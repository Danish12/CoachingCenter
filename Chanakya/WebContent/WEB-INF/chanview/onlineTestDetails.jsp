<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<body>

<%@ include file="navigation.jsp"%>

  <main id="main">
    <div class="breadcrumbs" data-aos="fade-in">
      <div class="container">
      	<c:choose>
      		<c:when test="${empty onlineTest}">
      			<h2>Online Tests</h2>
      		</c:when>
      		<c:otherwise>
				<h2>${onlineTest.name}</h2>
      		</c:otherwise>
      	</c:choose>
      </div>
    </div>
    
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">
        <div class="row mt-">
                  <div class="col-lg-4">
                    <div class="info">
        	        <c:choose>
        	      		<c:when test="${empty course}">
        	      			<c:forEach var="course" items="${courses}" varStatus="loop">
        		              <div class="email" >
        		                <a href="${pageContext.request.contextPath}/online-test/${course.name}">
        			                <i class="icofont-book-alt"></i>
        			                <h4>${course.name}</h4>
        		                </a>
        		              </div>
        				  </c:forEach>
        	      		</c:when>
        	      		<c:otherwise>
        					 <c:forEach var="sub" items="${course.sortedSubjects}" varStatus="loop">
        		              <div class="email" >
        		                <a href="${pageContext.request.contextPath}/online-test/${course.name}/${sub.name}">
        			                <i class="icofont-book-alt"></i>
        			                <h4>${sub.name}</h4>
        		                </a>
        		              </div>
        				  </c:forEach>
        	      		</c:otherwise>
        	      	</c:choose>
                    </div>
                  </div>

                  <div class="col-lg-8 mt-5 mt-lg-0">
                       <div class="info">
                              <c:forEach var="onlineTest" items="${onlineTests}"  varStatus="loop">
                                  <div class="email" >
                                   	 <a href="${pageContext.request.contextPath}/online-test-details/${onlineTest.onlineTestId}">
                                    	         <i class="icofont-paper"></i>
                                     	         <span>${onlineTest.name}</span>
                                           </a>
                                  </div>
                               </c:forEach>
                               <c:if test="${empty onlineTests}">
                                    <div class="email" > <h5>Nothing Found. Please choose another course and subject.</h5></div>
                               </c:if>
                       </div>
                  </div>
                </div>
       </div>
    </section>
    
  </main>

<%@ include file="footer.jsp"%>
</body>
</html>