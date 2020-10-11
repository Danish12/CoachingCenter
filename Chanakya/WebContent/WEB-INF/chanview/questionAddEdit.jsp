<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<%@ include file="header.jsp"%>
<script src="${pageContext.request.contextPath}/mainResources/js/ckeditor.js"></script> 
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>

<link type="text/css" rel="stylesheet" href="mainResources/css/jquery-ui.min.css"/>
<script type="text/javascript" src="mainResources/js/jquery.js"></script>
<script type="text/javascript" src="mainResources/js/jquery-ui.js"></script>

<script type="text/javascript" src="mainResources/js/materialize.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
<link type="text/css" rel="stylesheet" href="mainResources/css/jquery-ui.min.css"/>
<style>
.w100{
	width: 90%;
	margin-left: 15px;
}
</style>
	
<body class="page-header-fixed">
	<%@ include file="navigation.jsp"%>
	<br></br>
	<div class="align">
	  
		<form class="form-horizontal" role="form" style="width: 100%;padding-top: 5em;">
			<div class="input-field col s12 m6 w100">
				<h2>Add/Update Question</h2>
			</div>
			<div class="input-field col s12 m6 w100">
				<div class="form-group">
				   	<label for="name">Subjects</label>
					<select class="form-control input-sm m-select" name="subject" multiple="multiple" id="subject" >
						<c:forEach items="${subjects}" var="subject">
							<option value="${subject.subjectId}"> ${subject.name}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-row">
	      		<div class="w100" > 
	      			<div class="">
	      				<label  for="title">Question Text</label> 
	      			</div>
	      			<div class="">
	      				<textarea name="question" class="editor" id="question">${question.description}</textarea>
	      			</div>
	      		</div>
	      	</div>
	      	
	      	<!-- loop 4 times -->
	      	
	      	<c:forEach begin="0" end="3" varStatus="loop">
			    <div  class="w100">
		      		<div class="">
		      				<label for="url">Option ${loop.index + 1}</label>      
		      		</div>
				    <textarea name="option${loop.index + 1}"  class="editor" id="option${loop.index + 1}"></textarea>
			    </div>
		    </c:forEach>
		    <br><br>
      		<div  class="w100">
	      		<div class="">
	      				<label for="url">Question Solution</label>      
	      		</div>
			    <textarea name="solutionDetail"  class="editor" style="height:60px;" id="solutionDetail">${question.solutionDetail}</textarea>
		    </div>
		    <input type="hidden" id="action">
		    <input type="hidden" id="id" value="${question.questionId}">
		</form>
	</div>
	
 		<div class="w100" > 
 			<div class="">
 				<label  for="title">Correct Option</label> 
 			</div>
 			<div class="">
 				<select class="form-control input-sm m-select" name="correctOption" id="correctOption" >
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
				</select>
 			</div>
 		</div>
	
	<br>
	<div class="row1" style="text-align: center;">
		<div class="col-sm-12" >						               
			<button class="btn btn-primary" onclick="submitValues('Draft')"
				style="background-color: #3276b1 !important;border-color: #3276b1">Draft</button>
			<button  class="btn btn-success" onclick="submitValues('Publish')"
				style="background-color: #60c560 !important;border-color: #60c560">Publish</button>
			<a class="btn btn-danger" href="${pageContext.request.contextPath}/questionListHomePage?onlineTestId=${onlineTestId}"
				style="background-color: #d9534f !important;border-color: #d9534f">Cancel</a>
		</div>
	</div><br>
	<c:set var="includeSelect2" value="true"/>
	<%@ include file="footer.jsp"%>
</body>
<script>

	var allEditors = document.querySelectorAll('.editor');
	var allEditorObject = [];
	
	$(document).ready(function(){
		$("#action").val('${status}');
		$("#correctOption").val("${question.correctAnswer}");
		
		var json = ${question.toJSON(onlineTestId)};
		$("#option1").val(json.option1);
		$("#option2").val(json.option2);
		$("#option3").val(json.option3);
		$("#option4").val(json.option4);
		$("#subject").val(json.subjectIds.split(","));
		$('select').select2();
		initializeEditors()
	});
	
	function initializeEditors(){
		
		for (var i = 0; i < allEditors.length; ++i) {
		  ClassicEditor.create(allEditors[i], {
				ckfinder: {
		            uploadUrl: 'ImageUploader/upload'
		        },
				toolbar: {
					items: [
						'heading',
						'|',
						'bold',
						'italic',
						'link',
						'bulletedList',
						'numberedList',
						'|',
						'indent',
						'outdent',
						'|',
						'imageUpload',
						'blockQuote',
						'insertTable',
						'mediaEmbed',
						'undo',
						'ckfinder',
						'redo'
					]
				},
				language: 'en',
				image: {
					toolbar: [
						'imageTextAlternative',
						'imageStyle:full',
						'imageStyle:side'
					]
				},
				table: {
					contentToolbar: [
						'tableColumn',
						'tableRow',
						'mergeTableCells'
					]
				},
				licenseKey: '',
				
			} )
			.then( editor => {
				allEditorObject.push(editor);
				window.editor = editor;
			} )
			.catch( error => {
				console.error( 'Oops, something went wrong!' );
				console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
				console.warn( 'Build id: k2i30chx32nf-8o65j7c6blw0' );
				console.error( error );
			} );
		}
	}


	function submitValues(status) {

		var action = $("#action").val();
		var id = $("#id").val();
		var questionContent = allEditorObject[0].getData();
		var solutionContent = allEditorObject[5].getData();
		var option1Content = allEditorObject[1].getData();
		var option2Content = allEditorObject[2].getData();
		var option3Content = allEditorObject[3].getData();
		var option4Content = allEditorObject[4].getData();
		var correctOption = $("#correctOption").val();
		var onlineTestId = "${onlineTestId}";
		var subjectIds = $("#subject").val();
		
		$.ajax({
			  url: "${pageContext.request.contextPath}/saveQuestion",
			  type: "POST",
			  data: {
				    
					id :id,
					questionContent : questionContent,
					solutionContent : solutionContent,
					option1Content : option1Content,
					option2Content : option2Content,
					option3Content : option3Content,
					option4Content : option4Content,
					correctOption : correctOption,
					action : action,
					subjectIds : subjectIds,
					onlineTestId : onlineTestId
			  },
			  success:function(data) {
				  window.location.href = '${pageContext.request.contextPath}/questionListHomePage?onlineTestId=${onlineTestId}'; 
			  },
			  error: function (request, status, error) {
			        alert("Error while updating the Question!!" + error);
			  },
			  dataType: "html"
		});
	}
</script>
 </html>