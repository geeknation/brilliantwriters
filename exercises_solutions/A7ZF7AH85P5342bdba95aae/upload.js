/*
 javascript file to process upload via AJAX

 */
$(document).ready(function() {

	//elements

	var submitbutton = $("#ajaxButton");

	var progressbox = $('.progress');
	var progressbar = $('.bar');
	var statustxt = $('#statustxt');
	var myform = $("#ajax-form");
	var output = $("#output");
	var completed = '0%';

	$(myform).ajaxForm({
		dataType : "json",
		beforeSend : function() {
			//brfore sending form
			submitbutton.attr('disabled', '');
			// disable upload\ button
			statustxt.empty();
			progressbox.show();
			//show progressbar
			progressbar.width(completed);
			//initial value 0% of progressbar
			statustxt.html(completed);
			//set status text
			statustxt.css('color', '#000');
			
			//initial color of status text
		},

		uploadProgress : function(event, position, total, percentComplete) {//on progress
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
		// resetForm:true,
		success : function(response) {
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
				//update element with received data

				$console.html("<p class='text-success'>Submitted successfully</p>");
				myform.resetForm();
			}

			// check if theryre errors

		}
	});

});
