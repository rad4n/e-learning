<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sistem Pengumuman UN</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<link href='http://fonts.googleapis.com/css?family=Belgrano' rel='stylesheet' type='text/css'>
<!-- jQuery file -->
<script src="js/jquery.min.js"></script>
<script src="js/jquery.tabify.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var $ = jQuery.noConflict();
$(function() {
$('#tabsmenu').tabify();
$(".toggle_container").hide(); 
$(".trigger").click(function(){
	$(this).toggleClass("active").next().slideToggle("slow");
	return false;
});
});
</script>
</head>
<body>
<div id="panelwrap">
  	
	<div class="header">
    <div class="title"><a href="#">Sistem Pengumuman UN</a></div>
    
    <div class="header_right">Welcome Admin, <a href="#" class="settings">Settings</a> <a href="#" class="logout">Logout</a> </div>
    
    <div class="menu">
    <ul>
    <li><a href="#" class="selected">Main page</a></li>
    </ul>
    </div>
    
    </div>
    
    <div class="submenu">
    <ul>
  
    </ul>
    </div>          
                    
    <div class="center_content">  
 
    <div id="right_wrap">
    <div id="right_content">             
   
                    
              
    
    <ul id="tabsmenu" class="tabsmenu">
        <li class="active"><a href="#tab1">Hasil</a></li>
        
    </ul>
    <div id="tab1" class="tabcontent">
     <form action="aksi_excel.php" method="post" enctype="multipart/form-data">
            
            <div class="form_row">
            
            
             <table border=1px;>
					<tr><th>No</th>
						<th>Nama</th>
						<th>No Peserta</th>
						<th>Program</th>
						<th>Ket</th>
					</tr>


<?php
 
include "excel_reader2.php";
if( mysql_connect("localhost","u2447560_sman114","p4r3p4r3") ){
   mysql_select_db( "u2447560_sman114" );
}else{
   echo "database gagal"; exit;
}
if( isset( $_POST['submit_import'] ) ){
 
$cell   = new Spreadsheet_Excel_Reader($_FILES['upfile']['tmp_name']);
$jumlah = $cell->rowcount($sheet_index=0);
 
$i = 8; // dimulai dari ke dua karena baris pertama berisi title
$gagal = 0;
$sukses = 0;
$no = 1;
while( $i<=$jumlah ){
 
   //$cell->val( baris,kolom )
 
   $id  = $cell->val( $i,2 );
   $nis = $cell->val( $i,3 );
   $no_peserta= $cell->val( $i,4 );
   $nama = $cell->val( $i,5 );
    $ket = $cell->val( $i,7 );
	$prodi = $cell->val( $i,6 );
 //echo $id; exit;
$sql ="INSERT INTO siswa (id,no_peserta,nis,nama,ket,prodi) VALUES ('$id','$nis','$no_peserta','$nama','$ket','$prodi')";
$r = mysql_query( $sql ); 
if(!$r) {$gagal++;}
else $sukses++;
   $i++;
   ?>
   
   <tr>						<td><?php echo $no;?></td>
						<td><?php echo $nama;?></td>
						<td><?php echo $no_peserta;?></td>
						<td><?php echo $prodi;?></td>
						<td><?php echo $ket;?></td>
</tr>
</tr>
</tr>
</tr>
   <?php $no++;
}
 
}

?>

			 </table></div>
			 
			 <?php echo " $sukses data berhasil masuk <br>";
echo " $gagal data gagal masuk"; ?>
            <div class="clear"></div>
			</form>
        </div>
    </div>
    
     
    

    
       
      
     </div>
     </div><!-- end of right content-->
                     
                    
    <div class="sidebar" id="sidebar">
    <h2>Download File Contoh</h2>
    
        <ul>
            <li><a href="#" class="selected">File Contoh Excel</a></li>
        </ul>
        
       
    
    </div>             
    
    
    <div class="clear"></div>
    </div> <!--end of center_content-->
    
    <div class="footer">
Kerendi Developers <a href="#" target="_blank">CSSTemplatesMarket</a>
</div>

</div>

    	
</body>
</html>