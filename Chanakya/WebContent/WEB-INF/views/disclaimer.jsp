<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><%=resource.getString("title") %></title>
    <meta name="keywords" content="content publishing platform, publish your blog, where do guest blogging, 
    create back links">
	<meta name="description" content="<%=resource.getString("metaDescription") %>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="alternate" href="http://<%=resource.getString("name") %>.com" hreflang="en-us" />
	<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/homeResources/images/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css">
	<link rel="publisher" href="https://plus.google.com/104800969883924028037v">
	<!--Import materialize.css-->
	<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/materialize.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/materialize.min.js"></script>
</head>
<style>
	.row{
		margin-bottom: 8px !important;
	}
	h1{
		padding-top:1%;
		font-size:40px;
		color:black;
	}
	p{
		text-align: justify;
		
	}
	h2{
		font-size: 1.8em;
		color:black;
		text-align: left;
	}
	
	ulDisc{
		padding-left: 26px !important;
		list-style-type:disc !important;
	}
	liDisc{
		padding-bottom: 10px !important;
		padding-left: 20px !important;
	}
</style>
<body>
	<%@ include file="homeHeader.jsp"%>
	<br><br><br><br>
	<div class="container" style="width:90%;">
		<div class="row">
			<div class="col s12 center">
				<h1>Disclaimer</h1>
			</div><br>
			<div class="col s12">
				<p>All the blogs or articles published on <%=resource.getString("nameTwo") %> are guest blogs or guest articles.</p>
				<p>All opinions and views that are expressed on <%=resource.getString("nameTwo") %> are purely individual opinions.</p>
			</div><br>
			<div class="col s12">
				<p>Everyone love comments and we feel a lot happy when somebody shares their feedback, but any comments which are abusive, spread hatred, are racial, 
				   or in any way hurting anyone's opinions will never be entertained. We keep our comments moderated to maintain the integrity of individuals. 
				   We reserve all rights to accept or reject comments.
				</p>
			</div><br>
			<div class="col s12">
				<p>We use third party advertising companies to serve advertisement. Some of them, like AdSense, use the DART cookie to serve 
				   advertisements based on a user's interest and previous interactions. A user can always opt out of the DART cookie settings by 
				   visiting the Google ad and content network privacy policy.
				</p>
			</div>
		</div>
	</div>
	<br><br><br><br>
	<%@ include file="homeFooter.jsp"%>
</body>
</html>