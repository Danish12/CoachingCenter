<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../header.jsp"%>
<link href="mainResources/css/font-awesome-4.5.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />

<link type="text/css" rel="stylesheet" href="mainResources/css/jquery-ui.min.css"/>
<script type="text/javascript" src="mainResources/js/jquery.js"></script>
<script type="text/javascript" src="mainResources/js/jquery-ui.js"></script>

<script src="mainResources/js/jtable.js" type="text/javascript"></script>
<link href="mainResources/css/blue/jtable.css" rel="stylesheet" type="text/css">

<!-- <link type="text/css" rel="stylesheet" href="mainResources/css/materialize.min.css"> -->
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
				<div id="subjectDiv" class="row1">
					<div class="row1">
						<div class="col s6">
							<h1 style="font-size: 30px"><i class="fa fa-patient-o"> Subject</i></h1>	
						</div>
						<div class="col s6" style="padding-top: 30px;">						               
							<a class="btn right modal-trigger" href="#searchModal" onclick="blankUpdateForm()"><i class="fa fa-plus"></i>&nbsp; Add Subject</a>
						</div>
					</div>
					<div class="row1">
						<div class="col s12">
							<div class="searchResult" id="listSubjectContainer">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="searchModal" style="width: 70% !important; margin-left: 15%;">
			<div class="modal-content">
				<div class="row1" style="width:90%">
					<div class="col s12">
		    			<h4 style="font-size: 30px"><i class="fa fa-shield" style="color: #03a9f4"></i> Subject</h4>
		    		</div>
				</div>
				<div class="row1" style="width:90%">
					<div class="col s12 danger" id="errorMessage" style="padding: 0 0px;">
		    		</div>
				</div>
				<div class="row1" style="width:90%">
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="name">Name</label>
							<input type="text" class="form-control input-sm" name="name" id="name" placeholder="Name">
							<input type="hidden" class="form-control input-sm" name="subjectId" id="subjectId" >
						</div>
					</div>
				</div>
				<div class="row1 center">
					<div class="col s12">
						<input type="hidden" id="action"><input type="hidden" id="subjectId">
						<input class="btn saveBtnColor" type="button" value="Update Details" onclick="updateSubjectDetail()">
			           	<button class="btn modal-close cancelBtnColor" type="button">Close</button>
					</div>
					<br>
				</div>
			</div>
		</div>
	</main>
<c:set var="excludeBootstrapNjquery" value="true" ></c:set>
<%@ include file="../footer.jsp"%>
<script type="text/javascript">
	
	$(document).ready(function(){
	    $('ul.tabs').tabs();
	    $('.modal-trigger').leanModal();
	    $('select').material_select();
	 });
  
	$("#action").val('add');
	
	$(document).ready(function () {
	    $('#listSubjectContainer').jtable({
	        title: 'Subject List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	        	createAction : 'addSubject',
	            listAction: 'listSubject',
	            deleteAction: 'deleteSubject',
	            updateAction: 'editSubject'
	        },
	        fields: {
	        	SubjectId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'Subject Id',
	            },
	            name: {
	                title: 'Name',
	                width: '80%',
	            },
	            action: {
	                title: 'Action',
	                width: '20%',
	            }
	        },
	        recordAdded : function(event, data){
	        	
	        } 
	    });
	    //Load Subject list from server
	    $('#listSubjectContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    
	});
	
	function updateSubjectDetail() {
		$("#errorMessage").text("");
		if(document.getElementById("action").value.match("add")) {
			$('#listSubjectContainer').jtable('addRecord', {
			    record: {
			    	name:$("#name").val(),
			    	url:$("#url").val(),
			    	status:$("#status").val(),
			    	subjects:$("#subjects").val()
			    },
			    success: function() {
					$('#listSubjectContainer').jtable('reload');
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
			$('#listSubjectContainer').jtable('updateRecord', {
			    record: {
			    	SubjectId:$("#subjectId").val(),
			    	name:$("#name").val(),
			    	url:$("#url").val(),
			    	status:$("#status").val(),
			    	subjects:$("#subjects").val()
			    },
			    success: function() {
					$('#listSubjectContainer').jtable('reload');
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
	
	function loadSubjectDetail(subjectId, name, url) {
		$("#action").val('update');
		$('#searchModal').openModal();
		$("#subjectId").val(subjectId);
		$("#name").val(name);
		$("#url").val(url);
	}
	
	function blankUpdateForm() {
		$("#subjectId").val('');
    	$("#name").val('');
    	$("#url").val('');
        $("#action").val('add');
        $("#errorMessage").text("");
	}
</script>
</body>
</html>