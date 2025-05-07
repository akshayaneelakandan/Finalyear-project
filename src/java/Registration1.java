/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import connection.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author elangovan
 */
@WebServlet(urlPatterns = {"/Registration1"})
public class Registration1 extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        try {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String userName = request.getParameter("userName");
            String mail = request.getParameter("mail");
            String mobile = request.getParameter("mobile");
            String dateofbirth = request.getParameter("dateofbirth");
            String city = request.getParameter("city");
            String address = request.getParameter("address");
            String pwd = request.getParameter("pwd");
            String cpwd = request.getParameter("cpwd");
            String gender = request.getParameter("gender");

            Connection con = null;
            DatabaseConnection db1 = new DatabaseConnection();
            String query = "select * from register where username='" + userName + "'";
            ResultSet i1 = db1.Select(query);
            if (!i1.next()) {
                int i = db1.Insert("insert into register values('" + firstname + "','" + lastname + "','" + userName + "','" + mail + "','" + mobile + "','" + dateofbirth + "','" + city + "','" + address + "','" + pwd + "','" + cpwd + "','" + gender + "','No')");
                session.setAttribute("msg", "Successfully Register");
                response.sendRedirect("index.jsp");                
            }
            else{
                session.setAttribute("msg", "This username already exist! Change username");
                response.sendRedirect("Registration.jsp"); 
            }
                
            }
         catch (Exception e) {
            System.out.print("e");
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
