<script>tinymce.init({ 
	selector:'.incTiny',
	plugins:[
		"advlist autolink lists link image charmap print preview anchor",
		"searchreplace visualblocks code fullscreen",
		"insertdatetime media table contextmenu paste imagetools tiny_mce_wiris"
	],
	toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | tiny_mce_wiris_formulaEditor"
	});</script>
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
			<?php 
				if(isset($_GET['hal']) AND $_GET['hal']=="soalpilganexcel"){
			?>
		        Perhatian, silahkan download contoh file excel berikut<br>
		        <strong><a href="<?php echo base_url."contoh_soal.xls";?>">Download file excel</a></strong><br>
		        untuk melihat contoh format yang benar dalam pembuatan soal.
	       <?php }else{?>
	       		Perhatian, pembuatan soal wajib ada pilihan gandanya, jangan essay saja. Kalo soal pilihan ganda saja tanpa essay atau ada keduanya tidak masalah.
	       <?php }?>
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
						<label>Group Soal</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="level_group" class="form-control" rows="1" required></textarea>
						</div>
					</div>
					<div class="col-md-2">
						<label>Pertanyaan No. [ <?php echo mysqli_num_rows($sql_jumlah_pilgan) + 1; ?> ]</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pertanyaan" class="form-control incTiny" rows="2"></textarea>
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
							<textarea name="pilA" class="form-control incTiny" rows="1"></textarea>
						</div>
						<div class="form-group">
							<input type="file" name="gambar_a" class="form-control" />
						</div>
					</div>
					<div class="col-md-2">
						<label>Pilihan B</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilB" class="form-control incTiny" rows="1"></textarea>
						</div>
						<div class="form-group">
							<input type="file" name="gambar_b" class="form-control" />
						</div>
					</div>
					<div class="col-md-2">
						<label>Pilihan C</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilC" class="form-control incTiny" rows="1"></textarea>
						</div>
						<div class="form-group">
							<input type="file" name="gambar_c" class="form-control" />
						</div>
					</div>
					<div class="col-md-2">
						<label>Pilihan D</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilD" class="form-control incTiny" rows="1"></textarea>
						</div>
						<div class="form-group">
							<input type="file" name="gambar_d" class="form-control" />
						</div>
					</div>
					<div class="col-md-2">
						<label>Pilihan E</label>
					</div>
					<div class="col-md-10">
						<div class="form-group">
							<textarea name="pilE" class="form-control incTiny" rows="1"></textarea>
						</div>
						<div class="form-group">
							<input type="file" name="gambar_e" class="form-control" />
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
	            	$level_group = @mysqli_real_escape_string($db, $_POST['level_group']);
	            	$pertanyaan = @mysqli_real_escape_string($db, $_POST['pertanyaan']);
	            	$pilA = @mysqli_real_escape_string($db, $_POST['pilA']);
	            	$pilB = @mysqli_real_escape_string($db, $_POST['pilB']);
	            	$pilC = @mysqli_real_escape_string($db, $_POST['pilC']);
	            	$pilD = @mysqli_real_escape_string($db, $_POST['pilD']);
	            	$pilE = @mysqli_real_escape_string($db, $_POST['pilE']);
	            	$kunci = @mysqli_real_escape_string($db, $_POST['kunci']);

	            	$nama_gambar = '';
	            	$nama_video  = '';
	            	$nama_audio  = '';
	            	$nama_gambar_a ='';
	            	$nama_gambar_b ='';
	            	$nama_gambar_c ='';
	            	$nama_gambar_d ='';
	            	$nama_gambar_e ='';

	            	if(!empty($_FILES['gambar']['tmp_name'])){
		            	$sumber = @$_FILES['gambar']['tmp_name'];
	                    $target = DIR_ASSETS.'gambar_soal_pilgan/';
	                    $nama_gambar = md5($id.$level_group.@$_FILES['gambar']['name']).'.'.pathinfo($_FILES['gambar']['name'], PATHINFO_EXTENSION);
                    	move_uploaded_file($sumber, $target.$nama_gambar);
	                }

                    if(!empty($_FILES['video']['tmp_name'])){
	                    $sumber2 = @$_FILES['video']['tmp_name'];
	                    $target2 = DIR_ASSETS.'video_soal_pilgan/';
	                    $nama_video = md5($id.$level_group.@$_FILES['video']['name']).'.'.pathinfo($_FILES['video']['name'], PATHINFO_EXTENSION);
                    	move_uploaded_file($sumber2, $target2.$nama_video);
	                }

                    if(!empty($_FILES['audio']['tmp_name'])){
	                    $sumber3 = @$_FILES['audio']['tmp_name'];
	                    $target3 = DIR_ASSETS.'audio_soal_pilgan/';
	                    $nama_audio = md5($id.$level_group.@$_FILES['audio']['name']).'.'.pathinfo($_FILES['audio']['name'], PATHINFO_EXTENSION);
                    	move_uploaded_file($sumber3, $target3.$nama_audio);
	                }

                    #####gambar pilihan soal

                    if(!empty($_FILES['gambar_a']['tmp_name'])){
	                    $sumber4 = @$_FILES['gambar_a']['tmp_name'];
	                    $target4 = DIR_ASSETS.'gambar_soal_pilgan/';
	                    $nama_gambar_a = md5($id.$level_group.@$_FILES['gambar_a']['name']).'.'.pathinfo($_FILES['gambar_a']['name'], PATHINFO_EXTENSION);
                    	move_uploaded_file($sumber4, $target4.$nama_gambar_a);
	                }

                    if(!empty($_FILES['gambar_b']['tmp_name'])){
	                    $sumber5 = @$_FILES['gambar_b']['tmp_name'];
	                    $target5 = DIR_ASSETS.'gambar_soal_pilgan/';
	                    $nama_gambar_b = md5($id.$level_group.@$_FILES['gambar_b']['name']).'.'.pathinfo($_FILES['gambar_b']['name'], PATHINFO_EXTENSION);
                    	move_uploaded_file($sumber5, $target5.$nama_gambar_b);
	                }

                    if(!empty($_FILES['gambar_c']['tmp_name'])){
	                    $sumber6 = @$_FILES['gambar_c']['tmp_name'];
	                    $target6 = DIR_ASSETS.'gambar_soal_pilgan/';
	                    $nama_gambar_c = md5($id.$level_group.@$_FILES['gambar_c']['name']).'.'.pathinfo($_FILES['gambar_c']['name'], PATHINFO_EXTENSION);
                    	move_uploaded_file($sumber6, $target6.$nama_gambar_c);
	                }

                    if(!empty($_FILES['gambar_d']['tmp_name'])){
	                    $sumber7 = @$_FILES['gambar_d']['tmp_name'];
	                    $target7 = DIR_ASSETS.'gambar_soal_pilgan/';
	                    $nama_gambar_d = md5($id.$level_group.@$_FILES['gambar_d']['name']).'.'.pathinfo($_FILES['gambar_d']['name'], PATHINFO_EXTENSION);
                    	move_uploaded_file($sumber7, $target7.$nama_gambar_d);
	                }

                    if(!empty($_FILES['gambar_e']['tmp_name'])){
                    	$sumber8 = @$_FILES['gambar_e']['tmp_name'];
                    	$target8 = DIR_ASSETS.'gambar_soal_pilgan/';
                    	$nama_gambar_e = md5($id.$level_group.@$_FILES['gambar_e']['name']).'.'.pathinfo($_FILES['gambar_e']['name'], PATHINFO_EXTENSION);
                   		 move_uploaded_file($sumber8, $target8.$nama_gambar_e);
                    }

                   // print_r($r); exit;
                    mysqli_query($db, "INSERT INTO tb_soal_pilgan (
		                    	id_tq,
		                    	pertanyaan,
		                    	gambar,
		                    	video,
		                    	audio,
		                    	pil_a,
		                    	gbr_a,
		                    	pil_b,
		                    	gbr_b,
		                    	pil_c,
		                    	gbr_c,
		                    	pil_d,
		                    	gbr_d,
		                    	pil_e,
		                    	gbr_e,
		                    	kunci,
		                    	tgl_buat,
		                    	level_group
                    	) VALUES(
		                    	'$id', 
		                    	'$pertanyaan', 
		                    	'$nama_gambar',
		                    	'$nama_video',
		                    	'$nama_audio', 
		                    	'$pilA',
		                    	'$nama_gambar_a', 
		                    	'$pilB',
		                    	'$nama_gambar_b', 
		                    	'$pilC',
		                    	'$nama_gambar_c', 
		                    	'$pilD',
		                    	'$nama_gambar_d', 
		                    	'$pilE',
		                    	'$nama_gambar_e', 
		                    	'$kunci', 
		                    	 now(),
		                    	 $level_group
                    	)") or die ($db->error);          
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
	            	$target_dir = DIR_ASSETS."img/";
					$target_file = $target_dir . basename($_FILES["soal"]["name"]);
					move_uploaded_file($_FILES['soal']['tmp_name'],$target_file); 

					require 'inc/PHPExcel.php';
					require_once 'inc/PHPExcel/IOFactory.php';
					$objPHPExcel = PHPExcel_IOFactory::load($target_file);
					

					//GET IMAGE FROM EXCEL
					foreach ($objPHPExcel->getActiveSheet()->getDrawingCollection() as $drawing) {
						$string = $drawing->getCoordinates();
							$coordinate = PHPExcel_Cell::coordinateFromString($string); 
							if ($drawing instanceof PHPExcel_Worksheet_MemoryDrawing) {
								$image = $drawing->getImageResource();
								$renderingFunction = $drawing->getRenderingFunction();
								switch ($renderingFunction) {
									case PHPExcel_Worksheet_MemoryDrawing::RENDERING_JPEG:
										imagejpeg($image, DIR_ASSETS.'gambar_soal_pilgan/' . $drawing->getIndexedFilename());
									break;
									case PHPExcel_Worksheet_MemoryDrawing::RENDERING_GIF:
										imagegif($image, DIR_ASSETS.'gambar_soal_pilgan/' . $drawing->getIndexedFilename());
									break;
									case PHPExcel_Worksheet_MemoryDrawing::RENDERING_PNG:
										imagepng($image, DIR_ASSETS.'gambar_soal_pilgan/' . $drawing->getIndexedFilename());
									break;
									case PHPExcel_Worksheet_MemoryDrawing::RENDERING_DEFAULT:
										imagepng($image, DIR_ASSETS.'gambar_soal_pilgan/' . $drawing->getIndexedFilename());
									break;
								}
								if($coordinate[0]=="C")$nama_gambar[$coordinate[1]] =  $drawing->getIndexedFilename();
								if($coordinate[0]=="I")$gambar_a[$coordinate[1]] 	=  $drawing->getIndexedFilename();
								if($coordinate[0]=="J")$gambar_b[$coordinate[1]] 	=  $drawing->getIndexedFilename();
								if($coordinate[0]=="K")$gambar_c[$coordinate[1]] 	=  $drawing->getIndexedFilename();
								if($coordinate[0]=="L")$gambar_d[$coordinate[1]] 	=  $drawing->getIndexedFilename();
								if($coordinate[0]=="M")$gambar_e[$coordinate[1]] 	=  $drawing->getIndexedFilename();

							}
					}
					$allDataInSheet = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
					//print_r($allDataInSheet);exit;
					//$arrayCount
					$arrayCount = count($allDataInSheet);
					$sql ="INSERT INTO tb_soal_pilgan (
												id_tq,
												pertanyaan,
												gambar,
												pil_a,
												pil_b,
												pil_c,
												pil_d,
												pil_e,
												gbr_a,
												gbr_b,
												gbr_c,
												gbr_d,
												gbr_e,
												kunci,
												tgl_buat,
												level_group) VALUES";
					for($i=4;$i<=$arrayCount;$i++){
							$pertanyaan  	= trim($allDataInSheet[$i]["B"]);
							$pilA 			= trim($allDataInSheet[$i]["D"]);
							$pilB 			= trim($allDataInSheet[$i]["E"]);
							$pilC 			= trim($allDataInSheet[$i]["F"]);
							$pilD 			= trim($allDataInSheet[$i]["G"]);
							$pilE 			= trim($allDataInSheet[$i]["H"]);
							$kunci 			= trim($allDataInSheet[$i]["N"]);
							$level_group 	= trim($allDataInSheet[$i]["O"]);


					$sql .= " (
								'$id', 
								'$pertanyaan', 
								'".$nama_gambar[$i]."',
								'$pilA', 
								'$pilB', 
								'$pilC', 
								'$pilD', 
								'$pilE', 
								'".$gambar_a[$i]."',
								'".$gambar_b[$i]."',
								'".$gambar_c[$i]."',
								'".$gambar_d[$i]."',
								'".$gambar_e[$i]."',
								'$kunci', 
								 now(),
								'$level_group'
							   ),";
					}
					$sql = substr($sql,0,-1);
					mysqli_query($db,$sql)or die ($db->error); 

	            	if(!$db->error)echo '<script>window.location="?page=quiz&action=daftarsoal&hal=pilgan&id='.$id.'"</script>';
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