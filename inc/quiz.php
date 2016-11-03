<?php
$id = @$_GET['id'];
$no = 1;

if(@$_GET['action'] != 'kerjakansoal') { ?>
<div class="row">
<?php
}
if(@$_GET['action'] == ''){?>
	 <div class="col-md-9 col-md-push-2">
        <?php
        $sql_mapel = mysqli_query($db, "SELECT * FROM tb_kelas") or die ($db->error);
        while($data_mapel = mysqli_fetch_array($sql_mapel)) { ?>
                <a href="?page=quiz&action=daftarjenisujian&id_kelas=<?php echo $data_mapel['id_kelas']; ?>" type="button" class="btn btn-primary btn-lg btn-block"><?php echo $data_mapel['nama_kelas']; ?></a>
        	<?php
        } ?>
	</div>
<?php }
else if(@$_GET['action'] == 'daftarjenisujian') {
	$_SESSION['id_kelas'] = $_GET['id_kelas'];
 ?>
    <div class="col-md-9 col-md-push-2">
        <?php
        $sql_mapel = mysqli_query($db, "SELECT  DISTINCT tb_topik_quiz.judul,tb_topik_quiz.id_tq FROM tb_topik_quiz 
#LEFT JOIN tb_mapel ON tb_mapel.id = tb_topik_quiz.id_mapel
#LEFT JOIN tb_kelas ON tb_kelas.id_kelas = tb_topik_quiz.id_kelas
WHERE tb_topik_quiz.id_kelas = {$_GET['id_kelas']}") or die ($db->error);
        while($data_mapel = mysqli_fetch_array($sql_mapel)) { ?>
<<<<<<< HEAD
                <a href="?page=quiz&action=daftartopik&id_tq=<?php echo $data_mapel['judul']; ?>" type="button" class="btn btn-primary btn-block"><?php echo $data_mapel['judul']; ?></a>
=======
                <a href="?page=quiz&action=daftartopik&id_tq=<?php echo $data_mapel['judul']; ?>" type="button" class="btn btn-primary btn-lg btn-block"><?php echo $data_mapel['judul']; ?></a>
>>>>>>> 7741143d769dde2c08503735d12a4b0c68e8ba62
        	<?php
        } ?>
	</div>
<?php
} else if(@$_GET['action'] == 'daftartopik') { ?>
	<div class="row">
	    <div class="col-md-12">
	        <div class="panel panel-default">
	            <div class="panel-heading">Mata Pelajaran</div>
	            <div class="panel-body">
					<div class="table-responsive">
					<?php
					$id_mapel = @$_GET['id_mapel'];
					//$judul_mapel = str_replace(""," ",$_GET['id_tq']);
					$sql_tq = mysqli_query($db, "SELECT tb_topik_quiz.*, tb_mapel.mapel FROM tb_topik_quiz 
						LEFT JOIN tb_mapel ON tb_mapel.id = tb_topik_quiz.id_mapel
						WHERE tb_topik_quiz.judul like '%{$_GET['id_tq']}%' AND id_kelas = '{$_SESSION['id_kelas']}' AND status = 'aktif'") or die ($db->error);
					
					if(mysqli_num_rows($sql_tq) > 0) {
						while($data_tq = mysqli_fetch_array($sql_tq)) { ?>
						<table class="table-responsive" width="100%">
							<tr>
								<td valign="top">No. ( <?php echo $no++; ?> )</td>
								<td>
									<table class="table">
									    <thead>
									        <tr>
<<<<<<< HEAD
									            <td><b>Judul</b> <?php echo $data_tq['mapel']; ?></td>
=======
									            <td width="20%"><b>Judul</b></td>
									            <td>:</td>
									            <td width="65%"><?php echo $data_tq['mapel']; ?></td>
>>>>>>> 7741143d769dde2c08503735d12a4b0c68e8ba62
									        </tr>
									    </thead>
									    <tbody>
									        <tr>
									            <td>Waktu Pengerjaan <?php echo $data_tq['waktu_soal'] / 60 ." menit"; ?></td>
									        </tr>
									        <tr>
									        	<td><a href="?page=quiz&action=infokerjakan&id_tq=<?php echo $data_tq['id_tq']; ?>" class="btn btn-primary btn-xs">Kerjakan Soal</a></td>
									        	<td>
									        </tr>
									    </tbody>
									</table>
								</td>
							</tr>
						</table>
						<?php
						}
					} else { ?>
						<div class="alert alert-danger">Data quiz yang berada di kelas ini dengan mapel tersebut tidak ada</div>
						<?php
					} ?>
					</div>
	            </div>
	        </div>
	    </div>
	</div>
	<?php
} else if(@$_GET['action'] == 'infokerjakan') { ?>
	<div class="row">
	    <div class="col-md-12">
	        <div class="panel panel-default">
	            <div class="panel-heading">Informasi Tugas / Quiz</div>
	            <div class="panel-body">
	            <?php
	            $sql_nilai = mysqli_query($db, "SELECT * FROM tb_nilai_pilgan WHERE id_tq = '$_GET[id_tq]' AND id_siswa = '$_SESSION[siswa]'") or die ($db->error);
	            $sql_jwb = mysqli_query($db, "SELECT * FROM tb_jawaban WHERE id_tq = '$_GET[id_tq]' AND id_siswa = '$_SESSION[siswa]'") or die ($db->error);
	            if(mysqli_num_rows($sql_nilai) > 0 || mysqli_num_rows($sql_jwb) > 0) {
	            	echo "Anda sudah mengerjakan ujian / test ini, silahkan lihat nilai Anda di halaman nilai.";
	            } else { ?>
					1. Baca dengan seksama dan teliti sebelum mengerjakan Tugas / Quiz.<br />
					2. Pastikan koneksi anda terjamin dan bagus.<br />
					3. Pilih browser yang versi terbaru.<br />
					4. Jika mati lampu hubungi pengajar mata pelajaran terkait untuk melakukan jian ulang.
					<?php
				} ?>
	            </div>
	            <div class="panel-footer">
					<?php
					if(mysqli_num_rows($sql_nilai) > 0 || mysqli_num_rows($sql_jwb) > 0) { ?>
						<a href="?page=quiz" class="btn btn-primary">Kembali</a>
						<?php
					} else {
						$sql_cek_soal_pilgan = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_tq = '$_GET[id_tq]'") or die ($db->error);
						$sql_cek_soal_essay = mysqli_query($db, "SELECT * FROM tb_soal_essay WHERE id_tq = '$_GET[id_tq]'") or die ($db->error);
						if(mysqli_num_rows($sql_cek_soal_pilgan) > 0 || mysqli_num_rows($sql_cek_soal_essay) > 0) { ?>
							<a href="soal_lpia.php?id_tq=<?php echo @$_GET['id_tq']; ?>" class="btn btn-primary">Mulai Mengerjakan</a>
							<!-- <a href="?page=soal&id_tq=<?php echo @$_GET['id_tq']; ?>" class="btn btn-primary">Mulai Mengerjakan</a> -->
						<?php
						} else { ?>
							<a onclick="alert('Data soal tidak ditemukan, mungkin karena belum dibuat. Silahkan hubungi guru yang bersangkutan');" class="btn btn-primary">Mulai Mengerjakan</a>
						<?php
						} ?>
						<a href="?page=quiz" class="btn btn-primary">Kembali</a>
					<?php
					} ?>
				</div>
	        </div>
	    </div>
	</div>
	<?php
} 
?>