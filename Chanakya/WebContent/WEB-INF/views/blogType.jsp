<%@ page import="java.util.ResourceBundle"%>
<%@ page import="com.fagnum.services.model.SpringUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html>
<html>
  <head>
    <title>Fagnum | Content Publishing Platform</title>
    <meta name="keywords" content="content publishing platform, publish your blog, where do guest blogging, 
    create back links">
	<meta name="description" content="Fagnum is a content publishing platform for startups and bloggers">
    <meta charset="utf-8">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="alternate" href="http://fagnum.com" hreflang="en-us" />
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
		body {
			background-color: #f5f5f5;
		}
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
	<%@ include file="homeHeader.jsp"%>
	<%-- <sec:authorize access="isAuthenticated()">
	    <sec:authentication property="principal.username" var="username" />
	</sec:authorize>
	<sec:authorize access="!isAuthenticated()">
	    <sec:authentication property="principal" var="username" />
	</sec:authorize> --%>
	<%-- <div class="navbar-fixed" style=" z-index: 998; height:0px;"> 
		<nav id="navigation" style="box-shadow:none;background-color: white;">
			<div class="nav-wrapper " style="height:80px;">
				<div class="container" style="width:80%">
					<a title="Fagnum" href="<%=resource.getString("siteUrl") %>" class="brand-logo" style="padding-top:8px;">
						<img src="homeResources/images/logo.png" alt="logo"  style="background-color:transparent;width:170px;height:65px;">
					</a>
				</div>
				<a title="Menu Bar" href="#" data-activates="mobile-demo" class="button-collapse" ><i class="material-icons" style="color: black">menu</i></a>
				<ul class="right hide-on-med-and-down" id="desktopHeader" style="padding-right: 38px;">
					<li><a title="About us" href="aboutUs" style="color:grey;">About Us</a></li>
					<c:if test="${empty pageContext.request.userPrincipal.name}">
						<li><a title="Login" class="modal-trigger" href="#login" id="loginHeader" style="color:grey;" >Login</a></li>
					</c:if>
					<c:if test="${not empty pageContext.request.userPrincipal.name}">
						<c:set var="userType" scope="request" value="<%=SpringUser.getCurrentUser().getUserType() %>"></c:set>
						<li><a title="Dropdown" class="dropdown-button" id="loginEmailId" data-activates="dropdown2" style="color:grey;">
						<i class="material-icons right">account_circle</i></a></li>
						<ul class="dropdown-content" id="dropdown2" style="margin-top: 65px;min-width: 241px">
							<li><a style="color:grey;">${pageContext.request.userPrincipal.name}</a></li>
							<c:if test="${userType == 'ROLE_BLOGGER'}">
								<li><a title="Dashboard Blogger" href="dashBoardBlogger" style="color:grey;">Dashboard</a></li>
							</c:if>
							<li><a title="Logout" href="<c:url value="/j_spring_security_logout"/>" style="color:grey;">Logout</a></li>
						</ul>
					</c:if>
				</ul>
			</div>
		</nav>
	</div> --%>
	<br><br><br><br>
	<!-- <div class="container" style="width:90%;">
		<div class="row hide-on-med-and-down">
			<div class="col s12 m12 l12">
				<script data-cfasync='false' type='text/javascript' src='//clksite.com/adServe/banners?tid=168445_304229_5'></script>
			</div>
		</div>
	</div> -->
	<div class="container" style="width:90%;">
		<div class="row">
			<c:forEach items="${blogs}" var="blog">
				<div class="col s12 m6 l3">
					<a title="${blog.title}" href="<%=resource.getString("siteUrl")%>blog/${blog.url}">
						<div class="card" style="height:280px;">
							<div class="card-image">
								<img alt="${blog.title}" src="${blog.blogImage}" style="height:150px;">
							</div>
							<div class="card-title" 
								style="color:black;padding-left:15px;padding-right:15px;padding-top:15px;font-weight:bold;font-size:15px;">${blog.title}
							</div>
							<label style="padding-left: 15px;padding-right: 5px;cursor: pointer;">${blog.date}</label>
							<label style="padding-left: 10px;padding-right: 15px;cursor: pointer;">${blog.blogger.name}</label>
						</div>
					</a>
				</div>
			</c:forEach>
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