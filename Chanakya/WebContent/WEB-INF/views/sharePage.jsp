<script src="${pageContext.request.contextPath}/homeResources/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/messageBoard/share/js/jumboShare.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/messageBoard/share/css/jumboShare.css" />

<div id="jumboShare"style="height: 145px;"></div>
<script>
	$(document).ready(function() {
		//alert(window.location.href);
		$("#jumboShare").jumboShare({
			url : window.location.href
		});
	});
</script>
