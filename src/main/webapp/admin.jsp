<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Admin Login</title>
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
            String user = "root";
            String password = "Hazuki_0824";
            String login_sql = "SELECT a.admin_id, b.email_address "
                    + "FROM admin a "
                    + "LEFT JOIN users b ON a.user_id = b.user_id "
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
