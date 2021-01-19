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
.modal{
    position: fixed;
    left: 0;
    right: 0;
    background-color: #fafafa;
    max-height: 70%;
    width: 55%;
    margin: auto;
    overflow-y: auto;
    border-radius: 2px;
    will-change: top, opacity;
	}
	.modal .modal-content{
		padding: 24px;
}
.modal-content {
    border-radius: 0px;
    box-shadow: none;
    background: rgba(255, 255, 255, 0.94);
    border: 0;
	}

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
							<h1 style="font-size: 30px"><i class="fa fa-patient-o"> Students</i></h1>	
						</div>
						<div class="col s6" style="padding-top: 30px;">						               
							<a class="btn right modal-trigger" href="#searchModal" onclick="blankUpdateForm()"><i class="fa fa-plus"></i>&nbsp; Add Student</a>
						</div>
					</div>
					<div class="row1">
						<div class="col s12">
							<div class="searchResult" id="listUserContainer">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="searchModal" style="width: 70% !important;margin-left: 15%;">
			<div class="modal-content">
				<div class="row1" style="width:90%">
					<div class="col s12" style="padding: 0 0px;">
		    			<h4 style="font-size: 30px"><i class="fa fa-shield" style="color: #03a9f4"></i> Student</h4>
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
							<label for="name">Email Address</label>
							<input type="text" class="form-control input-sm" name="emailAddress" id="emailAddress" placeholder="emailAddress">
						</div>
					</div>
					
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="name">Mobile</label>
							<input type="text" class="form-control input-sm" name="mobile" id="mobile" placeholder="mobile">
						</div>
					</div>
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="name">Password</label>
							<input type="text" class="form-control input-sm" name="password" id="password" placeholder="password">
						</div>
					</div>
					
					<div class="input-field col s12 m6">
						<div class="form-group">
		      				<label  for="genre" >Course</label> 
			      			<select class="form-control input-sm m-select" name="courses" multiple="multiple" id="courses" >
										<c:forEach items="${courses}" var="course">
											<option value="${course.courseId}"> ${course.name}</option>
										</c:forEach>
							</select>   
						</div>
		      		</div>
					
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="name">Subscription Start Date</label>
							<input type="text" class="form-control input-sm datepicker" data-date-format="dd/mm/yyyy" name="startDate" id="startDate" placeholder="startDate">
						</div>
					</div>
					
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="name">Subscription End Date</label>
							<input type="text" class="form-control input-sm datepicker" name="endDate" data-date-format="dd/mm/yyyy" id="endDate" placeholder="endDate">
						</div>
					</div>
					
					<div class="input-field col s12 m6">
						<div class="form-group">
		      				<label for="url">STATUS</label>      
		      				<select class="form-control input-sm m-select" name="status" id="status" >
									<option value="true">ENABLED</option>
									<option value="false">DISABLED</option>
							</select>
		      			</div>
		      		</div>					
				</div>
				<div class="row1 center">
					<div class="col s12">
						<br>
						<input type="hidden" id="action"><input type="hidden" id="UserId" name="UserId">
						<a class="btn addBtnColor" href="#" style="color: white;background-color: #5fcf80" onclick="updateUserDetail()">
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
	    $('#listUserContainer').jtable({
	        title: 'Course List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	        	createAction : 'addUpdateUser',
	            listAction: 'listUser',
	            deleteAction: 'deleteVideo',
	            updateAction: 'addUpdateUser'
	        },
	        fields: {
	        	UserId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'Video Id',
	            },
	            name: {
	                title: 'Name',
	                width: '20%',
	            },
	            emailAddress: {
	                title: 'Email Id',
	                width: '20%',
	            },
	            mobile: {
	                title: 'Contact',
	                width: '10%'
	            },
	            password: {
	                title: 'Password',
	                width: '10%',
	                visibility: 'hidden',
	            },
	            startDate : {
	            	title : "Start Date"
	            },
	            endDate : {
	            	title : "End Date"
	            },
	            status: {
	                title: 'Status',
	                width: '10%',
	            },
	            
	            action: {
	                title: 'Action',
	                width: '10%',
	            }
	        },
	        recordAdded : function(event, data){
	        	
	        } 
	    });
	    //Load Course list from server
	    $('#listUserContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    
	});
	
	function updateUserDetail() {
		$("#errorMessage").text("");
		if(document.getElementById("action").value.match("add")) {
			$('#listUserContainer').jtable('addRecord', {
			    record: {
			    	name:$("#name").val(),
			    	status:$("#status").val(),
			    	action:'ADD',
			    	courses:$("#courses").val(),
			    	mobile:$("#mobile").val(),
			    	startDate:$("#startDate").val(),
			    	endDate:$("#endDate").val(),
			    	password:$("#password").val(),
			    	emailAddress:$("#emailAddress").val()
			    },
			    success: function() {
					$('#listUserContainer').jtable('reload');
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
			$('#listUserContainer').jtable('updateRecord', {
			    record: {
			    	UserId:$("#UserId").val(),
			    	action:'update',
			    	name:$("#name").val(),
			    	status:$("#status").val(),
			    	courses:$("#courses").val(),
			    	mobile:$("#mobile").val(),
			    	startDate:$("#startDate").val(),
			    	endDate:$("#endDate").val(),
			    	emailAddress:$("#emailAddress").val(),
			    	password:$("#password").val(),
			    	
			    },
			    success: function() {
					$('#listUserContainer').jtable('reload');
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

	
	function loadUserDetails(UserId) {
		
		$.ajax({
			  url: "loadUserDetails",
			  type: 'GET',
			  dataType: 'json', 
			  data : {UserId : UserId},
			  success: function(json){
					$("#UserId").val(json.UserId);
					$("#name").val(json.name);
					$("#mobile").val(json.mobile);
					$("#emailAddress").val(json.emailAddress);
					$("#courses").val(json.courseIds.split(","));
					$('#videoLocation').val(json.videoLocation);
					$('#startDate').val(json.startDate);
					$('#endDate').val(json.endDate);
					$('#password').val(json.password);
					$('select').select2();
					$("#action").val('update');
					$('#searchModal').openModal();
			  }
		});
	}
	
	$('.datepicker').datepicker({
		dateFormat: 'dd-mm-yy'
	});
	
	function blankUpdateForm() {
		$('#searchModal').openModal();
		$("#UserId").val('');
    	$("#name").val('');
        $("#action").val('add');
        $("#mobile").val('');
        $("#password").val('');
        $("#startDate").val('');
        $("#endDate").val('');
        $("#courses").val('');
        $("#errorMessage").text("");
        $('select').select2();
    	$('#emailAddress').val("");
	}
	
</script>
</html>