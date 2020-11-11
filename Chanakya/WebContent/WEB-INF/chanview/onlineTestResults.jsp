<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<style>
.solution-details{
    border: #5fcf80;
    border-width: thin;
    border-style: solid;
    margin-top : 10px;
    padding-left: 5px;
}
</style>
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
				<h2>Result for ${onlineTest.name}</h2>
      		</c:otherwise>
      	</c:choose>
      </div>
    </div>
    
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">
        <div class="row mt-">
           <div class="info">
              <div class="result" style="text-align: center;">
                <h3>Marks obtained ${correctCount}</h3>
              </div>
              <c:set var="questionsMap" value="${onlineTest.getQuestionMap()}" />
              <c:forEach var="onlineTestResponse" items="${onlineTestUserResponses}"  varStatus="loop">
                  <div class="solution" >
                     <c:set var="question" value="${questionsMap[onlineTestResponse.questionId]}"/>
                     <div class="solution-details" >
                        <div>Question - ${question.description}</div>
                        <div>Correct Answer - ${question.correctAnswer}</div>
                        <div>Answer Entered by You -
                            <c:choose>
                                <c:when test="${empty onlineTestResponse.optionChoosen}">
                                    No Answer Entered.
                                </c:when>
                                <c:otherwise>
                                    ${onlineTestResponse.optionChoosen}
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div>Solution Details - ${question.solutionDetail}</div>
                     </div>
                  </div>
               </c:forEach>
           </div>
        </div>
       </div>
    </section>
  </main>

<%@ include file="footer.jsp"%>
</body>
</html>