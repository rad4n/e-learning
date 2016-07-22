<?php
@session_start();
include "+koneksi.php";
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>CBT | Genius Ploes</title>
	<link href="style/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="style/assets/css/font-awesome.css" rel="stylesheet" />
    <style type="text/css">
    	html {
    		background: -webkit-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Safari 5.1 to 6.0 */
		    background: -o-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Opera 11.1 to 12.0 */
		    background: -moz-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Firefox 3.6 to 15 */
		    background: linear-gradient(#019A3D, #4EA800) no-repeat; /* Standard syntax */
		    height: 100%;

		}
		body{
			background: -webkit-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Safari 5.1 to 6.0 */
		    background: -o-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Opera 11.1 to 12.0 */
		    background: -moz-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Firefox 3.6 to 15 */
		    background: linear-gradient(#019A3D, #4EA800) no-repeat; /* Standard syntax */
		}
		#main-container{
			border: 22px white solid;
			box-shadow: 0px 0px 10px 10px black;
		}
    	#main-container{
    		width: 90%;
    		margin-top: 30px;
    	}
    	#main-container{
    		background: white;
    	}
		#logo-kanan {
		    float: right;
		    position: absolute;
		    right: -83px;
		    top: -30px;
		}
		#logo-kiri {
		    float: left;
		    position: absolute;
		    left: -83px;
		    top: -25px;
		}
    	#main-content{
    		background: #009A3D;
    		min-height: 354px;
    		box-shadow: 0px 0px 10px 5px black inset;
    		padding: 30px;
    	}
    	.title-header{
    		color: #FFFF00;
    		text-shadow: -3px 0 black, 0 3px black, 3px 0 black, 0 -3px black;
    		font-weight: bold;
    		text-align: center;
		}
    	.title-footer{
    		/*color: white;*/
    		text-align: center;
    	}
    	.btn {
		  background: red; /* For browsers that do not support gradients */
		  background: -webkit-linear-gradient(right, #579830, #0F4C2D); /* For Safari 5.1 to 6.0 */
		  background: -o-linear-gradient(right, #579830, #0F4C2D); /* For Opera 11.1 to 12.0 */
		  background: -moz-linear-gradient(right, #579830, #0F4C2D); /* For Firefox 3.6 to 15 */
		  background: linear-gradient(to right, #579830, #0F4C2D); /* Standard syntax */
		  border: none;
		}
    </style>
</head>
<body <?php if(@$_GET['page'] == 'soal') {?>onload="init(),noBack();" onpageshow="if (event.persisted) noBack();" onunload="keluar()" class="row" <?php }?>>
	<?php if(@$_SESSION['siswa']) {?>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
			<a href="inc/logout.php?sesi=siswa" class="btn btn-default navbar-btn navbar-right">Log Out</a>
	  </div>
	</nav>
	<?php }?>
	<div class="container" id="main-container">
		<div class="row" id="header-container">
			<div class="col-md-2">
				<img id="logo-kiri" src="img/a.png" width="150" height="150">
			</div>
			<div class="col-md-8">
				<h1 class="title-header">TRY OUT UJIAN ONLINE</h1>
				<h2 class="title-header">Computer Based Test (CBT)</h2>
			</div>
			<div class="col-md-2">
				<img id="logo-kanan" src="img/SKE.png" width="160" height="160">
			</div>
		</div>
		<div class="row" id="main-content">
			<div class="col-md-12">
				<?php
				if(empty($_SESSION['siswa'])) {
					if(@$_GET['hal'] == 'daftar') {
			        	include "register.php";
			    	}
					else include "login2.php";
				}
				
				else{

					$sql_terlogin = mysqli_query($db, "SELECT * FROM tb_siswa JOIN tb_kelas ON tb_siswa.id_siswa = '$_SESSION[siswa]' AND tb_kelas.id_kelas = tb_siswa.id_kelas") or die ($db->error);
					$data_terlogin = mysqli_fetch_array($sql_terlogin);

			        if(@$_GET['page'] == '') {
			            include "inc/quiz.php";
			        } else if(@$_GET['page'] == 'quiz') {
			            include "inc/quiz.php";
			        } else if(@$_GET['page'] == 'nilai') {
			            include "inc/nilai.php";
			        } else if(@$_GET['page'] == 'materi') {
			            include "inc/materi.php";
			        } else if(@$_GET['page'] == 'berita') {
			            include "inc/berita.php";
			        } 
			        else if(@$_GET['page'] == 'soal') {
			            include "soal.php";
			        } 
			    }
				?>
			</div>
		</div>
	</div>
	<div class="container">
		<h1 class="title-footer">Lembaga pendidikan Genious Ploes Group</h1>
		<h2 class="title-footer">Bimbingan Belajar-Kursus Matematika</h2>
	</div>
</body>
</html>