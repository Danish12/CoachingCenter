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
	<meta name="description" content="<%=resource.getString("metaDescription") %>">
    <meta charset="utf-8">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
	<br><br><br><br>
	<div class="container" style="width:90%;">
		<div class="row" id="resultBox">
			<div class="col s12 m12 l12">
				<ul class="collection with-header">
			        <li class="collection-header"><h5>Guidelines for publishing an article on <%=resource.getString("name") %></h5></li>
			        <li class="collection-item">Here is a team of entrepreneurs, writers and enthusiasts. we are keenly focusing on 
			        great value added content for our readers.</li>
			        <li class="collection-item">You can  understand our different themes going through our posts. Producing good content 
			        and adding value to maintain consistency for our readers.</li>
			        <li class="collection-item">We adhere to following instructions. It is applicable not only for us, instead 
			        to our respectable authors, editors, writers and contributors. It is suggested to go through our privacy policy once.</li>
			    </ul>
				<!-- <h1 class="left" style="font-size:30px">Guidelines for publishing an article on Writers Chord</h1> -->
			</div>
			<!-- <div class="col s12 m12 l12">
				<p class="left">Here is a team of entrepreneurs, writers and enthusiasts. we are keenly focusing on great value added content for our readers. 
				<br>You can  understand our different themes going through our posts. Producing good content and adding value to maintain consistency 
				<br>for our readers.
				<br><br>We adhere to following instructions. It is applicable not only for us, instead to our respectable authors, editors, writers 
				<br>and contributors. It is suggested to go through our privacy policy once.</p>
			</div> -->
		</div>
	</div>
	<div class="container" style="width:90%;">
		<div class="row" id="resultBox">
			<div class="col s12 m12 l12">
				<ul class="collection with-header">
			        <li class="collection-header"><h5>Who can write for us?</h5></li>
			        <li class="collection-item">Content writers</li>
			        <li class="collection-item">Bloggers</li>
			        <li class="collection-item">General Experience</li>
			        <li class="collection-item">Research Articles</li>
			        <li class="collection-item">Poetry</li>
			        <li class="collection-item">Technology</li>
			        <li class="collection-item">Travel</li>
			        <li class="collection-item">Fashion</li>
			        <li class="collection-item">Health & Fitness</li>
			        <li class="collection-item">Motivational & Influential</li>
			        <li class="collection-item">Fiction & Non Fiction Story</li>
			    </ul>
			</div>
		</div>
	</div>
	<div class="container" style="width:90%;">
		<div class="row" id="resultBox">
			<div class="col s12 m12 l12">
				<ul class="collection with-header">
			        <li class="collection-header"><h5>Our Article Writing Guidelines?</h5></li>
			        <li class="collection-item">Article shouldn't be plagiarised and must detailed and unique. Copied content won't be published.</li>
			        <li class="collection-item">We will avoid spam links through your bio, or through your own site.</li>
			        <li class="collection-item">Content must be greater than 600 words, must enriched the knowledge of our visitors and put sum value to our readers.</li>
			        <li class="collection-item">Article should not have more than 2 external links.</li>
			        <li class="collection-item">Article must offer precise arguments and should not be just opinions.</li>
			        <li class="collection-item">The article has to be related to the niche above mentioned</li>
			        <li class="collection-item">Writers Chord own the content on our site, hence we are eligible to to remove any content that violates 
			        our privacy policy without acknowledging the author.</li>
			        <li class="collection-item">Copyright policies need to obsolete as per the law and would result in deleting the post permanently 
			        in any case of violence.</li>
			    </ul>
			</div>
		</div>
	</div>
	<div class="container" style="width:90%;">
		<div class="row">
			<div class="col s12 m12 l12">
				<p>To register as a Contributor or Author as well as any further queries or doubts, you can contact us by writing to <%=resource.getString("care") %>.</p>
				<p>Thank you for your time and we welcome your future article.</p>
			</div>
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