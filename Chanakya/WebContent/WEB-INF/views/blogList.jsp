<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fagnum | Content Publishing Platform</title>
    <meta name="keywords" content="content publishing platform, publish your blog, where do guest blogging, 
    create back links">
	<meta name="description" content="Fagnum is a content publishing platform for startups and bloggers">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <link rel="icon" type="image/ico" href="homeResources/images/favicon.png ">
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="mainResources/css/font-awesome-4.5.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/css/blue/jtable.css" rel="stylesheet" type="text/css">
	<link type="text/css" rel="stylesheet" href="mainResources/css/materialize.min.css">
	<link type="text/css" rel="stylesheet" href="mainResources/css/jquery-ui.min.css"/>
</head>
<style>
  	.input-field label {
  		color: black;
  	}
</style>
<body>
	<%@ include file="mainHeader.jsp"%>
	<div class="row" style="width: 95%">
		<div class="col s6">
			<h1 style="font-size: 30px"><i class="fa fa-patient-o"> </i>Blog</h1>	
		</div>
		<div class="col s6 right-align"  style="padding-top: 30px;">						               
			<a class="btn addBtnColor" href="addBlog" style="color: white;background-color: #03a9f4"><i class="fa fa-plus"></i>&nbsp; Add Blog</a>
		</div>
	</div>
	<div class="row" style="width: 95%;">
		<div class="col s3">
			<input type="text" name="title" id="title" placeholder="Blog Title"/>
		</div>
		<div class="col s3">
			<input type="text" class="form-control" id="blogType" name="blogType" placeholder="Blog Type"/>
		</div>
		<div class="col s3">
			<input type="text" class="form-control" id="bloggerUrl"  name="bloggerUrl" placeholder="Blogger Url"/>
		</div>
		<div class="col s3">
			<input type="button" name="search" title="Search" value="Search" id="search"/>
		</div>
	</div>
	<br>
	<div class="row" style="padding: 0 10px;">
		<div class="col s12">
			<div class="searchResult" id="listBlogContainer"></div>
		</div>
	</div>
 <script type="text/javascript" src="mainResources/js/jquery.js"></script>
 <script type="text/javascript" src="mainResources/js/jquery-ui.js"></script>
 <script type="text/javascript" src="mainResources/js/materialize.min.js"></script>
 <script src="mainResources/js/jtable.js" type="text/javascript"></script>
 <script type="text/javascript">
 	
	 var blogTypeList=[];
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
	  });
	 
	 var bloggerList=[];
	 <c:forEach items="${bloggerList}" var="blogger" varStatus="status">
	 	bloggerList.push("${blogger.url}");
		 </c:forEach>
	 $('#bloggerUrl').bind('keyup', function(e) {
	  	$( "#bloggerUrl").autocomplete({
			source:bloggerList,
		}); 
	 });
 
	$(document).ready(function () {
	    $('#listBlogContainer').jtable({
	        title: 'Blog List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	            listAction: 'listBlog'
	        },
	        fields: {
	        	blogId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: true,
	            },
	            url: {
	                title: 'Url',
	            },
	            title: {
	                title: 'Title',
	            },
	            metaDescription: {
	                title: 'Meta Description',
	            },
	            blogType: {
	                title: 'Type',
	            },
	            genre: {
	                title: 'Genre',
	            },
	            status: {
	                title: 'Status',
	            },
	            bloggerUrl: {
	                title: 'Blogger Url',
	            },
	            button : {
	            	title : 'Action'
	            }
	        },
	        recordAdded : function(event, data){
	        	
	        } 
	    });
	    $('#listBlogContainer').jtable('load');
		 //Re-load records when user click 'load records' button.
        $('#search').click(function (e) {
            e.preventDefault();
            $('#listBlogContainer').jtable('load', {
                title: $('#title').val(),
                type: $('#blogType').val(),
                blogger: $('#bloggerUrl').val(),
                search: true
            });
        });	
 	
	});
 
 </script>
</body>
</html>