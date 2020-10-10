<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>${blogger.name} - Author</title>
    <meta name="keywords" content="content publishing platform, publish your blog, where do guest blogging, 
    create back links">
	<meta name="description" content="${blogger.bio}">
    <meta charset="utf-8">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta property="og:url"           content="<%=resource.getString("siteUrl")%>author/${blogger.url}" />
	<meta property="og:type"          content="article" />
	<meta property="og:title"         content="${blogger.name}" />
	<meta property="og:description"   content="${blogger.bio}" />
	<meta property="og:image"         content="<%=resource.getString("siteUrl")%>slashBloggerImage/${blogger.url}.jpg" />
	<meta property="og:site_name" 	  content="<%=resource.getString("name") %>.com">
	<meta name="twitter:card" content="summary_large_image"/>
	<meta name="twitter:description" content="${blogger.bio}"/>
	<meta name="twitter:title" content="${blogger.name}"/>
	<meta name="twitter:url" content="<%=resource.getString("siteUrl") %>${blogger.url}">
	<meta name="twitter:site" content="@<%=resource.getString("twitterHandle")%>"/>
	<meta name="twitter:domain" content="<%=resource.getString("name") %>.com"/>
	<meta name="twitter:image" content="<%=resource.getString("siteUrl")%>slashBloggerImage/${blogger.url}.jpg"/>
	<meta name="twitter:creator" content="@<%=resource.getString("twitterHandle")%>"/>
	<link rel="alternate" href="http://<%=resource.getString("name")%>.com" hreflang="en-us" />
	<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/homeResources/images/favicon.png ">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css">
	<!--Import Google Icon Font-->
	<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/materialize.min.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/custom.css"/>
</head>
<style>
	
	@media (min-width:993px){
		.blogLeft{
			margin-left: 158px !important;
		}
		.profileText{
	    	font-size: 18px;
	    	line-height: 30px;
	    	padding-bottom: 20px;
    		border-bottom: 2px solid black;
		}
		.imgBlock{
			height: 170px;
			width: 100%;
		}
		.titleBlock{
			color: black;
			font-size: 24px;
			line-height: 28px;
		}
		.detailBlock{
			font-size: 15px;
			line-height: 20px;
			color: #575757;
			margin-top: 10px ;
			text-align: justify;
			padding-bottom: 10px;
		}
	}
	@media (max-width:992px){
		.blogLeft{
		margin-left: 116px !important;
		}
	}
	@media (min-width:601px)and (max-width:992px){
		.profileText{
	    	font-size: 15px;
	    	line-height: 25px;
	    	padding-bottom: 20px;
    		border-bottom: 1px solid #ECECEC;
		}
		.detailBlock{
			font-size: 15px;
			line-height: 19px;
			color: #575757;
			margin-top: 10px ;
			text-align: justify;
			padding-bottom: 10px;
		}
		.imgBlock{
			height: 185px;
			width: 100%;
		}
		.titleBlock{
			color: black;
			font-size: 18px;
			line-height: 22px;
		}
	}
	@media (max-width:600px){
		.profileText{
	    	font-size: 12px;
	    	line-height: 20px;
	    	padding-bottom: 20px;
    		border-bottom: 1px solid #ECECEC;
		}
		.imgBlock{
			height: 200px;;
			width: 100%;
		}
		.titleBlock{
			color: black;
			font-size: 20px;
			line-height: 24px;
		}
		.detailBlock{
			font-size: 13px;
			line-height: 20px;
			color: #575757;
			margin-top: 10px ;
			text-align: justify;
			padding-bottom: 10px;
		}
	}
	.imgWrapper {
	    position: relative;
	    width: 100%;
	    height: 120px;
	    overflow: hidden;
	}
	.overlay {
	    position: absolute;
	    top: 0;
	    right: 0;
	    bottom: 0;
	    left: 0;
	    background: rgba(125, 120, 116, 0.9);
	}
	.imgSize{
		position: absolute;
	    top: -9999px;
	    bottom: -9999px;
	    left: -9999px;
	    right: -9999px;
	    width: 100%;
	    margin: auto;
	}
	.profileImg {
	    position: relative;
	    z-index: 1;
	    width: 192px;
	    height: 192px;
	    border: 5px solid #fff;
	    -webkit-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.2);
	    -moz-box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.2);
	    box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.2);
	    margin-top: -75px;
	    overflow: hidden;
	    margin-left: auto !important;
	    margin-right: auto !important;
	}
	.nameHeading{
		font-size: 24px;
		color: red;
	}
	.postInfo {
	    font-size: 10px;
	    line-height: 13px;
	    letter-spacing: 1px;
	    text-transform: uppercase;
		color: #E5002D;
	}
	a:hover{
	}
	.categories {
		color:white;
		font-family: Cambria, Georgia, serif;
	    font-size: 18px;
	    font-style: normal;
	    font-variant: normal;
	    font-weight: 500;
	}
</style>
<body>
<!------------------- HEADER--------------------- -->
	<%@ include file="homeHeader.jsp"%>
<!------------------- HEADER END--------------------- -->
<!------------------- PROFILE SECTION--------------------- -->
	<br><br><br><br>
	<div class="container" style="width:90%;">
		<c:if test="${not empty blogger.name}">
			<div class="row">
				<div class="col s12 m12 l3">
					<img alt="${blogger.name}" src="${blogger.profilePic}" style="width:100%;">
				</div>
				<div class="col s12 m12 l9">
					<div class="row">
						<div class="col s12 m12 l12">
							<h1 class="nameHeading" style="margin:0;">${blogger.name}
							<c:if test="${not empty blogger.facebookProfile}">
								&nbsp;&nbsp;<a title="Facebook Profile" href="${blogger.facebookProfile}" target="_blank" style="color:red;"><i class="fa fa-facebook"></i></a>
							</c:if>
							<c:if test="${not empty blogger.twitterProfile}">
								&nbsp;&nbsp;<a title="Twitter Profile" href="${blogger.twitterProfile}" target="_blank" style="color:red;"><i class="fa fa-twitter"></i></a>
							</c:if>
							<c:if test="${not empty blogger.linkedinProfile}">
								&nbsp;&nbsp;<a title="Linkedin Profile" href="${blogger.linkedinProfile}" target="_blank" style="color:red;"><i class="fa fa-linkedin"></i></a>
							</c:if></h1>
						</div>
						<div class="col s12 m12 l12">
							<p style="font-size:17px;text-align:justify;">${blogger.bio}</p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
    </div>
<!------------------- PROFILE SECTION END--------------------- -->
	<p class="profileText container center"></p>
	<br>
	<div class="container" style="width:90%;">
		<div class="row">
			<c:forEach items="${blogs}" var="blog">
				<div class="col s12 m6 l3">
					<a title="${blog.title}" href="<%=resource.getString("siteUrl")%>blog/${blog.url}">
						<div class="card" style="height:270px;">
							<div class="card-image">
								<img alt="${blog.title}" src="${blog.blogImage}" style="height:150px;">
							</div>
							<div class="card-title" 
								style="color:black;padding-left:15px;padding-right:15px;padding-top:15px;font-weight:bold;font-size:15px;">${blog.title}
							</div>
							<label style="padding-left: 15px;padding-right: 5px;cursor: pointer;">${blog.date}</label>
							<label style="padding-left: 5px;padding-right: 5px;cursor: pointer;">${blog.blogger.name}</label>
							<c:if test="${blog.views != 0}">
								<label style="padding-left: 5px;padding-right: 15px;cursor: pointer;">${blog.views} Views</label>
							</c:if>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@ include file="homeFooter.jsp"%>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/materialize.min.js"></script>
<script>
	$( document ).ready(function() {
	   $(".button-collapse").sideNav();
	});
</script>
</html>