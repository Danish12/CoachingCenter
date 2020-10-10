<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.util.UrlPathHelper"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<body>
	<link href="${pageContext.request.contextPath}/mainResources/css/ck5/ck5.css" rel="stylesheet">
  	<%@ include file="header.jsp"%>
  	<%@ include file="navigation.jsp"%>
	<main id="main">

    <!-- ======= Breadcrumbs ======= -->
	    <div class="breadcrumbs" data-aos="fade-in">
	      <div class="container">
	        <h2>${blog.title}</h2>
	      <%--   <p>${blog.content}</p> --%>
	      </div>
	    </div>
	     <a href="#" class="back-to-top"><i class="bx bx-left-arrow-alt"></i></a>
	     <section id="blog-details" class="blog-details">
	     	<div class="container ck-content" data-aos="fade-up">
	        	${blog.content}
	        </div>
	     </section>
	     </main>
	     </br>
	<%@ include file="footer.jsp"%>
  </body>
</html>

