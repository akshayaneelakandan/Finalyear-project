
import connection.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/update"})
public class update extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
         HttpSession session=request.getSession(true);
        try {
            
           DatabaseConnection db1=new DatabaseConnection();
           
           String key1=request.getParameter("key1");
           String query1="update fileupload1 set status='active' where key1='"+key1+"'";
         int i=db1.Update(query1);
         session.setAttribute("msg"," Update Successfully ");
         response.sendRedirect("permisssion.jsp");
           
        } finally {            
            out.close();
        }
    }
}
