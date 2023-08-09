<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Admin Login</title>
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
      input[type="submit"] {
        background-color: #4CAF50; /* Green background color for buttons */
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
    <h1>This is the Login Page for Admin</h1>
    <form method="post" action="admin.jsp">
      <label for="adminid">admin id:</label>
      <input type="number" id="adminid" name="adminid" required><br/><br/>
      
      <label for="Email">Email:</label>
      <input type="text" id="Email" name="Email" required><br/><br/>
      
      <input type="submit" value="Login">
    </form>
    
    <% 
    String adminid = request.getParameter("adminid");
    String Email = request.getParameter("Email");
        try {
            String db = "lease";
            String user = "root";
            String password = "Sheep88517565";
            String login_sql = "SELECT a.admin_id, b.email_address "
                    + "FROM lease.admin a "
                    + "LEFT JOIN lease.users b ON a.user_id = b.user_id "
                    + "WHERE a.admin_id = ? AND b.email_address = ?";

                    
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
            
            try (Connection con = DriverManager.getConnection(connectionURL, user, password);
                 PreparedStatement stmt = con.prepareStatement(login_sql)) {
            	 stmt.setString(1, adminid);
                 stmt.setString(2, Email);
                 
            	 ResultSet rs = stmt.executeQuery();
            	 if (rs.next()) {
                     // Admin login is successful
                     
                     session.setAttribute("adminid", adminid);
                     
                     response.sendRedirect("adminPage.jsp");
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

  </body>
</html>
