<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="paired.css">
  <link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png" />
  <link rel="stylesheet" href="aboutus.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

  <title>Paired</title>
</head>

<body onLoad="test();">


 <br><br><br>

  <div class="seperate"> <h2> Your Ticket has been Successfully Matched </h2> <br>
  <form action='directToTickets' method='GET'><a class='links'><button style='background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;'>Click Here to Proceed</button> </a></form>
  
  </div>
  <br><br>
  <main class="ticket-system">
 <div class="top">
 <div class="printer" />
 </div>
 <div class="receipts-wrapper">
    <div class="receipts">
       <div class="receipt">
       
          <img class="airliner-logo" src="Shairportlogo.png">
          <div class="route">
             <h2>${location}</h2>
          
             <svg  class ="plane-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!-- Font Awesome Pro 5.15.4 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) --><path d="M499.99 176h-59.87l-16.64-41.6C406.38 91.63 365.57 64 319.5 64h-127c-46.06 0-86.88 27.63-103.99 70.4L71.87 176H12.01C4.2 176-1.53 183.34.37 190.91l6 24C7.7 220.25 12.5 224 18.01 224h20.07C24.65 235.73 16 252.78 16 272v48c0 16.12 6.16 30.67 16 41.93V416c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32v-32h256v32c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32v-54.07c9.84-11.25 16-25.8 16-41.93v-48c0-19.22-8.65-36.27-22.07-48H494c5.51 0 10.31-3.75 11.64-9.09l6-24c1.89-7.57-3.84-14.91-11.65-14.91zm-352.06-17.83c7.29-18.22 24.94-30.17 44.57-30.17h127c19.63 0 37.28 11.95 44.57 30.17L384 208H128l19.93-49.83zM96 319.8c-19.2 0-32-12.76-32-31.9S76.8 256 96 256s48 28.71 48 47.85-28.8 15.95-48 15.95zm320 0c-19.2 0-48 3.19-48-15.95S396.8 256 416 256s32 12.76 32 31.9-12.8 31.9-32 31.9z"/></svg>
             <h2>${airport}</h2>
          </div>
          <div class="details">
             <div class="item">
                <span>Group Members</span>
                <h3 style ="font-size: 1.3rem;">${name1}, ${name2}</h3>
             </div>
             <div class="item">
                <span>Ticket# </span>
                <h3 style ="font-size: 1.3rem;">${ticnum}</h3>
             </div>
             <div class="item">
                <span>Departure Date</span>
                <h3 style ="font-size: 1.3rem;">${pickupdate}</h3>
             </div>
             <div class="item">
                <span>Airport Arrival Time</span>
                <h3 style ="font-size: 1.3rem;">${pickuptime}</h3>
             </div>
             <div class="item">
                <span></span>
                <h3></h3>
             </div>
             <div class="item">
                <span></span>
                <h3></h3>
             </div>
          </div>
       </div>
       <div class="receipt qr-code">
          <div class="details">
             <div class="item">
                <span></span>
                <h3></h3>
             </div>
             <div class="item">
                <span> </span>
                <h3></h3>
             </div>
             <br><br>
             <div class="item">
                <span> Paired User's Email</span>
                <h3 style ="font-size: 1.3rem;">${email2}</h3>
             </div>
             <div class="item">
                <span>Paired User's Number</span>
                <h3 style ="font-size: 1.3rem;">${phone2}</h3>
                <hr>
                
             </div>
             <div class="item">
             </div>
             
             <div class="item">
             
                <span></span>
             </div>
          </div>
       
</div>
</div>
    </div>

</main>



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