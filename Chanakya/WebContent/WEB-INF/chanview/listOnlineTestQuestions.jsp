<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<style>
.question{
    border: #5fcf80;
    border-width: thin;
    border-style: solid;
    margin-top : 10px;
    padding-left: 5px;
}
.row-question{
	display: block !important; 
}
</style>
<link href="${pageContext.request.contextPath}/homeResources/css/countdown.css" rel="stylesheet">
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
				<p>${onlineTest.instruction}</p>
      		</c:otherwise>
      	</c:choose>
      </div>
    </div>
    
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">
        <div class="row-question mt-">
          <form action="${pageContext.request.contextPath}/online-test-submit" method="POST" id="onlineTestForm">
                <input type="hidden" value="${onlineTest.onlineTestId}" name="testId"/>
                	<div class="all-questions">
		                <c:forEach var="question" items="${onlineTest.getSortedQuestions()}"  varStatus="loop">
		                     <div  class="question${loop.index+1} question" >
		                            <div class="question-details" >
		                                 <b>${loop.index+1}. </b>${question.description}
		                            </div>
		                         <c:forEach var="answers" items="${question.getSortedAnswers()}"  varStatus="loop">
		                             <div class="answer-description">
		                                   <input type="radio" name="${question.questionId}" value="${answers.optionNumber}">
		                                   <label for="${question.questionId}">${answers.description}</label><br>
		                             </div>
		                         </c:forEach>
		                     </div>
		               </c:forEach>
	               </div>
	               <!-- <a id="next" style="float: right;">next</a> -->
	               <br>
	                <button  id="next" class="" style="float: right; border-radius: 50px; border: 0; background: #5fcf80; ">Next</button>
	                <button  id="prev" class="" style="background: #5fcf80; border-radius: 50px; border: 0;">PREV</button>
				   <!-- <a id="prev">prev</a> -->
               <div class="contact">
                 <div class="php-email-form text-center">
                   <button type="submit" id="onlineTestSubmit" value="Submit Test">Submit Test</button>
                 </div>
               </div>
          </form>
        </div>
      </div>
    </section>
    
  </main>

<%@ include file="footer.jsp"%>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" /> -->

<script src="${pageContext.request.contextPath}/homeResources/js/jquery.countdown.js"></script>
<script>
$('.get-started-btn').countdown({
          date: +(new Date) + ${onlineTest.second}*1000,
          render: function(data) {
        	  console.log(data);
            $(this.el).text( this.leadingZeros(data.hours, 2) + " Hour "+this.leadingZeros(data.min, 2) + "min "+ this.leadingZeros(data.sec, 2) + " sec");
          },
          onEnd: function() {
            $(this.el).addClass('ended');
            $('#onlineTestForm').submit();
          }
        }).on("click", function() {
          $(this).removeClass('ended').data('countdown').update(+(new Date) + ${onlineTest.second}*10000*60).start();
    });
    
$(document).ready(function(){
    $(".all-questions .question").each(function(e) {
        if (e != 0)
            $(this).hide();
    });
    
    $("#next").click(function(){
    	$('html, body').animate({
            scrollTop: parseInt($('#main').offset().top)
        }, 1000);
        if ($(".all-questions  .question:visible").next().length != 0)
            $(".all-questions .question:visible").next().show().prev().hide();
        else {
            $(".all-questions .question:visible").hide();
            $(".all-questions .question:first").show();
        }
        return false;
    });

    $("#prev").click(function(){
    	$('html, body').animate({
            scrollTop: parseInt($('#main').offset().top)
        }, 1000);
        if ($(".all-questions .question:visible").prev().length != 0)
            $(".all-questions .question:visible").prev().show().next().hide();
        else {
            $(".all-questions .question:visible").hide();
            $(".all-questions .question:last").show();
        }
        return false;
    });
});
    
</script>
</body>
</html>