<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="utf-8">

		<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
		Remove this if you use the .htaccess -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

		<title>datadump</title>
		<meta name="description" content="">
		<meta name="author" content="ian">

		<meta name="viewport" content="width=device-width; initial-scale=1.0">

		<!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
		<link rel="shortcut icon" href="/favicon.ico">
		<link rel="apple-touch-icon" href="/apple-touch-icon.png">
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css"/>
		<style>
			.input-button {
				cursor: pointer;
			}

			#original {
				display: none;
			}
			#loader {
				background-color: #D4D4D4;
				text-align: center;
				border-radius: 4px;
				margin-top: 1%;
				padding: 0.1%;
				width: 40px;
			}
		</style>
	</head>

	<body>
		<div>
			<header>
				<h1>datadump</h1>
			</header>
			<nav>
				<p>
					<a href="/">Home</a>
				</p>
				<p>
					<a href="/contact">Contact</a>
				</p>
			</nav>

			<div>
				<form method="post" action="" enctype="multipart/form-data">
					<input type="file" name="files">
					<input type="submit" value="submit">
				</form>
				<?php

				if (isset($_FILES["files"])) {
					$file = $_FILES['files']['name'];
					var_dump(explode(".", $file));
				}
				$json = '{"a":1,"b":2,"c":3,"d":4,"e":5}';

				$data=json_decode($json);
				
				echo $data->a;
				?>
			</div>

			<div id="loader">
				<img src="../loading/loading-bars.svg" width="40" height="40"/>
			</div>

			<footer>
				<p>
					&copy; Copyright  by ian
				</p>
			</footer>
			<script type="text/javascript" src="../libs/jquery1.9.js"></script>
			<script type="text/javascript">
				$(".input-button").click(function() {
					$("#original").click();
				});

				function changeFile() {
					var fileObj = document.getElementById("original");
					$value = fileObj.files[0].name;
					$(".input-button").text($value);
				}
			</script>
		</div>
	</body>
</html>
