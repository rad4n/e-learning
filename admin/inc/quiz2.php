<?php $db = mysqli_connect("localhost", "root", "", "db_elearning");
    include "PHPExcel.php";
    include "PHPExcel/Cell.php";
    include "PHPExcel/Calculation.php";
    //include "PHPExcel/Writer/Excel2007/Worksheet.php";

    $excelku = new PHPExcel();
    

    $jawab = mysqli_query($db,"SELECT jawaban FROM tb_jawaban_pilgan_temp 
                                WHERE id_peserta='$_GET[id_siswa]'
                                AND  id_tq = '$_GET[id_tq]'");
    $r = mysqli_fetch_assoc($jawab);
    $n='C';
    $no=1;
    $excelku->createSheet();
    $excelku->getActiveSheet()->setTitle('Data Hasil jawaban');
    $excelku->getSheetByName('Data Hasil jawaban');
    while($r = mysqli_fetch_assoc($jawab)){
        
       $excelku->setActiveSheetIndex(0)->setCellValue($n."3",$no);
       $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$r['jawaban']);
       ++$n;
       $no++;
    }
    
   // Memberi nama sheet
   $excelku->setActiveSheetIndex(0); 

    
    $objWriter = PHPExcel_IOFactory::createWriter($excelku, 'Excel5');
    header('Content-Type: application/vnd.ms-excel');
    header('Content-Disposition: attachment;filename="Tes.xlsx"');
    header('Cache-Control: max-age=0');
    $objWriter->save('php://output');
    exit;
