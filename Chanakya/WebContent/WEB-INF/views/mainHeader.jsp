<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="com.fagnum.services.model.SpringUser"%>
<%
	ResourceBundle resourceHeader = ResourceBundle.getBundle("application");
%>
<!-- <style>
.navbar{
    height: 67px;
}
body.page-header-fixed {
    padding-top: 75px;
}
</style> -->
	<div class="navbar-fixed">
      <!-- Navigation -->
      	 <nav style=";background-color:white;height:64px;">
      		<div class="nav-wrapper ">
      			<div class="container" style="width:82%">
					<a title="<%=resourceHeader.getString("name")%>" href="<%=resourceHeader.getString("siteUrl")%>" class="brand-logo" style="padding-top: 9px;">
						<img src="homeresourceHeaders/images/logo.png" alt="logo" style="background-color:transparent;width:150px;height:44px;" >
					</a>
				</div>
				<a title="Menu Bar" href="#" data-activates="mobile-demo" class="button-collapse" ><i class="material-icons" style="color: black">menu</i></a>
				<%-- <ul class="left hide-on-med-and-down" style="padding-left: 280px;">
					<li>
						 <c:if test="${userType != 'ROLE_ENDUSER'}">
	            		 	<a class="waves-effect waves-light btn" href="<%=resourceHeader.getString("siteUrl")%>" title="Dashboard" 
						 	style="background-color: #03a9f4;color: white;">Go Back To Dashboard</a>
	            		 </c:if>
	            		 <c:if test="${userType == 'ROLE_ENDUSER'}">
	            		 	<a class="waves-effect waves-light btn" href="dashBoardUser" title="Dashboard" 
						 	style="background-color: #03a9f4;color: white;">Go Back To Dashboard</a>
	            		 </c:if>
            		 </li>
				</ul> --%>
      			<ul class="right hide-on-med-and-down">
      				<li>
      					<a data-activates="user" class="dropdown-button" href="#" style="color: grey"><%=SpringUser.getCurrentUser().getEmailId() %>
      						<i class="material-icons right">arrow_drop_down</i>
      					</a>
      				</li>
      			</ul>
      			<ul class="side-nav" id="mobile-demo" style="top: 64px;">
					<li>
      					<a style="color: grey"><%=SpringUser.getCurrentUser().getEmailId()%></a>
      				</li>
      				<li><a href="logout" title="Logout"><i class="fa fa-sign-out"></i>Logout</a></li>
				</ul>
      		</div>
      	</nav>
      </div>
       <ul  id="user" class="dropdown-content" style="min-width: 200px;margin-top: 65px">
			<li><a href="logout" title="Logout" style="font-size: 13px;color: grey"><i class="fa fa-sign-out" style="font-size: 13px;color: #03a9f4"></i> Logout</a></li>
       </ul>
      <style>
      	.cancelBtnColor{
		background-color: #F44336 !important;
		color: white;
		}
		.editBtnColor{
			background-color: #26A69A!important;
			color: white;
		}
		.deleteBtnColor{
			background-color: #C88213 !important;
			color: white;
		}
		.addBtnColor{
			background-color: #607D8B!important;
			color: white;
		}
		.saveBtnColor{
			background-color: #4CAF50 !important;
			color: white;
		}
		.btn:hover{
			color: white;
		}
      </style>