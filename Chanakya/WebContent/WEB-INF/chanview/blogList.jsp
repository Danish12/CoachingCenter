<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp"%>
<link href="mainResources/css/font-awesome-4.5.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />

<link type="text/css" rel="stylesheet" href="mainResources/css/jquery-ui.min.css"/>
<script type="text/javascript" src="mainResources/js/jquery.js"></script>
<script type="text/javascript" src="mainResources/js/jquery-ui.js"></script>

<script src="mainResources/js/jtable.js" type="text/javascript"></script>
<link href="mainResources/css/blue/jtable.css" rel="stylesheet" type="text/css">

<body>
	<%@ include file="navigation.jsp"%>
	
	<main id="main" style="padding-top: 6%;">
		<div class="row1" style="width: 95%;display: flex;">
			<div class="col s3">
				<a class="btn addBtnColor" href="addBlog" style="color: white;background-color: #5fcf80"><i class="fa fa-plus"></i>&nbsp; Add Article</a>
			</div>
		</div>
		<br>
		<div class="row1">
			<div class="col s12">
				<div class="searchResult" id="listBlogContainer"></div>
			</div>
		</div>
	</main>
 <c:set var="excludeBootstrapNjquery" value="true" ></c:set>
<%@ include file="footer.jsp"%>
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
	        title: 'Article List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	            listAction: 'listBlog',
	            deleteAction: 'deleteBlog'
	        },
	        fields: {
	        	blogId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	            },
	            url: {
	                title: 'Url',
	            },
	            title: {
	                title: 'Title',
	            },
	            courses: {
	                title: 'Course',
	            },
	            subjects: {
	                title: 'Subject',
	            },
	            isPrime: {
	                title: 'Prime',
	            },
	            status: {
	                title: 'Status',
	            },
	            
	            button : {
	            	title : 'Action'
	            },
	            button : {
	            	title : 'Delete'
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