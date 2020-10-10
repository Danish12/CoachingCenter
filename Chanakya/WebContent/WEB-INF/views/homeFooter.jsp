<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ResourceBundle"%>
<%
	ResourceBundle resourceFooter = ResourceBundle.getBundle("application");
%>
	<style>
		@media (min-width:601px){
			.widthContainer{
				width: 85%;
			}
		}
		@media (max-width:600px){
			.widthContainer{
				width: 90%;
			}
		}
	</style>
	<footer style="background-color:#444;">
	<div class="container" style="width:90%;">
		<div class="row" style="color:white;">
			<div class="col s12 l4">
				<a href="<%=resourceFooter.getString("siteUrl")%>" title="<%=resourceFooter.getString("name")%>" style="color:white;"><h4><%=resourceFooter.getString("name")%></h4></a>
				<p style="font-size: 11px;">Drop email at <%=resourceFooter.getString("care")%> for any query<br>Copyright © 2016 2u Technologies Pvt Ltd. All right reserved.</p>
			</div>
			<div class="col s12 m12 l4">
				<div class="row center-align">
					<br><br>
					<div class= "col s2 l2">
						<a title="Fagnum Facebook" href="https://www.facebook.com/fagnum/?fref=ts" target="_blank">
						<i class="fa fa-facebook-square" aria-hidden="true" style="color: white;font-size: 28px;"></i></a> 
					</div>
					<div class= "col s2 l2">
						<a title="Fagnum Google+" href="https://plus.google.com/u/0/104800969883924028037" target="_blank">
						<i class="fa fa-google-plus" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
					<div class= "col s2 l2">
						<a title="Fagnum LinkedIn" href="https://www.linkedin.com/company/fagnum" target="_blank">
						<i class="fa fa-linkedin" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
					<div class= "col s2 l2">
						<a title="Fagnum Twitter" href="https://twitter.com/fagnumtwit" target="_blank">
						<i class="fa fa-twitter-square" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
					<div class= "col s2 l2">
						<a title="Fagnum Youtube" href="https://www.youtube.com/channel/UC_3cumrEEwB4_7pEYGAhc5w/" target="_blank">
						<i class="fa fa-youtube-play" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
					<div class= "col s2 l2">
						<a title="Fagnum StumbleUpon" href="http://www.stumbleupon.com/stumbler/fagnum-official" target="_blank">
						<i class="fa fa-stumbleupon" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
				</div>
			</div>
			<div class="col s12 m12 l4">
				<div class="row" style="padding-left: 10%;">
					<br>
					<div class="col s4 m2 l6">
						<a title="About Us" href="<%=resourceFooter.getString("siteUrl")%>aboutUs/" style="color:white;"><h6> About Us</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Contact Us" href="<%=resourceFooter.getString("siteUrl")%>contactUs/" style="color:white;"><h6> Contact Us</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Privacy Policy" href="<%=resourceFooter.getString("siteUrl")%>privacyPolicy/" style="color:white;"><h6> Privacy Policy</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Write for Fagnum" href="<%=resourceFooter.getString("siteUrl")%>writeForUs/" style="color:white;"><h6> Write For Us</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Disclaimer" href="<%=resourceFooter.getString("siteUrl")%>disclaimer/" style="color:white;"> <h6> Disclaimer</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Sitemap" href="<%=resourceFooter.getString("siteUrl")%>sitemap/" style="color:white;" ><h6> Sitemap</h6></a>
					</div>
				</div>
			</div>
		</div>
		<br>
	</div>
	</footer>
<section id="models">
<!-- Modal Structure -->
	<div id="login" class="modal">
		<div class="modal-content">
			<div class=" row">
				<div class="col s11">
					<h5 class="color" style="text-align:center" >Login</h5>
				</div>
				<div class="col s1" id="closeLogin" style="display: none;"><a title="Fagnum" href="http://www.fagnum.com"><i class="material-icons" style="color: red;">close</i></a></div>
				<div id="test1" class="col s12">
					<div class="col s12">
						<div class="clearfix card-panel grey lighten-5 cform-wrapper" style="padding-bottom: 73px;">
							<form method="post" action="<c:url value="/j_spring_security_check" />">
								<div class="center-align" id="loginError" style="color:red;"></div>
                          		<div class="input-field">
                          			<input type="text" id="loginEmailId" name="j_username" class="validate input-box" onkeypress="return Isemail(event);">
                          			<label for="loginEmailId" class="input-label">Email Address</label>
                        		</div>
                        		<div class="input-field textarea-input">
                          			<input type="password" id="loginPassword" name="j_password" class="validate input-box" onkeypress="return Ispwd(event);">
                          			<label for="loginPassword" class="input-label">Password</label>
                        		</div>
                        		<div>
                        			<div style="float:left">New to Fagnum? <a title="Sign up" class="modal-trigger modal-close color" href="#signup" onclick="signup()">Signup
                        			</a><br><a title="Forget Password" class="modal-trigger modal-close color" href="#forgetPassword" onclick="forgetPassword()">Forgot Password</a></div>
                          			<button type="submit" class="right btn waves-effect waves-light theme-color">Login</button>
                          		</div>
                      		</form>
                    	</div>
                  	</div> <!-- ./contact form end -->
    			</div>
  			</div>
    	</div>
  	</div>
  	<div id="signup" class="modal" style="max-height: 71%">
    	<div class="modal-content">
      		<div class=" row">
				<div class="col s12">
					<h5 class="color" style="text-align:center">Signup</h5>
				</div>
    			<div id="test2" class="col s12">
    				<div class="col s12">
                    	<div class="clearfix card-panel grey lighten-5 cform-wrapper" style="padding-bottom: 73px;">
                        	<div class="input-field">
                          		<input id="signupEmailId" type="email" class="validate input-box" onchange="checkEmailAddress(this.id)">
                          		<label for="signupEmailId" class="input-label">Email</label>
                          		<span id="signupEmailIdError" style="color:red;"></span>
                        	</div>
                        	<div class="input-field">
                          		<input id="signupPassword" type="password" name="password" class="validate input-box" onkeypress="return Ispwd(event);">
                          		<label for="signupPassword" class="input-label">Password</label>
                          		<span id="signupPasswordError" style="color:red;"></span>
                        	</div>
                        	<div class="input-field">
                         		 <input id="signupConfirmPassword" type="password" class="validate input-box" onkeypress="return IsconfirmPwd(event);">
                          		 <label for="signupConfirmPassword" class="input-label">Confirm Password</label>
                          		 <span id="signupConfirmPasswordError" style="color:red;"></span>
                        	</div>
                        	<div>
                        		<div style="float:left">Already have an account. <a title="Login" class="modal-trigger modal-close color" href="#login" 
                        		onclick="login()"> Login </a></div>
                          		<button class="right btn waves-effect waves-light theme-color" onclick="signupForm()">Signup</button>
                          	</div>
                    	</div>
                  	</div> <!-- ./contact form end -->
    			</div>
 			</div>
    	</div>
  </div>
  <div id="forgetPassword" class="modal">
		<div class="modal-content">
			<div class=" row">
				<div class="col s12">
					<h5 class="color" style="text-align:center">Forgot Password</h5>
				</div>
				<div  class="col s12">
					<div class="col-sm-12">
						<div class="clearfix card-panel grey lighten-5 cform-wrapper" style="padding-bottom: 58px;">
                          	<div class="input-field">
                          		<input type="text" id="forgotEmailId" class="validate input-box" onchange="checkEmailAddress(this.id)">
                          		<label for="forgotEmailId"> Email Address</label>
                          		<span id="forgotEmailIdError" style="color:red;"></span>
                        	</div>
                        	<div>
                        		<div style="float:left">New to Fagnum? 
                        			<a title="Signup" class=" modal-trigger modal-close color" href="#signup" onclick="signup()">Signup </a><br>
                        			Already have an account. <a title="Login" class=" modal-trigger modal-close color" href="#login" onclick="login()"> Login </a>
                        		</div>
                          		<button class="right btn waves-effect waves-light theme-color" onclick="forgotPassword()">Submit
                          		<i class="tiny material-icons">send</i></button>
                          	</div>
                    	</div>
                  	</div> <!-- ./contact form end -->
    			</div>
  			</div>
    	</div>
  	</div>
</section>
<div id="footerMessage" class="modal" style="background-color: #73A86D; width:30%; padding-top:10px; margin-top:12%;">
   <div class="card web yellow-4" style="background-color: rgb(115, 168, 109);height: 120px">
	   	<div class="card-content white-text" style="background-color: rgb(115, 168, 109);">
          	 <span class="card-title"></span>
             <p id="labelOne" style="color:white;"></p><br>
             <p id="labelTwo" style="color:white;"></p>
        </div>
    </div>
</div>
<script>
	<c:if test="${not empty param.error}">
		window.onload = function() {
			$("#login").openModal();
			$("#loginError").html("Invalid login and password.");
			$("#closeLogin").show();
		};
	</c:if>
	$(document).ready(function(){
		    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
		 $('.modal-trigger').leanModal();
		 $(".button-collapse").sideNav();
	});
		
	function checkEmailAddress(userEmailId) {
		var emailAddress = document.getElementById(userEmailId).value;
		var signupEmailIdError = document.getElementById(userEmailId+"Error");
		var status = "";
		$.ajax({
			type : 'POST',
			async : false,
			url : 'checkEmailId',
			data : "emailId=" + emailAddress,
			complete : function(data) {
				var email = data.responseText;
				status = email.toString().trim();
			}
		});
		if (status.match("false") && userEmailId.match("signupEmailId")) {
			signupEmailIdError.innerHTML = " Email id already exists.";
			document.getElementById("signupEmailId").value = "";
			return false;
		}else if (status.match("true") && userEmailId.match("forgotEmailId")) {
			signupEmailIdError.innerHTML = " Email id doesn't exists.";
			document.getElementById("forgotEmailId").value = "";
			return false;
		}else {
			signupEmailIdError.innerHTML = "";
		}
		if (emailAddress.length == 0) {
			signupEmailIdError.innerHTML = " Email id cannot be blank.";
			return false;
		}else {
			signupEmailIdError.innerHTML = "";
		}
		var emailIdRegExp = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		if (!(emailAddress.match(emailIdRegExp))) {
			signupEmailIdError.innerHTML = " Enter a valid Email Id.";
			return false;
		} else {
			signupEmailIdError.innerHTML = "";
		}
		return true;
	}
	function IsNumeric(e) {
        var keyCode = e.which ? e.which : e.keyCode
        var ret = ((keyCode >= 48 && keyCode <= 57 )||(keyCode >=65 && keyCode <= 90)||(keyCode==32)  || specialKeys.indexOf(keyCode) != -1);
        if(!ret) {
        	document.getElementById("requirementContactNumberError").innerHTML = "Enter numbers only.";
        }
        else if ( document.getElementById("requirementContactNumber").value.length > 9) {
       	   document.getElementById("requirementContactNumberError").innerHTML = " Enter 10 digit contact number.";
       	   status = false;
       	  }else {
           	document.getElementById("requirementContactNumberError").innerHTML = "";
           }
        return ret;
    }
	var specialKeys = new Array();
    specialKeys.push(8); //Backspace
    function Isname(e) {
        var keyCode = e.which ? e.which : e.keyCode
        var ret = ((keyCode >= 97 && keyCode <= 122) || specialKeys.indexOf(keyCode) != -1);
        if(!ret) {
        	document.getElementById("nameError").innerHTML = "Enter alphabets only.";
        }else {
        	document.getElementById("nameError").innerHTML = "";
        }
        return ret;
    }
    function Ispwd(e) {
    	document.getElementById("signupPasswordError").innerHTML = "";
    }
    function IsconfirmPwd(e) {
    	document.getElementById("signupConfirmPasswordError").innerHTML = "";
    }
    function Isemail(e) {
    	document.getElementById("signupEmailIdError").innerHTML = "";
    }
    
	function signupForm() {
		if(document.getElementById("signupEmailId").value.length == 0) {
    		document.getElementById("signupEmailIdError").innerHTML = " Email id cannot be blank.";
    	}
    	if(document.getElementById("signupPassword").value.length == 0) {
    		document.getElementById("signupPasswordError").innerHTML = " Password cannot be blank.";
    	}
    	if(document.getElementById("signupConfirmPassword").value.length == 0) {
    		document.getElementById("signupConfirmPasswordError").innerHTML = " Confirm Password cannot be blank.";
    	}
    	if(!document.getElementById("signupPassword").value.match(document.getElementById("signupConfirmPassword").value)) {
    		document.getElementById("signupConfirmPasswordError").innerHTML = " Password and Confirm password must match.";
    		$("#signupPassword").val('');
			$("#signupConfirmPassword").val('');
    	}
	  if(document.getElementById("signupEmailId").value.length > 0 && 
  			document.getElementById("signupPassword").value.length > 0 && 
			document.getElementById("signupConfirmPassword").value.length > 0) {
		   $.post('signup',{
		     callFrom:'ajaxCall',
		     async: false,
		     emailId:$("#signupEmailId").val(),
		     password:$("#signupPassword").val(),
	       },
	      function(data) {
	       var data1 = JSON.parse(data);
	       var status = data1.status;
	       if(status) {
	    	   $("#signup").closeModal();
	    	   $("#footerMessage").openModal();
	    	   $("#signupEmailId").val('');
	    	   $("#labelOne").html(data1.messageOne);
	    	   //$("#labelTwo").html(data1.messageTwo);
	       }else {
	    	   $("#signup").closeModal();
	    	   $("#footerMessage").openModal();
	    	   $("#labelOne").html(data1.messageOne);
	       }
	    }
	    );
	  }
	  
	  function checkEmailValidation(userEmailId) {
			var emailAddress = document.getElementById(userEmailId).value;
			var signupEmailIdError = document.getElementById(userEmailId+"Error");
			var status = "";
			$.ajax({
				type : 'POST',
				async : false,
				url : 'checkEmailId',
				data : "emailId=" + emailAddress,
				complete : function(data) {
					var email = data.responseText;
					status = email.toString().trim();
				}
			});
			if (status.match("false") && userEmailId.match("signupEmailId")) {
				signupEmailIdError.innerHTML = " Email id already exists.";
				document.getElementById("signupEmailId").value = "";
				return false;
			}else if (status.match("true") && userEmailId.match("forgotEmailId")) {
				signupEmailIdError.innerHTML = " Email id doesn't exists.";
				document.getElementById("forgotEmailId").value = "";
				return false;
			}else {
				signupEmailIdError.innerHTML = "";
			}
			if (emailAddress.length == 0) {
				signupEmailIdError.innerHTML = " Email id cannot be blank.";
				return false;
			}else {
				signupEmailIdError.innerHTML = "";
			}
			var emailIdRegExp = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
			if (!(emailAddress.match(emailIdRegExp))) {
				signupEmailIdError.innerHTML = " Enter a valid Email Id.";
				return false;
			} else {
				signupEmailIdError.innerHTML = "";
			}
			return true;
		}
	 }

	function forgotPassword() {
    	if(document.getElementById("forgotEmailId").value.length == 0) {
    		document.getElementById("forgotEmailIdError").innerHTML = " Email id cannot be blank.";
    	}
    	if(document.getElementById("forgotEmailId").value.length > 0) {
    		$.post('forgotPassword',{
   			 callFrom:'ajaxCall',
   			 async: false,
   			 emailId:$("#forgotEmailId").val(),
   		},
   		function(data) {
   			var data1 = JSON.parse(data);
   			var status = data1.status;
   			if(status) {
   				$("#forgetPassword").closeModal();
				$("#footerMessage").openModal();
   				$("#forgotEmailId").val('');
   				$("#labelOne").html(data1.messageOne);
				$("#labelTwo").html(data1.messageTwo);
   			}else {
   				$("#forgetPassword").closeModal();
				$("#footerMessage").openModal();
				$("#labelOne").html(data1.messageOne);
   			}
   		}
   		);
    	}
    }
	
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/googleAnalytic.js"></script>