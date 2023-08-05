<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Room Page</title>
    </head>
  <body>
    <h1> Available Room Page </h1>
    
    <table border="1">
      <tr>
        <td>Address_id</td>
        <td>Street</td>
        <td>City</td>
        <td>state</td>
        <td>zip code</td>
   </tr>
   <a href="add_property.jsp" target="_blank"><button type="button">Back to add property</button></a><br/><br/>
    <% 
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Hazuki_0824";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false",user, password);
            out.println("Address id"+"<br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM address");
            
            while (rs.next()) {
                out.println("<tr>"+"<td>"+rs.getInt(1)+"</td>" + "<td>" + rs.getString(3) + "</td>" 
                        + "<td>" + rs.getString(4) + "</td>" + "<td>" + rs.getString(5) + "</td>" 
                        + "<td>" + rs.getInt(6) + "</td>" + "</tr>");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    
  </body>
</html>
