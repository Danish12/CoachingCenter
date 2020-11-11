<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="header.jsp"%>

<body>

<%@ include file="navigation.jsp"%>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs" data-aos="fade-in">
      <div class="container">
        <h2>Contact Us</h2>
        <p>To get registered on our website please fill in your information. We will call you back.</p>
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
                <h4>Location:</h4>
                <p>Nagina Chauraha, Dhampur</p>
              </div>

              <div class="email">
                <i class="icofont-envelope"></i>
                <h4>Email:</h4>
                <p>XXX@XXXXX.com</p>
              </div>

              <div class="phone">
                <i class="icofont-phone"></i>
                <h4>Call:</h4>
                <p>1234567890</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form method="post" role="form" class="php-email-form" id="contactFormId">
              <div class="form-row">
                <div class="col-md-12 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <input type="email" class="form-control" name="emailId" id="emailId" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="contactNumber" id="contactNumber" placeholder="Mobile No" data-rule="minlen:9" data-msg="Please enter at least 9 chars of Mobile No." />
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

<%@ include file="footer.jsp"%>
</body>

</html>

<script>
$('#contactFormId').submit(function(e) {
    e.preventDefault();
    $.ajax({
          url: "${pageContext.request.contextPath}/sendEnquiry",
          type: 'POST',
          data : {
            name : $('#name').val(),
            name : $('#emailId').val(),
            name : $('#contactNumber').val()
          },
          success: function(json){
            $('.sent-message').show();
            $('.sent-message').hide().delay(5000).fadeIn(400);
          }
    });
});
</script>