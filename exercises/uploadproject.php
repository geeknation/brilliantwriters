<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

		<title>Brilliant Writers | Upload Project</title>

		<link rel="stylesheet" href="libs/pure.css" type="text/css">
		<link href="libs/font-awesome-4.0.3/css/font-awesome.css" rel="stylesheet">
		<link rel="stylesheet" href="libs/bootstrap/css/bootstrap.css" style="">
		<link rel="stylesheet" href="libs/bxslider/jquery.bxslider.css" type="text/css">
		<link rel="stylesheet" href="libs/font-awesome-4.0.3/css/font-awesome.min.css" type="text/css">
		<link href="main.css" rel="stylesheet">

	</head>
	<style type="text/css">
		.warm {
			background: rgb(223, 117, 20); /* this is an orange */
			color: #FFFFFF
		}
	</style>
	<body>
		<nav class="navbar navbar-default" role="navigation">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Brrilliant Writers</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li class="active">
						<a href="index.php">Home</a>
					</li>
					<li>
						<a href="#"></a>
					</li>
					
				</ul>
				<!--form class="navbar-form navbar-left" role="search">
				<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
				</form-->
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="#"></a>
					</li>
					<li class="dropdown">
						<!-- <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a> -->
						<ul class="dropdown-menu">
							<li>
								<a href="#">Action</a>
							</li>
							<li>
								<a href="#">Another action</a>
							</li>
							<li>
								<a href="#">Something else here</a>
							</li>
							<li>
								<a href="#">Separated link</a>
							</li>
						</ul>
					</li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</nav>

		<!-- <div id="subnav">
		Subnav
		</div> -->
		<div class="pane" id="pane1">

			<div class="banner">
				Stuck with a Writing Project?
				<p></p>
				<ul class="bxslider">
					<li>
						Get it done quickly and professionally.
					</li>

					<li>
						Saves you time.
					</li>

					<li>
						Makes You Look Good.
					</li>

					<li>
						At a very affordable rate.
					</li>
					<li>
						Get started on your right. :-)
					</li>
				</ul>
			</div>
			<div class="startup_pane">
				<div class="">
					<?php
					if (isset($_GET['flag'])) {
						$flag = $_GET['flag'];
						if ($flag = md5("emptyfile")) {
							echo "
<div class='panel panel-info'>
Please upload an exercise.
</div>
";
						} else {
							//failsafe  for url modification
							header("Location: index.php");
						}
					}
					?>
				</div>
				<form class="" id="regForm" action="_epg.php" method="post" enctype="multipart/form-data" role="role">
					<fieldset>
						<legend>
							Upload Writing project here
						</legend>
						<p></p>
						<label>Exercise</label>
						
						
						<div class="form-group">
							<span>Project category</span>
							<select id="project-category" class="form-control" name="project-category">
								<option>Select a project category</option>
								<option>Technology</option>
								<option>Engineering</option>
								<option>Business</option>
							</select>
						</div>
						<div class="form-group">
							<span>select file from computer</span>
							<input type="file" name="exercise" id="exercise" class="upload form-control"/>
						</div>

						<!-- <label>First Name</label>
						<input type="text" id="firstname" name="firstname" class=""/>

						<label>Second Name</label>
						<input type="text" id="secondname" name="secondname"/> -->

						<div class="form-group">
							<label for="email">Email</label>
							<input type="text" id="email" name="email" class="form-control"/>
						</div>

						<div class="form-group">
							<label>Password</label>
							<input type="password" id="password" name="password" class="form-control"/>
						</div>

						<div class="form-group">
							<label>Confirm Password</label>
							<input type="password" id="confPassword" name="confPAssword" class="form-control"/>
						</div>

						<hr/>
						<div class="form-group">
							<label>Phone Number</label>
							<input type="text" name="phonenumber" id="phonenumber" class="form-control"/>
						</div>

						<div class="form-group">
							<label>Location</label>
							<input type="text" name="location" id="location" class="form-control"/>
						</div>

						<p id="sign_up_btn_holder">
							<input type="button" class="btn btn-warning warm" id="signup" value="Sign Up and upload Exercise" class="form-control"/>
						</p>

						<input type="hidden" name="createaccount" id="createaccount" value="createaccount"/>
					</fieldset>

				</form>

			</div>
		</div>

		<div class="pane">
			<!-- <h2><i class="fa fa-cog fa-2x"></i>How it Works</h2> -->
		</div>
		<footer>
				<div class="row">
					<div class="col-lg-12">
						<p>
							Copyright &copy; Brilliant Writers 2014
						</p>
					</div>
				</div>
			</footer>
		
	</body>
	<script type="text/javascript" src="libs/jquery1.9.js"></script>

		<script type="text/javascript" src="libs/bxslider/jquery.bxslider.min.js"></script>
		<script type="text/javascript" src="libs/modernizr.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				//form validation
				$("#signup").click(function() {
					validateForm();
				});
				function validateForm() {

					var password = $("#password").val();
					var confirmpassword = $("#confPassword").val();
					var location = $("#location").val();
					var phonenumber = $("#phonenumber").val();
					var email = $("#email").val();
					var category=$("#project-category").is(":selected");
					var empty = Array();
					var counter = 0;

					$("input[type=text]").each(function() {
						if ($(this).val() == '' || $(this).val() == null) {
							empty[counter] = "empty";
						} else {
							empty[counter] = "filled";
						}
						counter++;
					});

					//validation
					if ($.inArray("empty", empty) != -1 || $.inArray("empty", empty) >= 0) {
						window.alert("empty fields");
						console.log(empty);
						return false;

					}
					//check if the password fields are empty
					else if (emptyPasswords(password, confirmpassword) == 1) {
						window.alert("empty passwords");
						return false;

					}
					//check if passwords match
					else if (password != confirmpassword) {
						window.alert("not matching");
						return false;
					}
					//check if email is valid
					else if (validateEmail(email) == false) {
						window.alert("invalid email");
						return false;
					}else if(category=="Select a project category"){
						window.alert("please select a project category");
					}

					//submit the form
					$("#regForm").submit();

				}

				function emptyPasswords(p1, p2) {
					if (p1 == "" || p2 == "") {
						return 1;
					} else {
						return 0;
					}
				}

				function validateEmail(email) {
					var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
					return re.test(email);
				}

			});
			//carousel
			// $('.bxslider').bxSlider({
			// auto:true,
			// pause:5000,
			// infiniteLoop:true,
			// mode:"vertical"
			// });
		</script>
</html>

<!-- <button class="pure-button">
<i class="fa fa-cog fa-lg"></i>
Settings
</button> -->
