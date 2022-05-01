<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="414693959520-a8em47p4o4h9cjk9ca4vl383immov8i8.apps.googleusercontent.com"
          name="google-signin-client_id">
    <title>Login / Register</title>
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link crossorigin href="https://fonts.gstatic.com" rel="preconnect">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link
            href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
    <script crossorigin="anonymous"
            src="https://kit.fontawesome.com/3204349982.js"></script>
    <script async defer src="https://apis.google.com/js/platform.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto"
          rel="stylesheet" type="text/css"> 
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="414693959520-a8em47p4o4h9cjk9ca4vl383immov8i8.apps.googleusercontent.com">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ShairHome</title>
    <link rel="stylesheet" href="home.css">
    <script src="home.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta name="theme-color" content="#3a9fff">
		<link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png"/>
		

</head>
<body>
	<% String er = (String) request.getAttribute("error");
	if (er != null) out.println(er); %>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="https://image.ibb.co/fOur3b/favicon.png"/>
<meta name="theme-color" content="#1885ed">
<title>Shairport - Homepage</title>
</head>

<body>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="shortcut icon" type="image/x-icon" href="https://image.ibb.co/fOur3b/favicon.png"/>
      <meta name="theme-color" content="#1885ed">
        <title>Shairport - Homepage</title>
      </head>
      
      <body>
      <header class="header">
        <div class="container header__container">
          <div class="header__logo"><img class="header__img" src="https://image.ibb.co/kcVou6/path3000.png"> <h1 class="header__title">Shairport<span class="header__light"></span></h1></div> 

    
        <div class="header__menu">
          <nav id="navbar" >
            <ul class="header__elenco">
              <li class="header__el"><a href="#" class="header__link">Home</a></li>
              <li class="header__el"><a href="#" class="header__link">About Us</a></li>
              <li class="header__el header__el--blue"><a href="" class="btn btn--white">Sign In →</a></li>
            </ul>
          </nav>
        </div>
          </div>

          <div >
            <h1 class="text">
              Welcome to Shairport ! <br>
              USC's first ride-matching service <br><br><br>
              <span class="tuff">
              The most convenient way to find other Trojans to share a lyft <br> or Uber with to 
              the airport. Input your flight info into a <br>
              Shairport ticket and search for others with
              similar tickets!&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <br>
              <br>

              <span>
                <div class="button-container">
                  <a href="#" style = "  font-size: 20px;"class="btn"><span>Click here to find a Ride!</span></a>
                </div>
              </span>
            </span >
          
            </h1>
          </div>
      </header>
      
     <div>
       
     </div>
   
      </body>
</body>

     <script>
		function onSignIn(googleUser) {
	        // Useful data for your client-side scripts:
	        var profile = googleUser.getBasicProfile();
	        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
	        console.log('Full Name: ' + profile.getName());
	        console.log('Given Name: ' + profile.getGivenName());
	        console.log('Family Name: ' + profile.getFamilyName());
	        console.log("Image URL: " + profile.getImageUrl());
	        console.log("Email: " + profile.getEmail());
	        var name = profile.getName();
	        var email = profile.getEmail();
	        // The ID token you need to pass to your backend:
	        var id_token = googleUser.getAuthResponse().id_token;
	        document.cookie ="Email=" + email;
	        window.location.href = "http://localhost:8080/Shairport/form.html";
	      }
		
			function onSuccess(googleUser) {
		      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
		      onSignIn(googleUser);
		    }
			
		    function onFailure(error) {
		      console.log(error);
		    }
		 
		    
		     
		 
	    	function signOut() {
	    	    var auth2 = gapi.auth2.getAuthInstance();
	    	    auth2.signOut().then(function () {
	    	      console.log('User signed out.');
	    	      
	    	    });
	    	  }
		      
		    
		    
		      var CLIENT_ID = '414693959520-a8em47p4o4h9cjk9ca4vl383immov8i8.apps.googleusercontent.com';
		      var API_KEY = config.API_KEY;
		      
		   
		      var authorizeButton = document.getElementById('g-signin2');
		      
		      function handleClientLoad() {
		        gapi.load('client:auth2', initClient);
		      }
		      function initClient() {
		          gapi.client.init({
		          apiKey: API_KEY,
		          clientId: CLIENT_ID,
		          discoveryDocs: DISCOVERY_DOCS,
		          scope: SCOPES
		        }).then(function () {
		          // Listen for sign-in state changes.
		          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);
		         
		          authorizeButton.onclick = handleAuthClick;
		        }, function(error) {
		          appendPre(JSON.stringify(error, null, 2));
		        });
		      }
		      function handleAuthClick(event) {
		        gapi.auth2.getAuthInstance().signIn();
		      }
		    
	</script>
	
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" 
				onload="this.onload=function(){};handleClientLoad()"
      			onreadystatechange="if (this.readyState === 'complete') this.onload()" async defer></script>
	


</html>