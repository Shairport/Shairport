<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Homepage</title>
	<link rel="stylesheet" href="mellhome.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Ranga">
<!--     <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Nunito"> -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200&display=swap" rel="stylesheet">
</head>
<body>

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
<%--           	<%if(!loggedin){ %> --%>

             <li class="navbar_item"> <a href="register.jsp" class="links" class="btn btn--white">Sign In →</a> </li>
<%--             <%} else { %>
            <a href="LogoutDispatcher" class="links">Sign Out</a>
            <%} %> --%>
        </ul>
      </div>
    </nav>

	<div class="body">
	
		<div class="text" >
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
	            <a href="register.jsp" style = "  font-size: 20px;"class="btn"><span><i class="fa fa-plane"></i>   Click here to find a ride!</span></a>
	          </div>
	        </div>
	     </div>
	     
	     
 	     <div class="video">
	     	<iframe width="420" height="315" src="https://www.youtube.com/embed/iik25wqIuFo"> </iframe>
	     </div> 
	     
	</div>

</body>
</html>