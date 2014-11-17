<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Password Reset</title>
		<link rel="stylesheet" href="libs/bootstrap/css/bootstrap.css">
		<script type="text/javascript" src="_/alertify.js-0.3.9/src/alertify.js"></script>
		<link rel="stylesheet" href="_/alertify.js-0.3.9/themes/alertify.core.css" type="text/css">
	</head>

	<body>
		<form role="form">
			<div class="form-group">
				<label for="password1">Password</label>
				<input type="password" class="form-control" name="password1" id="password1">
			</div>
			<div class="form-group">
				<label for="password2">Confirm Password</label>
				<input type="password" class="form-control" name="password2" id="password2">
			</div>
			<div class="form-group">
				<input type="button" class="btn btn-warning" name="btn-change-pass" id="btn-change-pass" value="Change Password">
			</div>
		</form>
	</body>
	<script type="text/javascript" src="libs/jquery1.9.js"></script>
	<script type="text/javascript" src="libs/bootstrap/js/bootstrap.js"></script>
	
	
	<script type="text/javascript">
		jQuery(document).ready(function($){
			var $changeauth=$("#btn-change-pass");
			var pass1=$("#password1").val();
			var pass2=$("#password2").val();
			$changeauth.click(function(){
				//check if passwords match
				if(pass1!==pass2){
					alertify.success("Passwords not matching");
				}else{
					//submit the passwords
					$.ajax({
						url:,
						type:"post",
						dataType:"json",
						beforeSend:function(){
							
						},
						success:function(){
							
						}
					}).done(function(data){
						
					});
				}
			});
		});
		
	</script>
</html>

