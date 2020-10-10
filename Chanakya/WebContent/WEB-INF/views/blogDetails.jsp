<%@ page import="org.springframework.web.util.UrlPathHelper"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html>
<html>
  <head>
  <!-- Mobile detection code start -->
   <script src="${pageContext.request.contextPath}/homeResources/js/detectmobile.js"></script>
   <script>
   		try {
        // Set up detectmobile.js
        		detectmobile.redirectCallback = function(mode, url) {
	                if(mode == "mobile") {
	                // We could have arrived directly to a news article from a search engine, not the site home page
	                // Redirect to a corresponding article mobile version
	                // This example has some URL path for the article
	                // on both site.com and m.site.com, just different domain name.
	                // But you could any kind of URL rewrite here.
	                	return detectmobile.replaceDomainName(url, "m", true, true);
	                }
	                // Take no action
	                return url;
                }
                    // Execute mobile redirect
			     detectmobile.process();
        } catch(e) {
                // Make sure that in the fault modes, we do not interrupt execution of other Javascript code
	        if(console && console.exception) {
	        	console.exception(e);
	        }
        }
  </script>
  <!-- Mobile detection code end -->
  <title>${blog.title}</title>
  <%-- <meta name="keywords" content="${blog.metaKeyword}"> --%>
	<meta name="description" content="${blog.metaDescription}">
	<meta name="author" content="${blog.blogger.name}" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta property="og:url"           content="<%=resource.getString("siteUrl")%>blog/${blog.url}" />
	<meta property="og:type"          content="article" />
	<meta property="og:title"         content="${blog.title}" />
	<meta property="og:description"   content="${blog.metaDescription}" />
	<meta property="og:image"         content="${blog.blogImage}" />
	<meta property="og:site_name" 	  content="<%=resource.getString("siteName")%>">
	<meta property="article:publisher" content="<%=resource.getString("facebookLink")%>" />
	<meta property="article:author" content="${blog.blogger.name}" />
	<meta property="article:section" content="${blog.blogType}" />
	<meta property="article:published_time" content="${blog.byAndTimeStamp.createdTs}" />
	<meta property="article:modified_time" content="${blog.byAndTimeStamp.modifiedTs}" />
	<meta name="twitter:card" content="summary_large_image"/>
	<meta name="twitter:description" content="${blog.metaDescription}"/>
	<meta name="twitter:title" content="${blog.title}"/>
	<meta name="twitter:url" content="<%=resource.getString("siteUrl")%>blog/${blog.url}">
	<meta name="twitter:site" content="@<%=resource.getString("twitterHandle")%>"/>
	<meta name="twitter:domain" content="<%=resource.getString("siteName")%>"/>
	<meta name="twitter:image" content="${blog.blogImage}"/>
	<meta name="twitter:creator" content="@<%=resource.getString("twitterHandle")%>"/>
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="alternate" href="http://<%=resource.getString("siteName")%>" hreflang="en-us" />
	<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/homeResources/images/favicon.png">
	<link href="${pageContext.request.contextPath}/homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet">
	<!--Import Google Icon Font-->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--Import materialize.css-->
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/materialize.min.css"  media="screen,projection"/>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/custom.css"/>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/owlCrousel/owl.carousel.css" media="screen,projection" />
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/owlCrousel/owl.transitions.css" media="screen,projection" />
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/owlCrousel/owl.theme.css" media="screen,projection" />
  </head>
  <style>
	#owl-demo .item{
	  margin: 3px;
	  margin-right: 17px;
	}
	#owl-demo .item img{
	  display: block;
	  width: 100%;
	  height: auto;
	}
	@media (min-width:993px){
		.blogLeft{
			margin-left: 158px !important;
		}
	}
	@media (max-width:992px){
		.blogLeft{
			margin-left: 116px !important;
		}
	}
	@media (min-width:601px){
		.widthContainer{
			width: 85%;
		}
	}
	@media (max-width:600px){
		.widthContainer{
			width: 90%;
		}
		
	}
	h1 {
		display: block;
	    font-family: "futura-pt";
	    line-height: 1em;
	    text-transform: none;
	    letter-spacing: 0px;
	    font-weight: 700;
	    font-style: normal;
	    color: black;
	    position: relative;
	    z-index: inherit;
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
  	<%@ include file="homeHeader.jsp"%>
  	<br><br><br>
	<div class="container" style="width:90%;">
		<div class="row">
			<!-- ----- Left Column Start------ -->
			<div class="col s12 l8">
				<div class="row hide-on-large-only">
					<div class="col s12 m12 l12">
						<!-- facebook ad code start -->
						 <div style="display:none; position: relative;">
						  <iframe style="display:none;"></iframe>
						  <script type="text/javascript">
						    var data = {
						      placementid: '1189598161063314_1189605957729201',
						      format: '320x50',
						      testmode: false,
						      onAdLoaded: function(element) {
						        console.log('Audience Network [1189598161063314_1189605957729201] ad loaded');
						        element.style.display = 'block';
						      },
						      onAdError: function(errorCode, errorMessage) {
						        console.log('Audience Network [1189598161063314_1189605957729201] error (' + errorCode + ') ' + errorMessage);
						      }
						    };
						    (function(w,l,d,t){var a=t();var b=d.currentScript||(function(){var c=d.getElementsByTagName('script');return c[c.length-1];})();var e=b.parentElement;e.dataset.placementid=data.placementid;var f=function(v){try{return v.document.referrer;}catch(e){}return'';};var g=function(h){var i=h.indexOf('/',h.indexOf('://')+3);if(i===-1){return h;}return h.substring(0,i);};var j=[l.href];var k=false;var m=false;if(w!==w.parent){var n;var o=w;while(o!==n){var h;try{m=m||(o.$sf&&o.$sf.ext);h=o.location.href;}catch(e){k=true;}j.push(h||f(n));n=o;o=o.parent;}}var p=l.ancestorOrigins;if(p){if(p.length>0){data.domain=p[p.length-1];}else{data.domain=g(j[j.length-1]);}}data.url=j[j.length-1];data.channel=g(j[0]);data.width=screen.width;data.height=screen.height;data.pixelratio=w.devicePixelRatio;data.placementindex=w.ADNW&&w.ADNW.Ads?w.ADNW.Ads.length:0;data.crossdomain=k;data.safeframe=!!m;var q={};q.iframe=e.firstElementChild;var r='https://www.facebook.com/audiencenetwork/web/?sdk=5.3';for(var s in data){q[s]=data[s];if(typeof(data[s])!=='function'){r+='&'+s+'='+encodeURIComponent(data[s]);}}q.iframe.src=r;q.tagJsInitTime=a;q.rootElement=e;q.events=[];w.addEventListener('message',function(u){if(u.source!==q.iframe.contentWindow){return;}u.data.receivedTimestamp=t();if(this.sdkEventHandler){this.sdkEventHandler(u.data);}else{this.events.push(u.data);}}.bind(q),false);q.tagJsIframeAppendedTime=t();w.ADNW=w.ADNW||{};w.ADNW.Ads=w.ADNW.Ads||[];w.ADNW.Ads.push(q);w.ADNW.init&&w.ADNW.init(q);})(window,location,document,Date.now||function(){return+new Date;});
						  </script>
						  <script type="text/javascript" src="https://connect.facebook.net/en_US/fbadnw.js" async></script>
						</div>
						<!-- facebook ad code end -->
					</div>
				</div>
				<div class="row">
					<div class="col s12 m12 l12">
						<h1 class="left" style="font-size:30px">${blog.title}</h1>
					</div>
					<div class="col s12 m12 l8">
						<b><span>
							<a title="${blog.blogger.name}" href="<%=resource.getString("siteUrl") %>author/${blog.blogger.url}/" style="color: black;">
							${blog.blogger.name}</a></span> | <span>${blog.date}
						</span></b>
					</div>
					<div class="col s12 m12 l12" style="font-size:17px;text-align:justify;">
						${blog.content}
					</div>
					<br>
				</div>
				<div class="row hide-on-med-and-down">
					<div class="col s12 m4 l5 offset-l3">
						<div class="item">
							<%-- <a href="<%=resource.getString("siteUrl")%>blog/${blogs.url}" title="${blogs.title}"> --%>
								<div class="card" style="height:250px;">
									<div class="card-image">
										<iframe width="322" height="150" src="https://www.youtube.com/embed/oHYRsyMSw90" frameborder="0" allowfullscreen></iframe>
									</div>
									<div class="card-title" style="color:black;padding-left:15px;padding-right:15px;padding-top:15px;font-weight:bold;font-size:15px;">
										Roohaaniyat #LookBeyondLooks - The Short Movie
									</div>
									<label style="padding-left: 15px;padding-right: 5px;cursor: pointer;">13-Dec-16</label>
									<label style="padding-left: 10px;padding-right: 15px;cursor: pointer;">Sweta Sahu</label>
								</div>
							<!-- </a> -->
						</div>
					</div>
				</div>
				<c:if test="${not empty blog.blogger.bio}">
					<div class="row">
						<div class="col s6 m4 l3" style="font-size: 17px;">
							<span class="right" style="color:red;">About the Author</span>
						</div>
					</div>
					<div class="row">
						<div class="col s3 m3 l3">
							<img class="right" src="${blog.blogger.profilePic}" alt="${blog.blogger.name}" style="background-color:transparent;width:70%;" >
						</div>
						<div class="col s9 m9 l9" style="font-size: 17px;text-align: justify;">
							<div class="row">
								<div class="col s12 m12 l12" style="font-size: 17px;text-align: justify;">
									<a title="${blog.blogger.name}" href="<%=resource.getString("siteUrl")%>author/${blog.blogger.url}/" style="color: red;">${blog.blogger.name}</a>
								</div>
								<div class="col s12 m12 l12" style="font-size: 17px;text-align: justify;">
									${blog.blogger.bio}
								</div>
							</div>
						</div>
					</div>
				</c:if>
		   		<div class="col s12">
					<jsp:include page="sharePage.jsp"></jsp:include>
				</div>
				<div class="row">
				  	<div class="col s12 l7">
				  		<div class="fb-comments" data-href="<%=request.getContextPath() %>" data-numposts="5" data-order-by="reverse_time"></div>
				  		<div id="fb-root"></div>
				  	</div>	
				  	<!-- <div class="col s12 l4">
				  		<div class="row">
				  			<div class="col s4"><br></div>
				  			<div class="col s8">
				  				<span class="bold light-blue-text" style="font-size: 25px">Fagnum</span><i class="material-icons">email</i>
				  			</div>
				  			<div class="input-field col s12">
				  				<div class="row">
				  					<div class="col s10">
					  					<input id="newsletterEmailId" type="text" class="validate" onkeypress="IsEmail()">
					  					<label for="newsletterEmailId" >Email</label>
					  					<span id="newsletterEmailIdError" style="color:red;"></span>
					  					<span id="labelOne" style="color:green;"></span>
					  					<span id="labelTwo" style="color:green;"></span>
				  					</div>
				  					<div class="col s2">
				  						<a class="waves-effect waves-teal btn-flat" onclick="submitNewletterRequest()"><i class="material-icons col s2">send</i></a>
				  					</div>
				  				</div>
				  			</div>
				  			<div class="col s12 center">
				  				<p>Sign Up for the daily<span class="bold light-blue-text"> Fagnum Newsletter </span> for all the latest updates</p>
				  			</div>
				  		</div>
				  	</div> -->
				</div>
				<div class="row">
				  	<div class="col s12 l12">
				  		<div id="owl-demo" class="owl-carousel" style="opacity:1;display: block;">
				  			<c:forEach items="${authorBlogs}" var="blogs">
				  				<c:if test="${blogs.blogId != blog.blogId}">
					  				<div class="item">
						  				<a href="<%=resource.getString("siteUrl")%>blog/${blogs.url}" title="${blogs.title}">
						  					<div class="card" style="height:230px;">
												<div class="card-image">
													<img src="${blogs.blogImage}" style="height:130px;">
												</div>
												<div class="card-title" style="color:black;padding-left:15px;padding-right:15px;padding-top:15px;font-weight:bold;font-size:15px;">
													${blogs.title}
												</div>
												<label style="padding-left: 15px;padding-right: 5px;cursor: pointer;">${blogs.date}</label>
												<label style="padding-left: 10px;padding-right: 15px;cursor: pointer;">${blogs.blogger.name}</label>
											</div>
										</a>
						  			</div>
					  			</c:if>
				  			</c:forEach>
				  		</div>
				  	</div>
			    </div>
			    <div class="row hide-on-med-and-down">
				  	<div class="col l12">
				  	</div>
			    </div>
			</div>
			
			<!-- ----- Left Column End------ -->
			
			<!-- ----- Right Column Start------ -->
			<br><br><br>
			<div class="col s12 l4" style="padding-right: 0;padding-top: 23px;">
				<%-- <div class="row">
					<div class="col s12 m6 l10 offset-l1 hide-on-med-and-down">
						<div class="left">
							<%@ include file="includeFbLike.jsp"%>
						</div>
					</div>
				</div> --%>
				<div class="row hide-on-med-and-down">
					<div class="col s12 m6 l10 offset-l1">
						<div class="item">
							<%-- <a href="<%=resource.getString("siteUrl")%>blog/${blogs.url}" title="${blogs.title}"> --%>
								<div class="card" style="height:250px;">
									<div class="card-image">
										<iframe width="330" height="150" src="https://www.youtube.com/embed/oHYRsyMSw90" frameborder="0" allowfullscreen></iframe>
									</div>
									<div class="card-title" style="color:black;padding-left:15px;padding-right:15px;padding-top:15px;font-weight:bold;font-size:15px;">
										Roohaaniyat #LookBeyondLooks - The Short Movie
									</div>
									<label style="padding-left: 15px;padding-right: 5px;cursor: pointer;">13-Dec-16</label>
									<label style="padding-left: 10px;padding-right: 15px;cursor: pointer;">Sweta Sahu</label>
								</div>
							<!-- </a> -->
						</div>
					</div>
				</div>
				<c:forEach items="${relatedBlogs}" var="blogs">
		  			<c:if test="${blogs.blogId != blog.blogId}">
		  				<div class="row">
							<div class="col s12 m6 l10 offset-l1">
								<div class="item">
					  				<a href="<%=resource.getString("siteUrl")%>blog/${blogs.url}" title="${blogs.title}">
					  					<div class="card" style="height:250px;">
											<div class="card-image">
												<img src="${blogs.blogImage}" style="height:150px;">
											</div>
											<div class="card-title" style="color:black;padding-left:15px;padding-right:15px;padding-top:15px;font-weight:bold;font-size:15px;">
												${blogs.title}
											</div>
											<label style="padding-left: 15px;padding-right: 5px;cursor: pointer;">${blogs.date}</label>
											<label style="padding-left: 10px;padding-right: 15px;cursor: pointer;">${blogs.blogger.name}</label>
										</div>
									</a>
					  			</div>
							</div>
						</div>
		  			</c:if>
		  		</c:forEach>
				<%-- <div class="row hide-on-med-and-down">
					<div class="col s12 center">
						<p style="text-transform: uppercase !important;font-weight: bold !important;color: #E5002D !important;">most popular</p>
					</div>
					<div class="col l5 offset-l1">
						<img src="${blog.blogger.profilePic}" alt="${blog.blogger.name}" height="70px" width="144px" style="background-color:transparent;" >
					</div>
					<div class="col l6" style="padding-right: 0;padding-left: 0;">
						lscfkjasdfjkndnkj ksdfjkdsfj kaslhdfashfkjl dskhfuashy sdkfhsadkuhuk
					</div>
				</div> --%>
			</div>
		</div>
	</div>
	<%@ include file="homeFooter.jsp"%>
	<%-- <footer style="background-color:#444;">
	<div class="container" style="width:90%;">
		<div class="row" style="color:white;">
			<div class="col s12 l4">
				<a href="<%=resource.getString("siteUrl")%>" title="<%=resource.getString("name")%>" style="color:white;"><h4><%=resource.getString("name")%></h4></a>
				<p style="font-size: 11px;">Drop email at <%=resource.getString("care")%> for any query<br>Copyright © 2016 2u Technologies Pvt Ltd. All right reserved.</p>
			</div>
			<div class="col s12 m12 l4">
				<div class="row center-align">
					<br><br>
					<div class= "col s2 l2">
						<a title="<%=resource.getString("name")%> Facebook" href="<%=resource.getString("facebookLink")%>" target="_blank">
						<i class="fa fa-facebook-square" aria-hidden="true" style="color: white;font-size: 28px;"></i></a> 
					</div>
					<div class= "col s2 l2">
						<a title="<%=resource.getString("name")%> Google+" href="<%=resource.getString("googlePlusLink")%>" target="_blank">
						<i class="fa fa-google-plus" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
					<div class= "col s2 l2">
						<a title="<%=resource.getString("name")%> LinkedIn" href="<%=resource.getString("linkedinLink")%>" target="_blank">
						<i class="fa fa-linkedin" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
					<div class= "col s2 l2">
						<a title="<%=resource.getString("name")%> Twitter" href="<%=resource.getString("twitterHandle")%>" target="_blank">
						<i class="fa fa-twitter-square" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
					<div class= "col s2 l2">
						<a title="<%=resource.getString("name")%> Youtube" href="<%=resource.getString("youtube")%>" target="_blank">
						<i class="fa fa-youtube-play" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
					<div class= "col s2 l2">
						<a title="<%=resource.getString("name")%> StumbleUpon" href="<%=resource.getString("stumbleUponLink")%>" target="_blank">
						<i class="fa fa-stumbleupon" aria-hidden="true" style="color: white;font-size: 28px;"></i></a>
					</div>
				</div>
			</div>
			<div class="col s12 m12 l4">
				<div class="row" style="padding-left: 10%;">
					<br>
					<div class="col s4 m2 l6">
						<a title="About Us" href="<%=resource.getString("siteUrl")%>aboutUs/" style="color:white;"><h6> About Us</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Contact Us" href="<%=resource.getString("siteUrl")%>contactUs/" style="color:white;"><h6> Contact Us</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Privacy Policy" href="<%=resource.getString("siteUrl")%>privacyPolicy/" style="color:white;"><h6> Privacy Policy</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Write for Fagnum" href="<%=resource.getString("siteUrl")%>writeForUs/" style="color:white;"><h6> Write For Us</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Disclaimer" href="<%=resource.getString("siteUrl")%>disclaimer/" style="color:white;"> <h6> Disclaimer</h6></a>
					</div>
					<div class="col s4 m2 l6">
						<a title="Sitemap" href="<%=resource.getString("siteUrl")%>sitemap/" style="color:white;" ><h6> Sitemap</h6></a>
					</div>
				</div>
			</div>
		</div>
		<br>
	</div>
	</footer> --%>
	<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/jquery-2.2.0.min.js"></script> -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/materialize.min.js"></script>
	<script src="${pageContext.request.contextPath}/homeResources/owlCrousel/owl.carousel.min.js"></script>
  </body>
  <script type="text/javascript"> var infolinks_pid = 2858748; var infolinks_wsid = 0; </script>
  <script type="text/javascript" src="//resources.infolinks.com/js/infolinks_main.js"></script>
  <script>
  $( document ).ready(function() {
	   $(".button-collapse").sideNav();
  });
  
 /*  $(document).ready(function () {
	  $.post('signup',{
		     callFrom:'increaseBlogView',
		     async: false,
		     blogUrl:'${blog.url}',
	      },
	      function(data) {
	    }
	    );
	}); */
  function submitNewletterRequest() {
	  var emailAddress = document.getElementById("newsletterEmailId").value;
	  var emailIdRegExp = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
	  if (document.getElementById("newsletterEmailId").value == 0) {
		   document.getElementById("newsletterEmailIdError").innerHTML = "Enter a  Email Id.";
		   status = false;
		  }else
		if (!(emailAddress.match(emailIdRegExp))) {
			newsletterEmailIdError.innerHTML = " Enter a valid Email Id.";
			return false;
		} else {
			//newsletterEmailIdSuccess.innerHTML = "Thanks for signing up to Fagnum newsletter ";
			$.post('../saveNewsletter',{
				 callFrom:'ajaxCall',
				 async: false,
				 emailId:$("#newsletterEmailId").val(),
			},function(data) {
				var data1 = JSON.parse(data);
				var status = data1.status;
				if(status) {
					$("#newsletterEmailId").val('');
					$("#labelOne").html(data1.messageOne);
					$("#labelTwo").html(data1.messageTwo);
				}else {
					$("#labelOne").html(data1.messageOne);
				}
			}
			);
		}
		return true;
	}
  
  function IsEmail() {
	  	document.getElementById("newsletterEmailIdError").innerHTML = " ";
	  	document.getElementById("labelOne").innerHTML = " ";
	  	document.getElementById("labelTwo").innerHTML = " ";
  }
  
  $(document).ready(function() {
	  $("#owl-demo").owlCarousel({
	    items : 3,
	    lazyLoad : true,
	    navigation : true
	  }); 
	  
	});
  	//alert(window.document.location);
  	$('.fb-comments')[0].setAttribute("data-href",window.document.location);
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5";
	  fjs.parentNode.insertBefore(js, fjs);
	  }(document, 'script', 'facebook-jssdk'));
	
    (function(add, cla){window['UserHeatTag']=cla;window[cla]=window[cla]||function(){(window[cla].q=window[cla].q||[]).push(arguments)},
    window[cla].l=1*new Date();var ul=document.createElement('script');var tag = document.getElementsByTagName('script')[0];
	ul.async=1;ul.src=add;tag.parentNode.insertBefore(ul,tag);})('//uh.nakanohito.jp/uhj2/uh.js', '_uhtracker');_uhtracker({id:'uh3I9huke1'});
  </script>
</html>

