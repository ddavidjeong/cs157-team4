<%@ page import="java.sql.*" %>
<html>
  <head>
    <title>Adding Room</title>
  </head>
  <body>
    <h1>This is the Adding Room Page</h1>
    <form method="post" action="">
      <label for="size">Size:</label>
      <input type="number" id="size" name="size" required><br/><br/>
      
      <label for="type">Type:</label>
      <input type="text" id="type" name="type" required><br/><br/>
      
      <input type="submit" value="submit">
    </form>

    <%
      String size = request.getParameter("size");
      String type = request.getParameter("type");
      String db = "lease";
      String user = "root";
      String password = "Sheep88517565";
      
      try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
        
        try (Connection con = DriverManager.getConnection(url, user, password)) {
          String query = "INSERT INTO room (room_id, size, type) VALUES (?, ?, ?)";
          PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
          
          ResultSet rs = stmt.executeQuery("SELECT room_id FROM room ORDER BY room_id DESC LIMIT 1");
          int id = 1;
          if (rs.next()) {
            id = rs.getInt("room_id") + 1;
          }
          rs.close();
          
          stmt.setInt(1, id);
          stmt.setString(2, size);
          stmt.setString(3, type);
          
          int rowsAffected = stmt.executeUpdate();
          if (rowsAffected > 0) {
            out.println("Insert successful<br/><br/>");
          } else {
            out.println("Insert failed<br/><br/>");
          }
        }
      } catch (SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
      } catch (ClassNotFoundException e) {
        out.println("ClassNotFoundException caught: " + e.getMessage());
      }
    %>
  </body>
</html>
