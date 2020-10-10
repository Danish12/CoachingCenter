<%@ page import="java.util.ResourceBundle"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%
	ResourceBundle resource = ResourceBundle.getBundle("application");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title><%=resource.getString("title") %></title>
    <meta name="keywords" content="content publishing platform, publish your blog, where do guest blogging, 
    create back links">
	<meta name="description" content="<%=resource.getString("metaDescription") %>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<link rel="alternate" href="http://<%=resource.getString("name") %>.com" hreflang="en-us" />
	<link rel="icon" type="image/ico" href="${pageContext.request.contextPath}/homeResources/images/favicon.png">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/font-awesome-4.5.0/css/font-awesome.min.css">
	<link href="https://plus.google.com/104800969883924028037v" rel="publisher">
	<!--Import materialize.css-->
	<link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homeResources/css/materialize.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/jquery-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homeResources/js/materialize.min.js"></script>
</head>
<style>
	.row{
		margin-bottom: 8px !important;
	}
	h1{
		padding-top:1%;
		font-size:40px;
		color:black;
	}
	p{
		text-align: justify;
		
	}
	h2{
		font-size: 1.8em;
		color:black;
		text-align: left;
	}
	
	ulDisc{
		padding-left: 26px !important;
		list-style-type:disc !important;
	}
	liDisc{
		padding-bottom: 10px !important;
		padding-left: 20px !important;
	}
</style>
<body>
	<%@ include file="homeHeader.jsp"%>
	<br><br>
	<div class="container" style="width:90%;">
		<div class="row">
			<div class="col s12 center">
				<h1>Privacy Policy</h1>
			</div>
			<div class="col s12">
				<p>
					Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or
					otherwise handle your Personally Identifiable Information in accordance with our website.
				</p>
			</div>
			<div class="col s12">
				<h2>What personal information do we collect from the people that visit our blog, website or app?</h2>
				
				<p>When ordering or registering on our site, as appropriate, you may be asked to enter your name, email
				 	address, mailing address, phone number, or other details to help you with your experience.
				 </p>
			</div>
			<div class="col s12">
				<h2>When do we collect information?</h2>
				<p>We collect information from you when you register on our site, fill out a form or enter information on our site.
				 </p>
			</div>
			<div class="col s12">
				<h2>How do we use your information?</h2>
				<p>We may use the information we collect from you when you register, make a purchase, sign up for our newsletter,
					respond to a survey or marketing communication, surf the website, or use certain other site features in the following ways: </p>
				<ul style="list-style-type: disc;padding-left: 26px">
					<li style="list-style-type: disc;padding-left: 20px">To personalize user's experience and to allow us to deliver the type of content and product offerings in which you 
						are most interested.</li>
					<li style="list-style-type: disc;padding-left: 20px">To allow us to better service you in responding to your customer service requests.</li>
				</ul>
			</div>
			<div class="col s12">
				<h2>How do we protect visitor information?</h2>
				<p>Our website is scanned on a regular basis for security holes and known vulnerabilities in order to make your visit to
					 our site as safe as possible.
				 </p>
			</div>
			<div class="col s12">
				<h2>We use regular Malware Scanning.</h2>
				<p>Your personal information is contained behind secured networks and is only accessible by a limited number of persons
				   who have special access rights to such systems, and are required to keep the information confidential. In addition,
				   all sensitive/credit information you supply is encrypted via Secure Socket Layer (SSL) technology.
				 </p>
				 <p>We implement a variety of security measures when a user enters, submits, or accesses their information to maintain 
				 	the safety of your personal information.
				 </p>
				 <p>All transactions are processed through a gateway provider and are not stored or processed on our servers.
				 </p>
			</div>
			<div class="col s12">
				<h2>Do we use 'cookies'?</h2>
				<p>Yes. Cookies are small files that a site or its service provider transfers to your computer's hard drive through your
					Web browser (if you allow) that enables the site's or service provider's systems to recognize your browser and capture and 
					remember certain information. For instance, we use cookies to help us remember and process the items in your shopping cart. 
					They are also used to help us understand your preferences based on previous or current site activity, which enables us to provide 
					you with improved services. We also use cookies to help us compile aggregate data about site traffic and site interaction so that 
					we can offer better site experiences and tools in the future.
				 </p>
				 <p>We use cookies to: </p>
				 	 <ul style="list-style-type: disc;padding-left: 26px">
					 	<li style="list-style-type: disc;padding-left: 20px">Understand and save user's preferences for future visits.</li>
					 	<li style="list-style-type: disc;padding-left: 20px">Keep track of advertisements.</li>
					 	<li style="list-style-type: disc;padding-left: 20px">Compile aggregate data about site traffic and site interactions in order 
					 	to offer better site experiences and tools in the future. We may also use trusted third-party services that track this 
					 	information on our behalf.</li>
					 </ul>
				
				 <p>You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies.
				 	 You do this through your browser (like Internet Explorer) settings. Each browser is a little different, so look at your browser's 
				 	 Help menu to learn the correct way to modify your cookies.
				 </p>
				 <p>If you disable cookies off, some features will be disabled It won't affect the user's experience that make your site experience 
				 	more efficient and some of our services will not function properly.
				 </p>
				 <p>However, you can still book appointments.
				 </p>
			</div>
			<div class="col s12">
				<h2>Third-party disclosure</h2>
				<p>We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information unless we 
					provide users with advance notice. This does not include website hosting partners and other parties who assist us in operating
					our website, conducting our business, or serving our users, so long as those parties agree to keep this information confidential.
					We may also release information when it's release is appropriate to comply with the law, enforce our site policies, or protect 
					ours or others rights, property, or safety.
				 </p>
				 <p>However, non-personally identifiable visitor information may be provided to other parties for marketing, advertising, or other uses.
				 </p>
			</div>
			<div class="col s12">
				<h2>Third-party links</h2>
				<p>We do not include or offer third-party products or services on our website.
				 </p>
			</div>
			<div class="col s12">
				<h2>Google</h2>
					<p style="padding-left: 13px">Google's advertising requirements can be summed up by Google's Advertising Principles. They are put in place to provide a 
					positive experience for users. <br>
					<a class="center" title="Google Support" href="https://support.google.com/adwordspolicy/answer/1316548?hl=en">
					https://support.google.com/adwordspolicy/answer/1316548?hl=en</a>
				 </p>
				 <p style="padding-left: 13px">We have not enabled Google AdSense on our site but we may do so in the future.</p>
			</div>
			<div class="col s12">
				<h2>Fair Information Practices</h2>
				<p>The Fair Information Practices Principles form the backbone of privacy law in the United States and the concepts they 
					include have played a significant role in the development of data protection laws around the globe. Understanding the 
					Fair Information Practice Principles and how they should be implemented is critical to comply with the various privacy 
					laws that protect personal information.
				 </p>
				 <p>In order to be in line with Fair Information Practices we will take the following responsive action, should a data breach occur:</p>
				 <p>We will notify the users via email</p>
				 	<ul style="list-style-type: disc;padding-left: 26px">
				 		<li style="list-style-type: disc;padding-left: 20px">Within 1 business day</li>
				 	</ul>
				 
				  <p>We also agree to the Individual Redress Principle, which requires that individuals have a right to pursue legally enforceable
				   	rights against data collectors and processors who fail to adhere to the law. This principle requires not only that individuals
				    have enforceable rights against data users, but also that individuals have recourse to courts or government agencies to
				    investigate and/or prosecute non-compliance by data processors.</p>
			</div>
			<div class="col s12">
				<h2>CAN SPAM Act</h2>
				<p>The CAN-SPAM Act is a law that sets the rules for commercial email, establishes requirements for commercial messages, 
					gives recipients the right to have emails stopped from being sent to them, and spells out tough penalties for violations.
				 </p>
				 <p>We collect your email address in order to: </p>
				 <ul style="list-style-type: disc;padding-left: 26px">
				 	<li style="list-style-type: disc;padding-left: 20px">Send information, respond to inquiries, and/or other requests or questions.</li>
				 </ul>
				 <p>To be in accordance with CANSPAM we agree to the following: </p>
				 <ul style="list-style-type: disc;padding-left: 26px">
				 	<li style="list-style-type: disc;padding-left: 20px">NOT use false or misleading subjects or email addresses.</li>
				 	<li style="list-style-type: disc;padding-left: 20px">Identify the message as an advertisement in some reasonable way.</li>
				 	<li style="list-style-type: disc;padding-left: 20px">Include the physical address of our business or site headquarters.</li>
				 	<li style="list-style-type: disc;padding-left: 20px">Monitor third-party email marketing services for compliance, if one is used.</li>
				 	<li style="list-style-type: disc;padding-left: 20px">Honor opt-out/unsubscribe requests quickly.</li>
				 	<li style="list-style-type: disc;padding-left: 20px">Allow users to unsubscribe by using the link at the bottom of each email.</li>
				 </ul>
				 <p>If at any time you would like to unsubscribe from receiving future emails, you can email us at</p>
			 	<ul style="list-style-type: disc;padding-left: 26px">
			 		<li style="list-style-type: disc;padding-left: 20px">Follow the instructions at the bottom of each email.</li>
			 		<li style="list-style-type: disc;padding-left: 20px">and we will promptly remove you from ALL correspondence.</li>
			 	</ul>
			</div>
			<div class="col s12">
				<h2>Contact Us</h2>
				<p>If there are any questions regarding this privacy policy you may contact us using the information below.
			 	</p>
			 	<p><%=resource.getString("care") %></p>
			 </div>
		</div>
	</div>
	<%@ include file="homeFooter.jsp"%>
</body>
</html>