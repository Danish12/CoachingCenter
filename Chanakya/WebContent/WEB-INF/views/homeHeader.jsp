<%@ page import="java.util.ResourceBundle"%>
<%@ page import="com.fagnum.services.model.SpringUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ResourceBundle resourceHeader = ResourceBundle.getBundle("application");
%>
<style>
	@font-face {
		font-family: navbar-font;
		src: url(${pageContext.request.contextPath}/homeResources/helvetica-font/HelveticaNeueLTStd-Cn.otf);
	}
	
	.categories {
		color:black;
		font-family: navbar-font !important;
	    font-size: 18px;
	    font-style: normal;
	    font-variant: normal;
	    font-weight: 500;
	}
	
	.theme-color {
		background-color:#FDB912;
	}
	
	.color {
		color:#FDB912;
	}
</style>
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
<div class="navbar-fixed" style="z-index: 998; height:0px;"> 
	<nav id="navigation" style="box-shadow:none;background-color:white;">
		<div class="nav-wrapper container" style="height:80px;width:90%;">
			<div>
				<a title="<%=resourceHeader.getString("name") %>" href="<%=resourceHeader.getString("siteUrl") %>" class="brand-logo" 
				style="font-family: Cambria, Georgia, serif;font-size: 40px;font-style: normal;font-variant: normal;font-weight: 500;">
					<img src="${pageContext.request.contextPath}/homeResources/images/logo.png" alt="<%=resourceHeader.getString("name") %>">
				</a>
			</div>
			<a title="Menu Bar" href="#" data-activates="mobile-demo" class="button-collapse" ><i class="material-icons" style="color: black">menu</i></a>
			<ul class="right hide-on-med-and-down" id="desktopHeader">
				<c:if test="${empty pageContext.request.userPrincipal.name and home == 'true'}">
					<li><a title="Login" class="modal-trigger categories" href="#login" id="loginHeader">Login</a></li>
				</c:if>
				<c:if test="${not empty pageContext.request.userPrincipal.name}">
					<c:set var="userType" scope="request" value="<%=SpringUser.getCurrentUser().getUserType() %>"></c:set>
					<li><a title="Dropdown" class="dropdown-button" id="loginEmailId" data-activates="dropdown2" style="color:grey;">
					<i class="material-icons right">account_circle</i></a></li>
					<ul class="dropdown-content" id="dropdown2" style="margin-top: 65px;min-width: 241px">
						<li><a style="color:grey;">${pageContext.request.userPrincipal.name}</a></li>
						<c:if test="${userType == 'ROLE_BLOGGER'}">
							<li><a title="Dashboard Blogger" href="<%=resourceHeader.getString("siteUrl")%>dashBoardBlogger" style="color:grey;">Dashboard</a></li>
						</c:if>
						<li><a title="Logout" href="<c:url value="/j_spring_security_logout"/>" style="color:grey;">Logout</a></li>
					</ul>
				</c:if>
			</ul>
			<ul class="side-nav" id="mobile-demo" style="top: 56px;">
				<li><a title="Startup Voice" href="<%=resourceHeader.getString("siteUrl")%>voice/" class="categories">Startup Voice</a></li>
				<li><a title="Writer Words" href="<%=resourceHeader.getString("siteUrl")%>writer-words/" class="categories">Writer Words</a></li>
				<li><a title="How & Tips & Why" href="<%=resourceHeader.getString("siteUrl")%>how-tips-why/" class="categories">How & Tips & Why</a></li>
				<li><a title="Others" href="<%=resourceHeader.getString("siteUrl")%>others/" class="categories">Others</a></li>
				<li><a title="Videos" href="<%=resourceHeader.getString("siteUrl")%>videos/" class="categories">Videos</a></li>
				<li><a title="Short Movie Contest | Fagnum" href="<%=resourceHeader.getString("siteUrl")%>short-movie-contest/" 
				class="categories">Short Movie Contest</a></li>
				<li><a title="Article Writing Contest | Fagnum" href="<%=resourceHeader.getString("siteUrl")%>article-writing-contest/" 
				class="categories">Writing Contest</a></li>
			</ul>
		</div>
	</nav>
</div>
<div class="hide-on-med-and-down"> 
	<br><br><br>
</div>
<div class="hide-on-med-and-down" style="z-index: 998; height:0px;"> 
	<nav id="navigation" class="theme-color" style="box-shadow:none;">
		<div class="nav-wrapper" style="height:80px;">
			<div class="container" style="width:90%;">
				<ul id="desktopHeader" style="padding-right: 38px;">
					<li><a title="Startup Voice" href="<%=resourceHeader.getString("siteUrl")%>voice/" class="categories">Startup Voice</a></li>
					<li><a title="Writer Words" href="<%=resourceHeader.getString("siteUrl")%>writer-words/" class="categories">Writer Words</a></li>
					<li><a title="How & Tips & Why" href="<%=resourceHeader.getString("siteUrl")%>how-tips-why/" class="categories">How & Tips & Why</a></li>
					<li><a title="Others" href="<%=resourceHeader.getString("siteUrl")%>others/" class="categories">Others</a></li>
					<li><a title="Videos" href="<%=resourceHeader.getString("siteUrl")%>videos/" class="categories">Videos</a></li>
					<li><a title="Short Movie Contest | Fagnum" href="<%=resourceHeader.getString("siteUrl")%>short-movie-contest/" 
					class="categories">Short Movie Contest</a></li>
					<li><a title="Article Writing Contest | Fagnum" href="<%=resourceHeader.getString("siteUrl")%>article-writing-contest/" 
					class="categories">Article Writing Contest</a></li>
					<li><a title="Write for Fagnum" href="<%=resourceHeader.getString("siteUrl")%>writeForUs/" class="categories">Write For Us</a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
<script>
	/* <c:if test="${empty home}">
		$("#loginEmailId").css("color", "grey");
		$("#loginHeader").css("color", "grey");
		$("#signupHeader").css("color", "grey");
		 $("#navigation").removeClass("red").addClass("white");
		$(window).scroll(function () {
	  	    var sc = $(window).scrollTop()
	      	if (sc < 1) {
	      		   $("#mobile-demo li a").css("color","black");
	      		   $("#navigation").css("box-shadow","0 1px 6px rgba(0,0,0,.35)");
	      		   $("#navigation").removeClass("red").addClass("white");
	      		   $("#desktopHeader li a").css("color","grey");
	      		   $("#dropdown1 li a").css("color","grey");
	      		   $("#dropdown2 li a").css("color","grey");
	      	 } else {
	      		   $("#navigation").removeClass("red").addClass("white");
	      		   $("#navigation").css("box-shadow","0 1px 6px rgba(0,0,0,.35)");
	      		   $("#mobile-demo li a").css("color","black");
	      		   $("#desktopHeader li a").css("color","grey");
	      	 }
	 	  });   
	</c:if> */
		
	/* <c:if test="${notTransparent=='true'}">
		$("#navigation").removeClass("transparent").addClass("white");
		$("#navigation").css("box-shadow","0 1px 6px rgba(0,0,0,.35)");
	    $("#mobile-demo li a").css("color","black");
	    $("#desktopHeader li a").css("color","grey");
	</c:if>
	<c:if test="${empty notTransparent}">
		$("#navigation").removeClass("red").addClass("transparent");
		$(window).scroll(function () {
	  	    var sc = $(window).scrollTop()
	      	if (sc < 99) {
	      		   $("#mobile-demo li a").css("color","black");
	      		   $("#navigation").css("box-shadow","none");
	      		   $("#navigation").removeClass("red").addClass("transparent");
	      		   $("#desktopHeader li a").css("color","white");
	      		   $("#dropdown1 li a").css("color","grey");
	      		   $("#dropdown2 li a").css("color","grey");
	      	 } else {
	      		   $("#navigation").removeClass("transparent").addClass("white");
	      		   $("#navigation").css("box-shadow","0 1px 6px rgba(0,0,0,.35)");
	      		   $("#mobile-demo li a").css("color","black");
	      		   $("#desktopHeader li a").css("color","grey");
	      		   
	      	 }
	 	  });
	</c:if> */
</script>