<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>About Usx</title>
	<link rel="stylesheet" href="aboutus.css">
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
	
	
	
</body>
</html>