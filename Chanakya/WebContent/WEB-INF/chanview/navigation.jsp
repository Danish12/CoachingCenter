  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">
      <h1 class="logo mr-auto"><a href="${pageContext.request.contextPath}/">Chanakya</a></h1>
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/#about">About</a></li>
          <li><a href="${pageContext.request.contextPath}/#popular-courses">Courses</a></li>
          <li><a href="${pageContext.request.contextPath}/#trainers">Trainers</a></li>
          <li><a href="${pageContext.request.contextPath}/watch-videos">Videos</a></li>
          <!-- <li><a href="pricing.jsp">Pricing</a></li> -->
          <c:if  test="${pageContext.request.userPrincipal.name != null}">
	          <li class="drop-down"><a href="">Admin</a>
	            <ul>
	              <li><a href="${pageContext.request.contextPath}/blogAdmin">Articles</a></li>
	              <li><a href="${pageContext.request.contextPath}/course">Courses</a></li>
	              <li><a href="${pageContext.request.contextPath}/subject">Subjects</a></li>
	              <li><a href="${pageContext.request.contextPath}/videos">Videos</a></li>
	            </ul>
	          </li>
          </c:if>
          <c:choose>
            	<c:when test="${pageContext.request.userPrincipal.name != null}">
            		<li><a href="${pageContext.request.contextPath}/j_spring_security_logout">Logout</a>
          		</c:when>
          		<c:otherwise>
          			<li><a href="${pageContext.request.contextPath}/contact/">Contact</a></li>
          			<li><a href="${pageContext.request.contextPath}/login/">Login</a>		
          		</c:otherwise>
          </c:choose>
        </ul>
      </nav>
      <a href="/Chanakya/courses/" class="get-started-btn">Get Started</a>
    </div>
  </header>