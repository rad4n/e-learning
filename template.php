<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>Login E-Learning SMK Indonesia</title>
	<link href="style/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="style/assets/css/font-awesome.css" rel="stylesheet" />
    <style type="text/css">
    	html {
   			background: -webkit-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Safari 5.1 to 6.0 */
		    background: -o-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Opera 11.1 to 12.0 */
		    background: -moz-linear-gradient(#019A3D, #4EA800) no-repeat; /* For Firefox 3.6 to 15 */
		    background: linear-gradient(#019A3D, #4EA800) no-repeat; /* Standard syntax */
		}
		body{
			background: none;
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
    	}
    	.title-header{
    		color: #FFFF00;
    		text-shadow: -3px 0 black, 0 3px black, 3px 0 black, 0 -3px black;
    		font-weight: bold;
    		text-align: center;
		}
    	.title-footer{
    		color: white;
    		text-align: center;
    	}
    </style>
</head>
<body>
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
				<?php include "login2.php";?>
			</div>
		</div>
	</div>
	<div class="container">
		<h1 class="title-footer">Lembaga pendidikan Genious Ploes Group</h1>
		<h2 class="title-footer">Bimbingan Belajar-Kursus Matematika</h2>
	</div>
</body>
</html>