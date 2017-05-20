<?php
$GLOBALS['db']= mysqli_connect("localhost", "root", "", "elearning");
$db = mysqli_connect("localhost", "root", "", "elearning");

dirname("/usr/local/lib", 2);

if($_SERVER['SERVER_NAME']!="localhost"){define('base_url',"http://".$_SERVER['HTTP_HOST'].'/'); define('URL_ASSETS',base_url.'e-learning/assets/'); }
else {define('base_url',"http://".$_SERVER['HTTP_HOST']."/e-learning/"); define('URL_ASSETS',base_url.'assets/'); }


define("NAMA_SEKOLAH", "SMA NEGERI 41 JAKARTA");
define("ALAMAT_SEKOLAH", "Jln. Laks R.E Artadinata Jakarta");
define("TELP_SEKOLAH", "(xxx) xxxxxx");
define("EMAIL_SEKOLAH", "admin@sman114.sch.id");
define("KOTA_SEKOLAH", "Jakarta");
define("COMPANY", "Niqsy Media");
define('DIR_ASSETS', $_SERVER["DOCUMENT_ROOT"].'/e-learning/assets/');
define('DIR_FOTO_SISWA',DIR_ASSETS.'img/foto_siswa/');
define('URL_FOTO_SISWA',base_url.'assets/img/foto_siswa/');

#define("LOGO_SEKOLAH", URL_ASSETS."img/logo.jpg");
define("LOGO_SEKOLAH", "SMA NEGERI 41");

// //---fungsi2---//
// function cek_session($isi_admin, $isi_pengajar) {
//     if(@$_SESSION['admin']) {
//         echo $isi_admin;
//     } else if(@$_SESSION['pengajar']) {
//         echo $isi_pengajar;
//     }
// }

function tgl_indo($tgl) {
	$tanggal = substr($tgl,8,2);
	$bulan = getBulan(substr($tgl,5,2));
	$tahun = substr($tgl,0,4);
	return $tanggal.' '.$bulan.' '.$tahun;		 
}
function getBulan($bln){
	switch ($bln){
		case 1: 
			return "Januari";
			break;
		case 2:
			return "Februari";
			break;
		case 3:
			return "Maret";
			break;
		case 4:
			return "April";
			break;
		case 5:
			return "Mei";
			break;
		case 6:
			return "Juni";
			break;
		case 7:
			return "Juli";
			break;
		case 8:
			return "Agustus";
			break;
		case 9:
			return "September";
			break;
		case 10:
			return "Oktober";
			break;
		case 11:
			return "November";
			break;
		case 12:
			return "Desember";
			break;
	}
}

// function tampil_per_ID($table, $where = null) {
// 	global $db;
// 	$command = "SELECT * FROM $table";
// 	if($where != null) {
// 		$command .= " WHERE $where";
// 	}
// 	$query = mysqli_query($db, $command) or die ($db->error);
// 	return $query;
// 	mysqli_close($db);
// }
