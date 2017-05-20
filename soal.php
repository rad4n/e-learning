<?php
@session_start();
include "+koneksi.php";

$id_tq = @$_GET['id_tq'];
$no = 1;
$no2 = 1;
$sql_tq = mysqli_query($db, "SELECT * FROM tb_topik_quiz JOIN tb_mapel ON tb_topik_quiz.id_mapel = tb_mapel.id WHERE id_tq = '$id_tq'") or die ($db->error);
$data_tq = mysqli_fetch_array($sql_tq);
?>
<script src="style/assets/js/jquery-1.11.1.js"></script>
<script src="style/assets/js/bootstrap.js"></script>
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
    document.getElementById("divwaktu").innerHTML = jamx+" Jam : "+menitx+" Menit : "+detikx +" Detik";
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

<?php
if(@$_SESSION['siswa']) { ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>Ujian Online E-Learning <?=NAMA_SEKOLAH;?></title>
    <link href="style/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="style/assets/css/font-awesome.css" rel="stylesheet" />
    <link href="style/assets/css/style.css" rel="stylesheet" />
    <style type="text/css">
    .mrg-del {
        margin: 0;
        padding: 0;
    }
    </style>
</head>
<body onload="init(),noBack();" onpageshow="if (event.persisted) noBack();" onunload="keluar()">

<div class="navbar navbar-inverse set-radius-zero">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./">
                <h4 style="color: white;"><?=NAMA_SEKOLAH;?></h4>
                    <h5 style="color: white;"><?=ALAMAT_SEKOLAH;?></h5>
            </a>
        </div>

        <div class="left-div">
            <div class="user-settings-wrapper">
                <ul class="nav">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                            <span class="glyphicon glyphicon-user" style="font-size: 25px;"></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<div class="content-wrapper">
    <div class="container">
		<div class="row">
		    <div class="col-md-12">
		        <h4 class="page-head-line">Penilaian : <?php echo $data_tq['judul']; ?> <span style="float: right;">Mapel : <?php echo $data_tq['mapel']; ?></span></h4>
		    </div>
             <div class="panel panel-default">
                    <div class="panel-heading"><b style="text-align: center; display:block; color: red; font-size: 16px;">Info <small>(Sisa waktu Anda)</small></b></div>
                    <div class="panel-body">
                        <h3 align="center"><span id="divwaktu"></span></h3>
                    </div>
                </div>
		</div>

		<div class="row">
			<div class="col-md-2">
		       
                <?php $sql_soal_sudah_jawab = mysqli_query($db, "SELECT 
                    tb_jawaban_pilgan_temp.id_soal,
                    tb_jawaban_pilgan_temp.jawaban
                    FROM tb_jawaban_pilgan_temp 
                    #LEFT JOIN tb_soal_pilgan ON tb_soal_pilgan.id_pilgan = tb_jawaban_pilgan_temp.id_soal
                    WHERE id_peserta = '".$_SESSION['siswa']."' AND id_tq = '{$id_tq}'") or die ($db->error);
                    $soal_sudah_jawab = mysqli_num_rows($sql_soal_sudah_jawab);
                    if($soal_sudah_jawab>0) { 
                ?>
                <div class="panel panel-default">
                    <div class="panel-heading"><b>Butir Soal</small></b></div>
                    <div class="panel-body">
                        <div class="list-group">
                            <?php $no=1; foreach($sql_soal_sudah_jawab as $soal){?>
                                <a href="soal.php?id_tq=<?php echo $id_tq;?>&revisi_soal=<?php echo $soal['id_soal'];?>&no_revisi=<?php echo $no;?>" class="list-group-item"><?php echo $no.")".$soal['jawaban'];?></a>
                            <?php $no++;}?>
                        </div>
                    </div>
                </div>
                <?php }?>
		    </div>

		    <div class="col-md-10">
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
					if(mysqli_num_rows($sql_soal_pilgan) > 0){
                    ?>
                        <div class="panel panel-default">
                            <div class="panel-heading"><b>Soal Pilihan Ganda</b></div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <?php
                                    while($data_soal_pilgan = mysqli_fetch_array($sql_soal_pilgan)) { ?>
                                    <input type="hidden" name="id_pilgan" value="<?php echo $data_soal_pilgan['id_pilgan']; ?>">
        								<table class="table">
        							    	<tr>
        							    		<td width="10%">( <?php echo (isset($_GET['no_revisi'])?$_GET['no_revisi']:$n); ?> )</td>
        							            <td><b><?php echo $data_soal_pilgan['pertanyaan']; ?></b></td>
        							        </tr>
                                            <?php if($data_soal_pilgan['gambar'] != '') { ?>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <img width="220px" src="<?=URL_ASSETS;?>gambar_soal_pilgan/<?php echo $data_soal_pilgan['gambar']; ?>" />
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php if($data_soal_pilgan['video'] != '') { ?>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <video width="220px" controls>
                                                            <source src="admin/video/<?php echo $data_soal_pilgan['video']; ?>" type="video/mp4">
                                                            <source src="admin/video/<?php echo $data_soal_pilgan['video']; ?>" type="video/ogg">
                                                            Your browser does not support the video tag.
                                                        </video>
                                                    </td>
                                                </tr>
                                            <?php } ?>
                                            <?php if($data_soal_pilgan['audio'] != '') { ?>
                                                <tr>
                                                    <td></td>
                                                    <td>
                                                        <audio controls>
                                                            <source src="admin/audio/<?php echo $data_soal_pilgan['audio']; ?>" type="audio/mpeg">
                                                            <source src="admin/audio/<?php echo $data_soal_pilgan['audio']; ?>" type="audio/ogg">
                                                            Your browser does not support the audio tag.
                                                        </audio>
                                                    </td>
                                                </tr>
                                            <?php } ?>
        							        <tr>
        							        	<td></td>
        							            <td>
                                                    <div class="radio mrg-del">
                                                        <label>
                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="A" /> A. <?php echo $data_soal_pilgan['pil_a']; ?>
                                                            <?php if($data_soal_pilgan['gbr_a'] != '') { ?><br>
                                                            <img width="220px" src="<?=URL_ASSETS;?>gambar_soal_pilgan/<?php echo $data_soal_pilgan['gbr_a']; ?>" />
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                </td>
        							        </tr>
        							        <tr>
        							        	<td></td>
        							            <td>
                                                    <div class="radio mrg-del">
                                                        <label>
                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="B" /> B. <?php echo $data_soal_pilgan['pil_b']; ?>
                                                            <?php if($data_soal_pilgan['gbr_b'] != '') { ?><br>
                                                            <img width="220px" src="<?=URL_ASSETS;?>gambar_soal_pilgan/<?php echo $data_soal_pilgan['gbr_b']; ?>" />
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                </td>
        							        </tr>
        							        <tr>
        							        	<td></td>
        							            <td>
                                                    <div class="radio mrg-del">
                                                        <label>
                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="C" /> C. <?php echo $data_soal_pilgan['pil_c']; ?>
                                                            <?php if($data_soal_pilgan['gbr_c'] != '') { ?><br>
                                                            <img width="220px" src="<?=URL_ASSETS;?>gambar_soal_pilgan/<?php echo $data_soal_pilgan['gbr_c']; ?>" />
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                </td>
        							        </tr>
        							        <tr>
        							        	<td></td>
        							            <td>
                                                    <div class="radio mrg-del">
                                                        <label>
                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="D" /> D. <?php echo $data_soal_pilgan['pil_d']; ?>
                                                            <?php if($data_soal_pilgan['gbr_d'] != '') { ?><br>
                                                            <img width="220px" src="<?=URL_ASSETS;?>gambar_soal_pilgan/<?php echo $data_soal_pilgan['gbr_d']; ?>" />
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                </td>
        							        </tr>
        							        <tr>
        							        	<td></td>
        							            <td>
                                                    <div class="radio mrg-del">
                                                        <label>
                                                            <input type="radio" name="soal_pilgan[<?php echo $data_soal_pilgan['id_pilgan']; ?>]" value="E" /> E. <?php echo $data_soal_pilgan['pil_e']; ?>
                                                            <?php if($data_soal_pilgan['gbr_e'] != '') { ?><br>
                                                            <img width="220px" src="<?=URL_ASSETS;?>gambar_soal_pilgan/<?php echo $data_soal_pilgan['gbr_e']; ?>" />
                                                            <?php } ?>
                                                        </label>
                                                    </div>
                                                </td>
        							        </tr>
        								</table>
                                        <input type="submit" value="selanjutnya">
                                    <?php } ?>
                                    <input type="hidden" name="jumlahsoalpilgan" value="<?php echo mysqli_num_rows($sql_soal_pilgan); ?>" />
    							</div>
    			            </div>
    			        </div>
                    <?php }
                    $sql_soal_essay = mysqli_query($db, "SELECT * FROM tb_soal_essay WHERE id_tq = '$id_tq' ORDER BY rand()") or die ($db->error);
                    if(mysqli_num_rows($sql_soal_essay) > 0) {
                    ?>
                        
                    <?php
                    } ?>
                    
                    <input type="hidden" name="id_tq" value="<?php echo $id_tq; ?>" />
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
		        </form>
		    </div>
		</div>

	</div>
</div>

<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                &copy; <?=date('Y');?> CBT Software | By : <?=COMPANY;?>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
<?php } else {
	echo "<script>window.location='./';</script>";
}?>