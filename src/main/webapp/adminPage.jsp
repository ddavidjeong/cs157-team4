<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Admin Page</title>
    <style>
      body {
        background-color: #f8bbd0; /* Set the background color to a light pink */
      }

      h1 {
        color: #007bff; /* Set the heading color to a blue shade */
      }

      form {
        margin-top: 20px;
      }
      /* Style the buttons */
      .delete-button {
        background-color: #e57373; /* Red background color for delete button */
        color: white; /* White text color for buttons */
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
      }

      .modify-button {
        background-color: #81c784; /* Green background color for modify button */
        color: white; /* White text color for buttons */
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
      }

      .back-button {
        background-color: #64b5f6; /* Blue background color for back button */
        color: white; /* White text color for buttons */
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
      }

      /* Add some spacing between buttons */
      form:not(:last-child) {
        margin-bottom: 10px;
      }
    </style>
  </head>
  <body>
    <h1>Welcome to the Admin Page</h1>
    
    <% 
    // Retrieve adminid and Email from the session
    String adminid = (String) session.getAttribute("adminid");
    try {
        String db = "lease";
        String user = "root";
        String password = "Sheep88517565";
        String login_sql = "SELECT first_name, last_name "
                + "FROM lease.admin "
                + "WHERE admin_id = ?";

                
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        String connectionURL = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
        
        try (Connection con = DriverManager.getConnection(connectionURL, user, password);
             PreparedStatement stmt = con.prepareStatement(login_sql)) {
        	 stmt.setString(1, adminid);
             
             
        	 ResultSet rs = stmt.executeQuery();
        	 if (rs.next()) {
        		 out.println("Welcome"+" "+rs.getString(1)+" "+rs.getString(2));
             } else {
                 // Admin login failed, you can handle this scenario here.
                 out.println("Invalid admin credentials.");
             }
        } catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    } catch (ClassNotFoundException e) {
        out.println("ClassNotFoundException caught: " + e.getMessage());
    }
    %>
    <h1> </h1>
    <button class="delete-button" onclick="window.open('delete_list_admin.jsp', '_blank')">Delete Listing</button><br/><br/>
    <button class="modify-button" onclick="window.open('modify_list_admin.jsp', '_blank')">Modify Listing</button><br/><br/>
    <button class="delete-button" onclick="window.open('delete_property_admin.jsp', '_blank')">Delete Property</button><br/><br/>
    <button class="modify-button" onclick="window.open('modify_property_admin.jsp', '_blank')">Modify Property</button><br/><br/>
    <button class="back-button" onclick="window.open('admin.jsp', '_blank')">Back</button><br/><br/>

  </body>
</html>
