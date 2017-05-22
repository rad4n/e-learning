<script>tinymce.init({ 
	selector:'.incTiny',
	plugins:[
		"advlist autolink lists link image charmap print preview anchor",
		"searchreplace visualblocks code fullscreen",
		"insertdatetime media table contextmenu paste imagetools tiny_mce_wiris"
	],
	toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | tiny_mce_wiris_formulaEditor"
	});</script>
<?php

$sql_pilgan = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_tq = '$id'") or die ($db->error);

$sql_essay = mysqli_query($db, "SELECT * FROM tb_soal_essay WHERE id_tq = '$id'") or die ($db->error);

?>

<div class="row">

	<div class="panel panel-default">

		<div class="panel-heading">

			<a href="?page=quiz" class="btn btn-danger btn-sm">Kembali</a> &nbsp; 

			Lihat Daftar Jenis Soal : <a href="?page=quiz&action=daftarsoal&hal=pilgan&id=<?php echo $id; ?>" class="btn btn-primary btn-sm">Pilihan Ganda (<?php echo mysqli_num_rows($sql_pilgan); ?> soal)</a> 

			<a href="?page=quiz&action=daftarsoal&hal=essay&id=<?php echo $id; ?>" class="btn btn-primary btn-sm">Essay (<?php echo mysqli_num_rows($sql_essay); ?> soal)</a>

		</div>

		<?php

		if(@$_GET['hal'] == "pilgan" || @$_GET['hal'] == "essay") { ?>

			<div class="panel-body">

				<fieldset>

					<legend>Info Tugas / Quiz</legend>

					<?php

					$sql_tq = mysqli_query($db, "SELECT * FROM tb_topik_quiz JOIN tb_kelas ON tb_topik_quiz.id_kelas = tb_kelas.id_kelas JOIN tb_mapel ON tb_topik_quiz.id_mapel = tb_mapel.id WHERE id_tq = '$id'") or die ($db->error);

					$data_tq = mysqli_fetch_array($sql_tq);

					?>

					<table align="center">

						<tr>

							<td>Judul</td>

							<td align="center" width="50px">:</td>

							<td><?php echo $data_tq['judul']; ?></td>

						</tr>

						<tr>

							<td>Kelas</td>

							<td align="center" width="50px">:</td>

							<td><?php echo $data_tq['nama_kelas']; ?></td>

						</tr>

						<tr>

							<td>Mata Pelajaran</td>

							<td align="center" width="50px">:</td>

							<td><?php echo $data_tq['mapel']; ?></td>

						</tr>

						<tr>

							<td>Waktu Pengerjaan</td>

							<td align="center" width="50px">:</td>

							<td><?php echo $data_tq['waktu_soal'] / 60 ." menit"; ?></td>

						</tr>

					</table>

				</fieldset>

			</div>

		<?php

		} ?>

	</div>

</div>

<?php

$idsoal = @$_GET['idsoal'];

$k = 1;

$ke = @$_GET['ke'];



if(@$_GET['hal'] == "pilgan") { ?>

	<div class="row">

		<div class="panel panel-default">

			<div class="panel-heading">Soal Pilihan Ganda &nbsp; <a href="?page=quiz&action=buatsoal&hal=soalpilgan&id=<?php echo $id; ?>" class="btn btn-primary btn-sm">Tambah Soal Pilihan Ganda</a></div>

			<div class="panel-body">

				<div class="table-responsive">

				<?php

				if(mysqli_num_rows($sql_pilgan) > 0) {

					while($data_pilgan = mysqli_fetch_array($sql_pilgan)) { ?>
					<table width="100%">
						<tr>
							<td valign="top">Soal no. ( <?php echo $no++; ?> )</td>
							<td>
								<table class="table">
									<thead>
										<tr>
											<td width="20%"><b>Pertanyaan</b></td>
											<td>:</td>
											<td width="65%"><?php echo $data_pilgan['pertanyaan']; ?></td>
										</tr>
									</thead>
									<tbody>

										<tr>

											<td>Gambar</td>

											<td>:</td>

											<td>

												<?php

												if($data_pilgan['gambar'] != '') {

													echo '<img src="'.base_url.'assets/gambar_soal_pilgan/'.$data_pilgan['gambar'].'" width="200px" />';

												} else {

													echo "<i>Tidak ada gambar</i>";

												} ?>

											</td>

										</tr>

										<tr>

											<td>Pilihan A</td>

											<td>:</td>

											<td><?php
												if($data_pilgan['gbr_a'] != '') {
															echo '<img src="'.base_url.'assets/gambar_soal_pilgan/'.$data_pilgan['gbr_a'].'" width="200px" />';
												} 
												echo $data_pilgan['pil_a']; 
														?>
											</td>

										</tr>
										<tr>

											<td>Pilihan B</td>

											<td>:</td>

											<td><?php 
											if($data_pilgan['gbr_b'] != '') {
															echo '<img src="'.base_url.'assets/gambar_soal_pilgan/'.$data_pilgan['gbr_b'].'" width="200px" />';
												} 
												echo $data_pilgan['pil_b']; ?></td>

										</tr>

										<tr>

											<td>Pilihan C</td>

											<td>:</td>

											<td><?php 
											if($data_pilgan['gbr_c'] != '') {
															echo '<img src="'.base_url.'assets/gambar_soal_pilgan/'.$data_pilgan['gbr_c'].'" width="200px" />';
												} 
											echo $data_pilgan['pil_c']; ?></td>

										</tr>

										<tr>

											<td>Pilihan D</td>

											<td>:</td>

											<td><?php 
											if($data_pilgan['gbr_d'] != '') {
															echo '<img src="'.base_url.'assets/gambar_soal_pilgan/'.$data_pilgan['gbr_d'].'" width="200px" />';
												} 
											echo $data_pilgan['pil_d']; ?></td>

										</tr>

										<tr>

											<td>Pilihan E</td>

											<td>:</td>

											<td><?php 
												if($data_pilgan['gbr_e'] != '') {
															echo '<img src="'.base_url.'assets/gambar_soal_pilgan/'.$data_pilgan['gbr_e'].'" width="200px" />';
												} 
											echo $data_pilgan['pil_e']; ?></td>

										</tr>

										<tr>

											<td>Kunci</td>

											<td>:</td>

											<td><?php echo $data_pilgan['kunci']; ?></td>

										</tr>

										<tr>

											<td>Opsi</td>

											<td>:</td>

											<td>

												<a href="?page=quiz&action=daftarsoal&hal=editsoalpilgan&id=<?php echo $id; ?>&idsoal=<?php echo $data_pilgan['id_pilgan']; ?>&ke=<?php echo $k++; ?>" class="badge" style="background-color:#f60;">Edit</a>

												<a onclick="return confirm('Yakin akan menghapus data?');" href="?page=quiz&action=daftarsoal&hal=hapussoalpilgan&id=<?php echo $id; ?>&idsoal=<?php echo $data_pilgan['id_pilgan']; ?>" class="badge" style="background-color:#f00;">Hapus</a>

											</td>

										</tr>

									</tbody>

								</table>

							</td>

						</tr>

					</table>
					<?php

					}

				} else { ?>

					<div class="alert alert-danger">Data soal pilihan ganda tidak ditemukan</div>

					<?php

				} ?>

				</div>

			</div>

		</div>

	</div>

<?php

} else if(@$_GET['hal'] == "essay") { ?>

	<div class="row">

		<div class="panel panel-default">

			<div class="panel-heading">Soal Essay &nbsp; <a href="?page=quiz&action=buatsoal&hal=soalessay&id=<?php echo $id; ?>" class="btn btn-primary btn-sm">Tambah Soal Essay</a></div>

			<div class="panel-body">

				<div class="table-responsive">

					<table class="table table-striped table-bordered table-hover">

						<thead>

							<tr>

								<th>No</th>

								<th>Pertanyaan</th>

								<th>Gambar</th>

								<th>Tanggal Pembuatan</th>

								<th>Opsi</th>

							</tr>

						</thead>

						<tbody>

						<?php

						if(mysqli_num_rows($sql_essay) > 0) {

							while($data_essay = mysqli_fetch_array($sql_essay)) { ?>

							<tr>

								<td align="center" width="40px"><?php echo $no++; ?></td>

								<td><?php echo $data_essay['pertanyaan']; ?></td>

								<td align="center" width="150px">

									<?php

									if($data_essay['gambar'] != '') {

										echo '<img src="img/gambar_soal_essay/'.$data_essay['gambar'].'" width="100px" />';

									} else {

										echo "<i>Tidak ada gambar</i>";

									} ?>

								</td>

								<td align="center" width="160px"><?php echo tgl_indo($data_essay['tgl_buat']); ?></td>

								<td align="center" width="120px">

									<a href="?page=quiz&action=daftarsoal&hal=editsoalessay&id=<?php echo $id; ?>&idsoal=<?php echo $data_essay['id_essay']; ?>&ke=<?php echo $k++; ?>" class="badge" style="background-color:#f60;">Edit</a>

									<a onclick="return confirm('Yakin akan menghapus data?');" href="?page=quiz&action=daftarsoal&hal=hapussoalessay&id=<?php echo $id; ?>&idsoal=<?php echo $data_essay['id_essay']; ?>" class="badge" style="background-color:#f00;">Hapus</a>

								</td>

							</tr>

							<?php

							}

						} else {

							echo '<td colspan="5" align="center">Data soal essay tidak ditemukan</td>';

						} ?>

						</tbody>

					</table>

				</div>

			</div>

		</div>

	</div>

	<?php

} else if(@$_GET['hal'] == "editsoalpilgan") { ?>

	<div class="row">

		<div class="panel panel-default">

			<div class="panel-heading">Edit Soal Pilihan Ganda</div>

			<div class="panel-body">

			<?php

			$sql_pilgan_id = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_pilgan = '$idsoal'") or die ($db->error);

			$data_pilgan_id = mysqli_fetch_array($sql_pilgan_id);

			?>

				<form method="post" enctype="multipart/form-data">

				<div class="col-md-2">
						<label>Group Soal</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="level_group" class="form-control" rows="1" required><?php echo $data_pilgan_id['level_group']; ?></textarea>
						</div>
					</div>
					
					<div class="col-md-2">

						<label>Pertanyaan No. [ <?php echo $ke; ?> ]</label>

					</div>

					<div class="col-md-10">

						<div class="form-group">

							<textarea name="pertanyaan" class="form-control incTiny" rows="2"><?php echo $data_pilgan_id['pertanyaan']; ?></textarea>

						</div>

					</div>



					<div class="col-md-2">

						<label>Gambar <sup>(Optional)</sup></label>

					</div>

					<div class="col-md-10">

						<div class="form-group">

							<input type="file" name="gambar" class="form-control" />

							<?php

							if($data_pilgan_id['gambar'] != '') {

								if(@$_GET['gbr'] != 'del') { ?>

									<div style="margin-top:5px;">

										<img width="150px" src="<?=URL_ASSETS?>img/gambar_soal_pilgan/<?php echo $data_pilgan_id['gambar']; ?>" />

										<br /> <small><a href="?page=quiz&action=daftarsoal&hal=editsoalpilgan&id=<?php echo $id; ?>&idsoal=<?php echo $data_pilgan_id['id_pilgan']; ?>&ke=<?php echo $ke; ?>&gbr=del">Hapus Gambar</a></small>

									</div>

								<?php }

							} ?>

						</div>

					</div>

					<div class="col-md-2">
						<label>Pilihan A</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilA" class="form-control incTiny" rows="1"><?php echo $data_pilgan_id['pil_a']; ?></textarea>
						</div>
						<div class="form-group">
							
							<?php

							if($data_pilgan_id['gbr_a'] != '') {

								if(@$_GET['gbr_a'] != 'del') { ?>

									<div style="margin-top:5px;">

										<img width="150px" src="<?=URL_ASSETS?>img/gambar_soal_pilgan/<?php echo $data_pilgan_id['gbr_a']; ?>" />

										<br /> Jika ingin mengganti gambar silahkan upload pada field dibawah ini

									</div>

								<?php }

							}?>
							<input type="file" name="gambar_a" class="form-control" />
							

						</div>
					</div>

					<div class="col-md-2">
						<label>Pilihan B</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilB" class="form-control incTiny" rows="1"><?php echo $data_pilgan_id['pil_b']; ?></textarea>
						</div>
						<div class="form-group">
							<?php

							if($data_pilgan_id['gbr_b'] != '') {

								if(@$_GET['gbr_b'] != 'del') { ?>

									<div style="margin-top:5px;">

										<img width="150px" src="<?=URL_ASSETS?>img/gambar_soal_pilgan/<?php echo $data_pilgan_id['gbr_b']; ?>" />

										<br /> Jika ingin mengganti gambar silahkan upload pada field dibawah ini

									</div>

								<?php }

							}?>
							<input type="file" name="gambar_b" class="form-control" />
							
						</div>
					</div>

					<div class="col-md-2">
						<label>Pilihan C</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilC" class="form-control incTiny" rows="1"><?php echo $data_pilgan_id['pil_c']; ?></textarea>
						</div>
						<div class="form-group">
							<?php

							if($data_pilgan_id['gbr_c'] != '') {

								if(@$_GET['gbr_c'] != 'del') { ?>

									<div style="margin-top:5px;">

										<img width="150px" src="<?=URL_ASSETS?>img/gambar_soal_pilgan/<?php echo $data_pilgan_id['gbr_c']; ?>" />

										<br /> Jika ingin mengganti gambar silahkan upload pada field dibawah ini

									</div>

								<?php }

							} ?>
							<input type="file" name="gambar_c" class="form-control" />
							
						</div>
					</div>

					<div class="col-md-2">
						<label>Pilihan D</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilD" class="form-control incTiny" rows="1"><?php echo $data_pilgan_id['pil_d']; ?></textarea>
						</div>
						<div class="form-group">
							<?php

							if($data_pilgan_id['gbr_d'] != '') {

								if(@$_GET['gbr_d'] != 'del') { ?>

									<div style="margin-top:5px;">

										<img width="150px" src="<?=URL_ASSETS?>img/gambar_soal_pilgan/<?php echo $data_pilgan_id['gbr_d']; ?>" />

										<br /> Jika ingin mengganti gambar silahkan upload pada field dibawah ini

									</div>

								<?php }

							} ?>
							<input type="file" name="gambar_d" class="form-control" />
							
						</div>
					</div>

					<div class="col-md-2">
						<label>Pilihan E</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilE" class="form-control incTiny" rows="1"><?php echo $data_pilgan_id['pil_e']; ?></textarea>
						</div>
						<div class="form-group">
							
							<?php

							if($data_pilgan_id['gbr_e'] != '') {

								if(@$_GET['gbr_e'] != 'del') { ?>

									<div style="margin-top:5px;">

										<img width="150px" src="<?=URL_ASSETS?>img/gambar_soal_pilgan/<?php echo $data_pilgan_id['gbr_e']; ?>" />

										<br /> Jika ingin mengganti gambar silahkan upload pada field dibawah ini

									</div>

								<?php }

							}?>
							<input type="file" name="gambar_e" class="form-control" />
							
						</div>
					</div>

					<div class="col-md-2">
						<label>Kunci Jawaban</label>
					</div>

					<div class="col-md-10">
						<div class="form-group">
							<label class="radio-inline">
								<input type="radio" name="kunci" value="A" <?php if($data_pilgan_id['kunci'] == 'A') { echo "checked"; } ?>>A
							</label>
							<label class="radio-inline">
								<input type="radio" name="kunci" value="B" <?php if($data_pilgan_id['kunci'] == 'B') { echo "checked"; } ?>>B
							</label>
							<label class="radio-inline">
								<input type="radio" name="kunci" value="C" <?php if($data_pilgan_id['kunci'] == 'C') { echo "checked"; } ?>>C
							</label>
							<label class="radio-inline">
								<input type="radio" name="kunci" value="D" <?php if($data_pilgan_id['kunci'] == 'D') { echo "checked"; } ?>>D
							</label>
							<label class="radio-inline">
								<input type="radio" name="kunci" value="E" <?php if($data_pilgan_id['kunci'] == 'E') { echo "checked"; } ?>>E
							</label>
						</div>

						<div class="form-group">

							<input type="submit" name="simpan" value="Simpan" class="btn btn-success" />

							<input type="reset" value="Reset" class="btn btn-danger" />

						</div>

					</div>

				</form>

				<?php

				if(@$_POST['simpan']) {

					$pertanyaan = @mysqli_real_escape_string($db, $_POST['pertanyaan']);

					$pilA = @mysqli_real_escape_string($db, $_POST['pilA']);

					$pilB = @mysqli_real_escape_string($db, $_POST['pilB']);

					$pilC = @mysqli_real_escape_string($db, $_POST['pilC']);

					$pilD = @mysqli_real_escape_string($db, $_POST['pilD']);

					$pilE = @mysqli_real_escape_string($db, $_POST['pilE']);

					$kunci = @mysqli_real_escape_string($db, $_POST['kunci']);



					$sumber = @$_FILES['gambar']['tmp_name'];

					$target = 'img/gambar_soal_pilgan/';

					$nama_gambar = @$_FILES['gambar']['name'];

					#####gambar pilihan soal



                    $sumber4 = @$_FILES['gambar_a']['tmp_name'];

                    $target4 = 'img/gambar_soal_pilgan/';

                    $nama_gambar_a = @$_FILES['gambar_a']['name'];



                    $sumber5 = @$_FILES['gambar_b']['tmp_name'];

                    $target5 = 'img/gambar_soal_pilgan/';

                    $nama_gambar_b = @$_FILES['gambar_b']['name'];



                    $sumber6 = @$_FILES['gambar_c']['tmp_name'];

                    $target6 = 'img/gambar_soal_pilgan/';

                    $nama_gambar_c = @$_FILES['gambar_c']['name'];



                    $sumber7 = @$_FILES['gambar_d']['tmp_name'];

                    $target7 = 'img/gambar_soal_pilgan/';

                    $nama_gambar_d = @$_FILES['gambar_d']['name'];



                    $sumber8 = @$_FILES['gambar_e']['tmp_name'];

                    $target8 = 'img/gambar_soal_pilgan/';

                    $nama_gambar_e = @$_FILES['gambar_e']['name'];
                    //print_r($nama_gambar_a); exit;

                    move_uploaded_file($sumber4, $target4.$nama_gambar_a);

                    move_uploaded_file($sumber5, $target5.$nama_gambar_b);

                    move_uploaded_file($sumber6, $target6.$nama_gambar_c);

                    move_uploaded_file($sumber7, $target7.$nama_gambar_d);

                    move_uploaded_file($sumber8, $target8.$nama_gambar_e);

					

					$i = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_pilgan = '$idsoal'") or die ($db->error);
					$r = mysqli_fetch_array($i,MYSQLI_ASSOC);
					//pre($r);
					$sql = "UPDATE tb_soal_pilgan SET 
								pertanyaan = '$pertanyaan', 
								pil_a = '$pilA',
								pil_b = '$pilB',
								pil_c = '$pilC',
								pil_d = '$pilD',
								pil_e = '$pilE', 
								
								";
								
					if(!empty($nama_gambar)) {
						$sql .= " gambar = '$nama_gambar',";
						unlink("img/gambar_soal_pilgan/".$r['gambar']);
					}
					if(!empty($nama_gambar_a)) {
						$sql .= " gbr_a = '$nama_gambar_a',";
						unlink("img/gambar_soal_pilgan/".$r['gbr_a']);
					}
					if(!empty($nama_gambar_b)) {
						$sql .= " gbr_b = '$nama_gambar_b',";
						unlink("img/gambar_soal_pilgan/".$r['gbr_b']);
					}
					if(!empty($nama_gambar_c)) {
						$sql .= " gbr_c = '$nama_gambar_c',";
						unlink("img/gambar_soal_pilgan/".$r['gbr_c']);
					}
					if(!empty($nama_gambar_d)) {
						$sql .= " gbr_d = '$nama_gambar_d',";
						unlink("img/gambar_soal_pilgan/".$r['gbr_d']);
					}
					if(!empty($nama_gambar_e)) {
						$sql .= " gbr_e = '$nama_gambar_e',";
						unlink("img/gambar_soal_pilgan/".$r['gbr_e']);
					}

					$sql .= " kunci = '$kunci' WHERE id_pilgan = '$idsoal'";

					mysqli_query($db, $sql) or die ($db->error);

					echo "<script>window.location='?page=quiz&action=daftarsoal&hal=pilgan&id=".$id."';</script>";

				} ?>



			</div>

		</div>

	</div>

	<?php

} else if(@$_GET['hal'] == "hapussoalpilgan") {

	$i = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_pilgan = '$idsoal'") or die ($db->error);
	$r = mysqli_fetch_array($i,MYSQLI_ASSOC);
	if(!empty($r['gambar'])) unlink(DIR_ASSETS."gambar_soal_pilgan/".$r['gambar']);
	if(!empty($r['gbr_a'])) unlink(DIR_ASSETS."gambar_soal_pilgan/".$r['gbr_a']);
	if(!empty($r['gbr_b'])) unlink(DIR_ASSETS."gambar_soal_pilgan/".$r['gbr_b']);
	if(!empty($r['gbr_c'])) unlink(DIR_ASSETS."gambar_soal_pilgan/".$r['gbr_c']);
	if(!empty($r['gbr_d'])) unlink(DIR_ASSETS."gambar_soal_pilgan/".$r['gbr_d']);
	if(!empty($r['gbr_e'])) unlink(DIR_ASSETS."gambar_soal_pilgan/".$r['gbr_e']);
	
	mysqli_query($db, "DELETE FROM tb_soal_pilgan WHERE id_pilgan = '$idsoal'") or die ($db->error);

	echo "<script>window.location='?page=quiz&action=daftarsoal&hal=pilgan&id=".$id."';</script>";

} else if(@$_GET['hal'] == "editsoalessay") { ?>

	<div class="row">

		<div class="panel panel-default">

			<div class="panel-heading">Edit Soal Essay</div>

			<div class="panel-body">

			<?php

			$sql_essay_id = mysqli_query($db, "SELECT * FROM tb_soal_essay WHERE id_essay = '$idsoal'") or die ($db->error);

			$data_essay_id = mysqli_fetch_array($sql_essay_id);

			?>

				<form method="post" enctype="multipart/form-data">

					<div class="col-md-2">

						<label>Pertanyaan No. [ <?php echo $ke; ?> ]</label>

					</div>

					<div class="col-md-10">

						<div class="form-group">

							<textarea name="pertanyaan" class="form-control" rows="3" required><?php echo $data_essay_id['pertanyaan']; ?></textarea>

						</div>

					</div>



					<div class="col-md-2">

						<label>Gambar <sup>(Optional)</sup></label>

					</div>

					<div class="col-md-10">

						<div class="form-group">

							<input type="file" name="gambar" class="form-control" />

							<?php

							if($data_essay_id['gambar'] != '') {

								if(@$_GET['gbr'] != 'del') { ?>

									<div style="margin-top:5px;">

										<img width="150px" src="../admin/img/gambar_soal_essay/<?php echo $data_essay_id['gambar']; ?>" />

										<br /> <small><a href="?page=quiz&action=daftarsoal&hal=editsoalessay&id=<?php echo $id; ?>&idsoal=<?php echo $data_essay_id['id_essay']; ?>&ke=<?php echo $ke; ?>&gbr=del">Hapus Gambar</a></small>

									</div>

								<?php }

							} ?>

						</div>

						<div class="form-group">

	                        <input type="submit" name="simpan" value="Simpan" class="btn btn-success" />

	                        <input type="reset" value="Reset" class="btn btn-danger" />

	                    </div>

					</div>

	            </form>

	            <?php

	            if(@$_POST['simpan']) {

	            	$pertanyaan = @mysqli_real_escape_string($db, $_POST['pertanyaan']);



	            	$sumber = @$_FILES['gambar']['tmp_name'];

                    $target = 'img/gambar_soal_essay/';

                    $nama_gambar = @$_FILES['gambar']['name'];



                    if(@$_GET['gbr'] == 'del') {

						if($nama_gambar == '') {

							mysqli_query($db, "UPDATE tb_soal_essay SET pertanyaan = '$pertanyaan', gambar = '' WHERE id_essay = '$idsoal'") or die ($db->error);

							// echo "gambar benar2 dihapus";

						} else {

							move_uploaded_file($sumber, $target.$nama_gambar);

							mysqli_query($db, "UPDATE tb_soal_essay SET pertanyaan = '$pertanyaan', gambar = '$nama_gambar' WHERE id_essay = '$idsoal'") or die ($db->error);

							// echo "gambar dihapus dan diupload baru";

						}

					} else {

						if($nama_gambar == '') {

							mysqli_query($db, "UPDATE tb_soal_essay SET pertanyaan = '$pertanyaan' WHERE id_essay = '$idsoal'") or die ($db->error); 

							// echo "gambar tidak dihapus dan tidak diperbarui (tetap)";

						} else {

							move_uploaded_file($sumber, $target.$nama_gambar);

							mysqli_query($db, "UPDATE tb_soal_essay SET pertanyaan = '$pertanyaan', gambar = '$nama_gambar' WHERE id_essay = '$idsoal'") or die ($db->error);

							// echo "gambar diperbarui dari sebelumnya";

						}

					}        

                    echo '<script>window.location="?page=quiz&action=daftarsoal&hal=essay&id='.$id.'"</script>';

	            } ?>



			</div>

		</div>

	</div>

	<?php

} else if(@$_GET['hal'] == "hapussoalessay") {

	mysqli_query($db, "DELETE FROM tb_soal_essay WHERE id_essay = '$idsoal'") or die ($db->error);

	echo "<script>window.location='?page=quiz&action=daftarsoal&hal=essay&id=".$id."';</script>";

} ?>