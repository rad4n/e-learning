<?php
session_start();
ob_start();
?>
<html>
<head>
   <style type="text/css">
      .box{
         border: 1px solid #000;
      }
      .header td{
         
      }   
      .box td{
         padding: 5px 10px;
      }
   </style>
</head>
<body>

<?php
   
include "../../+koneksi.php";

if($_GET['kelas']=='all') $query = mysqli_query($db, "select * from tb_siswa where status='aktif'");
else $query = mysqli_query($db, "select * from tb_siswa where id_kelas='$_GET[kelas]' AND status='aktif'");
$no = 1;
echo "<table width='100%' cellspacing='20'><tr>";
while($r = mysqli_fetch_array($query)){
   $password = $r['pass'];
   $kls = mysqli_fetch_array(mysqli_query($db, "select * from tb_kelas where id_kelas='$r[id_kelas]'"));
		
   echo"<td class='box' width='335'>

<table width='100%' style='width: 330px; margin-left:-6px;' cellspacing='0'>
   
<tr class='header'>
   <td width='60' align='center'>
      <img src='".URL_ASSETS."img/logo.png' width='50'>
   </td>
   <td width='130' align='center' valign='middle' style='padding: 5px 30px;'>
   <b>KARTU PESERTA UJIAN CBT</b><br>"
   .NAMA_SEKOLAH."<br>"
    //."<span style='font-size:12px;'>".ALAMAT_SEKOLAH."</span>"
   ."</td>
</tr>
<hr style='margin-top:26px;'>	
<tr><td>Nama</td><td>: $r[nama_lengkap]</td></tr>
<tr><td>Kelas</td><td>: $kls[nama_kelas]</td></tr>
<tr><td>Username</td><td>: <b>$r[username]</b></td></tr>
<tr><td>Password</td><td>: <b>$password</b></td></tr>

</table>

</td>";

  if($no%2==0) echo "</tr><tr>";
  $no++;

}
echo "</tr></table>";
?>
</body>
</html>

<?php
require_once('html2pdf/html2pdf.class.php');
$content = ob_get_clean();
$html2pdf = new HTML2PDF('P','A4','en',true, 'UTF-8', array(0, 0, 0, 0));
$html2pdf->WriteHTML($content);
$html2pdf->Output('Kartu Peserta.pdf');
?>
