<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@page import="java.io.*" %>
        <%@page import="java.util.*" %>
<%@ include file="header.jsp"%>

<body>

<%@ include file="navigation.jsp"%>

  <section id="hero" style="height: 80vh;">
    <div class="hero-container" style="height: 80vh;">
      <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel" style="height: 80vh;">

        <ol style="height: 80vh;" class="carousel-indicators" id="hero-carousel-indicators"><li data-target="#heroCarousel" data-slide-to="0" class="active"></li><li data-target="#heroCarousel" data-slide-to="1" class=""></li><li data-target="#heroCarousel" data-slide-to="2" class=""></li></ol>

        <div class="carousel-inner" role="listbox" style="height: 80vh;">

          <!-- Slide 1 -->
          <div  class="carousel-item carousel-item-next carousel-item-left" style="background-image: url('homeResources/assets/img/chanakya-crousal/IMG-20200101-WA0043.jpg');height: 80vh;">
            <div class="carousel-container">
              <div class="carousel-content container">

              </div>
            </div>
          </div>

          <!-- Slide 2 -->
          <div  class="carousel-item" style="background-image: url('homeResources/assets/img/chanakya-crousal/IMG-20200101-WA0083.jpg');height: 80vh;">
            <div class="carousel-container">
              <div class="carousel-content container">

              </div>
            </div>
          </div>

          <!-- Slide 3 -->
          <div  class="carousel-item active carousel-item-left" style="background-image: url('homeResources/assets/img/chanakya-crousal/IMG-20200101-WA0089.jpg');height: 80vh;">
            <div class="carousel-container">
              <div class="carousel-content container">

              </div>
            </div>
          </div>

        </div>

        <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon icofont-rounded-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon icofont-rounded-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
  </section>

  <main id="main">
    <section id="latest" class="latest">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Latest</h2>
          <p>Latest Articles</p>
        </div>

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
            <table cellspacing="5" cellpadding="5" border="0" style="border-color:Black;border-width:0px;height:100%;width:98%;">
				<tbody>
					<th>NOTICE</th>
					<c:forEach items="${notices}" var="blog">
						<tr>
							<td ><a href="${pageContext.request.contextPath}/blog/${blog.url}">${blog.title}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <table cellspacing="5" cellpadding="5" border="0" style="border-color:Black;border-width:0px;height:100%;width:98%;">
				<tbody>
					<th>CURRENT AFFAIR</th>
					<c:forEach items="${currentAffairs}" var="blog">
						<tr>
							<td ><a href="${pageContext.request.contextPath}/blog/${blog.url}">${blog.title}</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->
	<section id="popular-courses" class="courses">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Courses</h2>
          <p>Popular Courses</p>
        </div>
		
        <div class="row" data-aos="zoom-in" data-aos-delay="100">
			 <c:forEach items="${courses}" var="course">
		          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
		            <div class="course-item">
					<a href="${pageContext.request.contextPath}/course/${course.name}">
		              <img src="homeResources/assets/img/course-2.jpg" class="img-fluid" alt="...">
		              <div class="course-content">
		                <div class="d-flex justify-content-between align-items-center mb-3">
		                  <h4>${course.name}</h4>
		                  <p class="price">&#2352; ${course.price}</p>
		                </div>
		
		                <h3><a href="${pageContext.request.contextPath}/course/${course.name}">${course.name} Coaching</a></h3>
		                <p>We provide high quality coaching for ${course.name}.</p>
		                <!-- 
		                 <div class="trainer d-flex justify-content-between align-items-center">
		                  <div class="trainer-profile d-flex align-items-center">
		                    <img src="homeResources/assets/img/trainers/trainer-2.jpg" class="img-fluid" alt="">
		                    <span>Lana</span>
		                  </div>
		                  <div class="trainer-rank d-flex align-items-center">
		                    <i class="bx bx-user"></i>&nbsp;35
		                    &nbsp;&nbsp;
		                    <i class="bx bx-heart"></i>&nbsp;42
		                  </div>
		                </div> -->
		              </div>
					  </a>
		            </div>
		          </div> 
	           </c:forEach>
        </div>
      </div>
    </section>
    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>About</h2>
          <p>About Us</p>
        </div>

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
            <img src="homeResources/assets/img/chanakya-crousal/IMG-20200101-WA0083.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            Chanakya Educational Institute has been into the field of Teacher and Public Service Exam since 2016 with a
            mission "Empowering the future professionals.....!". The institute strives to provide students
             with enormous opportunities, which enables them to be at the forefront while shaping their career and future.
             The institute commitment to shape the future of student by training and guiding them;
              supplemented with extensive and comprehensive facilities.


        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts section-bg">
      <div class="container">

        <div class="row counters">

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">1232</span>
            <p>Students</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">64</span>
            <p>Courses</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">42</span>
            <p>Events</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up">15</span>
            <p>Trainers</p>
          </div>

        </div>

      </div>
    </section><!-- End Counts Section -->
    
    <!-- ======= Trainers Section ======= -->
    <section id="trainers" class="trainers">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Trainers</h2>
          <p>Our Professional Trainers</p>
        </div>

        <div class="row" data-aos="zoom-in" data-aos-delay="100">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="member">
              <img src="homeResources/assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
              <div class="member-content">
                <h4>Walter White</h4>
                <span>Web Development</span>
                <p>
                  Magni qui quod omnis unde et eos fuga et exercitationem. Odio veritatis perspiciatis quaerat qui aut aut aut
                </p>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="member">
              <img src="homeResources/assets/img/trainers/trainer-2.jpg" class="img-fluid" alt="">
              <div class="member-content">
                <h4>Sarah Jhinson</h4>
                <span>Marketing</span>
                <p>
                  Repellat fugiat adipisci nemo illum nesciunt voluptas repellendus. In architecto rerum rerum temporibus
                </p>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
            <div class="member">
              <img src="homeResources/assets/img/trainers/trainer-3.jpg" class="img-fluid" alt="">
              <div class="member-content">
                <h4>William Anderson</h4>
                <span>Content</span>
                <p>
                  Voluptas necessitatibus occaecati quia. Earum totam consequuntur qui porro et laborum toro des clara
                </p>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Trainers Section -->

    <!-- ======= Contact Us Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
            <h2>Contact</h2>
            <p>Contact Us</p>
        </div>
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
                <p><a href = "mailto: omchanakyadhampur@gmail.com">omchanakyadhampur@gmail.com</a></p>
              </div>

              <div class="phone">
                <i class="icofont-phone"></i>
                <h4>Call:</h4>
                <p><a href = "tel: +917906554548">+917906554548</a></p>
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
    </section>

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
           // $('.sent-message').hide().delay(5000).fadeIn(400);
          }
    });
});
</script>