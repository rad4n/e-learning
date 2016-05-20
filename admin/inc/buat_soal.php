
<div class="row">
	<div class="panel panel-default">
	    <div class="panel-heading">
	        <a onclick="self.history.back();" class="btn btn-danger btn-sm">Kembali</a> &nbsp; 
	        Buat Jenis Soal : <a href="?page=quiz&action=buatsoal&hal=soalpilgan&id=<?php echo $id; ?>" class="btn btn-primary btn-sm">Pilihan Ganda</a> 
	        <a href="?page=quiz&action=buatsoal&hal=soalpilganexcel&id=<?php echo $id; ?>" class="btn btn-primary btn-sm">Pilihan Ganda dari excel</a> 
	        <a href="?page=quiz&action=buatsoal&hal=soalessay&id=<?php echo $id; ?>" class="btn btn-primary btn-sm">Essay</a>
	    </div>
	    <div class="panel-body" style="padding-bottom:0;">
			<div class="alert alert-warning">
		        Perhatian, pembuatan soal wajib ada pilihan gandanya, jangan essay saja. Kalo soal pilihan ganda saja tanpa essay atau ada keduanya tidak masalah. 
	        </div>
	    </div>
	</div>
</div>

<?php
if(@$_GET['hal'] == "soalpilgan") { ?>
	<div class="row">
		<div class="panel panel-default">
		    <div class="panel-heading">Buat Soal Pilihan Ganda</div>
		    <div class="panel-body">
		    	<?php $sql_jumlah_pilgan = mysqli_query($db, "SELECT * FROM tb_soal_pilgan WHERE id_tq = '$id'") or die ($db->error); ?>
			    <form method="post" enctype="multipart/form-data">
					<div class="col-md-2">
						<label>Pertanyaan No. [ <?php echo mysqli_num_rows($sql_jumlah_pilgan) + 1; ?> ]</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pertanyaan" class="form-control" rows="2" required></textarea>
						</div>
					</div>

					<div class="col-md-2">
						<label>Gambar <sup>(Optional)</sup></label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="file" name="gambar" class="form-control" />
						</div>
					</div>

					<div class="col-md-2">
						<label>Video <sup>(Optional)</sup></label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="file" name="video" class="form-control" />
						</div>
					</div>

					<div class="col-md-2">
						<label>Audio <sup>(Optional)</sup></label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="file" name="audio" class="form-control" />
						</div>
					</div>
					
					<div class="col-md-2">
						<label>Pilihan A</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilA" class="form-control" rows="1" required></textarea>
						</div>
					</div>
					<div class="col-md-2">
						<label>Pilihan B</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilB" class="form-control" rows="1" required></textarea>
						</div>
					</div>
					<div class="col-md-2">
						<label>Pilihan C</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilC" class="form-control" rows="1" required></textarea>
						</div>
					</div>
					<div class="col-md-2">
						<label>Pilihan D</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilD" class="form-control" rows="1" required></textarea>
						</div>
					</div>
					<div class="col-md-2">
						<label>Pilihan E</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilE" class="form-control" rows="1" required></textarea>
						</div>
	                </div>
	                <div class="col-md-2">
						<label>Kunci Jawaban</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
                            <label class="radio-inline">
                                <input type="radio" name="kunci" value="A">A
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="kunci" value="B">B
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="kunci" value="C">C
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="kunci" value="D">D
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="kunci" value="E">E
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

                    $sumber2 = @$_FILES['video']['tmp_name'];
                    $target2 = 'img/video_soal_pilgan/';
                    $nama_video = @$_FILES['video']['name'];

                    $sumber3 = @$_FILES['audio']['tmp_name'];
                    $target3 = 'img/audio_soal_pilgan/';
                    $nama_audio = @$_FILES['audio']['name'];

                    move_uploaded_file($sumber, $target.$nama_gambar);
                    move_uploaded_file($sumber2, $target2.$nama_video);
                    move_uploaded_file($sumber3, $target3.$nama_audio);

                    mysqli_query($db, "INSERT INTO tb_soal_pilgan VALUES('', '$id', '$pertanyaan', '$nama_gambar','$nama_video','$nama_audio', '$pilA', '$pilB', '$pilC', '$pilD', '$pilE', '$kunci', now())") or die ($db->error);          
                    echo '<script>window.location="?page=quiz&action=daftarsoal&hal=pilgan&id='.$id.'"</script>';
	            }?>
		    </div>
		</div>
	</div>
<?php
}else if(@$_GET['hal'] == "soalpilganexcel"){?>
	<div class="row">
		<div class="panel panel-default">
			<div class="panel-heading">Upload Soal Pilihan Ganda</div>
			<div class="panel-body">
				<form name="form-upload" method="post" enctype="multipart/form-data">
					<input type="file" name="soal">
					<input type="submit" name="upload" value="Upload" class="btn btn-success" />
				</form>
			</div>
			<?php
	            if(@$_POST['upload']){
	    //         	include "excel/excel_reader2.php";
	    //         	$cell   = new Spreadsheet_Excel_Reader($_FILES['soal']['tmp_name']);
					// $jumlah = $cell->rowcount($sheet_index=0);
					require 'PHPExcel.php';
					require_once 'PHPExcel/IOFactory.php';
					$cell = PHPExcel_IOFactory::load($_FILES['soal']['tmp_name']);
					$jumlah   = $cell->getWorksheetIterator()->getHighestRow();
					$i = 2; // dimulai dari ke dua karena baris pertama berisi title
					$gagal = 0;
					$sukses = 0;
					$no = 1;
					while( $i<=$jumlah ){				 
						//$cell->val( baris,kolom )

						// $pertanyaan  = $cell->val( $i,2 );
						// $pilA = $cell->val( $i,3 );
						// $pilB= $cell->val( $i,4 );
						// $pilC = $cell->val( $i,5 );
						// $pilD = $cell->val( $i,6 );
						// $pilE = $cell->val( $i,7 );
						// $kunci = $cell->val( $i,8 );
						// $nama_gambar = $cell->val( $i,9 );
						// $nama_video = $cell->val( $i,10 );
						// $nama_audio = $cell->val( $i,11 );
						//echo $id; exit;

						$pertanyaan = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,2)->getValue();
						$pilA = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,3)->getValue();
						$pilB = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,4)->getValue();
						$pilC = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,5)->getValue();
						$pilD = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,6)->getValue();
						$pilE = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,7)->getValue();
						$kunci = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,8)->getValue();
						$nama_gambar = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,9)->getValue();
						$nama_video = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,10)->getValue();
						$nama_audio = $cell->getWorksheetIterator()->getCellByColumnAndRow($i,11)->getValue();

						$sql ="INSERT INTO tb_soal_pilgan (id_tq,pertanyaan,gambar,video,audio,pil_a,pil_b,pil_c,pil_d,pil_e,kunci,tgl_buat) VALUES ('$id', '$pertanyaan', '$nama_gambar','$nama_video','$nama_audio', '$pilA', '$pilB', '$pilC', '$pilD', '$pilE', '$kunci', now())";
						$r = mysqli_query($db,$sql)or die ($db->error); 
	            	}
	            	echo '<script>window.location="?page=quiz&action=daftarsoal&hal=pilgan&id='.$id.'"</script>';
	        	} 
	        ?>
		</div>			            
	</div>
 <?php }else if(@$_GET['hal'] == "soalessay") { ?>
	<div class="row">
		<div class="panel panel-default">
		    <div class="panel-heading">Buat Soal Essay</div>
		    <div class="panel-body">
		    	<?php
		    	$sql_jumlah_essay = mysqli_query($db, "SELECT * FROM tb_soal_essay WHERE id_tq = '$id'") or die ($db->error); ?>
			    <form method="post" enctype="multipart/form-data">
					<div class="col-md-2">
						<label>Pertanyaan No. [ <?php echo mysqli_num_rows($sql_jumlah_essay) + 1; ?> ]</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pertanyaan" class="form-control" rows="3" required></textarea>
						</div>
					</div>

					<div class="col-md-2">
						<label>Gambar <sup>(Optional)</sup></label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<input type="file" name="gambar" class="form-control" />
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

                    move_uploaded_file($sumber, $target.$nama_gambar);
                    mysqli_query($db, "INSERT INTO tb_soal_essay VALUES('', '$id', '$pertanyaan', '$nama_gambar', now())") or die ($db->error);          
                    echo '<script>window.location="?page=quiz&action=daftarsoal&hal=essay&id='.$id.'"</script>';
	            }
	            ?>
		    </div>
		</div>
	</div>
	<?php
} ?>