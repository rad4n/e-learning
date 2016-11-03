<style type="text/css">
	@import url(http://fonts.googleapis.com/css?family=Roboto);
	.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  margin: 0 auto;
  overflow: hidden;
  font-family: roboto;
}

.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}

<<<<<<< HEAD
.loginmodal-submit{
=======
.loginmodal-container input[type=submit] {
>>>>>>> 7741143d769dde2c08503735d12a4b0c68e8ba62
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.loginmodal-container a {
  text-decoration: none;
  color: black;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 

.login-help{
  font-size: 12px;
}
</style>
<div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<<<<<<< HEAD
=======
  	<div class="modal-dialog">
		<div class="loginmodal-container">
>>>>>>> 7741143d769dde2c08503735d12a4b0c68e8ba62
       <?php
                        if(@$_POST['login']) {
                            $user = @mysqli_real_escape_string($db, $_POST['user']);
                            $pass = @mysqli_real_escape_string($db, $_POST['pass']);
                            $sql = mysqli_query($db, "SELECT * FROM tb_siswa WHERE username = '$user' AND password = md5('$pass')") or die ($db->error);
                            $data = mysqli_fetch_array($sql);
                            if(mysqli_num_rows($sql) > 0) {
                                if($data['status'] == 'aktif') {
                                    @$_SESSION['siswa'] = $data['id_siswa'];
                                    echo "<script>window.location='./';</script>";
                                } else {
                                    echo '<div class="alert alert-warning">Login gagal, akun Anda sedang tidak aktif</div>';
                                }
                            } else {
                                echo '<div class="alert alert-danger">Login gagal, username / password salah, coba lagi!</div>';
                            }
                        } ?>
<<<<<<< HEAD
		  <form method="post" class="form-horizontal">
      <div class="form-group col-xs-12 col-md-12">
			   <input type="text" name="user" placeholder="Username" class="form-control" required>
      </div>
      <div class="form-group col-xs-12 col-md-12">
			   <input type="password" name="pass" placeholder="Password" class="form-control" required>
        <input type="submit" name="login" class="login loginmodal-submit" value="Login">
			</div>
=======
		  <form method="post">
			<input type="text" name="user" placeholder="Username" class="form-control" required>
			<input type="password" name="pass" placeholder="Password" class="form-control" required>
			<input type="submit" name="login" class="login loginmodal-submit" value="Login">
>>>>>>> 7741143d769dde2c08503735d12a4b0c68e8ba62
		  </form>
			
		  <div class="login-help">
			<a href="./?hal=daftar">Register</a> - <a href="#">Forgot Password</a>
		  </div>
<<<<<<< HEAD
=======
		</div>
	</div>
>>>>>>> 7741143d769dde2c08503735d12a4b0c68e8ba62
</div>