<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Admin Page</title>
    </head>
  <body>
    <h1> Listing Transactions </h1>
    
    <table border="1">
      <tr>
        <td>Listing IDs</td>
        <td>Tenant IDs</td>
        <td>Landlord IDs</td>
   </tr>
    <% 
     String db = "lease";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "FlagFoot#30";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false",user, password);
            out.println("All Active Listings"+"<br/><br/>");
            out.println("All Non-Active Listings"+"<br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet listing = stmt.executeQuery("SELECT list_id FROM listing");
            ResultSet tenant = stmt.executeQuery("SELECT Tenant_id FROM Tenant");
            ResultSet landlord = stmt.executeQuery("SELECT landlord_id FROM landlord");
            
            while (listing.next()) {
                out.println("<tr>"+"<td>"+listing.getInt(1)+"</td>" + "<td>" + tenant.getInt(1) + "</td>" + "<td>"+landlord.getInt(1)+"</td>"+"</tr>");
            }
            listing.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>