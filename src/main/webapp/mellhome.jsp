<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Homepage</title>
		<link rel="stylesheet" href="mellhome.css">
		
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Ranga">
		<!--     <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito"> -->
		<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200&display=swap" rel="stylesheet">
		<link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png" />

	</head>

	<body onLoad="test();">

		<nav class="navtopbar">
			<div class="topbar">
				<div class="toplogo">
					<div class="toplogo-container">
						<a href="mellhome.jsp">
							<img src="Shairportlogo.png" class="shairport_logo">
						</a>
					</div>
				</div>


				<ul class="navbar_menu">
					<li class="navbar_item"> <a href="mellhome.jsp" class="links">Home</a> </li>
					<li class="navbar_item"> <a href="aboutus.jsp" class="links">About Us</a> </li>
					<%-- <%if(!loggedin){ %> --%>

						<% Cookie[] cookies=request.getCookies(); boolean loggedIn=false; if(cookies !=null){ for(Cookie cookie: cookies){ if(cookie.getName().equals("Email") || cookie.getName().contentEquals("GEmail")){ loggedIn=true; } } } if(loggedIn){
							out.println("<li class='navbar_item'><form action='directToTickets' method='GET'><a class='links'><button style='background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;'>My Profile</button> </a></form> </li>");
							out.println("<li class='navbar_item'><form action='logoutServlet' method='GET'><a class='links'><button onclick='signOut();' style='background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;'>Logout</button></a></form></li>");
							}
							else{
							out.println("<li class='navbar_item'> <a href='register2.0.jsp' onclick='signOut()' class='links' class='btn btn--white'>Sign In / Register</a> </li>");
							}%>
							<%-- <%} else { %>
								<a href="LogoutDispatcher" class="links">Sign Out</a>
								<%} %> --%>
				</ul>
			</div>
		</nav>






		<div class="body">

			<div class="text">
				<div class="header-text"> WELCOME TO SHAIRPORT! <br> </div>

				<div class="subheader-text">
					USC's first ride-matching website <br>
				</div>

				<div class="body-text">
					The most convenient way to find other <br>
					Trojans to share a Lyft or Uber with to <br>
					the airport. Input your flight info into a <br>
					Shairport ticket and search for other <br>
					similar tickets. Fight on!
				</div>

				<div class="button">
					<div class="button-container">
						<% boolean loggedIn2=false; if(cookies !=null){ for(Cookie cookie: cookies){
							if(cookie.getName().equals("Email") || cookie.getName().contentEquals("GEmail")){
							loggedIn2=true; } } } if(loggedIn2){ out.println("<a href='form.html' style='font-size: 20px;' class='btn'><span><i class='fa fa-plane'></i> Click here to find a ride!</span></a>");
							}
							else{
							out.println("<a href='register2.0.jsp' onclick='signOut()' style='font-size: 20px;' class='btn'><span><i class='fa fa-plane'></i> Click here to find a ride!</span></a>");
							}%>


							<!-- <a href="register.jsp" style = "  font-size: 20px;"class="btn"><span><i class="fa fa-plane"></i>   Click here to find a ride!</span></a> -->
					</div>
				</div>
			</div>


<!-- 			<div class="video">
				<iframe width="420" height="315" src="https://www.youtube.com/embed/iik25wqIuFo"> </iframe>
			</div> -->

		</div>

	</body>


	<script>
		var auth2;
		var googleUser; // The current user
		var auth2;
		var profile;
		function test() {
			gapi.load('auth2', function () {
				auth2 = gapi.auth2.init({
					client_id: '414693959520-a8em47p4o4h9cjk9ca4vl383immov8i8.apps.googleusercontent.com'
				});
				auth2.attachClickHandler('signin-button', {}, onSuccess, onFailure);
				auth2.isSignedIn.listen(signinChanged);
				auth2.currentUser.listen(userChanged); // This is what you use to listen for user changes
			});
		}
		var signinChanged = function (val) {
			console.log('Signin state changed to ', val);
			var auth2 = gapi.auth2.getAuthInstance();
			var profile = auth2.currentUser.get().getBasicProfile();
			console.log(profile.getName());
			console.log(profile.getEmail());
			console.log(profile.getImageUrl());

			const test = document.getElementsByClassName("username");
			/* test[0].innerText = "Hello "+ profile.getName() + "!";
			document.cookie = "name= ;"; */
		};
		var onSuccess = function (user) {
			console.log('Signed in as ' + user.getBasicProfile().getName());
			// Redirect somewhere
		};
		var onFailure = function (error) {
			console.log(error);
		};
		function signOut() {
			auth2.signOut().then(function () {
				console.log('User signed out.');
			});
			document.cookie = "name= ; max-age=0";
		}
	</script>

	<script src="https://apis.google.com/js/platform.js?onload=renderButton"
		onload="this.onload=function(){};handleClientLoad()"
		onreadystatechange="if (this.readyState === 'complete') this.onload()" async defer>
		</script>



	</html>