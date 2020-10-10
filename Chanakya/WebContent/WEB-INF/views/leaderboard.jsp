<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html>
<html>
  <head>
	<title>Article Writing Contest | Fagnum</title>
	<meta name="description" content="Article Writing Contest By Fagnum from 4th Feb to 28th Feb 2017">
	<meta name="author" content="Mohd Wasi" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta property="og:url"           content="<%=resource.getString("siteName")%>article-writing-contest/"/>
	<meta property="og:type"          content="article" />
	<meta property="og:title"         content="Article Writing Contest By Fagnum from 4th Feb to 28th Feb 2017" />
	<meta property="og:description"   content="Fagnum is organising their 7th article writing contest to encourage talent all over the country." />
	<meta property="og:image"         content="http://www.fagnum.com/newBlogImage/article-writing-contest-fagnum.jpg" />
	<meta property="og:site_name" 	  content="<%=resource.getString("siteName")%>">
	<meta property="article:publisher" content="<%=resource.getString("facebookLink")%>"/>
	<meta property="article:author" content="Mohd Wasi" />
	<meta property="article:section" content="article" />
	<meta name="twitter:card" content="summary_large_image"/>
	<meta name="twitter:description" content="Fagnum is organising their 7th article writing contest to encourage talent all over the country."/>
	<meta name="twitter:title" content="Article Writing Contest By Fagnum from 4th Feb to 28th Feb 2017"/>
	<meta name="twitter:url" content="<%=resource.getString("siteName")%>article-writing-contest/">
	<meta name="twitter:site" content="@fagnumtwit"/>
	<meta name="twitter:domain" content="fagnum.com"/>
	<meta name="twitter:image" content="http://www.fagnum.com/newBlogImage/article-writing-contest-fagnum.jpg"/>
	<meta name="twitter:creator" content="@fagnumtwit"/>
	<link rel="alternate" href="<%=resource.getString("alternateUrl")%>" hreflang="en-us" />
	<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/homeResources/images/favicon.png ">
	<link href="${pageContext.request.contextPath}/mainResources/minCss/hightop-font.css" media="all" rel="stylesheet" type="text/css" />
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/mainResources/stylesheets/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/mainResources/css/blue/jtable.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/mainResources/minCss/style.css" media="all" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/mainResources/css/materialize.min.css" type="text/css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/mainResources/css/jquery-ui.min.css" type="text/css" rel="stylesheet"/>

	<script type="text/javascript" src="${pageContext.request.contextPath}/mainResources/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mainResources/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mainResources/js/materialize.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/mainResources/js/jtable.js"></script>
<style>
	.sap {s
		border-bottom: 1px solid rgba(128, 128, 128, 0.3);
		border-style: dashed;
		border-top: transparent;
		border-left: transparent;
		border-right: transparent;
	}
	.sec { /* border-bottom: 1px solid #007AFF;
	    border-radius: 4px; */
		
	}
	.jtable-command-column {
		display: none !important;
	}
	.jtable-toolbar-item-text {
		display: none !important;
	}
	.danger{
	    background-color: #D9534F;
	    border-color: #D9534F;
	    color: #fff;
	    cursor: pointer;
	}
	.btn:hover{
		background-color: #03a9f4;
	}
	.btn{
		background-color: #03a9f4;
	}
	.tabs .indicator {
		background-color: #03a9f4;
	}
	 li.active a{
  		background-color: #03a9f4;
  		color: white;
  	}
  	.row .row {
    	margin: 0 ; 
    }
    .tabs .indicator {
	    background-color: #E53935;
	}
	.dropdown-content {
		max-height: 200px;
	}
</style>
</head>
<body>
    <%@ include file="homeHeader.jsp"%>
    <br><br><br>
    <div class="container" style="width:90%;">
		<div class="row" id="resultBox">
			<div class="col s12 m12 l12">
				<h1 class="left" style="font-size:30px">7th Article Writing Contest By Fagnum from 4th Feb to 28th Feb 2017</h1>
			</div>
			<div class="col s12 m12 l12">
				<img alt="Article Writing Contest" src="http://www.fagnum.com/blogImage?article-writing-contest-fagnum.jpg" style="width:100%;height:100%;">
			</div>
			<div class="col s12 m12 l12">
				<ul class="collection with-header">
			        <li class="collection-header"><h5>Prizes</h5></li>
			        <li class="collection-item">Prize money of <i class="fa fa-inr" aria-hidden="true"></i>1500 will be awarded to first rank holder.</li>
			        <li class="collection-item">Prize money of <i class="fa fa-inr" aria-hidden="true"></i>1250 will be awarded to second rank holder.</li>
			        <li class="collection-item">Prize money of <i class="fa fa-inr" aria-hidden="true"></i>750 will be awarded to third rank holder.</li>
			        <li class="collection-item">Prize money of <i class="fa fa-inr" aria-hidden="true"></i>500 will be awarded from 4th to 8th rank holder.</li>
			        <li class="collection-item">Prize money of <i class="fa fa-inr" aria-hidden="true"></i>300 will be awarded from 9th to 15th rank holder.</li>
			    </ul>
			</div>
			<div class="col s12 m12 l12">
				<ul class="collection with-header">
			        <li class="collection-header"><h5>Guidelines for publishing an article on <%=resource.getString("name") %>.</h5></li>
			        <li class="collection-item">Write an article on any topic of your choice that you think would be interesting for others to read. 
			        Think out of the box and try to write Children Stories, Scripts for Short movies (we are planning a movie on selected scripts), 
			        Letters like (https://www.youtube.com/watch?v=h_yJ0wfRiIY) or anything you like.</li>
			        <li class="collection-item">Article shouldn't be plagiarised. Copied content won't be published.</li>
			        <li class="collection-item">Article's page view will be awarded 1 point.</li>
			        <li class="collection-item">Refer a Blogger or a Writer and earn 50 points per referral.</li>
			        <li class="collection-item">Critics point will be awarded out of 500.</li>
			        <li class="collection-item">Critics points will be awarded on average time spent on the article by the readers.</li>
			        <li class="collection-item">Article's length must be greater than 500 words.</li>
			        <li class="collection-item">If article's length is greater than 700 words, 200 points will be added in Critics column.</li>
			        <li class="collection-item">If average time spent on the article is less than 2 minutes, then the prize money won't be awarded.</li>
			        <li class="collection-item">The article shouldn't be plagiarised. Copied content won't be published. After publishing it on fagnum. 
			        Some writers are publishing the article on their personal blog which is not legit and ethical at all. 
			        Those writers won't be allowed on fagnum. We request you all don't publish the article on your blog or anywhere else. 
			        If you are publishing any article on fagnum. It is owned by fagnum and If you have any problem with that. 
			        We request you not to publish your article or work on fagnum.</li>
			        <li class="collection-item">After your article got published on fagnum. The writer has to share the link in the brackets 
			        (https://www.youtube.com/watch?v=oHYRsyMSw90) to their facebook timeline and mention fagnum or tag fagnum and will 
			        earn 100 points in critics section.</li>
			    </ul>
			</div>
		</div>
	</div>
	<div class="container" style="width:90%;">
		<div class="row">
			<div class="col s12 m12 l12">
				<p>Share your Article at <%=resource.getString("care") %> and for any query you can call at +91 886 786 1530.</p>
			</div>
		</div>
	</div>
	<!-- <div class="container" style="width:90%;box-shadow:none;background-color:#d9534f;">
		<div class="row">
			<div class="col s12 m12 l12">
				<h5 style="color:white;padding-left:10px;" class="center-align">The leaderboard is updated and winners will receive an email regarding that soon.</h5>
				<h5 style="color:white;padding-left:10px;" class="center-align">According to the Rule Number 8, The Articles who have Avg. time spent less than 2 minutes will not be awarded a cash prize.</h5>
			</div>
		</div>
	</div> -->
	<!-- <div class="container" style="width:90%;">
		<div class="row hide-on-med-and-down">
			<div class="col s12 m12 l12">
				<script data-cfasync='false' type='text/javascript' src='//clksite.com/adServe/banners?tid=168445_304229_3'></script>
			</div>
		</div>
	</div> -->
	<div class="container" style="width:90%;">
		<div class="row">
			<div class="col s12">
				<div id="leaderboardDiv" class="row">
					<div class="row">
						<div class="col s12">
							<div class="searchResult" id="listLeaderboardContainer">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript"> var infolinks_pid = 2858748; var infolinks_wsid = 0; </script> 
<script type="text/javascript" src="//resources.infolinks.com/js/infolinks_main.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/googleAnalytic.js"></script>
<script type="text/javascript">
	
	$( document ).ready(function() {
	   $(".button-collapse").sideNav();
	});
	
	$(document).ready(function () {
	    $('#listLeaderboardContainer').jtable({
	        title: 'Leaderboard',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	            listAction: '${pageContext.request.contextPath}/listLeaderboardWinner',
	        },
	        fields: {
	        	leaderboardId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'BLOGGER_ID',
	            },
	            standing: {
	                title: 'Rank',
	            },
	            author: {
	                title: 'Author',
	            },
	            url: {
	                title: 'Title',
	            },
	            view: {
	                title: 'Views',
	            },
	            averageTime: {
	                title: 'Average Time',
	            },
	            critics: {
	                title: 'Critics',
	            },
	            referral: {
	                title: 'Referral',
	            },
	            point: {
	                title: 'Points',
	            },
	        },
	        recordAdded : function(event, data){
	        	
	        } 
	    });
	    //Load leaderboard list from server
	    $('#listLeaderboardContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    
	});
</script>
</body>
</html>