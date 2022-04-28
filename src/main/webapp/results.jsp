<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="rs.css">
    <script src="r.js"></script>
    <title>Document</title>
</head>
<body>   
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
		      <summary class="success">${tic.getPickupdate()} ${tic.getDisplayPickupTime()}</summary>
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
		      <input type="submit" value="Join This Ticket">
		    </details>
		</form>    
    </c:forEach>
  </container>
</body>
</html>