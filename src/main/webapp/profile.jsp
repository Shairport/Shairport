<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!DOCTYPE html>

  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="myticket.css">
    <link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png" />
    <link rel="stylesheet" href="mellhome.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

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

        <!-- <div class="container header__container">
                <div class="header__logo"><img class="header__img" src="https://image.ibb.co/kcVou6/path3000.png"> <h1 class="header__title">Shairport<span class="header__light"></span></h1></div>  -->


        <<!-- div class="header__menu">
          <nav id="navbar">
            <ul class="header__elenco">
              <li class="header__el"><a href="#" class="header__link">Home</a></li>
              <li class="header__el"><a href="#" class="header__link">About Us</a></li>
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
            "> &nbsp; Sign In &nbsp; </a></li>
            </ul>
          </nav>
      </div>
      Breadcrumb
      <nav aria-label="breadcrumb" class="main-breadcrumb"> -->
        <ol style="  visibility: hidden;
""                class=" breadcrumb">

        </ol>
      </nav>
      <!-- /Breadcrumb -->

      <div class="row gutters-sm">
        <div class="col-md-4 mb-3">
          <div class="card">
            <div class="card-body">
              <div class="d-flex flex-column align-items-center text-center">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle"
                      width="100px"  style = "max-width:100%;
max-height:100%">
                <form action="updateprofileServlet" method="GET">
                  <div class="mt-3">
                    <h4>${name}</h4>
                    
 
 				  <label class="field field_v2">
				    <input class="field__input" placeholder="e.g. Computer Science" name="major">
				    <span class="field__label-wrap">
				      <span class="field__label">Major</span>
				    </span>
				  </label>                   
                    <label class="field field_v1">
				    <input class="field__input" placeholder="e.g. 2024" name="gradyear">
				    <span class="field__label-wrap">
				      <span class="field__label">Graduation Year</span>
				    </span>
				  </label>
    
				  
  
 
                    <div class="col-sm-12">
                      <a class="btn btn-info " target="__blank"><button type="submit" style="  background: none!important;
                            border: none;
                            padding: 0!important;
                          
                            color: rgb(255, 255, 255);
                            cursor: pointer;">Confirm changes</button></a>
                    </div>
                  </div>
                </form>

              </div>
            </div>
          </div>
          <div class="card mt-3">

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
                  ${name}
                </div>
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
                    <h6 class="d-flex align-items-center mb-3"><i
                        class="material-icons text-info mr-2">Ticket#</i>${tic.getticketID()}</h6>
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
                    <small>Rider 2 Name: </small> <span class="text"> ${tic.getUser1_name()}</span>
                    <hr>
                    <small>Rider 2 Email: </small> <span class="text">${tic.getUser1_email()}</span>
                    <hr>
                    <small>Rider 2 Phone Number: </small> <span class="text"> ${tic.getUser1_phonenumber()}</span>
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