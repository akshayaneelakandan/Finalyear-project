

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import connection.DatabaseConnection;
@WebServlet("/upload")
@MultipartConfig(maxFileSize = 16177215)
public class upload extends HttpServlet {
    private String message;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        HttpSession session = request.getSession(true);
        String userName = request.getParameter("userName");
        String startdate = request.getParameter("startdate");
        String key = request.getParameter("key");
        String upload = request.getParameter("upload");
        Connection con = null;
        InputStream inputStream = null; // input stream of the upload file
        // obtains the upload file part in this multipart request
        int i1 = 0;
        try {
            Part filePart = request.getPart("upload");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }
            String filename = getFileName(filePart);
            DatabaseConnection db1 = new DatabaseConnection();
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tees_images_1", "root","admin");
            String sql = "insert into file(filename,date,key1,upload) values(?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, userName);
            statement.setString(2, startdate);
            statement.setString(3, key);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
            }
            //statement.setString(4, key);
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                session.setAttribute("msg", "Successfully upload");
                response.sendRedirect("Providerhome.jsp");
            } else {
                session.setAttribute("msg", "Database Error");
                response.sendRedirect("Providerhome.jsp");
            }
        } catch (Exception ex) {
            PrintWriter pw = response.getWriter();
            pw.print(ex);
        }
        request.setAttribute("Message", message);
    }

    private String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim()
                        .replace("\"", "");
            }
        }
        return null;
    }
}
