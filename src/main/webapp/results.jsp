<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="rs.css">
	<link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png"/>
    <script src="r.js"></script>
    <title>Results</title>
</head>
<body>   
	<link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png"/>
	<link rel="shortcut icon" type="image/x-icon" href="https://image.ibb.co/fOur3b/favicon.png"/>

	<div class="container header__container">
		<div class="header__logo"><img class="header__img" src="https://image.ibb.co/kcVou6/path3000.png"> <h1 class="header__title">Shairport<span class="header__light"></span></h1></div> 
	
	
	  <div class="header__menu">
		<nav id="navbar" >
		  <ul class="header__elenco">
			<li class="header__el"><a href="#" class="header__link" style="text-decoration: none;
				">Home</a></li>
			<li class="header__el"><a href="#" class="header__link" style="text-decoration: none;
				">About Us</a></li>
			<li class="header__el header__el--blue"><a href="" style="display: inline-block;
				padding: 6px 12px;
				margin-bottom: 0;
				font-size: 14px;
				font-weight: 400;
				line-height: 1.42857143;
				text-align: center;
				white-space: nowrap;
				vertical-align: middle;
				background-color: #fff;
				color: #8198ae;
				user-select: none;
		background-image: none;
		border: 1px solid transparent;
		border-radius: 4px;
		box-sizing: border-box;
		box-shadow: 0px 18px 13px -6px rgb(0 0 0 / 20%);
		text-decoration: none;

	">Sign In →</a></li>
		  </ul>
		</nav>
	  </div>
	 <br>
	 <br>
<div class="wow"></div>
<container>
    <h2>Ticket Results <span class="block"> ${startingdate}</span> </h2>
    <c:forEach var="tic" items="${results}">
    <details>
	      <summary class="success">${tic.getPickupdate()} ${tic.getDisplayPickupTime()}  &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;<span> <button class="button" style=" font-family: 'Ubuntu', sans-serif;
			position: absolute;
			transform: translate(-50%, -50%);
			margin-top: 9px;
			width: 100px;
			height: 30px;
			line-height: 1;
			font-size: 12px;
			font-weight: bold;
			letter-spacing: 1px;
			border: 3px solid #8C82FC;
			background: #fff;
			color: #8C82FC;
			border-radius: 40px;
			cursor: pointer;
			overflow: hidden;
			transition: all .35s;">Request</button></span></summary>
	      <ul>
	        <li> 
	          <div class="success">Airport<span class="failure">${tic.getAirport()}</span></div>
	        </li>
	        <li>
	          <div class="success">Ticket Holder<span class="status">${tic.getNameonTicket()}</span></div>
	        </li>
	        <li>
	            <div class="success">Spot on Campus<span class="status">${tic.getLocation()}</span></div>
	          </li>
	          <li>
	            <div class="success">Phone Number<span class="status">${tic.getPhonenumber()}</span></div>
	          </li>
	      </ul>
	    </details>
    </c:forEach>
  </container>
</body>
</html>