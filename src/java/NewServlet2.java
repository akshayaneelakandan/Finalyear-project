
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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

@WebServlet("/NewServlet2")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class NewServlet2 extends HttpServlet {
    // database connection settings
    // private String dbURL = "jdbc:mysql://localhost:3306/tees";
    //  private String dbUser = "root";
    //  private String dbPass = "admin";

    protected void service(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        HttpSession session = request.getSession(true);
        String userName = request.getParameter("userName");
        String startdate = request.getParameter("startdate");
        String key = request.getParameter("key");
        String upload = request.getParameter("upload");
        InputStream inputStream = null; // input stream of the upload file   
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("upload");
        if (filePart != null) {
            //prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        PreparedStatement pst;
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(NewServlet2.class.getName()).log(Level.SEVERE, null, ex);
            }
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tees_images_1", "root","admin");
            String Query = "INSERT INTO file(filename, date, key, upload) values (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(Query);
            statement.setString(1, userName);
            statement.setString(2, startdate);
            statement.setString(3, key);
            statement.setString(4, upload);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream);
            }
            int row = statement.executeUpdate();
            if (row > 0) {
                session.setAttribute("msg", "Upload Successfully..");
                response.sendRedirect("Providerhome.jsp");
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }

        }
    }

    private String getFileName(Part filepart) {
        String header = filepart.getHeader("content-disposition");
        String filename1 = header.substring(header.indexOf("filename=\""));
        return filename1;
    }
}