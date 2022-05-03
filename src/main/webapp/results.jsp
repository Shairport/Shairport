<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link class ="stylz" rel="stylesheet" href="rs.css">
	<link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png"/>
    <script src="r.js"></script>
    <title>Results</title>
</head>
<body class="peek">   
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

	">My Account ÃÂ</a></li>
		  </ul>

		</nav>
	  </div>
	 <br>
	 <br>
<div class="wow"></div>
 
<container>
   

    <h2>Ticket Results <span class="block"> ${startingdate}</span> </h2>
    <c:forEach var="tic" items="${results}">
    	    <form action="carpoolServlet" method="GET">
		    <input type = "hidden" name = "email1" value = "${user1email}" />
		    <input type = "hidden" name = "name1" value = "${user1name}" />
		    <input type = "hidden" name = "phone1" value = "${user1phone}"/>
		    <input type = "hidden" name = "email2" value = "${tic.getEmailonTicket()}" />
		    <input type = "hidden" name = "name2" value = "${tic.getNameonTicket()}" />
		    <input type = "hidden" name = "phone2" value = "${tic.getPhonenumber()}"/>
		    
		    <input type = "hidden" name = "pickupdate" value = "${tic.getPickupdate()}" />
		    <input type = "hidden" name = "airport" value = "${tic.getAirport()}" />
		    <input type = "hidden" name = "pickuptime" value = "${tic.getMilitaryPickuptime()}"/>
		    <input type = "hidden" name = "location" value = "${tic.getLocation()}" />
    <details>
	      <summary class="success">${tic.getPickupdate()} ${tic.getDisplayPickupTime()}  &nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;	&nbsp;<span> <button class="button" type="submit" style=" font-family: 'Ubuntu', sans-serif;
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
	    </form>
    </c:forEach>
  </container>
</body>
<script>
window.onload =  async function afterWebPageLoad() { 
	var docu =document.getElementsByTagName("html");
	var savedContent = docu[0].innerHTML;
	docu[0].innerHTML = '<head>\n    <meta charset="UTF-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\n    <title>loading</title>\n    <link rel="stylesheet" href="loading.css">\n    <link rel="shortcut icon" type="image/x-icon" href="https://image.ibb.co/fOur3b/favicon.png">\n\n\n</head>\n<body>\n   \n<div class="scene" style="--hue: 260; --saturation: 87; --lightness: 67">\n    <div class="word">\n      <div class="letter__wrap" style="--index: 0">\n        <div class="letter" data-letter="L"><span class="letter__panel" aria-hidden="true">L</span><span class="letter__panel" aria-hidden="true">W</span><span class="letter__panel" aria-hidden="true">L</span><span class="letter__panel" aria-hidden="true">W</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 1">\n        <div class="letter" data-letter="o"><span class="letter__panel" aria-hidden="true">o</span><span class="letter__panel" aria-hidden="true">a</span><span class="letter__panel" aria-hidden="true">o</span><span class="letter__panel" aria-hidden="true">a</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 2">\n        <div class="letter" data-letter="a"><span class="letter__panel" aria-hidden="true">a</span><span class="letter__panel" aria-hidden="true">i</span><span class="letter__panel" aria-hidden="true">a</span><span class="letter__panel" aria-hidden="true">i</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 3">\n        <div class="letter" data-letter="d"><span class="letter__panel" aria-hidden="true">d</span><span class="letter__panel" aria-hidden="true">t</span><span class="letter__panel" aria-hidden="true">d</span><span class="letter__panel" aria-hidden="true">t</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 4">\n        <div class="letter" data-letter="i"><span class="letter__panel" aria-hidden="true">i</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel" aria-hidden="true">i</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 5">\n        <div class="letter" data-letter="n"><span class="letter__panel" aria-hidden="true">n</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel" aria-hidden="true">n</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 6">\n        <div class="letter" data-letter="g"><span class="letter__panel" aria-hidden="true">g</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel" aria-hidden="true">g</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel"></span></div>\n      </div>\n    </div>\n  </div>\n\n</body>'
	
	await new Promise(resolve => setTimeout(resolve, 3500)); // 3 sec
	docu[0].innerHTML =savedContent;
  

    
	
	}
</script>
</html>