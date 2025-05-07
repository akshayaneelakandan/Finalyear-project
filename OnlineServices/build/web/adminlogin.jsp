
<!DOCTYPE HTML>

<html>
<head>
<title>Online Service Management </title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary JavaScript plugins) -->
<script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Medical_Equipment Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<script type="text/javascript" src="js/bootstrap.js"></script>

<script src="js/simpleCart.min.js"> </script>
<script src="js/responsiveslides.min.js"></script>
<script>
        window.location.hash = "no-back-button";
        window.location.hash = "Again-No-back-button";//again because google chrome don't insert first hash into history
        window.onhashchange = function () { window.location.hash = "no-back-button"; }
</script> 

<script>
    $(window).load(
        function () {
            $('.carousel1').carouFredSel({
                auto: false,
                prev: '.prev',
                next: '.next',
                width: 220,
                items: {
                    visible: {
                        min: 3,
                        max: 3
                    },
                    height: 'auto',
                    width: 220,
                },
                responsive: true,
                scroll: 1,
                mousewheel: false,
                swipe: {
                    onMouse: false,
                    onTouch: true
                }
            });
            $('.typo').mouseenter(
                function () {
                    var temp = $(".typo>img").attr("data-href");
                    $(".typo>img").attr(
                        "src", temp
                    );
                }
            );
        });
</script>
<script type='text/javascript'>
    function validation()
    {
        var name1 = document.getElementById('uid').value;
                        var name11 = /^[A-Za-z ]+$/.test(name1);
                        var namelen = name1.length;
                        if (name1 == "")
                        {
                            alert('user name field cant be empty');
                            return false;
                        }
                        else if (!name11)
                        {
                            alert('user name should be alphabets');
                            return false;
                        }
                        else if ((namelen < 5) || (namelen > 20))
                            {
                                alert('user name should be between 5  to 20 characters');
                                return false;
                                }
               var name1 = document.getElementById('pid').value;
                        var name11 = /^[A-Za-z ]+$/.test(name1);
                        var namelen = name1.length;
                        if (name1 == "")
                        {
                            alert('Pasword field cant be empty');
                            return false;
                        }
                        else if (!name11)
                        {
                            alert('Password should be alphabets');
                            return false;
                        }
                        else if ((namelen < 5) || (namelen > 20))
                            {
                                alert('Password should be between 5 to 20 characters');
                                return false;
                                }
                        return true;
    }

   </script>
</head>
<body>
<!-- header -->
<div class="header_bg">
<div class="container">
	<div class="header">
	<div class="head-t">
		<div class="logo">
                    <a href="#"><h1>Online Service Management</h1><class="img-responsive" alt=""/> </a>
		</div>
		<!-- start header_right -->
		<div class="header_right">
			<div class="rgt-bottom">	
			<div class="clearfix"> </div>
		</div>
		<div class="se-ca">
					<div class="clearfix"> </div>
				</div>
			<div class="clearfix"> </div>
		</div>
		</div>
			<div class="clearfix"> </div>
	</div>	
	
		<!-- start header menu -->
		<div class="header-top">
			<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
        <li class="dropdown"><a href="index.jsp">Home </a></li>
        <li class="dropdown"><a href="login.jsp">User</a></li>
        <li class="dropdown"><a href="clientlogin.jsp">Client </a></li>
       <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Contractor <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Silverlogin.jsp">Silver customer</a></li>
            <li><a href="Goldenlogin.jsp">Golden customer</a></li>
            <li><a href="Platinumlogin.jsp">Platinum customer</a></li>
          </ul>
        </li>
        <li class="dropdown"><a href="adminlogin.jsp">Admin </a></li>      
		<!--<li><a href="about.jsp">About Us</a></li>-->
		<li><a href="contact.jsp">Contact Us</a></li>      </ul>   
    </div>  
    
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
		</div>
		<!-- start header menu -->
	</div>
</div>
</div>
<!-- start banner -->
<div class="banner">
     <%
                      String msg=(String)session.getAttribute("msg");
                      if(msg!=null)
                      {
                          %>
                          <Script>
                              var msg='<%=msg%>';
                              alert(msg);
                              </script>
                          <%
                          session.removeAttribute("msg");
                      }
                      %>
	<div class="main">
      <div class="contact_top">
		<div class="container">
			<div class="row">
				<div class="col-md-7 map">
				  <div class="map">
                                      <ul class="rslides" id="slider" >                                                  
                   
                                                    <img src="images/images8.jpg"/>                                                   
                                      
				  </div>
				</div>
				<div class="col-md-5 tes">
					<div class="m_8">
                                            
					<div class="address">
                                            <form method="post" action="admin" onsubmit="return validation();">
         
            <table style="margin-top:0px; margin-left:0px;" border="1" width="300" height="200" >
                <thead>
                    <tr>
                        <th colspan="2">Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td> <input type="text" name="uname" id="uid"/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" id="pid"/></td>
                    </tr>
                    <tr>
                        
                        <td><input type="reset" value="Reset" /></td>
                        <td><input type="submit" value="Login" /></td>
                    </tr>
                   
                </tbody>
            </table>
     
        </form>
			
                    
						</ul>
			  		</div>
				 </div>
				</div>
		</div>
		
		<div class="clearfix"> </div>
	</div>
</div>
<!-- end banner -->

<div class="special">
	<div class="container">
		<div class="specia-top">
			<ul class="grid_2">
		
		<div class="clearfix"> </div>
	</ul>
		</div>
	</div>
</div>
<!-- special -->
<!--<div class="special">
	<div class="container">
		<div class="specia-top">
			<ul class="grid_2">
		
		<div class="clearfix"> </div>
	</ul>
		</div>
	</div>
</div>
<div class="foot-top">
	<div class="container">
		<div class="col-md-6 s-c">
			<li>
				<div class="fooll">
					<h5>follow us on</h5>
				</div>
			</li>
			<li>-->
				<!--<div class="social-ic">
					<ul>
						<li><a href="#"><i class="facebok"> </i></a></li>
						<li><a href="#"><i class="twiter"> </i></a></li>
						<li><a href="#"><i class="goog"> </i></a></li>
						<li><a href="#"><i class="inst"> </i></a></li>
							<div class="clearfix"></div>	
					</ul>
				</div>
			</li>
				<div class="clearfix"> </div>
		</div>
		<div class="col-md-6 s-c">
			<div class="stay">
						<div class="stay-left">
							<form>
								<input type="text" placeholder="Enter your email " required="">
							</form>
						</div>
						<div class="btn-1">
							<form>
								<input type="submit" value="join">
							</form>
						</div>
							<div class="clearfix"> </div>
			</div>
		</div>
			<div class="clearfix"> </div>
	</div>
</div>
<div class="footer">
	<div class="container">
		<div class="col-md-3 cust">
			<h4>CUSTOMER CARE</h4>
				<li><a href="#">Help Center</a></li>
				<li><a href="#">FAQ</a></li>
				<li><a href="#">How To Buy</a></li>
				<li><a href="#">Delivery</a></li>
		</div>
		<div class="col-md-3 abt">
			<h4>ABOUT US</h4>
				<li><a href="#">Our Stories</a></li>
				<li><a href="#">Press</a></li>
				<li><a href="#">Career</a></li>
				<li><a href="contact.html">Contact</a></li>
		</div>
		<div class="col-md-3 myac">
			<h4>MY ACCOUNT</h4>
				<li><a href="register.html">Register</a></li>
				<li><a href="#">My Cart</a></li>
				<li><a href="#">Order History</a></li>
				<li><a href="buy.html">Payment</a></li>
		</div>
		<div class="col-md-3 our-st">
				<h4>OUR STORE</h4>
				<li><i class="add"> </i>lorem ipsum</li>
				<li><i class="phone"> </i>1234567890</li>
				<li><a href="mailto:info@example.com"><i class="mail"> </i>info@sitename.com </a></li>
			
		</div>
		<div class="clearfix"> </div>-->
			<p>Copyrights © 2015 Online service management. All rights reserved | Design by <a href="http://Soflogicsystems.com/">Softlogic</a></p>
	</div>
</div>
<a href="#" id="toTop" style="display: block;"><span id="toTopHover" style="opacity: 0;"></span> <span id="toTopHover" style="opacity: 0;"> </span></a>
</body>
</html>