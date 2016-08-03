<?php
@session_start();
include "../+koneksi.php";

$id_tq = mysqli_real_escape_string($db, $_POST['id_tq']);

$soal = mysqli_query($db, "SELECT * FROM tb_soal_pilgan where id_tq = '$id_tq'") or die ($db->error);
$pilganda = mysqli_num_rows($soal);
$id_siswa = $_SESSION['siswa'];
$uri = explode("/",$_SERVER['REQUEST_URI']);
 $redirect = $_SERVER['HTTP_HOST']."/".$uri[1]."/soal_lpia.php?id_tq=".$id_tq;

  if(!empty($_POST['soal_pilgan'])){ 
      
     
      foreach($_POST['soal_pilgan'] as $key => $value) {
              $sql_sudah_ada = mysqli_query($db, "SELECT * from tb_jawaban_pilgan_temp WHERE id_soal = {$key} AND id_peserta = {$id_siswa} AND id_tq = {$id_tq}") or die ($db->error);
              $num_sudah_ada = mysqli_num_rows($sql_sudah_ada);
              if($num_sudah_ada>0){
                mysqli_query($db, "UPDATE tb_jawaban_pilgan_temp SET jawaban='$value' WHERE id_soal = {$key} AND id_peserta = {$id_siswa} AND id_tq = {$id_tq}") or die ($db->error);   
              }else{
                mysqli_query($db, "INSERT INTO tb_jawaban_pilgan_temp (id_peserta,id_tq,id_soal,jawaban)VALUES ('{$id_siswa}','{$id_tq}','{$key}','{$value}')") or die ($db->error);   
              }          
      }
      echo '<script>window.location = "http://'.$redirect.'";</script>';
  }else{//bila selesai mengerjakan soal
    
      if(isset($_POST['jumlahsoalpilgan']) AND $_POST['jumlahsoalpilgan']<$pilganda){
        // print_r($_POST['jumlahsoalpilgan'].'<br>');
        // exit($pilganda);
        mysqli_query($db, "INSERT INTO tb_jawaban_pilgan_temp (id_peserta,id_tq,id_soal)VALUES ('{$id_siswa}','{$id_tq}','".$_POST['id_pilgan']."')") or die ($db->error);  
        echo '<script>window.location = "http://'.$redirect.'";</script>';
        exit();
      }
      
     $benar = 0;
     $salah = 0;
     $tidakjawab = 0;
      //ambil dari tabel temporary
      $result = mysqli_query($db, "SELECT jawaban,id_soal FROM tb_jawaban_pilgan_temp WHERE id_peserta = {$id_siswa} AND id_tq = {$id_tq}") or die ($db->error);
      foreach($result as $key) {
          $cek = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_pilgan = '".$key['id_soal']."'") or die ($db->error);
          while($c = mysqli_fetch_array($cek)) {
              $jawaban = $c['kunci'];
          }
          if($key['jawaban'] == $jawaban) {
              $benar++;
          }else if(empty($key['jawaban']) OR $key['jawaban'] == ""){
            $tidakjawab++;
          }else {
              $salah++;
          }
      }
      $jumlah1 = mysqli_query($db, "SELECT MAX(level_group) as total FROM tb_soal_pilgan WHERE id_tq = '$id_tq'") or die ($db->error);
      $jumlah = mysqli_fetch_array($jumlah1);
      $persen = $benar / $jumlah['total'];//print_r("test :".$persen);exit;
      $hasil = $persen * 100;
      $masuk_tbl_nilai = mysqli_query($db, "INSERT INTO tb_nilai_pilgan VALUES('', '$id_tq', '$_SESSION[siswa]', '$benar', '$salah', '$tidakjawab', '$hasil')") or die ($db->error);
      if($masuk_tbl_nilai){
        //mysqli_query($db, "DELETE FROM tb_jawaban_pilgan_temp WHERE id_peserta='$_SESSION[siswa]'") or die ($db->error);
        echo "<script>window.location='./../?page=quiz&action=infokerjakan&id_tq=".$id_tq."';</script>";
      }

  }

 