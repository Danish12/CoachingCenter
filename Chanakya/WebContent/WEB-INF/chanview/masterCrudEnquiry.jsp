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
	<%@ include file="navigation.jsp"%>
	
	<main id="main" style="padding-top: 6%;">
	    <br>
		<div class="row11">
			<div class="col s12">
				<div id="courseDiv" class="row1">
					<div class="row1">
						<div class="col s6">
							<h1 style="font-size: 30px"><i class="fa fa-patient-o"> Enquiry</i></h1>	
						</div>
					</div>
					<div class="row1">
						<div class="col s12">
							<div class="searchResult" id="listVideoContainer">
							</div>
						</div>
					</div>
				</div>
			</div>
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
  
	$(document).ready(function () {
	    $('#listVideoContainer').jtable({
	        title: 'Course List',
	        paging: true, //Enable paging
	        pageSize: 10, //Set page size (default: 10)
	        sorting: true, //Enable sorting
	        defaultSorting: 'Name ASC', //Set default sorting
	        actions: {
	            listAction: 'listEnquiry'
	        },
	        fields: {
	        	EnquiryId: {
	                key: true,
	                create: false,
	                edit: false,
	                list: false,
	                title: 'Enquiry Id',
	            },
	            name: {
	                title: 'Name',
	                width: '20%',
	            },
	            date: {
	                title: 'Date',
	                width: '20%',
	            },
	            contactNumber: {
	                title: 'ContactNumber',
	                width: '10%',
	            },
	            emailId: {
	                title: 'Email ID',
	                width: '30%',
	            }
	        },
	        recordAdded : function(event, data){
	        	
	        } 
	    });
	    //Load Course list from server
	    $('#listVideoContainer').jtable('load', function(){
	    	$(".jtable-toolbar-item-add-record").hide();	
	    });
	    
	});
	
	
</script>
</html>