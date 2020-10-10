
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="header.jsp"%>

<body>

<%@ include file="navigation.jsp"%>



	<main id="main">

    <div class="breadcrumbs" data-aos="fade-in">
      <div class="container">
        <h2>Login</h2>
        <p>Login to see the Prime content on our site.</p>
      </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">

      <div class="container" data-aos="fade-up">

        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="icofont-google-map"></i>
                <h4>User Name:</h4>
              </div>

              <div class="email">
                <i class="icofont-envelope"></i>
                <h4>Password:</h4>
              </div>

            </div>

          </div>

		  
		  
          <div class="col-lg-8 mt-5 mt-lg-0">
            <form method="post" action="<c:url value="/j_spring_security_check" />" class="php-email-form">
              
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" name="j_username" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="password" class="form-control" name="j_password" id="subject" placeholder="Password" data-rule="minlen:4" data-msg="Please enter at least 4 chars of password" />
                  <div class="validate"></div>
                </div>
              </div>
             
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="center-align" id="loginError" style="color:red;"></div>
              </div>
              <div class="text-cente1r"><button type="submit">Login</button></div>
            </form>

          </div>

        </div>

      </div>
    </section>

  </main>
	
  <!-- ======= Footer ======= -->
  <%@ include file="footer.jsp"%>
</body>

</html>

<script type="text/javascript">
	<c:if test="${not empty param.error}">
		window.onload = function() {
			$("#loginError").html("Invalid login and password.");
		};
	</c:if>
</script>
