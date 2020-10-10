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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css">
	<!--Import Google Icon Font-->
	<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
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
	<br><br><br><br>
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<script>
	  (adsbygoogle = window.adsbygoogle || []).push({
	    google_ad_client: "ca-pub-8938038149741273",
	    enable_page_level_ads: true
	  });
	</script>
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
							<label style="padding-left: 10px;padding-right: 15px;cursor: pointer;">${blog.blogger.name}</label>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<br><br></br>
	<%@ include file="homeFooter.jsp"%>
	<script>
		$( document ).ready(function() {
		   $(".button-collapse").sideNav();
		});
    </script>
</body>
</html>	