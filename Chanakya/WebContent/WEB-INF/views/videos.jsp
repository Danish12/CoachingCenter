<%@ page import="com.fagnum.services.model.SpringUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.util.ResourceBundle"%>
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
	<link href="${pageContext.request.contextPath}/homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<!--Import Google Icon Font-->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/materialize.min.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/custom.css"/>
		
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/materialize.min.js"></script>
	<style>
		@media (min-width:993px){
			.card{
			height: 550px;
			}
			.widthContainer{
			width: 94% !important;
			padding-left: 10% !important;
			}
			.blogLeft{
			margin-left: 158px !important;
			}
		}
		@media (max-width:992px){
			.card{
			padding-bottom: 1%;
			}
			.blogLeft{
			margin-left: 116px !important;
			}
		}
	</style>
  </head>
<body>
	<%@ include file="homeHeader.jsp"%><br><br><br><br>
	<div class="container" style="width:90%;">
		<div class="row">
			<div class="col s12 m12 l12 hide-on-med-and-down">
				<iframe width="1200" height="540" src="https://www.youtube.com/embed/oHYRsyMSw90" frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="col s12 m12 l12 hide-on-large-only">
				<iframe width="330" height="250" src="https://www.youtube.com/embed/oHYRsyMSw90" frameborder="0" allowfullscreen></iframe>
			</div>
		</div>
	</div>
	<br><br></br>
	<script>
		$( document ).ready(function() {
		   $(".button-collapse").sideNav();
		})
		
    </script>
	<%@ include file="homeFooter.jsp"%>
</body>
</html>	