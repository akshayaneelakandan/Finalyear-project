/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import connection.DatabaseConnection;

@WebServlet(urlPatterns = {"/providerlogin"})
public class providerlogin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        try {
            Connection con = null;
            Statement st = null;
            DatabaseConnection db1 = new DatabaseConnection();
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String query = "select * from ownerregister where username='" + userName + "' and password='" + password + "'";
            ResultSet i = db1.Select(query);
            if (i.next()) {
                
                 String sts=i.getString("sts");
                    if(sts.equals("No"))
                    {
                          session.setAttribute("msg","Admin Can't not Approval!...");
              response.sendRedirect("index.jsp");
                    }
                     else if(sts.equals("Reject"))
                    {
                       session.setAttribute("msg","Admin Reject your Approval!...");
              response.sendRedirect("index.jsp");  
                    }
                    else
                    { 
                        session.setAttribute("msg", "Successfully Login");
                session.setAttribute("username", userName);
                session.setAttribute("password", password);
                response.sendRedirect("providerindex.jsp");
                        
                    }
                
            } else {
               session.setAttribute("msg", "Username & password incorrect!...");
                response.sendRedirect("Provider.jsp");
            }
        } catch (Exception e) {
            System.out.print("e"+e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
