<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html>
<html>
  <head>
	<title><%=resource.getString("title")%></title>
	<meta name="description" content="<%=resource.getString("metaDescription")%>">
    <meta charset="utf-8">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="alternate" href="<%=resource.getString("alternateUrl")%>" hreflang="en-us" />
	<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/homeResources/images/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/materialize.min.css" media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/custom.css"/>
		
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/materialize.min.js"></script>
	<style>
		body {
			background-color: #f5f5f5;
		}
	</style>
  </head>
 <body>
   <%@ include file="homeHeader.jsp"%>
   <br></br><br>
	<div class="container" style="width:80%;">
		<div class="row">
			<div class="col s12 center-align" style="font-family: robotolight;color: black;">
				<h1 style="font-size: 40px;">Contact Us</h1>
			</div>
			<div class="col s12 center-align">
               <p style="font-family: robotolight;color: black;font-size: 17px;line-height: 25px;">
                	<!-- <b><span style="color:#428bca;">Grow your backlinks and make a meteoric growth on your website</span></b><br> -->
					We'd love to hear from you! Drop us a note and we will get back to you as fast as humanly possible!
               </p>
           </div>
		</div>
	</div>
	<div class="container" style="width:80%;">
		<div class="row">
			<div class="col s12 center-align" style="font-family: robotolight;color: black;">
				<h1 style="font-size: 40px;">Get in touch</h1>
			</div>
			<div class="input-field col s12 l6 center-align">
		   		<div class="form-group">
			    	<label for="contactName" style="color: black;">Name</label>
				    <input type="text" class="form-control input-sm" name="contactName" id="contactName">
				</div>
		   </div>
			<div class="input-field col s12 l6 center-align">
		   		<div class="form-group">
			    	<label for="contactEmailId" style="color: black;">Email Id</label>
				    <input type="text" class="form-control input-sm" name="contactEmailId" id="contactEmailId">
				</div>
		   </div>
		   <div class="input-field col s12 l6 center-align">
		   		<div class="form-group">
			    	<label for="contactContactNumber" style="color: black;">Contact Number</label>
				    <input type="text" class="form-control input-sm" name="contactContactNumber" id="contactContactNumber">
				</div>
		   </div>
		   <div class="input-field col s12 l6 center-align">
		   		<div class="form-group">
			    	<label for="contactMessage" style="color: black;">Message</label>
				    <input type="text" class="form-control input-sm" name="contactMessage" id="contactMessage">
				</div>
		   </div>
		</div>
		<div class="row center">
			<div class="col s12">
				<br>
				<input class="btn theme-color" type="button" value="Send Message" onclick="contactUs()">
			</div>
		</div>
	</div>
	<!-- <div id="dialog-message" title="Mail Sent">
		<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		    Your message has been successfully sent to us.<br><br>
		    We will get back to you soon.
		</p>
	</div> -->
    <%@ include file="homeFooter.jsp"%>
</body>
	<script type='text/javascript'>
        function contactUs() {
	       $.post('${pageContext.request.contextPath}/sendEnquiry',{
	           callFrom:'ajaxCall',
	           async: false,
	           emailId:$("#contactEmailId").val(),
	           contactNumber:$("#contactContactNumber").val(),
	           name:$("#contactName").val(),
	           message:$("#contactMessage").val(),
           },
 		   function(data) {
 		   		var data1 = JSON.parse(data);
 			    var status = data1.status;
 			    if(status) {
 			       //$('#loading').hide();
 			       $("#contactEmailId").val('');
 			       $("#contactContactNumber").val('');
 			       $("#contactName").val('');
 			       $("#contactMessage").val('');
 			       $("#footerMessage").openModal();
 		    	   $("#labelOne").html(data1.messageOne);
	            }else {
	            	$("#footerMessage").openModal();
	 		    	$("#labelOne").html(data1.messageOne);
 			    }
 		   });
 		}
	</script>
</html>