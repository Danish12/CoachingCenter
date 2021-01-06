 <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>CHANAKYA</h3>
            <p>
              Nagina Chauraha <br>
              Dhampur Bijnor<br>
              Uttar Pradesh<br><br>
              <strong>Phone:</strong> <a href = "tel: +917906554548">+917906554548</a><br>
              <strong>Email:</strong> <a href = "mailto: omchanakyadhampur@gmail.com">omchanakyadhampur@gmail.com</a><br>
            </p>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/#about">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/#trainers">Trainers</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/watch-videos">Videos</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="${pageContext.request.contextPath}/online-test">Online Test</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <!--<h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>-->
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Website Developer</h4>
            <p>Site developed and maintained by <a href="tel:+919927793026">9927793026</a></p>
            <!-- <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form> -->
          </div>

        </div>
      </div>
    </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>
  <div id="preloader"></div>

  <c:if test="${empty excludeBootstrapNjquery or excludeBootstrapNjquery == 'false'}" >
    <script src="${pageContext.request.contextPath}/homeResources/assets/vendor/jquery/jquery.min.js"></script>
  	<script src="${pageContext.request.contextPath}/homeResources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>	
  </c:if>
  
  <c:if test="${not empty includeSelect2 or includeSelect2 == 'true'}" >
  	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
  	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
  </c:if>
  
  <script src="${pageContext.request.contextPath}/homeResources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/homeResources/assets/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/homeResources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/homeResources/assets/vendor/counterup/counterup.min.js"></script>
  <script src="${pageContext.request.contextPath}/homeResources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/homeResources/assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/homeResources/assets/js/main.js"></script>