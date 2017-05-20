<?php include "../../+koneksi.php";
    include "PHPExcel.php";
    include "PHPExcel/Cell.php";
    include "PHPExcel/Calculation.php";

    $excelku = new PHPExcel();

    $excelku->createSheet();
    $excelku->getActiveSheet()->setTitle('Data Hasil jawaban');
    $excelku->getSheetByName('Data Hasil jawaban');
    $excelku->setActiveSheetIndex(0)->setCellValue("A3","Nama");
    $excelku->getActiveSheet()->getColumnDimension("A")->setWidth(20);

    $excelku->setActiveSheetIndex(0)->setCellValue("B3","Kelas");
    $excelku->getActiveSheet()->getColumnDimension("B")->setWidth(20);

    $excelku->setActiveSheetIndex(0)->setCellValue("C3","NIS");
    $excelku->getActiveSheet()->getColumnDimension("C")->setWidth(20);
    $excelku->setActiveSheetIndex(0)->setCellValue("D3","No");

    
    if($_GET['id_siswa']=='all'){
      $sql_siswa_mengikuti_tes = mysqli_query($db, "SELECT * FROM tb_nilai_pilgan JOIN tb_siswa ON tb_nilai_pilgan.id_siswa = tb_siswa.id_siswa JOIN tb_kelas ON tb_siswa.id_kelas = tb_kelas.id_kelas WHERE id_tq = '$_GET[id_tq]'") or die ($db->error);
      $siswa_ke=4;
      while($data_siswa_mengikuti_tes = mysqli_fetch_array($sql_siswa_mengikuti_tes)){
                $jawab = mysqli_query($db,"SELECT tb_jawaban_pilgan_temp.jawaban,
                                      tb_jawaban_pilgan_temp.id_soal,
                                      tb_siswa.nama_lengkap,
                                      tb_siswa.nis,
                                      tb_kelas.nama_kelas
                               FROM tb_jawaban_pilgan_temp 
                               LEFT JOIN tb_siswa ON tb_siswa.id_siswa = tb_jawaban_pilgan_temp.id_peserta
                               LEFT JOIN tb_kelas ON tb_kelas.id_kelas = tb_siswa.id_kelas
                               WHERE tb_jawaban_pilgan_temp.id_peserta='$data_siswa_mengikuti_tes[id_siswa]'
                               AND  id_tq = '$_GET[id_tq]'");

                  $r = mysqli_fetch_assoc($jawab);
                  $n='E';
                  $no=1;

                  $excelku->setActiveSheetIndex(0)->setCellValue("A".$siswa_ke,$r['nama_lengkap']);

                  $excelku->setActiveSheetIndex(0)->setCellValue("B".$siswa_ke,$r['nama_kelas']);

                  $excelku->setActiveSheetIndex(0)->setCellValue("C".$siswa_ke,$r['nis']);

                  $excelku->setActiveSheetIndex(0)->setCellValue("D".$siswa_ke,"Skor");
                  
                  $jawab = mysqli_query($db,"SELECT tb_jawaban_pilgan_temp.jawaban,
                                                    tb_jawaban_pilgan_temp.id_soal,
                                                    tb_siswa.nama_lengkap,
                                                    tb_siswa.nis,
                                                    tb_kelas.nama_kelas
                                             FROM tb_jawaban_pilgan_temp 
                                             LEFT JOIN tb_siswa ON tb_siswa.id_siswa = tb_jawaban_pilgan_temp.id_peserta
                                             LEFT JOIN tb_kelas ON tb_kelas.id_kelas = tb_siswa.id_kelas
                                             WHERE tb_jawaban_pilgan_temp.id_peserta='$data_siswa_mengikuti_tes[id_siswa]'
                                             AND  id_tq = '$_GET[id_tq]'");
                  while($r = mysqli_fetch_assoc($jawab)){
                    $cek = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_pilgan = '".$r['id_soal']."'") or die ($db->error);
                    while($c = mysqli_fetch_array($cek)) {
                            $jawaban = $c['kunci'];
                        }
                    if($r['jawaban']==$jawaban) $h = 1;
                    else $h=0;
                     
                    if($siswa_ke==4)$excelku->setActiveSheetIndex(0)->setCellValue($n."3",$no);
                    // $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$r['jawaban']);
                     $excelku->setActiveSheetIndex(0)->setCellValue($n.$siswa_ke,$h);
                     if($siswa_ke==4)$excelku->getActiveSheet()->getColumnDimension($n)->setWidth(5);


                     ++$n;
                     $no++;
                  }

                  $sql_cek_nilai_pilgan = mysqli_query($db, "SELECT * FROM tb_nilai_pilgan  WHERE id_siswa = '$data_siswa_mengikuti_tes[id_siswa]' AND  id_tq = '$_GET[id_tq]'") or die ($db->error);

                  $data_nilai_pilgan = mysqli_fetch_array($sql_cek_nilai_pilgan);
                    if($siswa_ke==4){
                      $excelku->setActiveSheetIndex(0)->setCellValue(++$n."3","Benar");
                      $excelku->setActiveSheetIndex(0)->setCellValue(++$n."3","Salah");
                      $excelku->setActiveSheetIndex(0)->setCellValue(++$n."3","Kosong");
                      $excelku->setActiveSheetIndex(0)->setCellValue(++$n."3","Nilai");
                      $excelku->setActiveSheetIndex(0)->setCellValue($n.$siswa_ke,$data_nilai_pilgan['benar']);
                      $excelku->setActiveSheetIndex(0)->setCellValue($n.$siswa_ke,$data_nilai_pilgan['salah']);
                      $excelku->setActiveSheetIndex(0)->setCellValue($n.$siswa_ke,$data_nilai_pilgan['tidak_dikerjakan']);
                      $excelku->setActiveSheetIndex(0)->setCellValue($n.$siswa_ke,$data_nilai_pilgan['presentase']);
                    }
                    else{
                    $excelku->setActiveSheetIndex(0)->setCellValue(++$n.$siswa_ke,$data_nilai_pilgan['benar']);
                    $excelku->setActiveSheetIndex(0)->setCellValue(++$n.$siswa_ke,$data_nilai_pilgan['salah']);
                    $excelku->setActiveSheetIndex(0)->setCellValue(++$n.$siswa_ke,$data_nilai_pilgan['tidak_dikerjakan']);
                    $excelku->setActiveSheetIndex(0)->setCellValue(++$n.$siswa_ke,$data_nilai_pilgan['presentase']);
                  }
                  
                  $siswa_ke++;
      }
    }
    else{
      $jawab = mysqli_query($db,"SELECT tb_nilai_pilgan.uraian,
                                      tb_siswa.nama_lengkap,
                                      tb_siswa.nis,
                                      tb_kelas.nama_kelas
                               FROM tb_nilai_pilgan 
                               LEFT JOIN tb_siswa ON tb_siswa.id_siswa = tb_nilai_pilgan.id_siswa
                               LEFT JOIN tb_kelas ON tb_kelas.id_kelas = tb_siswa.id_kelas
                               WHERE tb_nilai_pilgan.id_siswa='$_GET[id_siswa]'
                               AND  id_tq = '$_GET[id_tq]'");

            $r = mysqli_fetch_assoc($jawab);
          $n='E';
          $no=1;
          

          $excelku->setActiveSheetIndex(0)->setCellValue("A4",$r['nama_lengkap']);

          $excelku->setActiveSheetIndex(0)->setCellValue("B4",$r['nama_kelas']);

          $excelku->setActiveSheetIndex(0)->setCellValue("C4",$r['nis']);

          $excelku->setActiveSheetIndex(0)->setCellValue("D4","Skor");
          
          $jawab = mysqli_query($db,"SELECT tb_nilai_pilgan.uraian,
                                            tb_siswa.nama_lengkap,
                                            tb_siswa.nis,
                                            tb_kelas.nama_kelas
                                     FROM tb_nilai_pilgan 
                                     LEFT JOIN tb_siswa ON tb_siswa.id_siswa = tb_nilai_pilgan.id_siswa
                                     LEFT JOIN tb_kelas ON tb_kelas.id_kelas = tb_siswa.id_kelas
                                     WHERE tb_nilai_pilgan.id_siswa='$_GET[id_siswa]'
                                     AND  id_tq = '$_GET[id_tq]'");

           $rr=mysqli_fetch_array($jawab,MYSQLI_ASSOC);
           $rr1 = json_decode($rr['uraian']);
            $rr2 = json_decode($rr['uraian'], true);

          foreach ($rr2 as $key => $r) {
            //print_r($r); exit;
            $cek = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_pilgan = '".$r['id']."'") or die ($db->error);
            while($c = mysqli_fetch_array($cek)) {
                    $jawaban = $c['kunci'];
                }

             
             $excelku->setActiveSheetIndex(0)->setCellValue($n."3",$no);
            // $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$r['jawaban']);
             $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$r['j']);
             $excelku->getActiveSheet()->getColumnDimension($n)->setWidth(5);
             if($r['j']!=$jawaban){ $h = "B";// print_r('expressio'); exit;
           

             $excelku->getActiveSheet()
                    ->getStyle($n."4")
                    ->getFill()
                    ->setFillType(PHPExcel_Style_Fill::FILL_SOLID)
                    ->getStartColor()
                    ->setARGB('#FF0000');

            }

             ++$n;
             $no++;
          }

          $sql_cek_nilai_pilgan = mysqli_query($db, "SELECT * FROM tb_nilai_pilgan  WHERE id_siswa = '$_GET[id_siswa]' AND  id_tq = '$_GET[id_tq]'") or die ($db->error);

          while($data_nilai_pilgan = mysqli_fetch_array($sql_cek_nilai_pilgan)) {
            $excelku->setActiveSheetIndex(0)->setCellValue(++$n."3","Benar");
            $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$data_nilai_pilgan['benar']);

            $excelku->setActiveSheetIndex(0)->setCellValue(++$n."3","Salah");
            $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$data_nilai_pilgan['salah']);

            $excelku->setActiveSheetIndex(0)->setCellValue(++$n."3","Kosong");
            $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$data_nilai_pilgan['tidak_dikerjakan']);

            $excelku->setActiveSheetIndex(0)->setCellValue(++$n."3","Nilai");
            $excelku->setActiveSheetIndex(0)->setCellValue($n."4",$data_nilai_pilgan['presentase']);
          }

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
