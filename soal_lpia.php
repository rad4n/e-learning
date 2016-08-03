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
		h3,h4,h5,h6{
			color: white;
		}

		h3{
			font-size: 18px;
		}
		.divwaktu{
			background: #7B2F24;
			font-size: 20;
			padding: 5px 10px;
			top: 30px;
			position: relative;
		}
		#sisa-waktu{
			background: #B0A334;
			font-size: 20;
			padding: 5px 10px;
			top: 30px;
			position: relative;
		}
		.kunci {
		    background:  #0944bc none repeat scroll 0 0;
		    margin: 1px;
		    width: 19%;
		    padding-right: 0px;
		    color: black;
		}
		.kunci-jwb {
			color: black;
		    background:  white none repeat scroll 0 0;
		    float: right;
		    text-align: center;
		    width: 60%;
		}
		.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {
		    border-top: 0px;
		    line-height: 1.42857;
		    padding: 0px;
		    vertical-align: top;
		}
		.footer{
			position: relative;
			bottom: -170px;
			background: #1E1D2A;
			color: white;
			text-align: center;
			font-size: 18px;
		}
    </style>
</head>
<body onload="init(),noBack();" onpageshow="if (event.persisted) noBack();" onunload="keluar()" class="row">
	<script src="style/assets/js/jquery-1.11.1.js"></script>
<script src="style/assets/js/bootstrap.js"></script>
	<?php
		$id_tq = @$_GET['id_tq'];
		$no = 1;
		$no2 = 1;
		$sql_tq = mysqli_query($db, "SELECT * FROM tb_topik_quiz JOIN tb_mapel ON tb_topik_quiz.id_mapel = tb_mapel.id WHERE id_tq = '$id_tq'") or die ($db->error);
		$data_tq = mysqli_fetch_array($sql_tq); 
	?>

	<script>
		var waktunya;
		waktunya = <?php echo $data_tq['waktu_soal']; ?>;
		var waktu;
		var jalan = 0;
		var habis = 0;

		function init(){
		    checkCookie();
		    mulai();
		}
		function keluar(){
		    if(habis==0){
		        setCookie('waktux',waktu,365);
		    }else{
		        setCookie('waktux',0,-1);
		    }
		}
		function mulai(){
		    jam = Math.floor(waktu/3600);
		    sisa = waktu%3600;
		    menit = Math.floor(sisa/60);
		    sisa2 = sisa%60
		    detik = sisa2%60;
		    if(detik<10){
		        detikx = "0"+detik;
		    }else{
		        detikx = detik;
		    }
		    if(menit<10){
		        menitx = "0"+menit;
		    }else{
		        menitx = menit;
		    }
		    if(jam<10){
		        jamx = "0"+jam;
		    }else{
		        jamx = jam;
		    }
		    //document.getElementById("divwaktu").innerHTML = jamx+" Jam : "+menitx+" Menit : "+detikx +" Detik";
		    var divs =  document.getElementsByClassName("divwaktu");
		    for (var i = 0; i < divs.length; i++) {
			    divs[i].innerHTML = menitx+" : "+detikx;
			}
		    waktu --;
		    if(waktu>0){
		        t = setTimeout("mulai()",1000);
		        jalan = 1;
		    }else{
		        if(jalan==1){
		            clearTimeout(t);
		        }
		        habis = 1;
		        document.getElementById("kirim").click();
		    }
		}
		function selesai(){    
		    if(jalan==1){
		        clearTimeout(t);
		    }
		    habis = 1;
		}
		function getCookie(c_name){
		    if (document.cookie.length>0){
		        c_start=document.cookie.indexOf(c_name + "=");
		        if (c_start!=-1){
		            c_start=c_start + c_name.length+1;
		            c_end=document.cookie.indexOf(";",c_start);
		            if (c_end==-1) c_end=document.cookie.length;
		            return unescape(document.cookie.substring(c_start,c_end));
		        }
		    }
		    return "";
		}
		function setCookie(c_name,value,expiredays){
		    var exdate=new Date();
		    exdate.setDate(exdate.getDate()+expiredays);
		    document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString());
		}
		function checkCookie(){
		    waktuy=getCookie('waktux');
		    if (waktuy!=null && waktuy!=""){
		        waktu = waktuy;
		    }else{
		        waktu = waktunya;
		        setCookie('waktux',waktunya,7);
		    }
		}
	</script>
	<script type="text/javascript">
	    window.history.forward();
	    function noBack(){ window.history.forward(); }
	</script>
	<?php if(@$_SESSION['siswa']){ ?>
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="row">
						<div class="col-md-3">
							<img src="img/SKE.png" class="img-responsive pull-left" alt="Responsive image" width="60" height="60">
							<img src="img/a.png" class="img-responsive pull-left" alt="Responsive image" width="60" height="60">
						</div>
						<div class="col-md-7">
							<h3>LEMBAGA PENDIDIKAN GENIUS PLOES GROUP</h3>
							<h4>CBT Application</h4>
						</div>
						<div class="col-md-2">
							<h3><span class="divwaktu label label-warning"></span></h3>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<form action="inc/proses_soal.php" method="post">
								<?php
				                    $sql_soal_sudah = mysqli_query($db, "SELECT id_soal,jawaban FROM tb_jawaban_pilgan_temp WHERE id_peserta = '".$_SESSION['siswa']."' AND id_tq = '{$id_tq}'") or die ($db->error);
				                    $no_sudah="";
				                    $n=1;
				                    while($soal_sudah = mysqli_fetch_assoc($sql_soal_sudah)) {
				                        if($n>1)$no_sudah .= ",";        
				                        $no_sudah .= $soal_sudah["id_soal"];
				                        $jawaban = $soal_sudah["jawaban"];
				                        $n++;
				                    }
				                    //print_r($no_sudah); exit();
				                    if(!empty($no_sudah)){
				                        if(isset($_GET['revisi_soal'])){
				                        $sql_soal_pilgan = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_tq = '$id_tq' AND id_pilgan='".$_GET['revisi_soal']."' limit 1 ") or die ($db->error);
				                        }else{
				                            $sql_soal_pilgan = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_tq = '$id_tq' 
				                            	AND id_pilgan NOT IN ({$no_sudah}) 
				                            	AND level_group = '$n'
				                            	ORDER BY rand() limit 1 ") or die ($db->error);
				                        }
				                    }elseif(isset($_GET['revisi_soal'])){
				                        $sql_soal_pilgan = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_tq = '$id_tq' AND id_pilgan='".$_GET['revisi_soal']."' limit 1 ") or die ($db->error);
				                    }
				                    else{
				                        $sql_soal_pilgan = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_tq = '$id_tq' AND level_group = '$n' ORDER BY rand() limit 1 ") or die ($db->error);
				                    }
									if(mysqli_num_rows($sql_soal_pilgan) > 0) { 
									while($data_soal_pilgan = mysqli_fetch_array($sql_soal_pilgan)) { ?>
										<div class="panel panel-defaut">
											<div class="panel-body" style="max-height: 500px;overflow-y: scroll;">
												 <?php echo (isset($_GET['no_revisi'])?$_GET['no_revisi']:$n); ?> )<b><?php echo $data_soal_pilgan['pertanyaan']; ?></b>
												 <?php if($data_soal_pilgan['gambar'] != '') { ?><br>
												 <img width="220px" src="admin/img/gambar_soal_pilgan/<?php echo $data_soal_pilgan['gambar']; ?>" />
												 <?php } ?>
												 <?php if($data_soal_pilgan['video'] != '') { ?><br>
												 <video width="220px" controls>
				                                                            <source src="admin/video/<?php echo $data_soal_pilgan['video']; ?>" type="video/mp4">
				                                                            <source src="admin/video/<?php echo $data_soal_pilgan['video']; ?>" type="video/ogg">
				                                                            Your browser does not support the video tag.
				                                 </video>
				                                 <?php } ?>
				                                 <?php if($data_soal_pilgan['audio'] != '') { ?><br>
				                                 <audio controls>
				                                                            <source src="admin/audio/<?php echo $data_soal_pilgan['audio']; ?>" type="audio/mpeg">
				                                                            <source src="admin/audio/<?php echo $data_soal_pilgan['audio']; ?>" type="audio/ogg">
				                                                            Your browser does not support the audio tag.
				                                 </audio>
				                                 <?php } ?>
											</div>
										</div>
										<div class="panel panel-default">
				                            <div class="panel-body">
				                                <div class="table-responsive">
				                                    <input type="hidden" name="id_pilgan" value="<?php echo $data_soal_pilgan['id_pilgan']; ?>">
				        								<table class="table">
				        							        <tr>
				        							            <td>
				                                                    <div class="radio mrg-del">
				                                                        <label>
				                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="A" /> A. <?php echo $data_soal_pilgan['pil_a']; ?>
				                                                        </label>
				                                                    </div>
				                                                </td>
				        							        </tr>
				        							        <tr>
				        							            <td>
				                                                    <div class="radio mrg-del">
				                                                        <label>
				                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="B" /> B. <?php echo $data_soal_pilgan['pil_b']; ?>
				                                                        </label>
				                                                    </div>
				                                                </td>
				        							        </tr>
				        							        <tr>
				        							            <td>
				                                                    <div class="radio mrg-del">
				                                                        <label>
				                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="C" /> C. <?php echo $data_soal_pilgan['pil_c']; ?>
				                                                        </label>
				                                                    </div>
				                                                </td>
				        							        </tr>
				        							        <tr>
				        							            <td>
				                                                    <div class="radio mrg-del">
				                                                        <label>
				                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="D" /> D. <?php echo $data_soal_pilgan['pil_d']; ?>
				                                                        </label>
				                                                    </div>
				                                                </td>
				        							        </tr>
				        							        <tr>
				        							            <td>
				                                                    <div class="radio mrg-del">
				                                                        <label>
				                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="E" /> E. <?php echo $data_soal_pilgan['pil_e']; ?>
				                                                        </label>
				                                                    </div>
				                                                </td>
				        							        </tr>
				        								</table>
				                                        <input type="submit" value="selanjutnya">
				                                    <?php
				                                    } ?>
				                                    <input type="hidden" name="jumlahsoalpilgan" value="<?php echo mysqli_num_rows($sql_soal_pilgan); ?>" />
				    							</div>
				    			            </div>
				    			        </div>
				    			        
				                    <?php }?>
				                    <?php if(mysqli_num_rows($sql_soal_pilgan) == 0) {?>
				                    <div class="panel panel-default">
				                        <div class="panel-heading">
				                            <div>
				                                <a id="selesai" class="btn btn-info">Selesai</a>
				                                <!-- <input type="reset" value="Reset Jawaban" class="btn btn-danger" /> -->
				                            </div>
				                            <div id="konfirm" style="display:none; margin-top:15px;">
				                                Apakah Anda yakin sudah selesai mengerjakan soal dan akan mengirim jawaban? &nbsp; <input onclick="selesai();" type="submit" id="kirim" value="Ya" class="btn btn-info btn-sm" />
				                            </div>
				                            <script type="text/javascript">
				                            $("#selesai").click(function() {
				                                $("#konfirm").fadeIn(1000);
				                            });
				                            </script>
				                        </div>
				                    </div>
				                    <?php }?>
				                    <input type="hidden" name="id_tq" value="<?php echo $id_tq; ?>" />
							</form>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-12">
							<h3><span id="sisa-waktu" class="label label-warning">Sisa Waktu</span>
							<span class="divwaktu label label-warning"></span></h3>
						</div>
					</div>
					<div class="row" style="margin-top:40px;">
						<div class="panel panel-default col-md-12" style="background:black;">
						  <div class="panel-body">
						    <h3 style="text-align:center">TRY OUT PREDIKSI UJIAN NASIONAL 2017</h3>
						  </div>
						</div>
					</div>

					<div class="row">
						<div class="panel panel-default col-md-12" style="background:black;">
						  <div class="panel-body">
						  	<?php $sql = mysqli_query($db,"SELECT tb_siswa.*,tb_kelas.nama_kelas from tb_siswa
						  	LEFT JOIN tb_kelas ON tb_siswa.id_kelas  = tb_kelas.id_kelas WHERE id_siswa = '".$_SESSION['siswa']."'");
						  		$d= mysqli_fetch_assoc($sql);
						  	?>
						  	<div class="pull-left">
						  		<img src="img/foto_siswa/<?=$d['foto'];?>" width="100" height="100" class="img-thumbnail">
						    </div>
						    <h3 style="text-align:center"><?=$d['nama_lengkap'];?></h3>
						    <h4 style="text-align:center">kelas : <?=$d['nama_kelas'];?></h4>
						    <h5 style="text-align:center"><?=$d['sekolah'];?></h5>
						  </div>
						</div>
					</div>

					<div class="row">
						<?php $sql_soal_sudah_jawab = mysqli_query($db, "SELECT 
		                    tb_jawaban_pilgan_temp.id_soal,
		                    tb_jawaban_pilgan_temp.jawaban
		                    FROM tb_jawaban_pilgan_temp 
		                    #LEFT JOIN tb_soal_pilgan ON tb_soal_pilgan.id_pilgan = tb_jawaban_pilgan_temp.id_soal
		                    WHERE id_peserta = '".$_SESSION['siswa']."' AND id_tq = '{$id_tq}'") or die ($db->error);
		                    $soal_sudah_jawab = mysqli_num_rows($sql_soal_sudah_jawab);
		                    if($soal_sudah_jawab>0) { 
		                ?>
		                            <?php $no=1; foreach($sql_soal_sudah_jawab as $soal){?>
		                               <!--  <a href="soal.php?id_tq=<?php echo $id_tq;?>&revisi_soal=<?php echo $soal['id_soal'];?>&no_revisi=<?php echo $no;?>" class="list-group-item"><?php echo $no.")".$soal['jawaban'];?></a> -->
		                               <a href="soal_lpia.php?id_tq=<?php echo $id_tq;?>&revisi_soal=<?php echo $soal['id_soal'];?>&no_revisi=<?php echo $no;?>" class="kunci col-md-3">
										  <?php echo $no;?> <div class="kunci-jwb"><?php echo $soal['jawaban'];?></div>
									    </a>
		                            <?php $no++;}?>
		                <?php }?>
					</div>

				</div>
				<h6 class="text-justify">Tolong di cek dengan seksama dan teliti jawaban yang telah di pilih sebelum menutup program ini</h6>
			</div>
		</div>
	<?php }else{
		echo "<script>window.location='./';</script>";
	}?>
<div class="container-fluid ">
	<div class="row footer">
		<div class="col-lg-12">
			<div class="col-md-12">
				<p>aplikasi ini dirancang dan dikembangkan oleh lembaga pendidikan genius ploes group</p>    
			</div>
	</div>
</div>
</body>
</html>