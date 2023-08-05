package servlet;

import java.io.FileInputStream;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import object.propertyBean;
@MultipartConfig
@WebServlet("/serveImage")
public class ServeImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// Retrieve the PropertyBean from the session attribute
    	HttpSession session = request.getSession();
    	propertyBean property = null;
    	int propertyId = 10; // Default value in case of an error

    	try {
    	    property = (propertyBean) session.getAttribute("propertyBean");
    	    if (property != null) {
    	        propertyId = property.getPropertyID();
    	    } else {
    	        propertyId = 8; // Set default value
    	        System.out.println("Error: PropertyBean not found in the session.");
    	    }
    	} catch (Exception e) {
    	    propertyId = 10; // Set default value
    	    System.out.println("Error while retrieving property ID: " + e.getMessage());
    	}

    	// Set the content type to image/jpeg (change the type if needed)
    	response.setContentType("image/jpeg");

    	// Replace the imageFilePath with the actual path to your image on the server
    	String imageFilePath = "/Users/tianxiangchen/eclipse-workspace/Team4GroupProject/src/main/webapp/uploads/" + propertyId + ".jpg";

    	try (FileInputStream fis = new FileInputStream(imageFilePath)) {
    	    byte[] buffer = new byte[1024];
    	    int bytesRead;
    	    while ((bytesRead = fis.read(buffer)) != -1) {
    	        response.getOutputStream().write(buffer, 0, bytesRead);
    	    }
    	} catch (Exception e) {
    	    System.out.println("Error while serving the image: " + e.getMessage());
    	}

    }
}
