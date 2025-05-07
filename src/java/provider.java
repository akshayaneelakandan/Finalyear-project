
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import connection.DatabaseConnection;
public class provider extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
         HttpSession session=request.getSession(true);
         try {
             Connection con=null; 
        Statement st=null;
        DatabaseConnection db1=new DatabaseConnection();
            String userName=request.getParameter("userName");         
            String password=request.getParameter("password");           
           String query="select * from register where username='"+userName+"' and password='"+password+"'";
        ResultSet i=db1.Select(query);
                if(!i.next())
                {
              session.setAttribute("msg","Username & password incorrect!...");
              response.sendRedirect("provider.jsp");
            }
                else
                {
               session.setAttribute("msg","Successfully Login");
               session.setAttribute("username",userName);
               session.setAttribute("password", password);
               response.sendRedirect("Providerhome.jsp");
            }
        }
          catch(Exception e)
        {
            System.out.print("e");
        }
    }

   
}
