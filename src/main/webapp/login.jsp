<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="google-signin-client_id" content="485424028778-43ulsjnma974ck26g0fbfkd43b5b7tk8.apps.googleusercontent.com">
    <title>Login</title>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="loginScript.js"></script>
</head>
<body>
    <div class="g-signin2" data-onsuccess="onSignIn"></div>
    <a href="#" onclick="signOut();">Sign out</a>
</body>
</html>