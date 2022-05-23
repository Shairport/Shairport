
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link class="stylz" rel="stylesheet" href="rs.css">
		<link rel="shortcut icon" type="image/png" href="https://image.ibb.co/fOur3b/favicon.png" />
		<script src="r.js"></script>
		<link rel="stylesheet" href="aboutus.css">
		<title>Results</title>
	</head>

	<body class="peek">


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



			<!-- <nav class="navtopbar">
			<div class="topbar">
				<div class="toplogo" style="width: 30%;">
					<div class="toplogo-container">
						<a href="mellhome.jsp">
							<img src="Shairportlogo.png" class="shairport_logo">
						</a>
					</div>
				</div>


				<ul class="navbar_menu" style="width: 70%;">
					<li class="navbar_item"> <a href="mellhome.jsp" class="links">Home</a> </li>
					<li class="navbar_item"> <a href="aboutus.jsp" class="links">About Us</a> </li>
					<li class='navbar_item'><form action='directToTickets' method='GET'><a class='links'><button style='background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;'>My Profile</button> </a></form> </li>
					<li class='navbar_item'><form action='logoutServlet' method='GET'><a class='links'><button onclick='signOut();' style='background: none; color: inherit; border: none; padding: 0; font: inherit; cursor: pointer; outline: inherit;'>Logout</button></a></form></li>
					
					
					
				</ul>
			</div>
		</nav> -->
		</div>

		<br>
		<br>
		<div class="wow"></div>

		<container>


			<h2>Ticket Results <span class="block"> </span> </h2>
			
		</container>
	</body>
	<script>
		window.onload = async function afterWebPageLoad() {
			var docu = document.getElementsByTagName("html");
			var savedContent = docu[0].innerHTML;
			docu[0].innerHTML = '<head>\n    <meta charset="UTF-8">\n    <meta http-equiv="X-UA-Compatible" content="IE=edge">\n    <meta name="viewport" content="width=device-width, initial-scale=1.0">\n    <title>loading</title>\n    <link rel="stylesheet" href="loading.css">\n    <link rel="shortcut icon" type="image/x-icon" href="https://image.ibb.co/fOur3b/favicon.png">\n\n\n</head>\n<body>\n   \n<div class="scene" style="--hue: 260; --saturation: 87; --lightness: 67">\n    <div class="word">\n      <div class="letter__wrap" style="--index: 0">\n        <div class="letter" data-letter="L"><span class="letter__panel" aria-hidden="true">L</span><span class="letter__panel" aria-hidden="true">W</span><span class="letter__panel" aria-hidden="true">L</span><span class="letter__panel" aria-hidden="true">W</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 1">\n        <div class="letter" data-letter="o"><span class="letter__panel" aria-hidden="true">o</span><span class="letter__panel" aria-hidden="true">a</span><span class="letter__panel" aria-hidden="true">o</span><span class="letter__panel" aria-hidden="true">a</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 2">\n        <div class="letter" data-letter="a"><span class="letter__panel" aria-hidden="true">a</span><span class="letter__panel" aria-hidden="true">i</span><span class="letter__panel" aria-hidden="true">a</span><span class="letter__panel" aria-hidden="true">i</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 3">\n        <div class="letter" data-letter="d"><span class="letter__panel" aria-hidden="true">d</span><span class="letter__panel" aria-hidden="true">t</span><span class="letter__panel" aria-hidden="true">d</span><span class="letter__panel" aria-hidden="true">t</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 4">\n        <div class="letter" data-letter="i"><span class="letter__panel" aria-hidden="true">i</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel" aria-hidden="true">i</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 5">\n        <div class="letter" data-letter="n"><span class="letter__panel" aria-hidden="true">n</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel" aria-hidden="true">n</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel"></span></div>\n      </div>\n      <div class="letter__wrap" style="--index: 6">\n        <div class="letter" data-letter="g"><span class="letter__panel" aria-hidden="true">g</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel" aria-hidden="true">g</span><span class="letter__panel" aria-hidden="true">.</span><span class="letter__panel"></span></div>\n      </div>\n    </div>\n  </div>\n\n</body>'

			await new Promise(resolve => setTimeout(resolve, 10000)); // 3 sec
			docu[0].innerHTML = savedContent;




		}
	</script>

	</html>