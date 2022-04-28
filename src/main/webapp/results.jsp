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
	    </details>
    </c:forEach>
  </container>
</body>
</html>