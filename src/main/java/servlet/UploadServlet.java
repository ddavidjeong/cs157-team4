package servlet;
import java.io.File;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import object.propertyBean;
@MultipartConfig
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "/Users/tianxiangchen/eclipse-workspace/Team4GroupProject/src/main/webapp/uploads"; // Specify the desired directory path

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Part part = request.getPart("image");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            
            // Create the uploads directory if it doesn't exist
            File uploadDir = new File(UPLOAD_DIRECTORY);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            HttpSession session = request.getSession();
            propertyBean property = (propertyBean) session.getAttribute("propertyBean");
            int id = property.getPropertyID();
            if (property != null) {
                System.out.println(property.getPropertyID());}
            else
            	System.out.println("error");
                
            // Save the image to the specified directory path
            part.write(UPLOAD_DIRECTORY + File.separator + Integer.toString(id)+".jpg");
            
            // Additional processing can be done here
            
            response.getWriter().println("Image uploaded successfully.");
            
            
			
			RequestDispatcher dispatcher =
					request.getRequestDispatcher("add_property.jsp");
			dispatcher.forward(request, response);
			
        } catch (Exception e) {
            response.getWriter().println("Error while uploading the image: " + e.getMessage());
        }
    }
}
