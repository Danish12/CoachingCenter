<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<%@ include file="header.jsp"%>
<script src="${pageContext.request.contextPath}/mainResources/js/ckeditor.js"></script> 
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>

	
<body class="page-header-fixed">
	<%@ include file="navigation.jsp"%>
	<br></br>
	<div class="align">
		<form class="form-horizontal" role="form" style="width: 100%;padding-top: 5em;">
      		<div class=" col-sm-3" > 
      			<div class="col-sm-12">
      				<label  for="title">Title</label> 
      			</div>
      			<div class="col-sm-12">
      				<input class="form-control" type="text" id="title" name="title" value="${blog.title}"
        			onchange="generateUrl()">
      			</div>
      		</div>
      		<div class=" col-sm-3" >  
      			<div class="col-sm-12">
      				<label for="url">Url</label>      
      			</div>
      			<div class="col-sm-12">
      				<input class="form-control" type="text" id="url" name="url" value="${blog.url}"/> 
      			</div>
      		</div>
      		<div class=" col-sm-3" >  
      			<div class="col-sm-12">
      				<label for="url">Prime/Public</label>      
      			</div>
      			<div class="col-sm-12">
      				<select class="form-control input-sm m-select" name="isPrime" id="isPrime" >
							<option value="true">PRIME</option>
							<option value="false">PUBLIC</option>
					</select>
      			</div>
      		</div>
      		<div class=" col-sm-3">   
      			<div class="col-sm-12">
      				<label  for="genre" >Course</label> 
      			</div>
      			<div class="col-sm-12">
	      			<select class="form-control input-sm m-select" name="courses" multiple="multiple" id="courses" >
								<c:forEach items="${courses}" var="course">
									<option value="${course.courseId}"> ${course.name}</option>
								</c:forEach>
					</select>   
				</div>
      		</div>
      		<div class=" col-sm-3">   
      			<div class="col-sm-12">
      				<label  for="genre" >Subject</label> 
      			</div>
      			<div class="col-sm-12">
	      			<select class="form-control input-sm m-select" name="subject" multiple="multiple" id="subject" >
								<c:forEach items="${subjects}" var="subject">
									<option value="${subject.subjectId}"> ${subject.name}</option>
								</c:forEach>
					</select>   
				</div>
      		</div>
		      		<br>
		      		<div id="editor" style="visibility: hidden; display: none; width: 80%;"> ${blog.content}</div>
		</form>
	</div>
	
	
	
	<br>
	<div class="row1" style="text-align: center;">
		<div class="col-sm-12" >						               
			<button class="btn btn-primary" onclick="submitValues('Draft')"
				style="background-color: #3276b1 !important;border-color: #3276b1">Draft</button>
			<button  class="btn btn-success" onclick="submitValues('Publish')"
				style="background-color: #60c560 !important;border-color: #60c560">Publish</button>
			<a class="btn btn-danger" href="blogAdmin" 
				style="background-color: #d9534f !important;border-color: #d9534f">Cancel</a>
		</div>
	</div><br>
	<c:set var="includeSelect2" value="true"/>
	<%@ include file="footer.jsp"%>
</body>
<script>


	$(document).ready(function() {
		<c:if test="${blog.courses != null}">
			var courses = ${blog.courses};
			$('#courses').val(courses);
		</c:if>
		<c:if test="${blog.subjects != null}">
			var subjects = ${blog.subjects};
			$('#subject').val(subjects);
		</c:if>
		
		$('#isPrime').val('${blog.isPrime}');
	    $('.m-select').select2();
	});
 
	function generateUrl() { 
		var str = document.getElementById("title").value;
		var newString = str.replace(/ /g,"-");
		document.getElementById("url").value = newString ;
	}


 var editor=	ClassicEditor
	.create( document.querySelector( '#editor' ), {
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
		window.editor = editor;
	} )
	.catch( error => {
		console.error( 'Oops, something went wrong!' );
		console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
		console.warn( 'Build id: k2i30chx32nf-8o65j7c6blw0' );
		console.error( error );
	} );
	
	function submitValues(status) {
		var content = editor.getData();

		var title = $('#title').val();
		var genre = $('#genre').val();
		var metaDesc = $('#metaDesc').val();
		var bloggerUrl = $('#bloggerUrl').val();
		var blogType = $('#blogType').val();
		var url = $('#url').val();
		var blogImageName = $('#blogImageName').val();
		var action = '${action}';
		var id = '${blog.blogId}';
		var fresh = $('#fresh').val();
		var status = status;
		var courses = $('#courses').val();
		var subjects = $('#subject').val();
		var isPrime = $('#isPrime').val();
		
		$.ajax({
			  url: "${pageContext.request.contextPath}/saveblog",
			  type: "POST",
			  data: {content : content,
					title : title,
					genre : genre,
					metaDesc : metaDesc,
					bloggerUrl : bloggerUrl,
					blogType : blogType,
					action : action,
					status : status,
					blogImageName : blogImageName,
					id :id,
					url : url,
					fresh : fresh,
					subjects : subjects,
					courses : courses,
					isPrime : isPrime,
			  },
			  success:function(data) {
				  window.location.href = 'blogAdmin'; 
			  },
			  error: function (request, status, error) {
			        alert("Error while updating teh Blog!!" + error);
			  },
			  dataType: "html"
		});
	}
</script>
 </html>