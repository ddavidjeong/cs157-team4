<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Admin Page</title>
  </head>
  <body>
    <h1>Welcome to the Admin Page</h1>
    
    <% 
    // Retrieve adminid and Email from the session
    String adminid = (String) session.getAttribute("adminid");
    try {
        String db = "shortterm_release";
        String user = "root";
        String password = "Sheep88517565";
        String login_sql = "SELECT first_name, last_name "
                + "FROM shortterm_release.admin "
                + "WHERE admin_id = ?";

                
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        String connectionURL = "jdbc:mysql://localhost:3306/shortterm_release?autoReconnect=true&useSSL=false";
        
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
    <a href="delete_list_admin.jsp" target="_blank"><button type="button">delete listing</button></a><br/><br/>
    <a href="modify_list_admin.jsp" target="_blank"><button type="button">modify listing</button></a><br/><br/>
    <a href="admin.jsp" target="_blank"><button type="button">Back</button></a><br/><br/>

  </body>
</html>
