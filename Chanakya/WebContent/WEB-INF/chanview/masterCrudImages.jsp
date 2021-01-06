<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp"%>
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
	<%@ include file="navigation.jsp"%>
	<main id="main" style="padding-top: 6%;">
	    <br>
		<div class="row11">
			<div class="col s12">
				<div id="ImagesDiv" class="row1">
					<div class="row1">
						<div class="col s6">
							<h1 style="font-size: 30px"><i class="fa fa-patient-o"> Images</i></h1>	
						</div>
						<div class="col s6" style="padding-top: 30px;">						               
							<a class="btn right modal-trigger" href="#searchModal" onclick="blankUpdateForm()"><i class="fa fa-plus"></i>&nbsp; Add Images</a>
						</div>
					</div>
					<div class="row1">
						<div class="col s12">
							<div class="searchResult" id="listImagesContainer">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal" id="searchModal" style="width: 70% !important;margin-left: 15%;">
			<form action="addImages" method="post" enctype="multipart/form-data">
			<div class="modal-content">
				<div class="row1" style="width:90%">
					<div class="col s12" >
		    			<h4 style="font-size: 30px"><i class="fa fa-shield" style="color: #03a9f4"></i> Images</h4>
		    		</div>
				</div>
				<div class="row1 " style="width:90%">
					<div class="col s12 danger" id="errorMessage" style="padding: 0 0px;">
		    		</div>
				</div>
				<div class="row1" style="width:90%">
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="description">description</label>
							<input type="text" class="form-control input-sm" name="description" id="description" placeholder="description">
							<input type="hidden" class="form-control input-sm" name="imageId" id="imageId" >
						</div>
					</div>
					
					<!-- <div class="input-field col s12 m6">
						<div class="form-group">
							<label for="name">URL</label>
							<input type="text" class="form-control input-sm" name="price" id="price" placeholder="Price">
						</div>
					</div> -->
					<div class="input-field col s12 m6">
						<div class="form-group">
							<label for="img">Select image:</label>
  							<input type="file" id="img" name="upload" accept="image/*">
						</div>
					</div>
				</div>
				<div class="row1 center">
					<div class="col s12">
						<br>
						<input type="hidden" id="action"><input type="hidden" id="imageId">
						<!-- <a class="btn addBtnColor" href="#" style="color: white;background-color: #5fcf80" onclick="updateImagesDetail()">
							<i class="fa fa-plus"></i>&nbsp; Update Details
						</a> -->
						<button class="btn cancelBtnColor" type="submit" > SAVE </button>
			           	<a class="btn cancelBtnColor" href="#" style="color: white;background-color: #e60d53" onclick="$('#searchModal').closeModal();">
			           		<i class="fa fa-close"></i>Close
			           	</a>
					</div>
				</div>
				</br>
			</div>
			</form>
		</div>
		</br>
	</main>
<c:set var="excludeBootstrapNjquery" value="true" ></c:set>
<%@ include file="footer.jsp"%>
</body>
<script type="text/javascript">
	
	$(document).ready(function(){
	    $('ul.tabs').tabs();
	    $('.modal-trigger').leanModal();
	    $('select').select2();
	 });
  
	$("#action").val('add');
	
	$(document).ready(function () {
	    $('#listImagesContainer').jtable({
	        title: 'Images List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	        	createAction : 'addImages',
	            listAction: 'listImages',
	            deleteAction: 'deleteImages',
	            updateAction: 'editImages'
	        },
	        fields: {
	        	imageId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'Images Id',
	            },
	            name: {
	                title: 'description',
	                width: '5%',
	            }/*,
	            price: {
	                title: 'Price',
	                width: '10%',
	            } ,
	            type: {
	                title: 'type',
	                width: '50%',
	            } */,
	            url: {
	                title: 'url',
	                width: '20%',
	                display: function (data) {
	                	console.log(data);
	                    return '<img src=${pageContext.request.contextPath}/' + data.record.url + ' style="width:60%;"/>';
	               }
	            },
	            
	            action: {
	                title: 'Action',
	                width: '5%',
	            }
	        },
	        recordAdded : function(event, data){
	        	
	        } 
	    });
	    //Load Images list from server
	    $('#listImagesContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    
	});
	
	function updateImagesDetail() {
		$("#errorMessage").text("");
		if(document.getElementById("action").value.match("add")) {
			/* $('#listImagesContainer').jtable('addRecord', {
			    record: {
			    	description:$("#description").val(),
			    	price:$("#price").val(),
			    	url:$("#url").val(),
			    	type:$("#type").val()
			    },
			    success: function() {
					$('#listImagesContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				},error: function (error) {
                    console.log(error);
                    $("#errorMessage").text(error.Message);
                    $(".ui-button.ui-corner-all.ui-widget")[0].click()

                }
			}); */
		}
		if(document.getElementById("action").value.match("update")) {
			$('#listImagesContainer').jtable('updateRecord', {
			    record: {
			    	imageId:$("#imageId").val(),
			    	description:$("#description").val(),
			    	url:$("#url").val(),
			    	action:'update',
			    	price:$("#price").val(),
			    	type:$("#type").val()
			    },
			    success: function() {
					$('#listImagesContainer').jtable('reload');
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
	
	function loadImagesDetail(imageId, description, type, url) {
		$("#action").val('update');
		$('#searchModal').openModal();
		$("#imageId").val(imageId);
		$("#description").val(description);
		$("#url").val(url);
		 $('select').select2();
	}
	
	function blankUpdateForm() {
		$("#imageId").val('');
    	$("#description").val('');
        $("#action").val('add');
        $("#url").val('');
        $("#errorMessage").text("");
        $('select').select2();
	}
</script>
</html>