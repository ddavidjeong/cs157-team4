<%@ page import="java.sql.*" %>
<%@ page import="object.propertyBean"%>
<html>
  <head>
    <title>Adding Room</title>
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
      
      <label for="street">street:</label>
      <input type="text" id="street" name="street" required><br/><br/>
      
      <label for="city">city:</label>
      <input type="text" id="city" name="city" required><br/><br/>
      
      <label for="state">state:</label>
      <input type="text" id="state" name="state" required><br/><br/>
      
      <label for="zip_code">zip_code:</label>
      <input type="text" id="zip_code" name="zip_code" required><br/><br/>
      
      
      
      
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
      int address;
      String street = request.getParameter("street");
      String city = request.getParameter("city");
      String state = request.getParameter("state");
      String zip_code = request.getParameter("zip_code");
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
          
          ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM address");
          address  = 0;
          if (rs1.next()) {
        	  address = rs1.getInt(1);
          }
          
          
          
          stmt.setInt(1, id+1);
          stmt.setInt(2, address);
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
          stmt.close();
          
          String cm5 = "INSERT INTO address (address_id, street, city, state, zip_code) VALUES (?, ?, ?, ?, ?)";
          PreparedStatement pstmtaddress = con.prepareStatement(cm5);
          pstmtaddress.setInt(1, address+1);
          pstmtaddress.setString(2, street);
          pstmtaddress.setString(3, city);
          pstmtaddress.setString(4, state);
          pstmtaddress.setString(5, zip_code);
      	  rowsAffected=pstmtaddress.executeUpdate();
      	  pstmtaddress.close();
          
       
          
        }
      } catch (SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
      } catch (ClassNotFoundException e) {
        out.println("ClassNotFoundException caught: " + e.getMessage());
      }
    %>
  </body>
</html>
