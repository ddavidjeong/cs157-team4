<%@ page import="java.sql.*" %>
<%@ page import="object.propertyBean"%>
<html>
  <head>
    <title>Adding Room</title>
  </head>
  <body>
    <h1>This is the Adding Property Page</h1>
    <form method="post" action="">
      <label for="bedroom">Number of Bedroom</label>
      <input type="number" id="bedroom" name="bedroom" required><br/><br/>
      
      <label for="N0BR">Number of Bathroom</label>
      <input type="number" id="NOBR" name="NOBR" required><br/><br/>
      
      <label for="type">Type:</label>
      <input type="text" id="type" name="type" required><br/><br/>
      
      <label for="Price">Price:</label>
      <input type="number" id="Price" name="Price" required><br/><br/>
      
      <label for="address">address id:</label>
      <input type="number" id="address" name="address" required><br/><br/>
      <a href="address.jsp" target="_blank"><button type="button">Address id refer id you don't know</button></a><br/><br/>
      <input type="submit" value="submit">
    </form>
    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required><br/><br/>
        <input type="submit" value="Upload">
    </form>
    <form method="post" action="">
      <a href="tenant_or_landlord.jsp" target="_blank"><button type="button">Back</button></a><br/><br/>
    </form>
    

    <%
      String bedroom = request.getParameter("bedroom");
      String bathroom = request.getParameter("NOBR");
      String type = request.getParameter("type");
      String price = request.getParameter("Price");
      String address = request.getParameter("address");
      String db = "lease";
      String user = "root";
      String password = "Sheep88517565";
      
      try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
        
        try (Connection con = DriverManager.getConnection(url, user, password)) {
          String query = "INSERT INTO property (property_id, address_id, bd_count, br_count, type, price) VALUES (?, ?, ?, ?, ?, ?)";
          PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
          
          ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM property");
          int id = 0;
          if (rs.next()) {
              id = rs.getInt(1);
          }
          rs.close();
          
          
          
          stmt.setInt(1, id+1);
          stmt.setString(2, address);
          stmt.setString(3, bedroom);
          stmt.setString(4, bathroom);
          stmt.setString(5, type);
          stmt.setString(6, price);
          
         // Create an instance of PropertyBean
          propertyBean property = new propertyBean();

          // Set the property_id value
          property.setPropertyID(id+1);

          // Set the propertyBean as a request attribute
          session.setAttribute("propertyBean", property);
          
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
