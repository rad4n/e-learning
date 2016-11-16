
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-heading">Data Nilai Ujian Anda</div>
            <div class="panel-body">
                <div class="table-responsive">
                	<table class="table table-striped table-bordered table-hover">
                    <?php
                        $no = 1;
                        $sql_cek_nilai_pilgan = mysqli_query($db, "SELECT * FROM tb_nilai_pilgan JOIN tb_topik_quiz ON tb_nilai_pilgan.id_tq = tb_topik_quiz.id_tq JOIN tb_mapel ON tb_topik_quiz.id_mapel = tb_mapel.id WHERE id_siswa = '$_SESSION[siswa]' ORDER BY tb_nilai_pilgan.id DESC LIMIT 1 ") or die ($db->error);
                        if(mysqli_num_rows($sql_cek_nilai_pilgan) > 0) {
                            while($data_nilai_pilgan = mysqli_fetch_array($sql_cek_nilai_pilgan)) { ?>
                                
                		<tr>
                			<td>Benar</td>
                            <td>:</td>
                            <td><?php echo $data_nilai_pilgan['benar']; ?></td>
                		</tr>
                        <tr>
                            <td>Salah</td>
                            <td>:</td>
                            <td><?php echo $data_nilai_pilgan['salah']; ?></td>
                        </tr>
                        <tr>
                            <td>Kosong</td>
                            <td>:</td>
                            <td><?php echo $data_nilai_pilgan['tidak_dikerjakan']; ?></td>
                        </tr>
                        <tr>
                            <td>Nilai</td>
                            <td>:</td>
                            <td><?php echo $data_nilai_pilgan['presentase']; ?></td>
                        </tr>
                		
                	</table>
                            
                    <?php } } else {
                            echo '<tr><td colspan="6" align="center">Tidak ada data nilai, mungkin Anda belum mengikuti ujian</td></tr>';
                        } ?>
               	</div>
            </div>
        </div>
    </div>
</div>