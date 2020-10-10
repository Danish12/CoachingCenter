<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ResourceBundle"%>
<%
	ResourceBundle resourceHead = ResourceBundle.getBundle("application");
%>
<style>
.navbar{
    height: 67px;
}
body.page-header-fixed {
    padding-top: 75px;
}

	.btn{
		background-color: #03a9f4 !important ;
		color: white !important;
	}
</style>

	<div class="navbar navbar-fixed-top scroll-hide">
        <div class="container-fluid main-nav clearfix">
        	<div class="navbar-header" style="margin-left: 118px;">
		      <a class="navbar-brand" href="<%=resourceHead.getString("siteUrl")%>"><img src="homeResources/images/logo.png" alt="logo" 
		      style="background-color:transparent;width: 150px;height: 44px" ></a>
		    </div>
          <div class="nav-collapse">
            <ul class="nav">
            	<li style="float:left;top:18px;">
            		 <c:if test="${userType != 'ROLE_ENDUSER'}">
            		 	<a href="<%=resourceHead.getString("siteUrl")%>" title="Dashboard" class="btn" role="button">Go Back To Dashboard</a>
            		 </c:if>
            		 <c:if test="${userType == 'ROLE_ENDUSER'}">
            		 	<a href="dashBoardUser" title="Dashboard" class="btn" role="button">Go Back To Dashboard</a>
            		 </c:if>
            	</li>
              <li class="dropdown" style="position: absolute;right: 16px;top: 12px;">
              	<a data-toggle="dropdown" href="#" style="font-size: 16px">${emailId}<b class="caret"></b></a>
                <ul class="dropdown-menu" style="right: 0;">
                 	<li><a href="logout" title="Logout"><i class="fa fa-sign-out"></i>Logout</a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>