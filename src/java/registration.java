
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import connection.DatabaseConnection;
public class registration extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
         HttpSession session=request.getSession(true);
         try {
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String userName=request.getParameter("userName");
            String mail=request.getParameter("mail");
            String mobile=request.getParameter("mobile");
            String dateofbirth=request.getParameter("dateofbirth");
            String city=request.getParameter("city");
            String address=request.getParameter("address");
            String pwd=request.getParameter("pwd");
            String cpwd=request.getParameter("cpwd");
            String gender=request.getParameter("gender");
            System.out.println(firstname);
            Connection con=null; 
            DatabaseConnection db1=new DatabaseConnection();
            int i=db1.Insert("insert into register values('"+firstname+"','"+lastname+"','"+userName+"','"+mail+"','"+mobile+"','"+dateofbirth+"','"+city+"','"+address+"','"+pwd+"','"+cpwd+"','"+gender+"')");          
            session.setAttribute("msg","Successfully Register");
            response.sendRedirect("index.jsp");
        }
          catch(Exception e)
        {
            System.out.print("e");
        }
    }

   
}
