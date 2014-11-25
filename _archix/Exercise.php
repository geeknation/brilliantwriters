<?php
/*
 * Exercise class to handle excercise uploads
 */
require_once ("EntelDB.php");
//require_once ("../swiftmailer/swift_required.php");
class Exercise {

	public $path;
	public $timeUploaded;
	public $assignee;
	public $timeCompleted;
	public $solutionPath;
	public $completed;
	public $assigned;
	public $filename;
	public $filetmp_name;
	public $filetype;
	public $filesize;
	public $category;
	private $solutionsFolder = "../exercises_solutions/";
	function getName() {
		include "dbconn.inc.php";
		$query = "SELECT name FROM excercise WHERE userCode=?";
		$stmt = $conn -> prepare($query);
		$stmt -> execute(array($this -> userCode));

		$data = $stmt -> fetchAll(PDO::FETCH_ASSOC);

		echo json_encode($data);
	}

	function uploadExercise() {

		$path = "exercises/" . $this -> filename;

		if (move_uploaded_file($this -> filetmp_name, $path)) {
			include "dbconn.inc.php";
			$query = "INSERT INTO exercises(exCode,path,category,timeUploaded,assignee,timeCompleted,solutionPath,format,size,completed,assigned) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			$stmt = $conn -> prepare($query);
			$data = array($this -> exCode, $path,$this->category, $this -> timeUploaded, $this -> assignee, $this -> timeCompleted, $this -> solutionPath, $this -> filetype, $this -> filesize, $this -> completed, $this -> assigned);
			$stmt -> execute($data);
			if ($stmt -> rowCount() == 1) {
				return "uploaded";
			} else {
				return "error uploading";
			}
		} else {
			return "error uploading";
		}

	}

	function fetchAllEx() {
		include "dbconn.inc.php";
		$query = "SELECT exercises.exCode,exercises.path,exercises.timeUploaded,exercises.assigned,users.exCode,users.email FROM progex.exercises INNER JOIN progex.users on exercises.id=users.id WHERE exercises.assigned=0 AND exercises.paid=0";
		$stmt = $conn -> prepare($query);
		$stmt -> execute();
		$data = $stmt -> fetchAll();
		echo json_encode($data);
	}
	
	function fetchData($id){
		include "dbconn.inc.php";
		$query = "SELECT exercises.exCode,exercises.path,exercises.timeUploaded,exercises.assigned,users.exCode,users.email FROM progex.exercises INNER JOIN progex.users on exercises.exCode=users.exCode WHERE exercises.exCode='".$id."'";
		$stmt = $conn -> prepare($query);
		$stmt -> execute();
		$data = $stmt -> fetchAll(PDO::FETCH_ASSOC);
		echo json_encode($data);
	}
	
	function completedExercises($sessionId) {
		include "dbconn.inc.php";

		$query = "SELECT * FROM exercises WHERE completed=1 AND assignee='" . $sessionId . "'";
		$stmt = $conn -> prepare($query);
		$stmt -> execute();
		$data = $stmt -> fetchAll();
		echo json_encode($data);
	}

	function pickExercise($query, $Arrdata) {
		include "dbconn.inc.php";
		$stmt = $conn -> prepare($query);
		$stmt -> execute($Arrdata);
		$count = $stmt -> rowCount();
		if ($count == 1) {
			echo json_encode(array("pickExercise" => "success", "message" => "picked"));
		} else {
			echo json_encode(array("pickExercise" => "fail", "message" => "An error occured,Kindly try again"));
		}

	}

	function uploadSolution($solfolder) {
		include "dbconn.inc.php";
		$soldir = $this -> solutionsFolder . $solfolder . "";
		$files = $this -> filename;
		if (mkdir($soldir, 0777)) {

			$resp = '';
			///move multiple files
			$path = $this -> solutionsFolder . $solfolder . "/";
			$uploadedfiles;
			$erroruploadfiles;
			$allowedTypes = array("html", "php", "css", "js", "xhtml");
			//upload all the files
			for ($i = 0; $i < count($files); $i++) {
				//check file extension

				if (!in_array(end(explode(".", $this -> filename[$i])), $allowedTypes)) {
					$erroruploadfiles[$i] = "invalid file type for [{$this->filename[$i]}]";
				}
				if (move_uploaded_file($this -> filetmp_name[$i], $path . $this -> filename[$i])) {
					$uploadedfiles[$i] = $this -> filename[$i];
				} else {
					$erroruploadfiles[$i] = $this -> filename[$i];
				}

			}//end of loop

			if (!empty($erroruploadfiles)) {
				$resp = array("uploadSolution" => "fail", "message" => "An error occured Please try again later.", "failed uploads" => $erroruploadfiles);
				echo json_encode($erroruploadfiles);
			} else if (count($uploadedfiles) == count($files)) {
				$query = "UPDATE exercises SET timeCompleted=?, solutionPath=?,completed=1 WHERE exCode=?";
				$data = array($this -> timeCompleted, $path, $solfolder);
				$stmt = $conn -> prepare($query);
				$stmt -> execute($data);
				if ($stmt -> rowCount() == 1) {
					$resp = array("uploadSolution" => "success", "message" => "Solution uploaded successfully");
				} else {
					$resp = array("uploadSolution" => "fail", "message" => "An error occured Please try again later.");
				}

			}
			echo json_encode($resp);
		} else {
			$resp = array("uploadSolution" => "fail", "message" => "An error occured Please try again later.");
			echo json_encode($resp);
		}

	}

	function checkFileType($files) {
		$filetypes = array("php", "js", "html", "css");
		$response = '';
		for ($i = 0; $i < count($files); $i++) {
			$split = explode(".", $files[$i]);
			$ext = $split[1];

			if (!in_array($ext, $filetypes)) {
				$response = "unwanted file types";
				break;
			} else {
				$response = "files types are good";
			}

		}

		return $response;
	}

	function mailSolution($id) {
		$db = new EntelDB("progex", "root", "");
		$conn = $db -> conn;
		$query = "SELECT exercises.solutionPath,users.email,users.firstName FROM exercises INNER JOIN users ON exercises.exCode=users.exCode WHERE exercises.exCode=?";
		$exec = $conn -> prepare($query);
		$exec -> execute(array($id));
		$data = $exec -> fetch(PDO::FETCH_ASSOC);

		//GET THE CURRENTLY LOGGED IN PROGRAMMERS EMAIL
		$userid = $_SESSION['userId'];
		$q = "SELECT email,firstName FROM programmers WHERE excode=?";
		$pexec = $conn -> prepare($q);
		$pexec -> execute(array($userid));
		$pdata = $pexec -> fetch(PDO::FETCH_ASSOC);
		//send the email

		$body = "
		Hi " . $data['firstName'] . " ,
		
		Your programming exercise has been completed please view attachment
		<p>
		Kindly note the attachment is a compressed document, kindly ensure that you have winzip or a program that opens zipped files.
		<p/>
		
		Regards,
		" . $pdata['firstName'] . "
		";

		$compressedFile = $this -> zipDir($data['solutionPath'], "../zip_sent/" . $this -> getFolderName($data['solutionPath']));
		$domain = $this -> getEmailService($pdata['email']);
		$emailsettings = $this -> getEmailSettings($domain);
		$message = Swift_Message::newInstance();
		$message -> setSubject("PROGEX - Solution for programming exercise");
		$message -> setFrom(array($pdata['email'] => $pdata['firstName']));
		// $message -> setTo($data['email']);
		$message -> setTo("ianmukunya@gmail.com");
		$message -> setBody($body);
		$attachment = "../zip_sent/" . $compressedFile;
		$message -> attach(Swift_Attachment::fromPath($attachment));
		$transport = Swift_SmtpTransport::newInstance("".$emailsettings['SMTPurl'],"".$emailsettings['SMTPport']);
		$mailer = Swift_Mailer::newInstance($transport);
		$result = $mailer -> send($message);
		// $mailer -> attach(Swift_Attachment::fromPath($attachment))->setFilename();
		// $mailer->send();

		
		$resp = '';
		if ($result) {
			$resp="Mail sent";
		} else {
			//handle the error
			$resp = "fail";
		}
		echo json_encode($result);
	}

	/**
	 * Zip a folder (include itself).
	 * Usage:
	 *   HZip::zipDir('/path/to/sourceDir', '/path/to/out.zip');
	 *
	 * @param string $sourcePath Path of directory to be zip.
	 * @param string $outZipPath Path of output zip file.
	 */
	public static function zipDir($sourcePath, $outZipPath) {
		$pathInfo = pathInfo($sourcePath);
		$parentPath = $pathInfo['dirname'];
		$dirName = $pathInfo['basename'];

		$z = new ZipArchive();
		$z -> open($outZipPath, ZIPARCHIVE::CREATE);
		$z -> addEmptyDir($dirName);
		self::folderToZip($sourcePath, $z, strlen("$parentPath/"));
		$z -> close();
	}

	private static function folderToZip($folder, &$zipFile, $exclusiveLength) {
		$handle = opendir($folder);

		while (false !== $f = readdir($handle)) {
			if ($f != '.' && $f != '..') {
				$filePath = "$folder/$f";
				// Remove prefix from file path before add to zip.
				$localPath = substr($filePath, $exclusiveLength);
				if (is_file($filePath)) {
					$zipFile -> addFile($filePath, $localPath);
				} elseif (is_dir($filePath)) {
					// Add sub-directory.
					$zipFile -> addEmptyDir($localPath);
					self::folderToZip($filePath, $zipFile, $exclusiveLength);
				}
			}
		}
		closedir($handle);
	}

	function getFolderName($path) {
		$exp = explode("/", $path);
		$foldername = (string)$exp[2] . ".zip";
		return $foldername;
	}

	function getEmailService($email) {
		$exp = explode("@", $email);
		$domainexp = explode(".", $exp[1]);
		return $domainexp[0];
	}

	function getEmailSettings($domain) {
		$db = new EntelDB("progex", "root", "");
		$conn = $db -> conn;
		$query = "SELECT * FROM email_settings WHERE name=?";
		$stmt = $conn -> prepare($query);
		$stmt -> execute(array($domain));
		$data = '';

		if (count($stmt -> fetch(PDO::FETCH_ASSOC)) == 0) {
			$data = "no found";
		} else {
			$data = $stmt -> fetch(PDO::FETCH_ASSOC);

		}

		return $data;

	}

}
?>