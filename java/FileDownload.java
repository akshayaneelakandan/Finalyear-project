
import connection.DatabaseConnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/FileDownload"})
public class FileDownload extends HttpServlet {

    private static final int BUFFER_SIZE = 4096;
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/tees_images_1";
    private String dbUser = "root";
    private String dbPass = "admin";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        // get upload id from URL's parameters
        DatabaseConnection db = new DatabaseConnection();
        int uploadId = Integer.parseInt(request.getParameter("encpwd"));
        HttpSession session = request.getSession(true);
        String PKEY1 = request.getParameter("PKey");
        ResultSet fg = db.Select("select * from fileupload1 where encpwd like '" + PKEY1 + "%'");
        if (fg.next()) {
            String filekey = request.getParameter("filekey");

            String status = request.getParameter("status");
            System.out.println("uploadId" + uploadId + "filekey" + filekey + "status" + status);
            Connection conn = null; // connection to the database
            try {
                // connects to the database
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                // queries the database
                String sql = "SELECT * FROM fileupload1 WHERE encpwd = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, uploadId);
                ResultSet result = statement.executeQuery();
                if (result.next()) {
                    String filekey1 = result.getString("key1");
                    String status1 = result.getString("status");
                    System.out.println("filekey1" + filekey1 + "status1" + status1);
                    if ((status.equals(status1))) {
                        String fileName1 = result.getString("filename");
                        Blob blob = result.getBlob("empty");
                        InputStream inputStream = blob.getBinaryStream();
                        int fileLength = inputStream.available();
                        System.out.println("fileLength = " + fileLength);
                        ServletContext context = getServletContext();
                        // sets MIME type for the file download
                        String mimeType = context.getMimeType(fileName1);
                        if (mimeType == null) {
                            mimeType = "application/octet-stream";
                        }
                        response.setContentType(mimeType);
                        response.setContentLength(fileLength);
                        String headerKey = "Content-Disposition";
                        String headerValue = String.format("attachment; filename=\"%s\"", fileName1);
                        response.setHeader(headerKey, headerValue);
                        // writes the file to the client
                        OutputStream outStream = response.getOutputStream();
                        byte[] buffer = new byte[BUFFER_SIZE];
                        int bytesRead = -1;
                        while ((bytesRead = inputStream.read(buffer)) != -1) {
                            outStream.write(buffer, 0, bytesRead);
                        }
                        inputStream.close();
                        outStream.close();
                        conn.close();

                    } else {
                        session.setAttribute("Pkgverifymsg1", "Key Values are Not Matching !");
                        response.sendRedirect("File_Revocation.jsp");
                    }

                }


            } catch (SQLException ex) {
                ex.printStackTrace();
                response.getWriter().print("SQL Error: " + ex.getMessage());
            } catch (IOException ex) {
                ex.printStackTrace();
                response.getWriter().print("IO Error: " + ex.getMessage());
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
        } else {
            session.setAttribute("msg", "Key Values are Not Matching !");
            response.sendRedirect("searchresult.jsp");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FileDownload.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FileDownload.class.getName()).log(Level.SEVERE, null, ex);
        }
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
