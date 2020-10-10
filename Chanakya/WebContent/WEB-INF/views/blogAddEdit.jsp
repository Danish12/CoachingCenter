<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html>
<html>
  <head>
	<title><%=resource.getString("title")%></title>
	<meta name="description" content="<%=resource.getString("metaDescription")%>">
    <meta charset="utf-8">
	<!--Let browser know website is optimized for mobile-->
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="alternate" href="<%=resource.getString("alternateUrl")%>" hreflang="en-us" />
	<link rel="icon" type="image/ico" href="homeResources/images/favicon.png ">
    <link href="mainResources/css/font-awesome-4.5.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="messageBoard/css/samples.css" rel="stylesheet">
	<link rel="icon" type="image/ico" href="homeResources/images/favicon.png ">
    <link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/stylesheets/bootstrap.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/stylesheets/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/stylesheets/style.css" media="all" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="homeResources/css/jquery-ui.min.css"/>
	<script type="text/javascript" src="homeResources/js/jquery.js"></script>
	<script src="messageBoard/js/ckeditor.js"></script>
</head>
<style>
	@media(min-width:992px){
		.align{
			padding-bottom: 10px !important;
			text-align: center !important;
		}
	}
</style>
<body class="page-header-fixed">
	<%@ include file="adminHead.jsp"%>
	<br></br>
	<div class="row align">
		<form class="form-horizontal" role="form">
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
      		<div class=" col-sm-3">   
      			<div class="col-sm-12">
      				<label  for="genre" >Genre</label> 
      			</div>
      			<div class="col-sm-12">
      				<textarea class="form-control" id="genre" name="genre">${blog.genre}</textarea>
      			</div>      
      		</div>
      		<div class=" col-sm-3"> 
      			<div class="col-sm-12">
      				<label for="metaDesc">Meta Description</label>         
      			</div>
      			<div class="col-sm-12">
      				<textarea class="form-control" id="metaDesc" name="metaDesc">${blog.metaDescription}</textarea>
      			</div>
      		</div>
		</form>
	</div>
	<div class="row align">
		<div class="form-group">
			<div class=" col-sm-3">
				<div class="col-sm-12">
					<label for="blogType">Blog Type</label>
      			</div>
      			<div class="col-sm-12">
      				<textarea class="form-control" id="blogType"  name="blogType" >${blog.blogType}</textarea>
      			</div>
			</div>
      		<div class=" col-sm-3">
      			<div class="col-sm-12">
      				<label for="bloggerUrl">Blogger Url</label>
      			</div>
      			<div class="col-sm-12">
      				<textarea class="form-control" id="bloggerUrl"  name="bloggerUrl" >${blog.bloggerUrl}</textarea>
      			</div>
      		</div>
      		<div class=" col-sm-3">
      			<div class="col-sm-12">
      				<label for="blogImageName">Blog Image Name</label>
      			</div>
      			<div class="col-sm-12">
      				<textarea class="form-control" id="blogImageName"  name="blogImageName" >${blog.blogImageName}</textarea>
      			</div>
      		</div>
      		<div class=" col-sm-3">
      			<div class="col-sm-12">
      				<label for="fresh">Fresh</label>
      			</div>
      			<div class="col-sm-12">
      				<textarea class="form-control" id="fresh" name="fresh" >${blog.fresh}</textarea>
      			</div>
      		</div>
    	</div>
	</div>
	<div id="editor" style="visibility: hidden; display: none;"> ${blog.content}</div>
	<br>
	<div class="row" style="text-align: center;">
		<div class="col-sm-12" >						               
			<button class="btn btn-primary" onclick="submitValues('Draft')"
				style="background-color: #3276b1 !important;border-color: #3276b1">Draft</button>
			<button  class="btn btn-success" onclick="submitValues('Publish')"
				style="background-color: #60c560 !important;border-color: #60c560">Publish</button>
			<a class="btn btn-danger" href="blogAdmin" 
				style="background-color: #d9534f !important;border-color: #d9534f">Cancel</a>
		</div>
	</div>
</body>

<script>
	function generateUrl() { 
		var str = document.getElementById("title").value;
		var newString = str.replace(/ /g,"-");
		document.getElementById("url").value = newString ;
	}

	 /* var blogTypeList=[];
	 blogTypeList.push("writer-words");
	 blogTypeList.push("how-tips-why");
	 blogTypeList.push("startup-voice");
	 blogTypeList.push("Technology");
	 blogTypeList.push("Travel");
	 blogTypeList.push("others");
     $('#blogType').bind('keyup', function(e) {
     	$( "#blogType" ).autocomplete({
			source: blogTypeList,
		});
	  }); */
     
     var bloggerList=[];
     <c:forEach items="${bloggerList}" var="blogger" varStatus="status">
     	bloggerList.push("${blogger.url}");
 	 </c:forEach>
	 $('#bloggerUrl').bind('keyup', function(e) {
	  	$( "#bloggerUrl").autocomplete({
			source:bloggerList,
		}); 
     });
	    
	 var categoryList=[];
     <c:forEach items="${categoryList}" var="category" varStatus="status">
     	categoryList.push("${category.url}");
 	 </c:forEach>
	 $('#blogType').bind('keyup', function(e) {
	  	$( "#blogType").autocomplete({
			source:categoryList,
		}); 
     });
	 
	 var genreList=[];
     <c:forEach items="${genreList}" var="genre" varStatus="status">
     	genreList.push("${genre.url}");
 	 </c:forEach>
	 $('#genre').bind('keyup', function(e) {
	  	$( "#genre").autocomplete({
			source:genreList,
		}); 
     });
	 
	var editorElement = CKEDITOR.document.getById('editor');
	CKEDITOR.replace('editor');

	function submitValues(status) {
		var content = CKEDITOR.instances.editor.getData();
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
		
		$.ajax({
			  url: "saveblog",
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
			  },
			  success:function(data) {
				  window.location.href = 'blogAdmin'; 
			  },
			  error: function (request, status, error) {
			        alert("Error while updating teh Blog!!");
			  },
			  dataType: "html"
		});
	}
	// To read the DATA  CKEDITOR.instances.editor1.getData()
</script>
 <script src="mainResources/minJs/jquery-1.11.3.min.js" type="text/javascript"></script> 
 <script src="mainResources/minJs/bootstrap.min.js" type="text/javascript"></script>
 <script src="mainResources/minJs/jquery-ui.min.js" type="text/javascript"></script>
</html>