<?php $db = mysqli_connect("localhost", "u2447560_dadan", "bangginggongle80ws12", "u2447560_e-learning");
    include "PHPExcel.php";
    include "PHPExcel/Cell.php";
    include "PHPExcel/Calculation.php";

    $excelku = new PHPExcel();
    

    $jawab = mysqli_query($db,"SELECT tb_jawaban_pilgan_temp.jawaban,
                                      tb_siswa.nama_lengkap,
                                      tb_siswa.nis,
                                      tb_kelas.nama_kelas
                               FROM tb_jawaban_pilgan_temp 
                               LEFT JOIN tb_siswa ON tb_siswa.id_siswa = tb_jawaban_pilgan_temp.id_peserta
                               LEFT JOIN tb_kelas ON tb_kelas.id_kelas = tb_siswa.id_kelas
                               WHERE tb_jawaban_pilgan_temp.id_peserta='$_GET[id_siswa]'
                               AND  id_tq = '$_GET[id_tq]'");
    $r = mysqli_fetch_assoc($jawab);
    $n='E';
    $no=1;
    $excelku->createSheet();
    $excelku->getActiveSheet()->setTitle('Data Hasil jawaban');
    $excelku->getSheetByName('Data Hasil jawaban');

    $excelku->setActiveSheetIndex(0)->setCellValue("A3","Nama");
    $excelku->setActiveSheetIndex(0)->setCellValue("A4",$r['nama_lengkap']);
    $excelku->getActiveSheet()->getColumnDimension("A")->setWidth(20);

    $excelku->setActiveSheetIndex(0)->setCellValue("B3","Kelas");
    $excelku->setActiveSheetIndex(0)->setCellValue("B4",$r['nama_kelas']);
    $excelku->getActiveSheet()->getColumnDimension("B")->setWidth(20);

    $excelku->setActiveSheetIndex(0)->setCellValue("C3","NIP");
    $excelku->setActiveSheetIndex(0)->setCellValue("C4",$r['nis']);
    $excelku->getActiveSheet()->getColumnDimension("C")->setWidth(20);

    $excelku->setActiveSheetIndex(0)->setCellValue("D3","No");
    $excelku->setActiveSheetIndex(0)->setCellValue("D4","Skor");
    while($r = mysqli_fetch_assoc($jawab)){
       
       $excelku->setActiveSheetIndex(0)->setCellValue($n."3",$no);
       $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$r['jawaban']);
       $excelku->getActiveSheet()->getColumnDimension($n)->setWidth(5);


       ++$n;
       $no++;
    }

   // Memberi nama sheet
   $excelku->setActiveSheetIndex(0); 
   $style = array(
        'alignment' => array(
            'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
        ),
        'borders' => array(
          'allborders' => array(
            'style' => PHPExcel_Style_Border::BORDER_THIN
          )
        )
    );
   $excelku->getActiveSheet()->getStyle('A3:'.$n.'4')->applyFromArray($style);
    
    $objWriter = PHPExcel_IOFactory::createWriter($excelku, 'Excel5');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Tes.xls"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');
    exit;
