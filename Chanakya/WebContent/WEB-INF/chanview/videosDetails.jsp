<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="https://vjs.zencdn.net/7.8.4/video-js.css" rel="stylesheet" />
  <script src="https://vjs.zencdn.net/7.8.4/video.js"></script>

<%@ include file="header.jsp"%>

<body>

<%@ include file="navigation.jsp"%>

  <main id="main">
    <div class="breadcrumbs" data-aos="fade-in">
      <div class="container">
      	<c:choose>
      		<c:when test="${empty course}">
      			<h2>Watch Videos</h2>
      		</c:when>
      		<c:otherwise>
				<h2>${course.name}</h2>      		
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
		                <a href="${pageContext.request.contextPath}/watch-videos/${course.name}">
			                <i class="icofont-book-alt"></i>
			                <h4>${course.name}</h4>
		                </a>
		              </div>
				  </c:forEach>
	      		</c:when>
	      		<c:otherwise>
					 <c:forEach var="sub" items="${course.sortedSubjects}" varStatus="loop">
		              <div class="email" >
		                <a href="${pageContext.request.contextPath}/watch-videos/${course.name}/${sub.name}">
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
			<c:forEach var="video" items="${videos}"  varStatus="loop">
				 <div class="email col-lg-4" >
	                 <video
					    id="${video.videoId}"
					    class="video-js"
					    controls
					    preload="auto"
					    width= "300px"
   					    height="150px"
					    data-setup="{}" >
				    <source src="${video.videoLocation}" type="video/mp4" />
				    <p class="vjs-no-js">
				      To view this video please enable JavaScript, and consider upgrading to a
				      web browser that
				    </p>
				  </video>
					  <div>
			                <span>${video.name}</span>
			          </div>
	             </div>   
			  </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </section>
    
  </main>

<%@ include file="footer.jsp"%>
</body>

</html>