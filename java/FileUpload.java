import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import connection.DatabaseConnection;

@WebServlet("/FileUpload")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUpload extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "upload";
    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
    private String dbURL = "jdbc:mysql://localhost:3306/tees_images_1";
    private String dbUser = "root";
    private String dbPass = "admin";
    private String message;
    private Object conn;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        String username1 = request.getParameter("userName");
        String date1 = request.getParameter("startdate");
        String key1 = request.getParameter("key");
        String encpwd1 = request.getParameter("enckey");
        String filesize1 = request.getParameter("filesize");
        String filename1=request.getParameter("filename");
        
        String privatekey1 = "Not Updated";
        String outsourcekey1 = "Not Updated";
        String updatedkey1 = "Not Updated";

        InputStream inputStream12 = null;

        Part filePart = request.getPart("file12");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            // obtains input stream of the upload file
            inputStream12 = filePart.getInputStream();
        }




        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
        HttpSession session = request.getSession(true);

        try {


            String file, password;


            FileInputStream inFile;
            FileOutputStream outFile;

            file = getFileName(filePart);
            password = request.getParameter("enckey");



          //  inFile = new FileInputStream("D:\\2015 Projects\\IdentityBased\\web\\Files\\upload\\" + file);
            outFile = new FileOutputStream("D:\\arulmani\\TEES\\web\\Files\\upload" + file + ".aes");

            try {
                PBEKeySpec keySpec = new PBEKeySpec(password.toCharArray());
                SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBEWithMD5AndDES");
                SecretKey passwordKey = keyFactory.generateSecret(keySpec);



                byte[] salt = new byte[8];
                Random rnd = new Random();
                rnd.nextBytes(salt);
                int iterations = 100;



                PBEParameterSpec parameterSpec = new PBEParameterSpec(salt, iterations);



                Cipher cipher = Cipher.getInstance("PBEWithMD5AndDES");
                cipher.init(Cipher.ENCRYPT_MODE, passwordKey, parameterSpec);



                outFile.write(salt);



                byte[] input = new byte[64];
                int bytesRead;
               /* while ((bytesRead = inFile.read(input)) != -1) {
                    byte[] output = cipher.update(input, 0, bytesRead);
                    if (output != null) {
                        outFile.write(output);
                    }
                }*/

                byte[] output = cipher.doFinal();
                if (output != null) {
                    outFile.write(output);
                }

               // inFile.close();
                outFile.flush();
                outFile.close();


            } catch (Exception e) {
                System.out.println(e.getMessage());
                System.out.println(e.getLocalizedMessage());
                System.out.println(e.getCause());

            }

            if (!ServletFileUpload.isMultipartContent(request)) {
                // if not, we stop here
                PrintWriter writer = response.getWriter();
                writer.println("Error: Form must has enctype=multipart/form-data.");
                writer.flush();
                return;
            }

            // configures upload settings
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // sets memory threshold - beyond which files are stored in disk
            factory.setSizeThreshold(MEMORY_THRESHOLD);
            // sets temporary location to store files
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            ServletFileUpload upload = new ServletFileUpload(factory);

            
            String uploadPath = getServletContext().getRealPath("")
                    + File.separator + UPLOAD_DIRECTORY;
            String path = "D:\\arulmani\\TEES\\web\\Files\\upload" + File.separator + UPLOAD_DIRECTORY;

            // creates the directory if it does not exist
            File uploadDir = new File(path);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            try {
                // parses the request's content to extract file data
                @SuppressWarnings("unchecked")
                List<FileItem> formItems = upload.parseRequest(request);

                if (formItems != null && formItems.size() > 0) {
                    // iterates over form's fields
                    for (FileItem item : formItems) {
                        // processes only fields that are not form fields
                        if (!item.isFormField()) {
                            String fileName = new File(item.getName()).getName();
                            String filePath = path + File.separator + fileName;
                            File storeFile = new File(filePath);

                            // saves the file on disk
                            item.write(storeFile);

                        }
                    }
                }
            } catch (Exception ex) {
                request.setAttribute("message", "There was an error: " + ex.getMessage());
            }
            // redirects client to message page
            




            // connects to the database

            String verify1 = "Request";
            String keystatus1 = "Not Verified";

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            DatabaseConnection db1 = new DatabaseConnection();
            ResultSet rs1 = null;
            

            



            // constructs SQL statement
            String sql = "INSERT INTO fileupload1(Username, date, key1, file12, encpwd, filesize, filename) values(?,?,?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username1);
            statement.setString(2, date1);
            statement.setString(3, key1);


            if (inputStream12 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(4, inputStream12);

            }
            statement.setString(5, encpwd1);
            statement.setString(6, filesize1);
            statement.setString(7, filename1);
            

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {

                session.setAttribute("msg", "Successfully Uploaded");
                response.sendRedirect("Providerhome.jsp");
            } else {
                session.setAttribute("msg", "Database Error");
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
            // sets the message in request scope
            request.setAttribute("Message", message);

            // forwards to the message page
            //getServletContext().getRequestDispatcher("/moviedetails.jsp").forward(request, response);
        }
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
