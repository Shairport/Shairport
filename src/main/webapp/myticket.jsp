<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <link class="stylz" rel="stylesheet" href="rs.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="myticket.css">
  <link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png" />
  <link rel="stylesheet" href="aboutus.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>    

  <title>My Account</title>
</head>

<body onLoad="test();">


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
          <li class='navbar_item'>
            <form action='directToTickets' method='GET'><a class='links'><button
                  style='background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;'>My
                  Profile</button> </a></form>
          </li>
          <li class='navbar_item'>
            <form action='logoutServlet' method='GET'><a class='links'><button onclick='signOut();'
                  style='background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;'>Logout</button></a>
            </form>
          </li>



        </ul>
      </div>
    </nav>
  </div>


  <div class="container">
    <div class="main-body">

      <div class="container header__container">
        <!-- <div class="header__logo"><img class="header__img" src="https://image.ibb.co/kcVou6/path3000.png"> <h1 class="header__title">Shairport<span class="header__light"></span></h1></div> -->



        <!-- Breadcrumb -->
        <nav aria-label="breadcrumb" class="main-breadcrumb">
          <ol style="visibility: hidden;" class="breadcrumb">

          </ol>
        </nav>
        <!-- /Breadcrumb -->

        <div class="row gutters-sm">
          <div class="col-md-4 mb-3">
            <div class="card">
              <div class="card-body">
                <div class="d-flex flex-column align-items-center text-center">
                  <img src="${imageURL}" alt="Admin" class="rounded-circle"
                    width="150">

                  <div class="mt-3">
                    <h4>${name}</h4>
                    <p class="text-secondary mb-1">Graduation Year: ${gradyear}</p>
                    <p class="text-muted font-size-sm">Major: ${major}</p>

                  </div>
                  <div class="col-sm-12">
                    <form action="editServlet" method="GET">
                      <a class="btn btn-info " target="__blank"><button type="submit" style="  background: none!important;
                          border: none;
                          padding: 0!important;
                        
                          color: rgb(255, 255, 255);
                          cursor: pointer;">Edit</button></a>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <div class="card mt-3">
              <div style="font-family: Lato, sans-serif;
              color: #9a43ba;
              text-align: center;
              display: flex;
              font-weight: bold"
              
           class="card mt-6">
                Pending Outgoing Requests <br>
                </div>

                <!-- FOR EACH SHOULD START HERE-->
                <c:forEach var="tic" items="${outgoing}">
               
                <div style="text-align: center; padding: 3%;"class="requests">
                  <container>
                    
                    <input type="hidden" name="email1" value="${tic.getUser1_email()}" />
                    <input type="hidden" name="ticketID" value="${tic.getTicketID()}" />
                    <input type="hidden" name="carpoolID" value="${tic.getCarpoolID()}" />
                    <details>
                      <summary style="background-color: none";="success">

                        <i class="fa fa-hourglass" style="font-size:20px; margin-right: 2%;"></i>
                        Request to ${tic.getUser2_name()}</summary>
                      <ul>
                        <li>
                          <div >Airport<span class="failure">${tic.getAirport()}</span></div>
                        </li>
                        <li>
                          <div >Flight Date<span class="failure">${tic.getPickupdate()}</span></div>

                        </li>
                        <li>
                          <div >Arrival Time<span class="failure">${tic.getDisplayPickupTime()}</span></div>
                        </li>
                        <li>
                          <div >Pickup Location<span class="failure">${tic.getLocation()}</span></div>
                        </li>                        
                      </ul>
                    </details>
                  
              </container>
                </div>
                </c:forEach>
                                  <!-- FOR EACH SHOULD END HERE-->







                                  <!-- THIS IS THE START OF THE INCOMING REQUESTS-->
                <div display="" class="switch">
                </div>
                <div style="font-family: Lato, sans-serif;
              color: #9a43ba;
              text-align: center; display: flex; font-weight: bold;" class="card mt-6">
                Incoming Requests <br>
                </div>

             <!-- FOR EACH STARTS HERE-->
				<c:forEach var="tic" items="${incoming}">
				
                <div style="text-align: center; padding: 3%;" class="card-b3ody">
                  <container>
                        <details>
                          <summary style="background-color: none";="success">
                      
                            <i class="fa fa-arrow-circle-down" style="font-size:20px; margin-right: 2%;"></i>
                            Requested By ${tic.getUser1_name()} </summary>
                          <ul>
                            <li>
                              <div >Airport<span class="failure">${tic.getAirport()}</span></div>
                            </li>
                            <li>
                              <div >Flight Date<span class="failure">${tic.getPickupdate()}</span></div>

                            </li>
                            <li>
                              <div >Arrival Time<span class="failure">${tic.getDisplayPickupTime()}</span></div>
                            </li>
	                        <li>
	                          <div >Pickup Location<span class="failure">${tic.getLocation()}</span></div>
	                        </li>                                 
                            <li>
	                            <form action="acceptServlet" method="GET">
				                    <input type="hidden" name="email1" value="${tic.getUser2_email()}" />
				                    <input type="hidden" name="ticketID" value="${tic.getTicketID()}" />
				                    <input type="hidden" name="carpoolID" value="${tic.getCarpoolID()}" />   
				                    <input type="hidden" name="email2" value="${tic.getUser1_email()}" />
				               
				                    <input type="hidden" name="pickupdate" value="${tic.getPickupdate()}" />                       
	                              <div class="success"><button type="submit" style="background: none;
	                                color: rgb(0, 175, 73);
	                                border: none;
	                                padding: 0;
	                                font: inherit;
	                                cursor: pointer;
	                                outline: inherit;">Accept </button>
	                              </div>
                            	</form>
                            </li>
                            <li>
                             <form action="declineServlet" method="GET">
				                    <input type="hidden" name="email1" value="${tic.getUser2_email()}" />
				                    <input type="hidden" name="ticketID" value="${tic.getTicketID()}" />
				                    <input type="hidden" name="carpoolID" value="${tic.getCarpoolID()}" />                             
                              <div class="failure"><button type = "submit" style="background: none;
                                color: red;
                                border: none;
                                padding: 0;
                                font: inherit;
                                cursor: pointer;
                                outline: inherit;">Decline</button>
                              </div>
                              </form>
                            </li>
                          </ul>
                        </details>
                  </container>
              
                </div>
                </c:forEach>
             <!-- FOR EACH ENDS HERE-->
                
                
                
               
              
                
            </div>
            
          </div>
          <div class="col-md-8">
            <div class="card mb-3">
              <div class="card-body">
                <div class="row">
                  <div class="col-sm-3">
                    <h6 class="mb-0">Full Name</h6>
                  </div>
                  <div class="col-sm-9 text-secondary">
                    ${name} </div>
                </div>
                <hr>
                <div class="row">
                  <div class="col-sm-3">
                    <h6 class="mb-0">Email</h6>
                  </div>
                  <div class="col-sm-9 text-secondary">
                    ${email}
                  </div>
                </div>
                <hr>





                <div class="row">
                  <div class="col-sm-3">
                    <h6 class="mb-0">School</h6>
                  </div>
                  <div class="col-sm-9 text-secondary">
                    University of Southern California
                  </div>
                </div>
                <hr>
                <div class="row">

                </div>
              </div>
            </div>

            <div style="margin-left: -7px;" class="row gutters-sm">
              <c:forEach var="tic" items="${myCarpools}">
                <div class="col-sm-6 mb-3">
                  <div class="card h-100">
                    <div class="card-body">
                      <h6 class="d-flex align-items-center mb-3">
                        <form action="deletecarpoolServlet" method="GET">

                          <input type="hidden" value="${tic.getPickupdate()}" name="pickupdate" />
                          <input type="hidden" value="${tic.getMilitaryPickuptime()}" name="pickuptime" />
                          <i class="x"><button type="submit" style="background: none;
                          color: inherit;
                          border: none;
                 
                          padding-right:6%;
                          font: inherit;
                          cursor: pointer;
                          outline: inherit;">X &nbsp &nbsp &nbsp</button></i>
                        </form>
                        <i class="material-icons text-info mr-2">Carpool#</i>${tic.getCarpoolID()}
                      </h6>
                      <small>Airport Arrival Time: </small> <span class="text"> ${tic.getDisplayPickupTime() }</span>
                      <hr>
                      <small>Airport: </small> <span class="text">${tic.getAirport()}</span>
                      <hr>
                      <small>Pickup Date: </small> <span class="text">${tic.getPickupdate()}</span>
                      <hr>
                      <small>Pickup Location: </small> <span class="text">${tic.getLocation()}</span>
                      <hr>
                      <small>Rider 1 Name: </small> <span class="text">${tic.getUser1_name()}</span>
                      <hr>
                      <small>Rider 1 Email: </small> <span class="text"> ${tic.getUser1_email()}</span>
                      <hr>
                      <small>Rider 1 Phone Number: </small> <span class="text">${tic.getUser1_phonenumber()}</span>
                      <hr>
                      <small>Rider 2 Name: </small> <span class="text"> ${tic.getUser2_name()}</span>
                      <hr>
                      <small>Rider 2 Email: </small> <span class="text">${tic.getUser2_email()}</span>
                      <hr>
                      <small>Rider 2 Phone Number: </small> <span class="text"> ${tic.getUser2_phonenumber()}</span>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>

      </div>
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
    var link =profile.getImageUrl();
    var img = document.getElementsByTagName("img");
    img[1].setAttribute("src",link);
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