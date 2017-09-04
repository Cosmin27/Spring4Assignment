<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true"%>
<html>
<head>
<title>About</title>
<link href="/assignment4spring/resources/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="header_wrapper">
		<div class="header">
			<div class="page_title">Assignment</div>
			<div class="main_menu">
				<a href="/assignment4spring/">Home</a> 
				<c:choose>
					<c:when test="${sessionScope.logged == true}" >
						<a href="/assignment4spring/friends">Friends</a>
						<a href="/assignment4spring/logout">Log out</a>
					</c:when>
					
					<c:otherwise>
						<a href="/assignment4spring/login">Login</a>
					</c:otherwise>
				</c:choose>
				<a href="/assignment4spring/about">About</a>
			</div>
		</div>
	</div>
	<div class="info_header_wrapper"></div>

	<div class="content_wrapper">
		<div class="content">
			<div>
				<div class="content-holder">
					<div class="padding_container">This is the "About" page of the assignment.</div>
				</div>
			</div>
		</div>

		<div class="info_footer_wrapper"></div>
		<div class="footer_wrapper">
			<div class="footer">
				<div class="copyright">Spring Session Breakout</div>
			</div>
		</div>
	</div>
	
	<script>
		var logged = ${sessionScope.logged};
		if(logged == true){
			var usernameString = "${sessionScope.usernameString}";
		}
		else {
			var usernameString = "";
		}
	</script>
</body>
</html>
