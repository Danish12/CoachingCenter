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
    <title>Short Movie Making Contest | Fagnum</title>
	<meta name="description" content="Short Movie Making Contest Begins 1st Mar 17 & Ends 25th Mar 17">
	<meta name="author" content="Mohd Wasi" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta property="og:url"           content="http://www.fagnum.com/short-movie-contest/"/>
	<meta property="og:type"          content="article" />
	<meta property="og:title"         content="Short Movie Making Contest By Fagnum from 1st Mar to 25th Mar 2017" />
	<meta property="og:description"   content="Fagnum is organising their first short movie making contest after successfully running 6 article writing contest to encourage talent all over the country." />
	<meta property="og:image"         content="http://www.fagnum.com/newBlogImage/short-movie-making-contest-fagnum.jpg" />
	<meta property="og:site_name" 	  content="<%=resource.getString("siteName")%>">
	<meta property="article:publisher" content="<%=resource.getString("facebookLink")%>"/>
	<meta property="article:author" content="Mohd Wasi" />
	<meta property="article:section" content="article" />
	<meta name="twitter:card" content="summary_large_image"/>
	<meta name="twitter:description" content="Fagnum is organising their first short movie making contest after successfully running 6 article writing contest to encourage talent all over the country."/>
	<meta name="twitter:title" content="Short Movie Making Contest By Fagnum from 1st Mar to 25th Mar 2017"/>
	<meta name="twitter:url" content="http://www.fagnum.com/short-movie-contest/">
	<meta name="twitter:site" content="@fagnumtwit"/>
	<meta name="twitter:domain" content="fagnum.com"/>
	<meta name="twitter:image" content="http://www.fagnum.com/newBlogImage/short-movie-making-contest-fagnum.jpg"/>
	<meta name="twitter:creator" content="@fagnumtwit"/>
	<link rel="alternate" href="<%=resource.getString("alternateUrl") %>" hreflang="en-us" />
	<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/homeResources/images/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css">
	<!--Import Google Icon Font-->
	<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/materialize.min.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/custom.css"/>
	<style>
		/* body {
			background-color: #f5f5f5;
		} */
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
	<br><br>
	<div class="container" style="width:90%;">
		<div class="row" id="resultBox">
			<div class="col s12 m12 l12">
				<h1 class="left" style="font-size:30px">Short Movie Making Contest By Fagnum from 1st Mar to 25th Mar 2017</h1>
			</div>
			<div class="col s12 m12 l8">
				<img alt="Short Movie Making Contest Fagnum" src="http://www.fagnum.com/blogImage?short-movie-making-contest-fagnum.jpg" style="width:100%;height:100%;">
			</div>
			<div class="col s12 m12 l12">
				<ul class="collection with-header">
			        <li class="collection-header"><h5>Prizes</h5></li>
			        <li class="collection-item">First rank holder will get a cash prize of <i class="fa fa-inr" aria-hidden="true"></i>10,000.</li>
			        <li class="collection-item">Second rank holder will get a cash prize of <i class="fa fa-inr" aria-hidden="true"></i>7,500.</li>
			        <li class="collection-item">Third rank holder will get a cash prize of <i class="fa fa-inr" aria-hidden="true"></i>5,000.</li>
			        <li class="collection-item">If anyone referred a contestant and contestant published their short movie on fagnum youtube channel 
			        then referrer will get <i class="fa fa-inr" aria-hidden="true"></i>500 cash prize. </li>
			    </ul>
			</div>
			<div class="col s12 m12 l12">
				<ul class="collection with-header">
			        <li class="collection-header"><h5>Guidelines for publishing a Short Movie on <%=resource.getString("name") %> YouTube channel.</h5></li>
			        <li class="collection-item">Fagnum supports and encourages young filmmakers to create and showcase original short films on our platform.</li>
			        <li class="collection-item">Each entry should have Fagnum as its opening slate for it to become eligible for the contest. 
			        Brand logo slate will be provided to the contestants.</li>
			        <li class="collection-item">Fagnum is permitted to use the submitted works (films, trailer, posters, pictures) and  
			        press materials of all selected entries for publicity and promotional purposes.</li>
			        <li class="collection-item">Short Movie must be in Hindi or English.</li>
			        <li class="collection-item">Keep your short film under 15 minutes including start and end credits.</li>
			        <li class="collection-item">We do not encourage the use of copyrighted material and child abuse or any scandalous events as your theme.</li>
			        <li class="collection-item">Short movies must be original and must not be posted on the internet before. They will be published ONLY on Fagnum's YouTube channel.</li>
			        <li class="collection-item">Movies published on fagnum's youtube channel will be owned by fagnum only. </li>
			        <li class="collection-item">Contestants must share at least one Poster, Teaser and Short Movie with Fagnum logo to participate.</li>
			        <li class="collection-item">Share your movie at care@fagnum.com.</li>
			    </ul>
			</div>
		</div>
	</div>
	<div class="container" style="width:90%;">
		<div class="row" id="resultBox">
			<div class="col s12 m12 l12">
				<ul class="collection with-header">
			        <li class="collection-header"><h5>Judging Criteria and How points will be awarded?</h5></li>
			        <li class="collection-item">Each movie will be watched by the fagnum team and if it conforms to the guidelines in terms of content and quality, it will be published on our YouTube channel</li>
			        <li class="collection-item">Each movie view on YouTube will be awarded one point.</li>
			        <li class="collection-item">For every 100 minutes watch time, 10 points will be awarded.</li>
			        <li class="collection-item">Certificate will be provided to every participant.</li>
			    </ul>
			</div>
		</div>
	</div>
	<div class="container" style="width:90%;">
		<div class="row">
			<div class="col s12 m12 l12">
				<p>For any other query, you can contact us by writing to <%=resource.getString("care") %> or call at +91 886 786 1530</p>
				<p>Thank you for your time and we welcome your movies.</p>
			</div>
			<div class="col s12">
				<jsp:include page="sharePage.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<br><br></br>	
	<script type="text/javascript" src="homeResources/js/jquery.js"></script>
	<script type="text/javascript" src="homeResources/js/materialize.min.js"></script>
	<%@ include file="homeFooter.jsp"%>
	<script>
		$( document ).ready(function() {
		   $(".button-collapse").sideNav();
		});
		
		function loadMore(length) {
			var length = length;
			scroll = scroll + 500;
			//document.getElementById('loading').style.display = "block" ;
			$.get('loadMore',{
		 		 callFrom:'ajaxCall',
		 		 async: false,
		 		 length:length,
		 		 },
		 	     function(data) {
		     	    $("#divLoadMore").remove();
		     	    var data1 = data.replace("[[","[").replace("]]","]");
		 			var result = eval(data1);
		 			var resultLength = result.length;
		 			length = parseInt(length) + parseInt(resultLength);
		 			if(resultLength > 0) { 	
		 				//$("#loading").hide();
		 				for(var i=0;i<result.length;i++) {
		 					var code = "<div class='col s12 m6 l3'>"+					
							"<a title='"+result[i].title+"' href='blog/"+result[i].url+"'>"+
							"<div class='card' style='height:270px;'>"+
								"<div class='card-image'>"+
									"<img alt='"+result[i].title+"' src='"+result[i].image+"' style='height:150px;'>"+
								"</div>"+
								"<div class='card-title' style='color:black;padding-left:15px;padding-right:15px;padding-top:15px;font-weight:bold;font-size:15px;'>"+result[i].title+""+
								"</div>"+
								"<label style='padding-left: 15px;padding-right: 5px;cursor: pointer;'>"+result[i].date+"</label>"+
								"<label style='padding-left: 10px;padding-right: 15px;cursor: pointer;'>"+result[i].name+"</label>"+
							"</div>"+
							"</a>"+
							"</div>";
		 	 				$("#resultBox").append(code);	
		 	  			}
		 				var btnCode="<div class='row container' id='divLoadMore'>"+
										"<div class='col m4 l8'>"+"<br>"+"</div>"+
										"<div class='col m4 l4'>"+
											"<input type='button' id='loadMore' class='btn waves-effect waves-light col s6 m6 l7' value='Load More' "+
											 "onclick='loadMore("+length+")' style='margin-top: 15px;clear: both;background-color: #03a9f4;'>"+
										 "</div>"+
									"</div>"
		 	 			//var btnCode = "<input type='button' id='loadMore' class='btn btn-default loadBtn' value='Load More' onclick='loadMore("+length+")' style='margin-left: 250px; margin-top: 15px;'>";
		 	 			$("#resultBox").append(btnCode);
		 			}else {
		 				//$("#loading").hide();
		 				$("#noMoreResults").show();
		 				$("#divLoadMore").hide(); 				
		 			}
		 	    });
		}
    </script>
</body>
</html>	