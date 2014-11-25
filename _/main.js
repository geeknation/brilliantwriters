jQuery(document).ready(function($) {

	fetchAllEx();

	var pending = $(".pending");
	pending.click(function() {
		fetchAllEx();
	});

	$(".appmenu>li").click(function() {
		$(".appmenu>li").removeClass("active");
		$(this).addClass("active");
	});

	$("#createprogrammer-modal").click(function() {

		var firstname = $("#firstName").val();
		var secondname = $("#secondName").val();
		var email = $("#emailAddress").val();
		var phonenumber = $("#phoneNumber").val();
		var username = $("#username").val();
		var languages = $("#languages").val();
		var location = $("#location").val();

		if (firstname == '' || secondname == '' || email == '' || phonenumber == '' || username == '' || languages == '' || location == '') {
			$("#console").html("<div class='alert alert-danger'>Please Fill in all the fields</div>");
		} else {

			var data = {
				firstname : $("#firstName").val(),
				secondname : $("#secondName").val(),
				email : $("#emailAddress").val(),
				phonenumber : $("#phoneNumber").val(),
				username : $("#username").val(),
				languages : $("#languages").val(),
				location : $("#location").val(),
				flag : "save-programmer"
			};

			//fetchData(data, "post", "engine.php", "json");
			$.ajax({
				cache : false,
				url : "engine.php",
				dataType : "json",
				data : data,
				type : "post",
				beforeSend : function() {

				},
				complete : function() {

				},
				success : function(data) {
					console.log(data);
					if (data.success == "true") {
						$(".modal-body").html('<p class="text-success">' + data.Message + '</p>');
					} else {
						$(".modal-body").html('<p class="text-danger">' + data.Message + '</p>');
					}

				}
			});
		}
	});

	//save solution
	var progressbox = $(".progress");
	var progressbar = $('.progress-bar');
	var statustxt = $(".statustxt");
	var myform = $("#upload-solution-form");
	var button = $("#btn-solution");

	$(myform).ajaxForm({
		dataType : "json",
		beforeSend : function() {
		},
		uploadProgress : function(event, position, total, percentComplete) {
			//on progress
			progressbar.width(percentComplete + '%');
			//update progressbar percent complete
			statustxt.html(percentComplete + '%');
			//update status text
			if (percentComplete > 50) {
				statustxt.css('color', '#fff');
				//change status text to white after 50%
			}
		},
		dataType : 'json',
		success : function(response) {
			console.log(response);

			if (response.error) {
				$('#solution-modal').modal('hide');
				alertify.error(response.error);
				fetchPendingExercises();
			} else if (response.message) {
				$('#solution-modal').modal('hide');
				alertify.success(response.message);
				fetchPendingExercises();
			}

			/*
			// on complete
			var $resp = response;
			var $console = $("#console");
			progressbox.hide();

			// reset form
			submitbutton.removeAttr('disabled');
			//enable submit button
			progressbox.hide();
			// hide progressbar
			if (!$resp.success) {

			if ($resp.errors != null) {
			if ($resp.errors.firstname || $resp.errors.secondname) {
			$console.html("<p class='text-error'>Please Fill in all the fields</p>").fadeIn('slow');
			}
			if ($resp.errors.myfile) {
			$console.html("<p class='text-error'>Please choose a file</p>").fadeIn('slow');
			}

			}

			} else {

			}*/

			// check if theryre errors

		}
	});

});
/*
end of document.ready
*/

//end of document ready [jQuery]
var completed = $(".completed");
var myexercises = $(".myexercises");
$("#createprogrammer").click(function() {
	$(".modal-title").html("Create Programmer");
	$("#create-programmer-modal").modal("show");
});

myexercises.click(function() {
	var data = {
		"flag" : "my-exercises"
	};
	$.ajax({
		cache : false,
		url : "engine.php",
		data : data,
		type : "get",
		dataType : "json",
		success : function(data) {
			var body = '';
			var excode;
			var time;
			var path;
			var assigned;
			var inputButton;
			var downloadButton;
			$.each(data, function(index, array) {
				excode = array.exCode;
				path = array.path;
				timeUploaded = new Date(array.timeUploaded * 1000);
				time = timeUploaded.getDate();
				assignee = array.assignee;
				downloadButton = '<a href="../' + path + '" target="_blank" class="btn btn-primary btn-xs" id=' + excode + '>Download Exercise</a>';
				inputButton = "<input type='button' class='btn btn-warning btn-xs solution-button' onclick='getModal(this.id)' id='" + excode + "' value='Upload solution'>";
				body += "<tr><td>" + timeUploaded + "</td><td>" + downloadButton + "&nbsp;" + inputButton + "</td></tr>";
			});

			var tableheader = "<table class='table table-bordered table-condensed table-hover'><th>Time</th><th>Action</th>";
			var tablefooter = "</table>";
			var table = tableheader + body + tablefooter;
			$("#contentloader").html(table);
		}
	});
});

completed.click(function() {
	var data = {
		"flag" : "completed-exercises"
	};
	$.ajax({
		cache : false,
		url : "engine.php",
		data : data,
		type : "get",
		dataType : "json",
		success : function(data) {
			var body = '';
			var excode;
			var time;
			var path;
			var assigned;
			var inputButton;
			var downloadButton;
			$.each(data, function(index, array) {
				excode = array.exCode;
				path = array.path;
				du = new Date(array.timeUploaded * 1000);
				dc = new Date(array.timeCompleted * 1000);
				var ampm_du = du.getHours() >= 12 ? 'pm' : 'am';
				var ampm_dc = dc.getHours() >= 12 ? 'pm' : 'am';
				timeUploaded = du.toDateString() + "&nbsp;at&nbsp;" + ampmTime(du);
				timeCompleted = dc.toDateString() + "&nbsp;at&nbsp;" + ampmTime(dc);
				assignee = array.assignee;
				downloadButton = '<div class="btn-group"><button type="button" class="btn btn-success btn-xs dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button><ul class="dropdown-menu" role="menu"><li><a href="../' + path + '" target="_blank" class="btn-xs" id=' + excode + '>Download Exercise</a></li><li><a href="#sendsolution" class="send-solution" id=' + excode + ' onclick="sendSolution(this.id)">Send solution</a></li></ul></div>';
				sendSolutionbtn = '';
				body += "<tr><td>" + downloadButton + "</td><td>" + timeUploaded + "</td><td>" + timeCompleted + "&nbsp;" + "</td></tr>";
			});
			var tableheader = "<table class='table table-bordered table-condensed table-hover completed-ex'><thead><tr><th>Actions</th><th>Time Uploaded</th><th>Time Completed</th></tr></thead>";
			var tablefooter = "</table>";
			var table = tableheader + body + tablefooter;
			$(".completed-ex").find("td").addClass("td");
			$("#contentloader").html(table);
		}
	});
});
function sendSolution(id) {
	$(".email-soln").modal();
	
	
	$.ajax({
			url : "engine.php",
			cache : false,
			type : "GET",
			data : {
				flag : "fetch-data",
				id : id
			},
			dataType:"json",
			beforeSend : function() {
				//show loader
				console.log("start");
			},
			error : function(xhr, ajaxOptions, thrownError) {
	
			},
		}).done(function(data) {
			$("#recipient").html(data[0].email);
			
			
			 	
		});
	
}

function ampmTime(date) {

	var hours = date.getHours();
	var minutes = date.getMinutes();
	var ampm = hours >= 12 ? 'pm' : 'am';
	hours = hours % 12;
	hours = hours ? hours : 12;
	// the hour '0' should be '12'
	minutes = minutes < 10 ? '0' + minutes : minutes;
	var strTime = hours + ':' + minutes + ' ' + ampm;
	return strTime;

}

function fetchAllEx() {

	var fData = {
		"flag" : "fetch_all"
	};

	$.ajax({
		type : "GET",
		url : "engine.php",
		data : fData,
		dataType : 'json'

	}).done(function(data) {
		console.log(data);
		//display user friendly stuff
		var body = '';
		var assignee;
		var excode;
		var time;
		var path;
		var assigned;

		$.each(data, function(index, array) {
			excode = array.exCode;
			timeUploaded = new Date(array.timeUploaded * 1000);
			time = timeUploaded.get;
			path = array.path;
			assigned = array.assigned;
			assignee = array.assignee;
			if (assignee == "" || assignee == null) {

				assignee = "<input type='button' class='btn btn-primary btn-sm pickbtn' id=" + excode + " value='Pick'/>";
			} else {
				assignee = "<input type='button' class='btn btn-success btn-xs pickbtn' value='Picked'/>";
			}
			body += "<tr><td>" + assignee + "</td><td>" + timeUploaded + "</td></tr>";
		});

		var tableheader = "<table class='table table-bordered table-condensed table-hover'  width='auto'><th>ACTION</th><th>TIME</th>";
		var tablefooter = "</table>";
		var table = tableheader + body + tablefooter;
		$("#contentloader").html(table);

		$(".pickbtn").on("click", function() {
			pickExercise(this.id);
		});

	}).fail(function(data) {
		console.log(data);
	});
}

function fetchPendingExercises() {
	var data = {
		"flag" : "my-exercises"
	};
	$.ajax({
		cache : false,
		url : "engine.php",
		data : data,
		type : "get",
		dataType : "json",
		success : function(data) {
			var body = '';
			var excode;
			var time;
			var path;
			var assigned;
			var inputButton;
			var downloadButton;
			$.each(data, function(index, array) {
				excode = array.exCode;
				timeUploaded = new Date(array.timeUploaded * 1000);
				time = timeUploaded.getDate();
				assignee = array.assignee;
				downloadButton = '<input type="button" class="btn btn-primary btn-xs" id=' + excode + ' value="Download Exercise">';
				inputButton = "<input type='button' class='btn btn-warning btn-xs solution-button' onclick='getModal(this.id)' id='" + excode + "' value='Upload solution'>";
				body += "<tr><td>" + timeUploaded + "</td><td>" + downloadButton + "&nbsp;" + inputButton + "</td></tr>";
			});

			var tableheader = "<table class='table table-bordered table-condensed table-hover'><th>Time</th><th>Action</th>";
			var tablefooter = "</table>";
			var table = tableheader + body + tablefooter;
			$("#contentloader").html(table);
		}
	});
}

function pickExercise(id) {
	//assign the exercise the the programmer.
	var $data = {
		"excode" : id,
		"flag" : "pick-exercise"
	};
	$.ajax({
		cache : false,
		url : "engine.php",
		dataType : "json",
		data : $data,
		type : "POST",
		beforeSend : function() {
			
		},
		complete : function() {
			
		},
		success : function(data) {
			console.log(data);
			if (data.pickExercise == "success") {
				fetchAllEx();
				alertify.success("Exercise has been assigned to you.");
			}else{
				alertify.error("Error picking exercise, kindly try again");
			}
		}
	});
}

function fetchData($data, $method, $server, $datatype) {

	$.ajax({
		cache : false,
		url : $server,
		dataType : $datatype,
		data : $data,
		type : $method,
		beforeSend : function() {

		},
		complete : function() {

		},
		success : function(data) {

		}
	});
}

function openModal($modaltitle, $data, $method, $server, $datatype, $modaltype) {

	$.ajax({
		cache : false,
		url : $server,
		data : $data,
		type : $method,
		dataType : $datatype,
		beforeSend : function() {
		},
		complete : function() {
		},
		success : function(data) {
			$(".modal-title").html($modaltitle);
			$($modaltype).modal();
		}
	});
}

function createUI($flag, $method, $server, $datatype) {
	var flag = {
		"flag" : $flag
	};
	var Sdata = '';
	$.ajax({
		cache : false,
		url : $server,
		data : flag,
		type : $method,
		dataType : $datatype,
		beforeSend : function() {
		},
		complete : function() {
		},
		success : function(data) {

		}
	});
}

var _Globals = {
	ServerData : ""
};

function getModal(id) {

	$(".modal-title").html("Upload Problem Solution");
	$("#solution-id").val(id);
	// $("")
	$(".solution-modal").modal("show");

}