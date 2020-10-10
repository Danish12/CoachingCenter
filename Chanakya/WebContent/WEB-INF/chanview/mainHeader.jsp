<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ page import="com.fagnum.services.model.SpringUser"%>
<%
	ResourceBundle resourceHeader = ResourceBundle.getBundle("application");
%>
	<div class="navbar-fixed">
      <!-- Navigation -->
      	 <nav style=";background-color:white;height:64px;">
      		<div class="nav-wrapper ">
				<a title="Menu Bar" href="#" data-activates="mobile-demo" class="button-collapse" ><i class="material-icons" style="color: black">menu</i></a>
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