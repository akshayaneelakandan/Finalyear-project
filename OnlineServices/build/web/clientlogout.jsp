<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head><script>
    Session.Abandon();
        Session.Clear();
        Session.RemoveAll();
        System.Web.Security.FormsAuthentication.SignOut();
        Response.Redirect("clientlogin.jsp", false); </script>
    <body>
       <%
       
         session.setAttribute("msg","Successfully LOgout..");
           response.sendRedirect("clientlogin.jsp");
        %> 
    </body>
</html>
