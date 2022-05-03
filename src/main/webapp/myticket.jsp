<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href = "myticket.css">
    <link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png"/>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <title>My Account</title>
</head>
<body>

    <div class="container">
        <div class="main-body">
        
            <div class="container header__container">
                <div class="header__logo"><img class="header__img" src="https://image.ibb.co/kcVou6/path3000.png"> <h1 class="header__title">Shairport<span class="header__light"></span></h1></div> 
            
            
              <div class="header__menu">
                <nav id="navbar" >
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
            ">Sign In</a></li>
                  </ul>
                </nav>
              </div>
              <!-- Breadcrumb -->
              <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol style ="  visibility: hidden;
""                class="breadcrumb">
                
                </ol>
              </nav>
              <!-- /Breadcrumb -->
        
              <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex flex-column align-items-center text-center">
                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin" class="rounded-circle" width="150">
                        <div class="mt-3">
                          <h4>${name}</h4>
                          <p class="text-secondary mb-1">Year: ${gradyear}</p>
                          <p class="text-muted font-size-sm">Major: ${major}</p>
                        
                        </div>
                       <div class="col-sm-12">
                       <form action="editServlet" method="GET">
                       <a class="btn btn-info " target="__blank"><button type = "submit" style="  background: none!important;
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
                          ${name}          </div>
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
    
                  <div  style ="margin-left: -7px;"class="row gutters-sm">
                  <c:forEach var="tic" items="${myCarpools}">
                    <div class="col-sm-6 mb-3">
                      <div class="card h-100">
                        <div class="card-body">
                          <h6 class="d-flex align-items-center mb-3"><i class="x"><button style="background: none;
                            color: inherit;
                            border: none;
                            padding: 0;
                            font: inherit;
                            cursor: pointer;
                            outline: inherit;">X</button></i><i class="material-icons text-info mr-2">Ticket#</i>${tic.getticketID()}</h6>
                          <small>Airport Arrival Time: </small> <span class="text"> ${tic.getDisplayPickupTime() }</span>
                          <hr > 
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
</html>