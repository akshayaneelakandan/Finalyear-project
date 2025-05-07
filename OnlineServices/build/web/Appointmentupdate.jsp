<%@page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%@page import="Service.Userorder"%>
<%@page import="Connection.DbConnection"%>
<%@page import="Service.silverview"%>
<%@page import="java.sql.ResultSet;"%>
<%
        Connection con=null; 
        Statement st=null;
        DbConnection db1=new DbConnection();
        String username1=request.getParameter("username");
        //String Mobile1=request.getParameter("Mobile");
        String query="select * from provider";
        ResultSet i=db1.Select(query);
%> 
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
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
	
  </script>
<script type="text/javascript" src="js/move-top.js">/*</script>
       <script type="text/javascript" src="js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
				});
			});*/
		</script>
		<script type="text/javascript">
		$(document).ready(function() {
				/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
				*/
		$().UItoTop({ easingType: 'easeOutQuart' });
});
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
        <li class="dropdown"><a href="admin.jsp">Home </a></li>
        
        
      <!-- <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Components<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="component.jsp">Application Software</a></li>
            <li><a href="busines.jsp">Business Software</a></li>
            <li><a href="network.jsp">Network Software</a></li>
          </ul>
        </li>-->
            <li class="dropdown">
            <!--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">View <span class="caret"></span></a>-->
            <ul class="dropdown-menu">
            
          </ul>
            
            <li><a href="Orderview.jsp">View Order Details</a></li>
            <li><a href="Appointmentupdate.jsp">Update Appointment</a></li>
            <li><a href="updatediscount.jsp">Update Discount</a></li>
            <li><a href="Permission.jsp">Permission</a></li>
        </li>
            <li><a href="Report.jsp">Report</a></li>
        
        	<!--<li><a href="about.html">About Us</a></li>-->
		<li><a href="adminlagout.jsp">Log out</a></li>
            
            </ul>
        </li>
		
           
		
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
	<div class="banner">
	<div class="main">
      <div class="contact_top">
		<div class="container">
			<div class="row">
				<div class="col-md-7 map">
				  <div class="map">
                                      <ul class="rslides" id="slider" >    
				  </div>
				</div>
                                            <div class="address">
                                              <table style="margin-top:0px;margin-left:0px;" cellpadding="3"  border="2">
                                                  <tr><h5>
                                                <td><b>Name </b></td>
                                                <td><b>Product</b></td> 
                                                <td><b>Company</b></td>
                                                 <td><b>E-Mail</b></td>
                                                <td><b>Branch</b></td>
                                                 <td><b>Mobile</b></td>
                                                 <td><b>Issues </b></td>
                                                  <td><b>Date &nbsp;&nbsp;&nbsp;</b></td> 
                                            </tr></h5>
                                             
                                    <% 
                                        int num=1;
                                        while(i.next())
                                        {
                                    %>
                                        <tr>
                                            <td><%= i.getString("username")%></td>
                                            <td><%= i.getString("product")%></td>
                                            <td><%= i.getString("comname")%></td>
                                            <td><%= i.getString("mail")%></td>
                                            <td><%= i.getString("Address")%></td>
                                            <td><%= i.getString("Mobile")%></td>
                                            <td><%=i.getString("Issue")%></td>
                                            <td><%= i.getString("appdate")%></td>
                                            <!--<td><a href="Updatedate.jsp?count=">Update</a></td>-->
                                            <td><a href="Updatedate.jsp?name=<%=(i.getString("username"))%>&company=<%=(i.getString("comname"))%>&Mobile=<%=(i.getString("Mobile"))%>&count=<%=(i.getString("appdate"))%>">Update</a></td>
                                           
                                            <% 
                                        }num++; 
                                        i.close();
                                            %>
                                        </tr></table>
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
</div></div>
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