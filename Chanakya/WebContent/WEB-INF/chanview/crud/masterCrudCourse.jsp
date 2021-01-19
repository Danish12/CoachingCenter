<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp"%>
<link href="mainResources/css/font-awesome-4.5.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />

<link type="text/css" rel="stylesheet" href="mainResources/css/jquery-ui.min.css"/>
<script type="text/javascript" src="mainResources/js/jquery.js"></script>
<script type="text/javascript" src="mainResources/js/jquery-ui.js"></script>

<script src="mainResources/js/jtable.js" type="text/javascript"></script>
<link href="mainResources/css/blue/jtable.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="mainResources/js/materialize.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
	
<style>

	.jtable-command-button {
		display: none !important;
	}
	.jtable-toolbar-item-text {
		display: none !important;
	}
	.btn:hover{
		background-color: #5fcf80;
	}
	.btn{
		background-color: #5fcf80;
	}
	.tabs .indicator {
		background-color: #5fcf80;
	}
</style>
<body>
	<%@ include file="../navigation.jsp"%>
	<main id="main" style="padding-top: 6%;">
	    <br>
		<div class="row11">
			<div class="col s12">
				<div id="courseDiv" class="row1">
					<div class="row1">
						<div class="col s6">
							<h1 style="font-size: 30px"><i class="fa fa-patient-o"> Course</i></h1>	
						</div>
						<div class="col s6" style="padding-top: 30px;">						               
							<a class="btn right modal-trigger" href="#searchModal" onclick="blankUpdateForm()"><i class="fa fa-plus"></i>&nbsp; Add Course</a>
						</div>
					</div>
					<div class="row1">
						<div class="col s12">
							<div class="searchResult" id="listCourseContainer">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="searchModal" style="width: 70% !important;margin-left: 15%;">
			<div class="modal-content">
				<div class="row1" style="width:90%">
					<div class="col s12" >
		    			<h4 style="font-size: 30px"><i class="fa fa-shield" style="color: #03a9f4"></i> Course</h4>
		    		</div>
				</div>
				<div class="row1 " style="width:90%">
					<div class="col s12 danger" id="errorMessage" style="padding: 0 0px;">
		    		</div>
				</div>
				<div class="row1" style="width:90%">
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="name">Name</label>
							<input type="text" class="form-control input-sm" name="name" id="name" placeholder="Name">
							<input type="hidden" class="form-control input-sm" name="courseId" id="courseId" >
						</div>
					</div>
					
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="name">Price</label>
							<input type="text" class="form-control input-sm" name="price" id="price" placeholder="Price">
						</div>
					</div>
					
					<div class="input-field col s12 m6">
						<div class="form-group">
						    	<label for="name">Subjects</label>
							<select class="form-control input-sm m-select" name="subject" multiple="multiple" id="subject" >
								<c:forEach items="${subjects}" var="subject">
									<option value="${subject.subjectId}"> ${subject.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="input-field col s12 m6">
						<div class="form-group">
							<!-- <label for="Status">Status</label> -->
							<select class="form-control input-sm m-select" name="status" id="status" >
								<option value="ACTIVE">ACTIVE</option>
								<option value="DEACTIVE">DEACTIVE</option>
							</select>
						</div>
					</div>
					
				</div>
				<div class="row1 center">
					<div class="col s12">
						<br>
						<input type="hidden" id="action"><input type="hidden" id="courseId">
						<a class="btn addBtnColor" href="#" style="color: white;background-color: #5fcf80" onclick="updateCourseDetail()">
							<i class="fa fa-plus"></i>&nbsp; Update Details
						</a>
			           	<a class="btn cancelBtnColor" href="#" style="color: white;background-color: #e60d53" onclick="$('#searchModal').closeModal();">
			           		<i class="fa fa-close"></i>Close
			           	</a>
					</div>
				</div>
				</br>
			</div>
		</div>
		</br>
	</main>
<c:set var="excludeBootstrapNjquery" value="true" ></c:set>
<%@ include file="../footer.jsp"%>
</body>
<script type="text/javascript">
	
	$(document).ready(function(){
	    $('ul.tabs').tabs();
	    $('.modal-trigger').leanModal();
	    $('select').select2();
	 });
  
	$("#action").val('add');
	
	$(document).ready(function () {
	    $('#listCourseContainer').jtable({
	        title: 'Course List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	        	createAction : 'addCourse',
	            listAction: 'listCourse',
	            deleteAction: 'deleteCourse',
	            updateAction: 'editCourse'
	        },
	        fields: {
	        	CourseId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'Course Id',
	            },
	            name: {
	                title: 'Name',
	                width: '20%',
	            },
	            price: {
	                title: 'Price',
	                width: '10%',
	            },
	            Subject: {
	                title: 'Subjects',
	                width: '50%',
	            },
	            selectedSubjects: {
	                title: 'selectedSubjects',
	                width: '60%',
	                visibility: 'hidden'
	            },
	            status: {
	                title: 'Status',
	            },
	            
	            action: {
	                title: 'Action',
	                width: '20%',
	            }
	        },
	        recordAdded : function(event, data){
	        	
	        } 
	    });
	    //Load Course list from server
	    $('#listCourseContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    
	});
	
	function updateCourseDetail() {
		$("#errorMessage").text("");
		if(document.getElementById("action").value.match("add")) {
			$('#listCourseContainer').jtable('addRecord', {
			    record: {
			    	name:$("#name").val(),
			    	price:$("#price").val(),
			    	status:$("#status").val(),
			    	subject:$("#subject").val()
			    },
			    success: function() {
					$('#listCourseContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				},error: function (error) {
                    console.log(error);
                    $("#errorMessage").text(error.Message);
                    $(".ui-button.ui-corner-all.ui-widget")[0].click()

                }
			});
		}
		if(document.getElementById("action").value.match("update")) {
			$('#listCourseContainer').jtable('updateRecord', {
			    record: {
			    	CourseId:$("#courseId").val(),
			    	name:$("#name").val(),
			    	status:$("#status").val(),
			    	price:$("#price").val(),
			    	subject:$("#subject").val()
			    },
			    success: function() {
					$('#listCourseContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				},error: function (error) {
                    console.log(error);
                    $("#errorMessage").text(error.Message);
                    $(".ui-button.ui-corner-all.ui-widget")[0].click()

                }
			});
		}
	}
	
	function loadCourseDetail(courseId, name, subject, subjectId, price) {
		$("#action").val('update');
		$('#searchModal').openModal();
		$("#courseId").val(courseId);
		$("#name").val(name);
		$("#price").val(price);
		$("#subject").val(subjectId.split(","));
		 $('select').select2();
	}
	
	function blankUpdateForm() {
		$("#courseId").val('');
    	$("#name").val('');
        $("#action").val('add');
        $("#price").val('');
        $("#subject").val('');
        $("#errorMessage").text("");
        $('select').select2();
	}
</script>
</html>