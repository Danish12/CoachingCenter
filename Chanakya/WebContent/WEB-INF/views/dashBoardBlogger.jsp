<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Fagnum | Content Publishing Platform</title>
    <meta name="keywords" content="content publishing platform, publish your blog, where do guest blogging, 
    create back links">
	<meta name="description" content="Fagnum is a content publishing platform for startups and bloggers">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="icon" type="image/ico" href="homeResources/images/favicon.png ">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="mainResources/css/font-awesome-4.5.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/minCss/jquery-ui.min.css" rel="stylesheet" type="text/css">
	<link href="mainResources/css/materialize.min.css" rel="stylesheet" type="text/css">
	<link href="mainResources/minCss/style.css" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/minCss/hightop-font.css" media="all" rel="stylesheet" type="text/css" />
	<script src="messageBoard/js/ckeditor.js"></script>
</head>
<style>
	@media (min-width:993px){
  		.desktop{
  			position: inherit;
  		}
  	}
  	 .side-nav li.active {
    	background-color: #03a9f4;
	}
	.side-nav li.active a{
		color: white !important;
	}
	.side-nav li {
	    float: none;
	     padding: 0 ; 
	    line-height: 64px;
	}
	li {
    	 margin-bottom: 0; 
	}
	.iconPadding{
		position: absolute;
	    padding-left: 86%;
	   
	}
	.card:hover{
		border: 2px solid #03a9f4;
	}
	.modal .modal-content {
     padding: 0;
	}
	textarea.materialize-textarea {
	    overflow-y: auto;
	    padding: 0 0;
	    resize: both;
	    max-height: 74px;
	    min-height: 74px;
	}
	
	.btn{
		background-color: #888888;
	}
</style>
<body>
	<%@ include file="mainHeader.jsp"%>
	<div class="center" id="loading" style="display: none;width: 100%;position: absolute;height: 100%">
		<div class="preloader-wrapper big active" style="top: 30%">
			<div class="spinner-layer spinner-blue-only" style="border-color: #03a9f4;">
				<div class="circle-clipper left">
					<div class="circle"></div>
				</div>
				<div class="gap-patch">
					<div class="circle"></div>
				</div>
				<div class="circle-clipper right">
					<div class="circle"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid main-content">
		<div class="row">
			<%@ include file="profileBloggerBar.jsp"%>
			<div class="col s12 l9" id="welcomeDashboard" style="display:none;">
				<div class="row container center" >
				<br><br><br><br>
					<div class="col s12 l9 offset-l9">
						<h1 style="font-size: 40px;">Welcome to Dashboard.</h1>
					</div>
				</div>
			</div>
			<div class="col l9 offset-l3" id="editProfile" style="display: none;">
			<br><br>
				<div class="row">
					<div class="col s12">
						<div class="widget-container" style="box-shadow: none;">
							<div class="heading" style="padding-left: 400px;">
								<i class="fa fa-pencil-square-o"></i>Edit Profile
							</div>
							<div class="widget-content padded" style="margin-left: -40px">
								<form action="#" id="validate-form" method="get">
									<fieldset>
										<div class="row">
											<div class="input-field col s6">
												<div class="form-group">
													<input class="form-control" id="name" name="name" type="text" placeholder="Name"
														onkeypress="return isAlpha(event)" onchange="capitalize(this.id)">
													<label for="name">Name</label>
													<span id="nameError" style="color:red;"></span>
												</div>
											</div>
											<div class="input-field col s6">
												<div class="form-group">
													<input class="form-control" id="contactNumber" name="contactNumber" type="text" placeholder="Contact Number"
														onkeypress="return isNumber(event,this.id)">
													<label for="contactNumber">Contact Number</label>
													<span id="contactNumberError" style="color:red;"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="input-field col s6">
												<div class="form-group">
													<input class="form-control" id="altContactNumber" name="altContactNumber" type="text" placeholder="Alt Contact Number"
														onkeypress="return isNumber(event,this.id)">
													<label for="altContactNumber">Alt Contact Number</label>
													<span id="altContactNumberError" style="color:red;"></span>
												</div>
											</div>
											<div class="input-field col s6">
												<div class="form-group">
													<input class="form-control" id="facebookProfile" name="facebookProfile" type="text" 
													placeholder="Facebook Profile Link">
													<label for="facebookProfile">Facebook Profile Link</label>
													<span id="facebookProfileError" style="color:red;"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="input-field col s6">
												<div class="form-group">
													<input id="twitterProfile" name="twitterProfile" type="text" placeholder="Twitter Profile Link">
													<label for="twitterProfile">Twitter Profile Link</label>
													<span id="twitterProfileError" style="color:red;"></span>
												</div>
											</div> 
											<div class="input-field col s6">
												<div class="form-group">
													<input class="form-control" id="linkedinProfile" name="linkedinProfile" type="text" 
														placeholder="Linkedin Profile Link">
													<label for="linkedinProfile">Linkedin Profile Link</label>
													<span id="linkedinProfileError" style="color:red;"></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col s6 l2 offset-l4">
									 			<input class="btn  pull-right saveBtnColor" type="button" value="Save" onclick="saveProfile()">
											</div>
											<div class="col s6 l3">
									 			<input class="btn cancelBtnColor" type="button" value="Cancel" onclick="showHide('cancel')">
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>				
			</div>
			<div class="col l9 offset-l3" id="editPassword" style="display: none;">
			<br><br>
				<div class="row" style="margin-left: -74px">
					<div class="col s12">
						<div class="widget-container" style="box-shadow: none;">
							<div class="heading" style="padding-left: 443px">
								<i class="fa fa-pencil-square-o"></i>Change Password
							</div>
							<div class="widget-content padded">
								<div class="row">
									<div class="input-field col s12 l6 offset-l3">
										<input id="currentPassword" name="currentPassword" type="password"
											onkeypress="return isCurrentPassword(event)">
										<label class="" for="currentPassword">Current Password</label>
										<span id="currentPasswordError" style="color: red;"></span>
									</div>
									<div class="input-field col s12 l6 offset-l3">
										<input id="newPassword" name="newPassword" type="password" 
										onkeypress="return isNewPassword(event);">
										<label for="newPassword" class="">New Password</label>
										<span id="newPasswordError" style="color: red;"></span>
									</div>
									<div class="input-field col s12 l6 offset-l3">
										<input id="confirmPassword" name="confirmPassword" type="password"
										onkeypress="return isConfirmPassword(event);">
										<label for="confirmPassword" class="">Confirm Password</label>
										<span id="confirmPasswordError" style="color: red;"></span>
									</div>
									<div class="row">
										<div class="col s6 l2 offset-l4">
											<input class="btn  pull-right saveBtnColor" type="button" value="Save" onclick="changePassword();">
										</div>
										<div class="col s6 l3">
											<input class="btn cancelBtnColor" type="button" value="Cancel" onclick="showHide('cancel');">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				<div class="col l9 offset-l3" id="editImage" style="display: none;">
				<br><br>
					<div class="row" style="margin-left: -74px">
						<div class="col s12">
							<div class="widget-container" style="box-shadow: none;">
								<div class="heading" style="padding-left: 443px;">
									<i class="fa fa-pencil-square-o"></i>Change Image
								</div>
								<div class="row">
									<div class="file-field input-field col s12 l6 offset-l3">
										<div class="btn">
											<img alt="" src="" id="profileImage">
										</div>
									</div>
								</div>
								<div class="widget-content padded">
									<form action="bloggerImageSubmit" id="validate-form" method="post" enctype="multipart/form-data">
										<fieldset>
											<div class="row">
												<div class="file-field input-field col s12 l6 offset-l3">
													<div class="btn">
														<span>Profile Image</span>
														<input name="profileImage" type="file">
													</div>
													<div class="file-path-wrapper">
										        		<input class="file-path validate" placeholder="Select Profile Image" type="text">
													</div>
											    </div>
											</div>
											<div class="row" >
												<div class="col s12 l6 offset-l5">
													<input class="btn saveBtnColor" type="submit" value="Save">
													<input class="btn cancelBtnColor" type="button" value="Cancel" onclick="showHide('cancel')">
												</div>
											</div>
										</fieldset>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col l9 offset-l3" id="editBio" style="display: none;">
				<br><br>
					<div class="row" style="margin-left: -74px">
						<div class="col s12">
							<div class="widget-container" style="box-shadow: none;">
								<div class="heading" style="padding-left: 443px">
									<i class="fa fa-pencil-square-o"></i>Update BIO
								</div>
								<div class=" col s12 widget-content padded">
									<div id="editor" style="visibility: hidden; display: none;"> </div>
								</div>
								
								<div class="col s12 center">
								<br>
									<input class="btn  saveBtnColor" type="button" value="Save" onclick="saveBio()">
									<input class="btn  cancelBtnColor" type="button" value="Cancel" onclick="showHide('cancel')">
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<div class="col s12 l9 offset-l3" id="messageType" style="display: none;">
			<div class="row container center" >
			<br><br><br><br>
				<div class="col s12 l9 offset-l6">
					<h5>Message</h5>
					<span id="contentMessage"></span>
				</div>
			</div>
		</div>
	<script src="mainResources/minJs/jquery-1.11.3.min.js" type="text/javascript" ></script> 
	<script src="mainResources/minJs/jquery-ui.min.js" type="text/javascript"></script>
	<script src="mainResources/js/materialize.min.js" type="text/javascript"></script>
	<script type="text/javascript">

	var editorElement = CKEDITOR.document.getById('editor');
	CKEDITOR.replace('editor'); 
	
	function saveBio(){
		var content = CKEDITOR.instances.editor.getData();
		$.ajax({
			  url: "saveProfile",
			  type: "POST",
			  data: {
				  bio : content,
				  updateBio : 'true'
			  },
			  success:function(data) {
				  //window.location.href = 'blogAdmin';
				if(data.match("true")) {
					$("#loading").hide();
					showHide("messageType");
					document.getElementById("contentMessage").innerHTML="Bio updated successfully.";
				}
			  },
			  error: function (request, status, error) {
			        alert("Error while updating the Bio!!");
			  }
		});
	}

	$(document).ready(function () {
		 $('#dateOfBirth').pickadate({
		    selectMonths: true, // Creates a dropdown to control month
		    selectYears: 80, // Creates a dropdown of 15 years to control year
		    format: 'dd-mmm-yyyy',
		    /* onSet: function() {
			   	this.close();
			} */
		    onSet: function(context){
		    	  //alert('On Set');
		    	  if(context.select)
		    	  	this.close();
		      }
		}); 
		$('.modal-trigger').leanModal();
	}); 
		
	function capitalize(str)
	{
		document.getElementById(str).value = document.getElementById(str).value.replace(/\b[a-z]/g, 
    			function(a) { return a.toUpperCase(); 
    		});
	}
	
	if("${imageChangedsuccessfully}".match("true")) {
		alert("sdkfj");
		showHide("messageType");
		document.getElementById("contentMessage").innerHTML = "Image changed successfully.";
	}
	
	if("${not empty type}") {
		showHide('${type}');
	}
	
	function showHide(type) {
		$("#editProfile").hide();
		$("#editPassword").hide();
		$("#editImage").hide();
		$("#messageType").hide();
		$("#editBio").hide();
		$("#welcomeDashboard").hide();
		$("#tab-profile-edit-edit").parent().removeClass("active");
		$("#tab-profile-edit-pwd").parent().removeClass("active");
		$("#tab-profile-edit-image").parent().removeClass("active");
		$("#tab-profile-edit-bio").parent().removeClass("active");
		if(type.match("profileType")) {
			$("#editProfile").show();
			$("#tab-profile-edit-edit").parent().addClass("active");
		}else if(type.match("passwordType")) {
			$("#editPassword").show();
			$("#tab-profile-edit-pwd").parent().addClass("active");
		}else if(type.match("imageType")) {
			$("#editImage").show();
			$("#tab-profile-edit-image").parent().addClass("active");
		}else if(type.match("bioType")) {
			$("#editBio").show();
			$("#tab-profile-edit-bio").parent().addClass("active");
		}else if(type.match("messageType")) {
			$("#messageType").show();
		}else if(type.match("cancel")) {
			$("#welcomeDashboard").show();
		}
	}
	
	function getProfile() {
		$.get('getProfile', {
			callFrom : 'ajaxCall',
			async : false,
		},
		function(data) {
			data1 = data.replace("[[", "[").replace("]]", "]");
			var result = eval(data1);
			var resultLength = result.length;
			for (var i = 0; i < result.length; i++) {
				document.getElementById('name').value = replaceUndefined(result[i].name);
				document.getElementById('contactNumber').value = replaceUndefined(result[i].contactNumber);
				document.getElementById('altContactNumber').value = replaceUndefined(result[i].altContactNumber);
				document.getElementById('facebookProfile').value = replaceUndefined(result[i].facebookProfile);
				document.getElementById('twitterProfile').value = replaceUndefined(result[i].twitterProfile);
				document.getElementById('linkedinProfile').value = replaceUndefined(result[i].linkedinProfile);
				document.getElementById('editor').innerHTML = replaceUndefined(result[i].bio);
				document.getElementById("profileImage").src = result[i].profilePic;
			}
		}
		);
	}
	getProfile(); 

	function saveProfile() {
		var numberRegExp = /^(\-)?([\d]+(?:\.\d{1,2})?)$/;
		var contactNumber = document.getElementById("contactNumber").value;
		var status = true;
		if(document.getElementById("name").value.length == 0) {
    		document.getElementById("nameError").innerHTML = " Name cannot be blank.";
    		status = false;
    	}else {
		   	document.getElementById("nameError").innerHTML = "";
		}
		if (!numberRegExp.test(contactNumber) || document.getElementById("contactNumber").value.length != 10) {
		   document.getElementById("contactNumberError").innerHTML = " Enter 10 digit contact number.";
		   status = false;
 		} else {
		   	document.getElementById("contactNumberError").innerHTML = "";
		}
		/* if(document.getElementById("facebookProfile").value.length == 0) {
    		document.getElementById("facebookProfileError").innerHTML = " Office Number cannot be blank.";
    		status = false;
    	}else {
		   	document.getElementById("facebookProfileError").innerHTML = "";
		}
		if(document.getElementById("twitterProfile").value.length == 0) {
    		document.getElementById("twitterProfileError").innerHTML = "Membership Number cannot be blank.";
    		status = false;
    	}else {
		   	document.getElementById("twitterProfileError").innerHTML = "";
		}
		if(document.getElementById("linkedinProfile").value.length == 0) {
    		document.getElementById("linkedinProfileError").innerHTML = "Service Number cannot be blank.";
    		status = false;
    	}else {
		   	document.getElementById("linkedinProfileError").innerHTML = "";
		} */
		
		if(status) {
		$("#loading").show();
		$.post('saveProfile', {
			callFrom : 'ajaxCall',
			async : false,
			name : $('#name').val(),
			contactNumber : $('#contactNumber').val(),
			altContactNumber : $('#altContactNumber').val(),
			facebookProfile : $('#facebookProfile').val(),
			twitterProfile : $('#twitterProfile').val(),
			linkedinProfile : $('#linkedinProfile').val(),
		}, function(data) {
			if(data.match("true")) {
				$("#loading").hide();
				showHide("messageType");
				document.getElementById("contentMessage").innerHTML="Profile updated successfully.";
			}
		
		});
	}
	}
	
	function isDateOfBirth(dateOfBirth) {
    	document.getElementById("dateOfBirthError").innerHTML = "";
    }
	
	function isServiceNumber(e) {
    	document.getElementById("linkedinProfileError").innerHTML = "";
    }
	
	function isMembershipNumber(e) {
    	document.getElementById("twitterProfileError").innerHTML = "";
    }
	
	function isEmailId(e) {
    	document.getElementById("emailIdError").innerHTML = "";
    }
	
	function changePassword() {
		var status = true;
		if(document.getElementById("currentPassword").value.length == 0) {
    		document.getElementById("currentPasswordError").innerHTML = " Current password cannot be blank.";
    		status = false;
    	}
		if(document.getElementById("newPassword").value.length == 0) {
    		document.getElementById("newPasswordError").innerHTML = " New password cannot be blank.";
    		status = false;
    	}
    	if(document.getElementById("confirmPassword").value.length == 0) {
    		document.getElementById("confirmPasswordError").innerHTML = " Confirm Password cannot be blank.";
    		status = false;
    	}
    	if(!document.getElementById("newPassword").value.match(document.getElementById("confirmPassword").value)) {
    		document.getElementById("confirmPasswordError").innerHTML = " Password and confirm password must match.";
    		$("#newPassword").val('');
			$("#confirmPassword").val('');
			status = false;
    	}
    	if(status) {
    		$("#loading").show();
			$.post('changePassword', {
				callFrom : 'ajaxCall',
				async : false,
				newPassword : $('#newPassword').val(),
			}, function(data) {
				var result = JSON.parse(data);
				var status = result[0].status;
				if(status.match("true")) {
					$("#loading").hide();
					showHide("messageType");
					document.getElementById("contentMessage").innerHTML = result[0].message;
				}
				
			});
    	}
	}
    
    function isCurrentPassword(e) {
    	document.getElementById("currentPasswordError").innerHTML = "";
    }
    
    function isConfirmPassword(e) {
    	document.getElementById("confirmPasswordError").innerHTML = "";
    }

    function isNewPassword(e) {
    	document.getElementById("newPasswordError").innerHTML = "";
    }
    
    var specialKeys = new Array();
    specialKeys.push(8); //Backspace
    function isAlpha(e) {
        var keyCode = e.which ? e.which : e.keyCode
        var ret = ((keyCode >= 97 && keyCode <= 122)||(keyCode==38)||(keyCode >=65 && keyCode <= 90)||(keyCode==32)|| specialKeys.indexOf(keyCode) != -1);
        if(!ret) {
        	document.getElementById("nameError").innerHTML = "";
        }else {
        	document.getElementById("nameError").innerHTML = "";
        }
        return ret;
    }
   
    function isNumber(e,id) {
        var keyCode = e.which ? e.which : e.keyCode
        var ret = ((keyCode >= 48 && keyCode <= 57 ) || specialKeys.indexOf(keyCode) != -1);
        if(!ret) {
        	document.getElementById(id).innerHTML = "";
        }
        else if ( document.getElementById(id).value.length > 9) {
       	   document.getElementById(id).innerHTML = "Enter 10 digit contact number.";
       	   status = false;
       	  }else {
           	document.getElementById(id).innerHTML = "";
          }
        return ret;
    }
	
    function isOfficeContactNumber(e) {
        var keyCode = e.which ? e.which : e.keyCode
        var ret = ((keyCode >= 48 && keyCode <= 57 ) || specialKeys.indexOf(keyCode) != -1);
        if(!ret) {
                	document.getElementById("facebookProfileError").innerHTML = "";
                }
                else  {
                   	document.getElementById("facebookProfileError").innerHTML = "";
                   }
                return ret;
            }
        
    
    
	/* function emailValidation(emailId) {
		var emailAddress = document.getElementById(emailId).value;
		var emailIdError = document.getElementById(emailId+"Error");
		var emailIdRegExp = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		if (!(emailAddress.match(emailIdRegExp))) {
			emailIdError.innerHTML = " Enter a valid Email Id.";
			return false;
		} else {
			emailIdError.innerHTML = "";
		}
		return true;
	} */
	
	function replaceUndefined(value){
		if(value === undefined){
			return "";
		}
		return value;
	}

</script>	
</body>
</html>