<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="301645777112-2rlc9gth0f5d4reimjcm9bf0kj7ahec0.apps.googleusercontent.com"
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
    <meta name="google-signin-client_id" content="414693959520-vaogaupc5phofnvp712flmqqr96ue9ai.apps.googleusercontent.com">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
		
		
		<% String er = (String) request.getAttribute("error");
			if (er != null) out.println(er);
		%>
		
		
	   <nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <a class="navbar-brand" href="homepage.jsp" style="color:#bd3dd1; font-family: 'Georgia', serif; font-weight: bold; font-size: 30px; width: 10%; text-align:center;">Shairport</a>
		  
		  <div style="width:65%;"></div>
		  
		  
		  <div style="width: 25%;">
		    <ul class="navbar-nav">
		      <li class="nav-item active">
		        <a class="nav-link" href="aboutus.jsp" style="color: #bd3dd1; font-weight:bold;"> About Us <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item active">
		      	<a class='nav-link' href='login.jsp' onclick='signOut();' style='color: #bd3dd1; font-weight:bold;'>Login/Sign Up</a>
		      </li>
		    </ul>
		  </div>
		</nav>

		<section class="vh-100" style="background-color: #da6ceb;">
		  <div class="container py-5 h-100">
		    <div class="row d-flex justify-content-center align-items-center h-100">
		      <div class="col col-xl-10">
		        <div class="card" style="border-radius: 1rem;">
		          <div class="row g-0">
		            <div class="col-md-6 col-lg-5 d-none d-md-block">
		              <img src="lyft1.jpg"
		                alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
		            </div>
		            <div class="col-md-6 col-lg-7 d-flex align-items-center">
		              <div class="card-body p-4 p-lg-5 text-black">
		
		                <form action="login" method="POST">
		
		                  <!-- <div class="d-flex align-items-center mb-3 pb-1">
		                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
		                    <span class="h1 fw-bold mb-0">Logo</span>
		                  </div> -->
		
		                  <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>
		
		                  <div class="form-outline mb-4">
		                    <input type="email" id="email" name="email" class="form-control form-control-lg" />
		                    <label class="form-label" for="email">Email address</label>
		                  </div>
		
		                  <div class="form-outline mb-4">
		                    <input type="password" id="password" name="password" class="form-control form-control-lg" />
		                    <label class="form-label" for="password">Password</label>
		                  </div>
		
		                  <div class="pt-1 mb-4">
		                    <button class="btn btn-dark btn-lg btn-block" type="submit" style="background-color: #bd3dd1">Login</button>
		                  </div>
		                  

		                  <hr class="mx-5">
				            <div>
				            	<div class="g-signin2" data-onsuccess="onSignIn" data-width="auto" data-height="40" data-longtitle="true" data-theme="dark"> </div>
				            	<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
				            </div>
				            
				          </form>

		                  <!-- <a class="small text-muted" href="#!">Forgot password?</a> -->
		                  
		                  <br>
		                  <br>
		                  
		                  <p class="mb-5 pb-lg-2" style="color: grey; font-size: 20px;">
		                  	  <i class="fas fa-cubes fa-2x me-3" style="color: #bd3dd1;"></i>
							  Don't have an account? 
		                  	  <a href="register.jsp" style="color: #bd3dd1;">Register here</a>
		                  </p>
		                  <!-- <a href="#!" class="small text-muted">Terms of use.</a>
		                  <a href="#!" class="small text-muted">Privacy policy</a> -->
		                
		
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>




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
	        window.location.href = "http://localhost:8080/Shairport/form.html";
	  		addGoogleUser(name, email, id_token);
	  		document.cookie = "name= ;";
	      }
		
			function onSuccess(googleUser) {
		      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
		      onSignIn(googleUser);
		    }
			
		    function onFailure(error) {
		      console.log(error);
		    }
		 
		    
		  function addGoogleUser(name, email, id) {
				$.ajax({
					url: "register",
					data: {
						username: name,
						password: id,
						email: email
					},
					success: function(result) {
						window.location.href = "http://localhost:8080/Shairport/form.html";		        
					}
				});	
			}
		     
		 
		    	function signOut() {
		    	    var auth2 = gapi.auth2.getAuthInstance();
		    	    auth2.signOut().then(function () {
		    	      console.log('User signed out.');
		    	      
		    	    });
		    	  }
		      
		    
		    
		      var CLIENT_ID = '414693959520-vaogaupc5phofnvp712flmqqr96ue9ai.apps.googleusercontent.com';
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