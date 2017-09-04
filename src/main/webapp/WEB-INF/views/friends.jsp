<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page session="true"%>
<html>
<head>
<title>Friends</title>
<link href="/assignment4spring/resources/style.css" rel="stylesheet"
	type="text/css" />
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="/assignment4spring/resources/userSearch.js"></script>
</head>
<body>
	<div class="header_wrapper">
		<div class="header">
			<div class="page_title">Assignment</div>
			<div class="main_menu">
				<a href="/assignment4spring/">Home</a>
				<c:choose>
					<c:when test="${sessionScope.logged == true}">
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
					<div class="padding_container">
					<div class="search_container">
						<form action="" method="POST" id="messageForm">
										<table>

											<tr>
												<td><label class="artist_form_label">Search for: 
												</label></td>
												<td><input size="90" type="text" id="userSearch"
													class="vertical_middle" name="userSearch"/></td>
												

											</tr>
										</table>
									</form>
						<br>
						<div id="searchResults">
							
						</div>
						<br>
					</div>
						<c:forEach var="usersList" items="${users}">
									<c:set var="hasFriend" value="false"> 
									</c:set>
									
									<c:forEach var="element" items="${sessionScope.userAccount.friends}">
										<c:if test="${element.username == usersList.username}">
											<c:set var="hasFriend" value="true" />
											
										</c:if>
										
									
									</c:forEach>
									
										<c:choose>
											<c:when test="${hasFriend == true && sessionScope.userAccount.username != usersList.username}">
												<div class="list_items">
												
												
												<div class="button-wrapper">
													<div class="button_holder">
														<span class="bold_font"> ${usersList.username} </span>
														<a class= "fct_btn" href="unfollowUser/${usersList.username}">Unfollow</a>
														</div>
													
												</div>
												
											</div>
											</c:when>
											<c:when test="${hasFriend == false && sessionScope.userAccount.username != usersList.username}">
												<div class="list_items"><div class="button-wrapper">
													
													
													<div class="button_holder">
														<span class="bold_font"> ${usersList.username} </span>
														<a class= "fct_btn" href="followUser/${usersList.username}">Follow</a>
														</div>
													
												</div></div>
											</c:when>
										</c:choose>
									
								
							
						</c:forEach>
					</div>
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
		loadInitialList();
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
