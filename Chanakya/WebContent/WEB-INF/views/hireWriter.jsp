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
    <title><%=resource.getString("title") %></title>
    <meta name="keywords" content="content publishing platform, publish your blog, where do guest blogging, 
    create back links">
	<meta name="description" content="<%=resource.getString("metaDescription") %>">
    <meta charset="utf-8">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="alternate" href="<%=resource.getString("alternateUrl") %>" hreflang="en-us"/>
	<link rel="icon" type="image/ico" href="homeResources/images/favicon.png">
	<link href="homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet" href="homeResources/css/materialize.min.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="homeResources/css/custom.css"/>
		
	<script type="text/javascript" src="homeResources/js/jquery.js"></script>
	<script type="text/javascript" src="homeResources/js/materialize.min.js"></script>
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
	<div class="container" style="width:90%;">
		<div class="row" id="resultBox">
			<c:forEach items="${listBlogger}" var="blogger">
				<div class="col s12 m6 l3">
					<a title="${blogger.name}" href="author/${blogger.url}/">
						<div class="card" style="height:270px;">
							<div class="card-image">
								<img alt="${blogger.name}" src="${blogger.profilePic}" style="height:200px;">
							</div>
							<div class="row">
								<div class="col s7 card-title" 
									style="color:black;padding-left:20px;padding-top:15px;font-weight:bold;font-size:15px;">
									${blogger.name}</div>
								<div class="col s5 card-title"
									style="color:black;padding-left:20px;padding-top:15px;font-weight:bold;font-size:15px;">
									${blogger.noOfArticle} Article</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
			<%-- <div class="row container" id="divLoadMore">
				<div class="col s4 m5 l8"><br></div>
				<div class="col s6 m4 l4" style="position: inherit;will-change:inherit;">
					<a id="loadMore" class="btn waves-effect waves-light col s12 m12 l7" onclick="loadMore(${matches})" 
					style="margin-top: 15px;clear: both;background-color: #03a9f4;position: inherit;will-change:inherit;">Load More</a>
				</div>
			</div>
			<div class="row" id="noMoreResults" style="display: none;">
				<div class="col m4 l12">
					<h5 class="center-align" style="font-weight: bold;color: #03a9f4;">No more results.</h5>
				</div>
			</div> --%>
		</div>
	</div>
	<br><br></br>
	<script type="text/javascript" src="homeResources/js/jquery.js"></script>
	<script type="text/javascript" src="homeResources/js/materialize.min.js"></script>
	<!--  Revenue Hits Start-->
	<!-- <script data-cfasync='false' type='text/javascript' src='//clksite.com/adServe/banners?tid=168445_304229_0&type=footer&size=468x60'></script> -->
	<!--  Revenue Hits End-->
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