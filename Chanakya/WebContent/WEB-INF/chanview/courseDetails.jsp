<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="header.jsp"%>

<body>

<%@ include file="navigation.jsp"%>

  <main id="main">

    <div class="breadcrumbs" data-aos="fade-in">
      <div class="container">
        <h2>${course.name}</h2>
        <!-- <p></p> -->
      </div>
    </div><!-- End Breadcrumbs -->
    <section id="contact" class="contact">
	  
      <div class="container" data-aos="fade-up">
        <div class="row mt-">
          <div class="col-lg-4">
            <div class="info">
              <c:forEach var="sub" items="${course.sortedSubjects}" varStatus="loop">
	              <div class="email" >
	                <a href="${pageContext.request.contextPath}/course/${course.name}/${sub.name}">
		                <i class="icofont-book-alt"></i>
		                <h4>${sub.name}</h4>
	                </a>
	              </div>
			  </c:forEach>	
            </div>
          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">
           <div class="info">
			<c:forEach var="blog" items="${blogs}"  varStatus="loop">
				 <div class="email" >
	                <a href="${pageContext.request.contextPath}/blog/${blog.url}">
		                <i class="icofont-paper"></i>
		                <span>${blog.title}</span>
	                </a>
	             </div>   
			  </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

<%@ include file="footer.jsp"%>
</body>

</html>