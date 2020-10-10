<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<meta name="description" content="Fagnum is a content publishing platform for startups and leaderboards">
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
			<div id="leaderboardDiv" class="row">
				<div class="row">
					<div class="col s6">
						<h1 style="font-size: 30px"><i class="fa fa-patient-o"> Leaderboard</i></h1>	
					</div>
					<div class="col s6" style="padding-top: 30px;">						               
						<a class="btn right modal-trigger" href="#searchModal" onclick="blankUpdateForm()"><i class="fa fa-plus"></i>&nbsp; Add Leaderboard</a>
					</div>
				</div>
				<div class="row">
					<div class="col s12">
						<div class="searchResult" id="listLeaderboardContainer">
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
	    			<h4 style="font-size: 30px"><i class="fa fa-shield" style="color: #03a9f4"></i> Leaderboard</h4>
	    		</div>
			</div>
			<div class="row" style="width:90%">
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="contestNumber">Contest Number</label>
						<input type="text" class="form-control input-sm" name="contestNumber" id="contestNumber" placeholder="Contest Number">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="blogId">Blog</label>
						<input type="text" class="form-control input-sm" name="blogId" id="blogId" placeholder="Blog">
					</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="share">Share</label>
				        <input type="text" class="form-control input-sm" name="share" id="share" placeholder="Share">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="view">View</label>
				        <input type="text" class="form-control input-sm" name="view" id="view" placeholder="View">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="averageTime">Average Time</label>
				        <input type="text" class="form-control input-sm" name="averageTime" id="averageTime" placeholder="Average Time">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="critics">Critics</label>
				        <input type="text" class="form-control input-sm" name="critics" id="critics" placeholder="Critics">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="referral">Referral</label>
				        <input type="text" class="form-control input-sm" name="referral" id="referral" placeholder="Referral">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="awardedMoney">Awarded Money</label>
				        <input type="text" class="form-control input-sm" name="awardedMoney" id="awardedMoney" placeholder="Awarded Money">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="standing">Standing</label>
				        <input type="text" class="form-control input-sm" name="standing" id="standing" placeholder="Standing">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<select class="form-control input-sm" name="status" id="status">
						   	<option>Active</option>
						   	<option>InActive</option>
						</select>
					</div>
				</div>
			</div>
			<div class="row center">
				<div class="col s12">
					<br>
					<input type="hidden" id="action"><input type="hidden" id="leaderboardId">
					<input class="btn saveBtnColor" type="button" value="Update Details" onclick="updateLeaderboardDetail()">
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
	    $('#listLeaderboardContainer').jtable({
	        title: 'Leaderboard List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	        	createAction : 'addLeaderboard',
	            listAction: 'listLeaderboard',
	            deleteAction: 'deleteLeaderboard',
	            updateAction: 'editLeaderboard'
	        },
	        fields: {
	        	leaderboardId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'BLOGGER_ID',
	            },
	            contestNumber: {
	                title: 'Contest Number',
	            },
	            title: {
	                title: 'Title',
	            },
	            share: {
	                title: 'Shares',
	            },
	            view: {
	                title: 'Views',
	            },
	            averageTime: {
	                title: 'Average Time',
	            },
	            critics: {
	                title: 'Critics',
	            },
	            referral: {
	                title: 'Referral',
	            },
	            point: {
	                title: 'Points',
	            },
	            awardedMoney: {
	                title: 'Awarded Money',
	            },
	            standing: {
	                title: 'Standing',
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
	    //Load leaderboard list from server
	    $('#listLeaderboardContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    
	});
	
	function updateLeaderboardDetail() {
		if(document.getElementById("action").value.match("add")) {
			$('#listLeaderboardContainer').jtable('addRecord', {
			    record: {
			    	blogId:$("#blogId").val(),
			    	share:$("#share").val(),
			    	view:$("#view").val(),
			    	critics:$("#critics").val(),
			    	averageTime:$("#averageTime").val(),
			    	referral:$("#referral").val(),
			    	status:$("#status").val(),
			    	contestNumber:$("#contestNumber").val(),
			    	awardedMoney:$("#awardedMoney").val(),
			    	standing:$("#standing").val(),
			    },
			    success: function() {
					$('#listLeaderboardContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				}
			});
		}
		if(document.getElementById("action").value.match("update")) {
			$('#listLeaderboardContainer').jtable('updateRecord', {
			    record: {
			    	leaderboardId:$("#leaderboardId").val(),
			    	blogId:$("#blogId").val(),
			    	share:$("#share").val(),
			    	view:$("#view").val(),
			    	critics:$("#critics").val(),
			    	averageTime:$("#averageTime").val(),
			    	referral:$("#referral").val(),
			    	status:$("#status").val(),
			    	contestNumber:$("#contestNumber").val(),
			    	awardedMoney:$("#awardedMoney").val(),
			    	standing:$("#standing").val(),
			    },
			    success: function() {
					$('#listLeaderboardContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				}
			});
		}
	}
	
	function loadLeaderboardDetail(leaderboardId, share, view, status, blogId, critics, referral, awardedMoney, contestNumber, averageTime, standing) {
		$("#action").val('update');
		$('#searchModal').openModal();
		$("#leaderboardId").val(leaderboardId);
		$("#share").val(share);
		$("#view").val(view);
		$("#critics").val(critics);
		$("#averageTime").val(averageTime),
		$("#referral").val(referral);
        $("#status").val(status);
        $("#contestNumber").val(contestNumber),
    	$("#awardedMoney").val(awardedMoney),
    	$("#standing").val(standing),
        $("#blogId").val(blogId);
	}
	
	function blankUpdateForm() {
		$("#leaderboardId").val('');
    	$("#blogId").val('');
    	$("#share").val('');
    	$("#view").val('');
    	$("#averageTime").val('');
    	$("#critics").val('');
    	$("#referral").val('');
    	$("#contestNumber").val(''),
    	$("#awardedMoney").val(''),
    	$("#standing").val(''),
        $("#action").val('add');
	}
</script>
</body>
</html>