<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       
         session.setAttribute("msg","Successfully Logout..");
           response.sendRedirect("adminlogin.jsp");
        %> 
    </body>
</html>
