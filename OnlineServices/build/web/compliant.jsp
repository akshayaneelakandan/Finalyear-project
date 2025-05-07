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
</script>
<script type='text/javascript' >
    function validateion()
    {
        var name1 = document.getElementById('name').value;
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
                        else if ((namelen < 6) || (namelen > 20))
                            {
                                alert('user name should be between 6 to 20 characters');
                                return false;
                                }
               var name1 = document.getElementById('pwd').value;
                        var name11 = /^[A-Za-z ]+$/.test(name1);
                        var namelen = name1.length;
                        if (name1=="")
                        {
                            alert('Product name field cant be empty');
                            return false;
                        }
                        else if (!name11)
                        {
                            alert('Product name should be alphabets');
                            return false;
                        }
                        else if ((namelen < 6) || (namelen > 20))
                            {
                                alert('Product name should be between 6 to 20 characters');
                                return false;
                            }
                         var name1 = document.getElementById('cname').value;
                        var name11 = /^[A-Za-z ]+$/.test(name1);
                        var namelen = name1.length;
                        if (name1=="")
                        {
                            alert('Company name field cant be empty');
                            return false;
                        }
                        else if (!name11)
                        {
                            alert('Company name should be alphabets');
                            return false;
                        }
                        else if ((namelen < 6) || (namelen > 20))
                            {
                                alert('Company name should be between 6 to 20 characters');
                                return false;
                            }
                          var Mail = document.getElementById("mail").value;
                        var filter =/^[a-zA-Z0-9\.]+@[-a-zA-Z0-9\.]+[(com)?(in)?(org)?(net)?]+$/.test(Mail);
                        if (!filter) {
                            alert("Invalid Mail ID");
                            return false;
                        }
                        var pass1 = document.getElementById('add').value;
                        var name11 = /[A-Za-z0-9]+$/.test(pass1);
                        var namelen = name1.length;
                        if (add == "")
                        {
                            alert('Address field cant be empty');
                            return false;
                        }
                          else if (!name11)
                        {
                            alert('Fill address alphabets and if you need numbers only');
                            return false;
                        }
                        var mml = document.getElementById("mob").value;
                        var mmml =/^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$/.test(mml);
                        var mlen = mml.length;
                        if (mml == "")
                        {
                            alert("Phone Number Field Cant Empty");
                            // document.getElementById("E_Ph").style.border='1px solid red';
                            document.getElementById("mobile")
                            return false;
                        }
                        else if (!mmml)
                        {
                            alert("Phone number should be 10 numbers not starting with 0 to 6");
                            //document.getElementById("E_Ph").style.border='1px solid red';
                            document.getElementById("mobile")
                            return false;
                        }
                        else if ((mlen < 10) || (mlen > 10))
                        {
                            alert("Phone Number Should Contain 10 Numbers");
                            //document.getElementById("E_Ph").style.border='1px solid red';
                            document.getElementById("mobile")
                            return false;
                        }
                        var pass1 = document.getElementById('iss').value;
                        var name11 = /^[A-Za-z]+$/.test(pass1);
                        var namelen = name1.length;
                        if (add == "")
                        {
                            alert('Issues field cant be empty');
                            return false;
                        }
                          else if (!name11)
                        {
                            alert('Issus only alphabets');
                            return false;
                        }
                         var date = document.getElementById('start_datepicker').value;
                        if (date == "")
                        {
                            alert('Date cant be empty');
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
                    <a href="index.jsp"><h1>Online Service Management</h1><class="img-responsive" alt=""/> </a>
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
        <li class="dropdown"><a href="clientlogin.jsp">Home </a></li>
        <li class="dropdown"><a href="#">Client</a></li>
        
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Components<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="component.jsp">Application Software</a></li>
            <li><a href="busines.jsp">Business Software</a></li>
            <li><a href="network.jsp">Network Software</a></li>
          </ul>
        </li>
		<li class="dropdown">
          <a href="compliant.jsp" >Provider </a>
           
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View <span class="caret"></span></a>
            <ul class="dropdown-menu">
            <li><a href="individualappointment.jsp">Appointment Date</a></li>
            
          </ul>
        </li>
		<!--<li><a href="about.html">About Us</a></li>-->
		
                <li><a href="logout.jsp">Log out</a></li>
      </ul>
      
    
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
	<div class="main">
      <div class="contact_top">
		<div class="container">
			<div class="row">
				<div class="col-md-7 map">
				  <div class="map">
			 <img src="images/images3.jpg"/>     
				  </div>
				</div>
				<div class="col-md-5 tes">
					<div class="m_8">
                                            
					<div class="address">
                                            <form name="fname" method="post"  action="NewServlet" onsubmit="return validateion();">

                <table style="margin-top:-20px; margin-left:-200px;" border="1" width="500" height="200" >
                    <thead>
                        <tr>
                            <th colspan="2">Provider Appointment</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>User Name</td>
                            <td> <input type="text" name="uname" id="name"/></td>
                        </tr>
                        <tr>                       
                            <td>Product Name</td>
                            <td><input type="text" name="product"  id="pwd"/></td>
                        </tr>
                        <td>Company Name</td>
                            <td> <input type="text" name="comname" id="cname"/></td>
                        </tr>
                        
                        <td>E-mail</td>
                            <td> <input type="text" name="mail" id="mail"/></td>
                        </tr>
                        <td>Address</td>
                            <td> <input type="text" name="Address" id="add" /></td>
                        </tr>
                     
                        <td>Mobile Number</td>
                            <td> <input type="text" name="Mobile"  id="mob"/></td>
                        </tr>

                        </tr>
                        <td>Issue</td>
                            <td> <input type="text" name="Issue"  id="iss"/></td>
                        </tr>
                        
                        <td>Appointment Date </td>
                        <td> <input type="date" name="startdate" id="start_datepicker"/></td>
                        </tr>
                        
                        <tr>
                            <td><input type="reset" value="Reset" /></td>
                            <td> <input type="submit" value="appointment" /></td>
                           
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