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
    <%@ include file="mainHeader.jsp"%>
    <div class="row" style="width: 95%">
		<div class="col s6">
			<h1 style="font-size: 30px;"><i class="fa fa-patient-o"> </i>Blogger</h1>	
		</div>
		<div class="col s6 right-align"  style="padding-top: 30px;">						               
			<a class="btn right modal-trigger" href="#searchModal" onclick="blankUpdateForm()"><i class="fa fa-plus"></i>&nbsp; Add Blogger</a>
		</div>
	</div>
	<div class="row" style="width: 95%;">
		<div class="col s3">
			<input type="text" class="form-control" name="name" id="bloggerName" placeholder="Name"/>
		</div>
		<div class="col s3">
			<input type="text" class="form-control" name="emailId" id="bloggerEmailId" placeholder="Email Id"/>
		</div>
		<div class="col s3">
			<input type="text" class="form-control" name="city" id="bloggerCity" placeholder="City"/>
		</div>
		<div class="col s3">
			<input type="button" class="btn" name="search" title="Search" value="Search" id="search"/>
		</div>
	</div>
	<div class="row" style="padding: 0 10px;">
		<div class="col s12">
			<div class="searchResult" id="listBloggerContainer"></div>
		</div>
	</div>
	<div class="modal" id="searchModal" style="width: 70% !important;">
		<div class="modal-content">
			<div class="row" style="width:90%">
				<div class="col s12" style="padding: 0 0px;">
	    			<h4 style="font-size: 30px"><i class="fa fa-shield" style="color: #03a9f4"></i> Blogger</h4>
	    		</div>
			</div>
			<div class="row" style="width:90%">
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="name">Name</label>
						<input type="text" class="form-control input-sm" name="name" id="name" placeholder="Name">
					</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="url">Url</label>
				        <input type="text" class="form-control input-sm" name="url" id="url" placeholder="URl">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="emailId">Email Id</label>
				        <input type="text" class="form-control input-sm" name="emailId" id="emailId" placeholder="Email Id">
				   	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="contactNumber">Contact Number</label>
				        <input type="text" class="form-control input-sm" name="contactNumber" id="contactNumber" placeholder="Contact Number">
				  	</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="gender">Gender</label>
				        <input type="text" class="form-control input-sm" name="gender" id="gender" placeholder="Gender">
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
				       	<label for="city">City</label>
				        <input type="text" class="form-control input-sm" name="city" id="city" placeholder="City">
					</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="profilePic">Profile Pic</label>
				        <input type="text" class="form-control input-sm" name="profilePic" id="profilePic" placeholder="Profile Pic">
					</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
				       	<label for="facebookProfile">Facebook Profile</label>
				        <input type="text" class="form-control input-sm" name="facebookProfile" id="facebookProfile" placeholder="Facebook Profile">
					</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
					   	<label for="linkedinProfile">LinkedIn Profile</label>
					    <input type="text" class="form-control input-sm" name="linkedinProfile" id="linkedinProfile" placeholder="Linkedin Profile">
					</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
					   	<label for="twitterProfile">Twitter Profile</label>
					    <input type="text" class="form-control input-sm" name="twitterProfile" id="twitterProfile" placeholder="Twitter Profile">
					</div>
				</div>
				<div class="input-field col s12 m6">
				   	<div class="form-group">
					   	<label for="blogLink">Blog Link</label>
					    <input type="text" class="form-control input-sm" name="blogLink" id="blogLink" placeholder="Blog Link">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="joiningDate">Joining Date</label>
						<input type="text" class="form-control input-sm" name="joiningDate" id="joiningDate" placeholder="Joining Date">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="leavingDate">Leaving Date</label>
						<input type="text" class="form-control input-sm" name="leavingDate" id="leavingDate" placeholder="Leaving Date">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="bio">Bio</label>
						<input type="text" class="form-control input-sm" name="bio" id="bio" placeholder="Bio">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="referredBy">Referred By</label>
						<input type="text" class="form-control input-sm" name="referredBy" id="referredBy" placeholder="Referred By">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="metaKeyword">Meta Keyword</label>
						<input type="text" class="form-control input-sm" name="metaKeyword" id="metaKeyword" placeholder="Meta Keyword">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="review">Review</label>
						<input type="text" class="form-control input-sm" name="review" id="review" placeholder="Review">
					</div>
				</div>
				<div class="input-field col s12 m6">
					<div class="form-group">
						<label for="promote">Promote</label>
						<input type="text" class="form-control input-sm" name="promote" id="promote" placeholder="Promote">
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
					<input type="hidden" id="action"><input type="hidden" id="bloggerId">
					<input class="btn saveBtnColor" type="button" value="Update Details" onclick="updateBloggerDetail()">
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
	
	$('#leavingDate').datepicker({
	    dateFormat: 'dd-M-yy',
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '2016:2020'
	});
	$('#joiningDate').datepicker({
	    dateFormat: 'dd-M-yy',
	    changeMonth: true,
	    changeYear: true,
	    yearRange: '2016:2020'
	});
	
	$(document).ready(function () {
	    $('#listBloggerContainer').jtable({
	        title: 'Blogger List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	        	createAction : 'addBlogger',
	            listAction: 'listBlogger',
	            deleteAction: 'deleteBlogger',
	            updateAction: 'editBlogger'
	        },
	        fields: {
	        	bloggerId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'BLOGGER_ID',
	            },
	            name: {
	                title: 'Name',
	            },
	            url: {
	                title: 'URL',
	            },
	            emailId: {
	                title: 'Email Id',
	            },
	            contactNumber: {
	                title: 'Contact Number',
	            },
	            gender: {
	                title: 'Gender',
	            },
	            type: {
	                title: 'Type',
	            },
	            city: {
	                title: 'City',
	            },
	            profilePic: {
	                title: 'Profile Pic',
	            },
	            facebookProfile: {
	                title: 'Facebook Profile',
	            },
	            linkedinProfile: {
	                title: 'Linkedin Profile',
	            },
	            twitterProfile: {
	                title: 'Twitter Profile',
	            },
	            blogLink: {
	                title: 'Blog Link',
	            },
	            joiningDate: {
	                title: 'Joining Date',
	            },
	            leavingDate: {
	                title: 'Leaving Date',
	            },
	            metaKeyword: {
	                title: 'Meta Keyword',
	            },
	            promote: {
	                title: 'Promote',
	            },
	            review: {
	                title: 'Review',
	            },
	            referredBy: {
	                title: 'Referred By',
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
	    //Load blogger list from server
	    $('#listBloggerContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    $('#search').click(function (e) {
            e.preventDefault();
            $('#listBloggerContainer').jtable('load', {
                name: "name,emailId,city",
                value: $('#bloggerName').val()+","+$('#bloggerEmailId').val()+","+$('#bloggerCity').val(),
            });
        });	
	    
	});
	
	function updateBloggerDetail() {
		if(document.getElementById("action").value.match("add")) {
			$('#listBloggerContainer').jtable('addRecord', {
			    record: {
			    	name:$("#name").val(),
			    	url:$("#url").val(),
			    	city:$("#city").val(),
			    	contactNumber:$("#contactNumber").val(),
			    	emailId:$("#emailId").val(),
			    	bio:$("#bio").val(),
			    	profilePic:$("#profilePic").val(),
			    	linkedinProfile:$("#linkedinProfile").val(),
			    	facebookProfile:$("#facebookProfile").val(),
			    	twitterProfile:$("#twitterProfile").val(),
			    	blogLink:$("#blogLink").val(),
			    	metaKeyword:$("#metaKeyword").val(),
			    	joiningDate:$("#joiningDate").val(),
			    	referredBy:$("#referredBy").val(),
			    	status:$("#status").val(),
			    	leavingDate:$("#leavingDate").val(),
			    	type:$("#type").val(),
			    	review:$("#review").val(),
			    	gender:$("#gender").val(),
			    	promote:$("#promote").val(),
			    },
			    success: function() {
					$('#listBloggerContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				}
			});
		}
		if(document.getElementById("action").value.match("update")) {
			$('#listBloggerContainer').jtable('updateRecord', {
			    record: {
			    	bloggerId:$("#bloggerId").val(),
			    	name:$("#name").val(),
			    	url:$("#url").val(),
			    	city:$("#city").val(),
			    	contactNumber:$("#contactNumber").val(),
			    	emailId:$("#emailId").val(),
			    	bio:$("#bio").val(),
			    	profilePic:$("#profilePic").val(),
			    	linkedinProfile:$("#linkedinProfile").val(),
			    	facebookProfile:$("#facebookProfile").val(),
			    	twitterProfile:$("#twitterProfile").val(),
			    	blogLink:$("#blogLink").val(),
			    	metaKeyword:$("#metaKeyword").val(),
			    	joiningDate:$("#joiningDate").val(),
			    	referredBy:$("#referredBy").val(),
			    	status:$("#status").val(),
			    	leavingDate:$("#leavingDate").val(),
			    	type:$("#type").val(),
			    	review:$("#review").val(),
			    	gender:$("#gender").val(),
			    	promote:$("#promote").val(),
			    },
			    success: function() {
					$('#listBloggerContainer').jtable('reload');
					$('#searchModal').closeModal();
					$("#mes").hide();
					blankUpdateForm();
				}
			});
		}
	}
	
	function loadBloggerDetail(bloggerId) {
		$.post('oneBlogger',{
			 callFrom:'ajaxCall',
			 bloggerId:bloggerId,
			 async: false,
		},
		function(data) {
			$("#action").val('update');
			var result = eval(data);
			var bloggerData = eval(result[0].blogger);
			if(bloggerData.length > 0) {
				$('#searchModal').openModal();
				for(var i=0; i<bloggerData.length; i++) {
					$("#bloggerId").val(bloggerData[i].bloggerId);
					$("#name").val(bloggerData[i].name);
					$("#url").val(bloggerData[i].url);
					$("#city").val(bloggerData[i].city);
			        $("#status").val(bloggerData[i].status);
			        $("#emailId").val(bloggerData[i].emailId);
			        $("#contactNumber").val(bloggerData[i].contactNumber);
			        $("#bio").val(bloggerData[i].bio);
			        $("#profilePic").val(bloggerData[i].profilePic);
			        $("#linkedinProfile").val(bloggerData[i].linkedinProfile);
			        $("#twitterProfile").val(bloggerData[i].twitterProfile);
			        $("#blogLink").val(bloggerData[i].blogLink);
			        $("#metaKeyword").val(bloggerData[i].metaKeyword);
			        $("#facebookProfile").val(bloggerData[i].facebookProfile);
			        $("#joiningDate").val(bloggerData[i].joiningDate);
			        $("#leavingDate").val(bloggerData[i].leavingDate);
			        $("#referredBy").val(bloggerData[i].referredBy);
			        $("#type").val(bloggerData[i].type);
			        $("#review").val(bloggerData[i].review);
			        $("#gender").val(bloggerData[i].gender);
			        $("#promote").val(bloggerData[i].promote);
				}
			}
		}
		);
	}
	
	function blankUpdateForm() {
		$("#bloggerId").val('');
    	$("#name").val('');
    	$("#url").val('');
    	$("#city").val('');
    	$("#contactNumber").val('');
        $("#emailId").val('');
        $("#bio").val('');
        $("#profilePic").val('');
        $("#linkedinProfile").val('');
        $("#facebookProfile").val('');
        $("#twitterProfile").val('');
        $("#blogLink").val('');
        $("#metaKeyword").val('');
        $("#joiningDate").val('');
        $("#leavingDate").val('');
        $("#referredBy").val('');
        $("#type").val('');
    	$("#review").val('');
    	$("#gender").val('');
    	$("#promote").val('');
        $("#action").val('add');
	}
</script>
</body>
</html>