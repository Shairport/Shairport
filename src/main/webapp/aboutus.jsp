<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>About Us</title>
		<link rel="stylesheet" href="aboutus.css">
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Ranga">
		<!--     <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito"> -->
		<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200&display=swap" rel="stylesheet">
		<link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png" />

	</head>

	<body>

		<div>
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

							<% Cookie[] cookies=request.getCookies(); boolean loggedIn=false; if(cookies !=null){
								for(Cookie cookie: cookies){ if(cookie.getName().equals("Email") ||
								cookie.getName().contentEquals("GEmail")){ loggedIn=true; } } } if(loggedIn){
								out.println("<li class='navbar_item'> <form action='directToTickets' method='GET'><a class='links'><button style='background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;'>My Profile</button> </a></form></li>");
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
		</div>




		<%-- <nav class="navtopbar">
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
					<%if(!loggedin){ %>
						<li class="navbar_item"> <a href="register.jsp" class="links" class="btn btn--white">Sign In
								→</a> </li>
						<%} else { %>
							<a href="LogoutDispatcher" class="links">Sign Out</a>
							<%} %>
				</ul>
			</div>
			</nav> --%>


			<div class="pagebody">

				<div class="pageheader">
					MEET THE CREATORS
				</div>

				<div class="subheader">
					Meet the team of four USC students who created Shairport.
					What started as a simple idea for a final project <br> in one of their
					computer science classes turned into this website that you are on right now!

				</div>

				<div class="firstrow">
					<div class="person1">
						<div class="photo">
							<img src="max.png" class="personphoto">
						</div>

						<div class="name">
							MAX ALBRIGHT
						</div>

						<div class="caption">
							Max Albright is a current junior at USC. <br>
							He is majoring in computer science and business <br>
							administration. Max is from Wayzata, Minnesota. <br>
							In his free time, Max enjoys running, <br>
							skateboarding, coding, and playing basketball. <br>
							Max wants to be a software engineering <br>
							manager at a tech company in the future.
						</div>
					</div>
					<div class="person2">
						<div class="photo">
							<img src="toan.png" class="personphoto">
						</div>

						<div class="name">
							TOAN HUYNH
						</div>

						<div class="caption">
							Toan Huynh is a current junior computer <br>
							science major at USC. He is from Seattle, <br>
							Washington. Toan enjoys listening to music such <br>
							as J. Cole and Travis Scott, playing basketball, <br>
							and going to the beach in his free time. In the <br>
							future, Toan wants to be a CTO at a company.
						</div>
					</div>

					<div class="person3">
						<div class="photo">
							<img src="james.png" class="personphoto">
						</div>

						<div class="name">
							JAMES MCCOLL
						</div>

						<div class="caption">
							James McColl is a current junior at USC majoring in <br>
							computer science and minoring in entrepreneurship. <br>
							He is from Wilmette, Illinois. James enjoys hanging <br>
							out with friends, playing the piano, and hiking in <br>
							his free time. In the future, James hopes to be a <br>
							product manager or start his own company.
						</div>
					</div>

					<div class="person4">
						<div class="photo">
							<img src="mellissa.jpg" class="personphoto">
						</div>

						<div class="name">
							MELLISSA ZHANG
						</div>

						<div class="caption">
							Mellissa Zhang is a current junior at USC. <br>
							She is a computer science and business <br>
							administration major with a dance minor. <br>
							She is originally from Naperville, Illinois. In <br>
							her free time, Mellissa enjoys dancing, working <br>
							out, making YouTube videos, and hanging out <br>
							with friends. In the future, Mellissa hopes to go <br>
							into product management or entrepreneurship.
						</div>
					</div>

				</div>







				<!-- 				<div class="secondrow">
				
					<div class="person3">
						<div class="photo">
							<img src="james.png" class="personphoto">
						</div>

						<div class="name">
							JAMES MCCOLL
						</div>

						<div class="caption">
							James McColl is a sophomore computer <br>
							science major at USC. He is from Wilmette, <br>
							Illinois. James enjoys hanging out with friends, <br>
							playing die, and hiking during his free time. In <br>
							the future, James hopes to be a product <br>
							manager or start his own company.
						</div>
					</div>
					<div class="person4">
						<div class="photo">
							<img src="mellissa.jpg" class="personphoto">
						</div>

						<div class="name">
							MELLISSA ZHANG
						</div>

						<div class="caption">
							Mellissa Zhang is a current sophomore at USC. <br>
							She is a computer science and business <br>
							administration major with a dance minor. <br>
							She is originally from Naperville, Illinois. In <br>
							her free time, Mellissa enjoys dancing, working <br>
							out, making YouTube videos, and hanging out <br>
							with friends. In the future, Mellissa hopes to go <br>
							into product management or entrepreneurship.
						</div>
					</div>
				</div> -->

			</div>



	</body>