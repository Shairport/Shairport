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
    <link href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap" rel="stylesheet">
    <script crossorigin="anonymous" src="https://kit.fontawesome.com/3204349982.js"></script>
    <script async defer src="https://apis.google.com/js/platform.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
    <script src="https://apis.google.com/js/api:client.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id"
        content="414693959520-vaogaupc5phofnvp712flmqqr96ue9ai.apps.googleusercontent.com">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>

<body>


    <% String er=(String) request.getAttribute("error"); if (er !=null) out.println(er); %>


        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="homepage.jsp"
                style="color:#bd3dd1; font-family: 'Georgia', serif; font-weight: bold; font-size: 30px; width: 10%; text-align:center;">Shairport</a>

            <div style="width:65%;"></div>


            <div style="width: 25%;">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="aboutus.jsp" style="color: #bd3dd1; font-weight:bold;"> About Us <span
                                class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class='nav-link' href='login.jsp' onclick='signOut();'
                            style='color: #bd3dd1; font-weight:bold;'>Login/Sign Up</a>
                    </li>
                </ul>
            </div>
        </nav>

        <section class="vh-100" style="background-color: #ff578c;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col col-xl-10">
                        <div class="card" style="border-radius: 1rem;">
                            <div class="row g-0">
                                <div class="col-md-6 col-lg-5 d-none d-md-block">
                                    <img src="lyft1.jpg" alt="login form" class="img-fluid"
                                        style="border-radius: 1rem 0 0 1rem;" />
                                </div>
                                <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                    <div class="card-body p-4 p-lg-5 text-black">

                                        <form>

                                            <!-- <div class="d-flex align-items-center mb-3 pb-1">
		                    <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
		                    <span class="h1 fw-bold mb-0">Logo</span>
		                  </div> -->

                                            <h4 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Register for an
                                                account</h4>

                                            <div class="form-outline mb-3">
                                                <input id="newName" name="newName"
                                                    class="form-control form-control-lg" />
                                                <label class="form-label" for="newName">Name</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="email" id="newEmail"
                                                    class="form-control form-control-lg" />
                                                <label class="form-label" for="newEmail">Email address</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="tel" id="form2Example17"
                                                    class="form-control form-control-lg" />
                                                <label class="form-label" for="form2Example17">Phone</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" id="form2Example27"
                                                    class="form-control form-control-lg" />
                                                <label class="form-label" for="form2Example27">Password</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="email" id="form2Example17"
                                                    class="form-control form-control-lg" />
                                                <label class="form-label" for="form2Example17">Confirm Password</label>
                                            </div>

                                            <div class="pt-1 mb-4">
                                                <button class="btn btn-dark btn-lg btn-block" type="button"
                                                    style="background-color: #ff578c">Register</button>
                                            </div>

                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>




</body>

</html>