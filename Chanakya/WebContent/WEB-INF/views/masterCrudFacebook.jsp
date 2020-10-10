<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<link href="mainResources/minCss/hightop-font.css" media="all" rel="stylesheet" type="text/css" />
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="mainResources/stylesheets/font-awesome.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="mainResources/css/blue/jtable.css" rel="stylesheet" type="text/css">
	<link href="mainResources/minCss/style.css" media="all" rel="stylesheet" type="text/css" />
	
	<link type="text/css" rel="stylesheet" href="mainResources/css/materialize.min.css">
	<link type="text/css" rel="stylesheet" href="mainResources/css/jquery-ui.min.css"/>
	<script type="text/javascript" src="mainResources/js/jquery.js"></script>
	<script type="text/javascript" src="mainResources/js/jquery-ui.js"></script>
	<script type="text/javascript" src="mainResources/js/materialize.min.js"></script>
	
	<script src="mainResources/js/jtable.js" type="text/javascript"></script>
	
<style>

/* .jtable-command-column {
	display: none !important;
} */

	.sap {
		border-bottom: 1px solid rgba(128, 128, 128, 0.3);
		border-style: dashed;
		border-top: transparent;
		border-left: transparent;
		border-right: transparent;
	}
	.sec { /* border-bottom: 1px solid #007AFF;
	    border-radius: 4px; */
		
	}
	.jtable-command-column {
		display: none !important;
	}
	.jtable-toolbar-item-text {
		display: none !important;
	}
	.danger{
	    background-color: #D9534F;
	    border-color: #D9534F;
	    color: #fff;
	    cursor: pointer;
	}
	.btn:hover{
		background-color: #03a9f4;
	}
	.btn{
		background-color: #03a9f4;
	}
	.tabs .indicator {
		background-color: #03a9f4;
	}
	 li.active a{
  		background-color: #03a9f4;
  		color: white;
  	}
  	.row .row {
    	margin: 0 ; 
    }
    .tabs .indicator {
	    background-color: #E53935;
	}
	.dropdown-content {
		max-height: 200px;
	}
</style>
</head>
<body>
   <!-- Navigation -->
    <%@ include file="mainHeader.jsp"%>
    <br>
	<div class="row">
		<div class="col s12">
			<div id="facebookDiv" class="row">
				<div class="row">
					<div class="col s6">
						<h1 style="font-size:30px;"><i class="fa fa-patient-o"> Facebook</i></h1>	
					</div>
					<div class="col s6" style="padding-top: 30px;">						               
						<a class="btn right modal-trigger" href="#searchModal" onclick="blankUpdateForm()"><i class="fa fa-plus"></i>&nbsp; Add Facebook</a>
					</div>
				</div>
				<div class="row">
					<div class="col s12">
						<div class="searchResult" id="listFacebookContainer">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="searchModal" style="width: 70% !important;">
		<div class="modal-content">
			<div class="row" style="width:90%">
				<div class="col s12" style="padding: 0 0px;">
	    			<h4 style="font-size: 30px"><i class="fa fa-shield" style="color: #03a9f4"></i> Facebook</h4>
	    		</div>
			</div>
			<div class="row" style="width:90%">
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="groupName">Group Name</label>
						<input type="text" class="form-control input-sm" name="groupName" id="groupName" placeholder="Group Name">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="groupLink">Group Link</label>
						<input type="text" class="form-control input-sm" name="groupLink" id="groupLink" placeholder="Group Link">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="type">Type</label>
						<input type="text" class="form-control input-sm" name="type" id="type" placeholder="Type">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<select class="form-control input-sm" name="status" id="status">
						   	<option value="Active">Active</option>
						   	<option value="InActive">InActive</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row center">
				<div class="col s12">
					<br>
					<input type="hidden" id="action"><input type="hidden" id="facebookId">
					<input class="btn saveBtnColor" type="button" value="Update Facebook" onclick="updateFacebookDetail()">
		           	<button class="btn modal-close cancelBtnColor" type="button">Close</button>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	
	$(document).ready(function(){
	    $('ul.tabs').tabs();
	    $('.modal-trigger').leanModal();
	    $('select').material_select();
	 });
  
	$("#action").val('add');
	
	$(document).ready(function () {
	    $('#listFacebookContainer').jtable({
	        title: 'Facebook List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	        	createAction : 'addFacebook',
	            listAction: 'listFacebook',
	            deleteAction: 'deleteFacebook',
	            updateAction: 'editFacebook'
	        },
	        fields: {
	        	facebookId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'Facebook Id',
	            },
	            groupName: {
	                title: 'Group Name',
	            },
	            groupLink: {
	                title: 'Group Link',
	            },
	            type: {
	                title: 'Type',
	            },
	            status: {
	                title: 'Status',
	            },
	            action: {
	                title: 'Action',
	            }
	        },
	        recordAdded : function(event, data){
	        	
	        } 
	    });
	    //Load facebook list from server
	    $('#listFacebookContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    
	});
	
	function updateFacebookDetail() {
		if(document.getElementById("action").value.match("add")) {
			$('#listFacebookContainer').jtable('addRecord', {
			    record: {
			    	groupName:$("#groupName").val(),
			    	groupLink:$("#groupLink").val(),
			    	type:$("#type").val(),
			    	status:$("#status").val(),
			    },
			    success: function() {
					$('#listFacebookContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				}
			});
		}
		if(document.getElementById("action").value.match("update")) {
			$('#listFacebookContainer').jtable('updateRecord', {
			    record: {
			    	facebookId:$("#facebookId").val(),
			    	groupName:$("#groupName").val(),
			    	groupLink:$("#groupLink").val(),
			    	type:$("#type").val(),
			    	status:$("#status").val(),
			    },
			    success: function() {
					$('#listFacebookContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				}
			});
		}
	}
	
	function loadFacebookDetail(facebookId, groupName, groupLink, type, status) {
		$("#action").val('update');
		$('#searchModal').openModal();
		$("#facebookId").val(facebookId);
		$("#groupName").val(groupName);
		$("#groupLink").val(groupLink);
		$("#type").val(type);
        $("#status").val(status);
	}
	
	function blankUpdateForm() {
		$("#facebookId").val('');
		$("#groupName").val('');
    	$("#groupLink").val('');
    	$("#type").val('');
    	$("#status").val('');
        $("#action").val('add');
	}
</script>
</body>
</html>