<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<%@ include file="header.jsp"%>
<script src="${pageContext.request.contextPath}/mainResources/js/ckeditor.js"></script> 
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>

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
			<div class="form-row">
	      		<div class="w100" > 
	      			<div class="">
	      				<label  for="title">Question Text</label> 
	      			</div>
	      			<div class="">
	      				<textarea name="question.description" class="editor">${question.description}</textarea>
	      			</div>
	      		</div>
	      	</div>
	      	
	      	<!-- loop 4 times -->
	      	
	      	<c:forEach begin="0" end="3" varStatus="loop">
		      	<div style="width: 45%; float:left; padding-left: 15px;">
		      		<div class="col-sm-12">
		      				<label for="url">Option ${loop.index + 1}</label>      
		      		</div>
				    <textarea name="option1"  class="editor"></textarea>
			    </div>
			    <c:choose >
			    	<c:when test="${loop.index % 2 == 0}"><div style="width: 5%; float:left;"></div></c:when>
			    	<c:otherwise><br></c:otherwise>
			    </c:choose>
		    </c:forEach>
      		<div  class="w100">
	      		<div class="">
	      				<label for="url">Question Solution</label>      
	      		</div>
			    <textarea name="solutionDetail"  class="editor" style="height:60px;" ></textarea>
		    </div>
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

var allEditors = document.querySelectorAll('.editor');
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
	    //writer.setStyle( 'height', '200px', editor.editing.view.document.getRoot() );

		window.editor = editor;
	} )
	.catch( error => {
		console.error( 'Oops, something went wrong!' );
		console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
		console.warn( 'Build id: k2i30chx32nf-8o65j7c6blw0' );
		console.error( error );
	} );
}

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