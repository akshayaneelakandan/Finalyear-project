import connection.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/reportview"})
public class reportview extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        String username = request.getParameter("uname");
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");

        // Create a new database connection
        DatabaseConnection db1 = new DatabaseConnection();
        String query = "SELECT * FROM fileupload1 WHERE date BETWEEN '" + startdate + "' AND '" + enddate + "' AND username='" + username + "' ORDER BY date ASC";

        try {
            // Execute the query and get the result
            ResultSet rs = db1.Select(query);

            if (rs.next()) {
                session.setAttribute("startdate", startdate);
                session.setAttribute("enddate", enddate);
                session.setAttribute("username", username);

                request.setAttribute("username", username);
                request.setAttribute("startdate", startdate);
                request.setAttribute("enddate", enddate);
                session.setAttribute("msg", "Successfully Retrieved Data");

                // Forward the request to the JSP page
                RequestDispatcher rd = request.getRequestDispatcher("ReportView.jsp");
                rd.forward(request, response);
            } else {
                // If no data is found
                session.setAttribute("msg", "No data available for the selected dates.");
                response.sendRedirect("report.jsp");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("msg", "Error retrieving data: " + e.getMessage());
            response.sendRedirect("error.jsp");

        } finally {
            db1.close();  // Make sure to close the database resources
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
