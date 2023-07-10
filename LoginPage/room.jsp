<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Room Page</title>
    </head>
  <body>
    <h1> Available Room Page </h1>
    
    <table border="1">
      <tr>
        <td>Room_id</td>
        <td>size</td>
        <td>Type</td>
   </tr>
    <% 
     String db = "lease";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Sheep88517565";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false",user, password);
            out.println("The Available room list show below"+"<br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM room");
            
            while (rs.next()) {
                out.println("<tr>"+"<td>"+rs.getInt(1)+"</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>"+rs.getString(3)+"</td>"+"</tr>");
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
