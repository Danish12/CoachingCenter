<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="Wasi">
	<title>Fagnum | Content Publishing Platform</title>
    <meta name="keywords" content="content publishing platform, publish your blog, where do guest blogging, 
    create back links">
	<meta name="description" content="Fagnum is a content publishing platform for startups and bloggers">
	<link rel="icon" type="image/ico" href="homeResources/images/favicon.png ">
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="mainResources/css/font-awesome-4.5.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="mainResources/css/materialize.min.css">
	<link type="text/css" rel="stylesheet" href="mainResources/css/jquery-ui.min.css"/>
</head>
<body>
       <%@ include file="mainHeader.jsp"%>
	<div class="row center" >
		<div class="col s12">
			<h1 style="font-size: 35px"><i class="fa fa-patient-o"> </i>Blog Image</h1>
		</div>
	</div>
    <form method="POST" action="blogImageSubmit" enctype="multipart/form-data" >
    	<div class="row" style="width: 50%">
			<!-- <div class="col s3">
				<label for="blogImage">Blog Name</label>
			</div> -->
			<div class="input-field col s6">
				<select name="blogId">
					<option value="Select">Select</option>
					<c:forEach items="${blogs}" var="blog">
						<option value="${blog.blogId}">${blog.title}</option>
					</c:forEach>
				</select>
				<label for="blogImage">Blog Name</label>
			</div>
			<div class="col s6">
				<!-- <label for="blogImage">Blog Image</label>
			</div>
			<div class="col-md-3">
				<input type="file" name="blogImage" id="blogImage" placeholder="Select Image for Blog">
			</div> -->
				<div class="file-field input-field">
					<div class="btn">
						<span>Blog Image</span>
						<input name="blogImage" id="blogImage" type="file">
					</div>
					<div class="file-path-wrapper">
		        		<input class="file-path validate"  placeholder="Select Image for Blog" type="text">
					</div>
			    </div>
		    </div>
			<div class="col s12 center">
				<br>
				<a class="waves-effect waves-light btn saveBtnColor"><input type="submit" value="Save" /></a>
				<a class="btn cancelBtnColor" href="<%=resource.getString("siteUrl")%>" title="Main">Cancel</a>
		    </div>
		</div>
		<div class="row" style="padding:0 10px">
			<c:forEach items="${blogImages}" var="blogImage" varStatus="status">
				<div class="col s3">
				<br>
					<div class="form-group">
						<img src="${blogImage.value}" width="100%" height="160px">
				   	</div>
			    </div>
			</c:forEach>
		</div>
    </form>
 <script type="text/javascript" src="mainResources/js/jquery.js"></script>
 <script type="text/javascript" src="mainResources/js/jquery-ui.js"></script>
 <script type="text/javascript" src="mainResources/js/materialize.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function() {
	    $('select').material_select();
	  });
 </script>
</body>
</html>