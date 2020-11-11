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
</style>
<body>
 <link href="${pageContext.request.contextPath}/homeResources/css/countdown.css" rel="stylesheet">

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
        <div class="row mt-">
          <form action="${pageContext.request.contextPath}/online-test-submit" method="POST" id="onlineTestForm">
                <input type="hidden" value="${onlineTest.onlineTestId}" name="testId"/>
                <c:forEach var="question" items="${onlineTest.getSortedQuestions()}"  varStatus="loop">
                     <div  class="question" >
                            <div class="question-details" >
                                 <b>${loop.index+1}. ${question.description}</b>
                            </div>
                         <c:forEach var="answers" items="${question.getSortedAnswers()}"  varStatus="loop">
                             <div class="answer-description">
                                   <input type="radio" name="${question.questionId}" value="${answers.optionNumber}">
                                   <label for="${question.questionId}">${answers.description}</label><br>
                             </div>
                       </c:forEach>
                     </div>
               </c:forEach>
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
<script src="${pageContext.request.contextPath}/homeResources/js/jquery.countdown.js"></script>
<script>
$('.get-started-btn').countdown({
          date: +(new Date) + ${onlineTest.second}*1000,
          render: function(data) {
            $(this.el).text( this.leadingZeros(data.min, 2) + "min "+ this.leadingZeros(data.sec, 2) + " sec");
          },
          onEnd: function() {
            $(this.el).addClass('ended');
            $('#onlineTestForm').submit();
          }
        }).on("click", function() {
          $(this).removeClass('ended').data('countdown').update(+(new Date) + ${onlineTest.second}*10000*60).start();
    });
</script>
</body>
</html>