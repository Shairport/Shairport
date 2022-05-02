<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>About Usx</title>
	<link rel="stylesheet" href="aboutus.css">
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
    
    
    <div class="pagebody">
	
		<div class="pageheader" >
			MEET THE CREATORS
		</div>
		
		<div class="subheader">
			Meet the team of six USC students who created Shairport. 
			What started as a simple idea for a final project  <br> in one of their
			computer science classes turned into this website that you are on right now!
		</div>
		
		<div class="firstrow">
			<div class="person1">
			</div>
			
			<div class="person2">
			</div>
			
			<div class="person3">
			</div>
		</div>
		
		<div class="secondrow">
			<div class="person4">
			</div>
			
			<div class="person5">
			</div>
			
			<div class="person6">
			</div>
		</div>
	     
	</div>
	
	
	
</body>
</html>