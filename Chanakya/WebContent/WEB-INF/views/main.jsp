<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="icon" type="image/ico" href="homeResources/images/favicon.png ">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="mainResources/css/font-awesome-4.5.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/minCss/hightop-font.css" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/minCss/jquery-ui.min.css" rel="stylesheet" type="text/css">
	<link href="mainResources/css/materialize.min.css" rel="stylesheet" type="text/css" >
	</head>
	<style>
		.card{
			height: 206px;
		}
		.stats-card {
		    display: block;
		    position: relative;
		    overflow: hidden;
		}
		.count {
		    position: relative;
		    font-weight: 700;
		    font-size: 2rem;
		    line-height: 2rem;
		}
	</style>	
<body >
<c:set var="userType" scope="request" value="<%=SpringUser.getCurrentUser().getUserType() %>"></c:set>
   	 <%@ include file="mainHeader.jsp"%>
       <div>
			<div class="row " style="width: 95%">
				<br>
				<c:if test="${userType == 'ROLE_SUPER_ADMIN'}">
		      		<div class="col s12 m6 l3" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "style="height: 102px"><a title="Blog Admin" href="blogAdmin">
		      				<div class="stats-card cyan darken-4 cyan-text text-lighten-5" style="height: 100%">
		      					<div class="count center" style="padding: 13% 0;font-size: 22px">Blog Admin</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      		<div class="col s12 m6 l3" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "style="height: 102px"><a title="Blog Images" href="blogImages">
		      				<div class="stats-card purple darken-4 purple-text text-lighten-5" style="height: 100%">
		      					<div class="count center" style="padding: 13% 0;font-size: 22px">Blog Images</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      		<div class="col s12 m6 l3" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "style="height: 102px"><a title="Blogger" href="blogger">
		      				<div class="stats-card purple darken-4 purple-text text-lighten-5" style="height: 100%">
		      					<div class="count center" style="padding: 13% 0;font-size: 22px">Blogger</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      		<div class="col s12 m6 l3" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "style="height: 102px"><a title="category" href="category">
		      				<div class="stats-card purple darken-4 purple-text text-lighten-5" style="height: 100%">
		      					<div class="count center" style="padding: 13% 0;font-size: 22px">Category</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      		<div class="col s12 m6 l3" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "style="height: 102px"><a title="Genre" href="genre">
		      				<div class="stats-card purple darken-4 purple-text text-lighten-5" style="height: 100%">
		      					<div class="count center" style="padding: 13% 0;font-size: 22px">Genre</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      		<div class="col s12 m6 l3" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "style="height: 102px"><a title="Leaderboard" href="masterCrudLeaderboard">
		      				<div class="stats-card purple darken-4 purple-text text-lighten-5" style="height: 100%">
		      					<div class="count center" style="padding: 13% 0;font-size: 22px">Leaderboard</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      		<div class="col s12 m6 l3" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "style="height: 102px"><a title="Twitter Tweet" href="twitterTweet">
		      				<div class="stats-card purple darken-4 purple-text text-lighten-5" style="height: 100%">
		      					<div class="count center" style="padding: 13% 0;font-size: 22px">Twitter Tweet</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      		<div class="col s12 m6 l3" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "style="height: 102px"><a title="Facebook" href="facebook">
		      				<div class="stats-card purple darken-4 purple-text text-lighten-5" style="height: 100%">
		      					<div class="count center" style="padding: 13% 0;font-size: 22px">Facebook</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      	</c:if>
		      	<c:if test="${userType == 'ROLE_DIGITAL'}">
		      		<div class="col s12 m6 l4" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "><a title="Blog Admin" href="blogAdmin">
		      				<div class="stats-card cyan darken-4 cyan-text text-lighten-5" style="height: 100%">
		      					<i class="fa fa-location-arrow" style="position: absolute;font-size: 6rem;right: 0;bottom: -1rem;"></i>
		      					<div class="count center" style="padding: 23% 11%">Blog Admin</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      		<div class="col s12 m6 l4" style="padding: 0 20px">
		      			<div class="card  z-depth-3 "><a title="Blog Images" href="blogImages">
		      				<div class="stats-card purple darken-4 purple-text text-lighten-5" style="height: 100%">
		      					<i class="fa fa-location-arrow" style="position: absolute;font-size: 6rem;right: 0;bottom: -1rem;"></i>
		      					<div class="count center" style="padding: 23% 11%">Blog Images</div>
		      				</div>
		      				<br></a>
		      			</div>
		      		</div>
		      	</c:if>
			</div>
		</div>
 <script src="mainResources/minJs/jquery-1.11.3.min.js" type="text/javascript" ></script> 
 <script src="mainResources/minJs/jquery-ui.min.js" type="text/javascript"></script>
 <script src="homeResources/js/materialize.min.js" type="text/javascript" ></script>
 
 <script>
	 $(document).ready(function(){
		 $(".dropdown-button").dropdown();
		 $(".button-collapse").sideNav();
	});
	
 </script>
</body>
</html>