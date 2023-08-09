<%@ page import="java.sql.*"%>
<%@ page import="object.*"%>
<html>
<head>
<title>Adding Room</title>
<style>
body {
	background-color: #f8bbd0;
	/* Set the background color to a light pink */
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
	<div style="text-align: center">
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

      <label for="street">Street:</label>
      <input type="text" id="street" name="street" required><br/><br/>

      <label for="city">City:</label>
      <input type="text" id="city" name="city" required><br/><br/>

      <label for="state">State:</label>
      <input type="text" id="state" name="state" required><br/><br/>

      <label for="zipCode">Zip Code:</label>
      <input type="number" id="zipCode" name="zipCode" required><br/><br/>

      <input type="submit" value="submit">
    </form>	
    
	    <form action="UploadServlet" method="post" enctype="multipart/form-data">
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required><br/><br/>
        <input type="submit" value="Upload">
    </form>
    <form action="landlordPage.jsp" target="_blank">
		Back to landlord page <input type="submit" value="back">
	</form>
	</div>


	<%
      String bedroom = request.getParameter("bedroom");
      String bathroom = request.getParameter("NOBR");
      String type = request.getParameter("type");
      String price = request.getParameter("Price");
      String street= request.getParameter("street");
      String city = request.getParameter("city");
      String state = request.getParameter("state");
      String zipCode = request.getParameter("zipCode");
      userBean userInfo = (userBean) session.getAttribute("userInfo");
      String landlordID = userInfo.getLandlord_id();
      String user = "root";
      String password = "Sheep88517565";
      
      try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
        
        try (Connection con = DriverManager.getConnection(url, user, password)) {
			String query = "INSERT INTO property (property_id, address_id, bd_count, br_count, type, price) VALUES (?, ?, ?, ?, ?, ?)";
			String ownSQL = "INSERT INTO own (property_id, landlord_id) VALUES (?, ?)";
			String checkSQL = "SELECT address_id from address where "
					+ "street = ? AND city = ? AND state = ? AND zip_code = ?";
			PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			PreparedStatement ownstmt = con.prepareStatement(ownSQL, Statement.RETURN_GENERATED_KEYS);
			PreparedStatement addressstmt = con.prepareStatement(checkSQL, Statement.RETURN_GENERATED_KEYS);
			
			addressstmt.setString(1, street);
			addressstmt.setString(2, city);
			addressstmt.setString(3, state);
			addressstmt.setString(4, zipCode);
          
          ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM property");
          ResultSet check = addressstmt.executeQuery();
          int id = 0;
			if (rs.next()) {
				id = rs.getInt(1); //get property id
			}
			
			int addressID = 0;
			if(check.next()) { //check if the address is already in address table
				addressID = check.getInt(1);
			}
			else {// add new address into address table
				ResultSet numAddress = stmt.executeQuery("SELECT COUNT(*) FROM address");
				if(numAddress.next()){
					addressID = numAddress.getInt(1) + 1;
				}
			
				String addressSQL = "INSERT INTO address (address_id, street, city, state, zip_code) VALUES (?, ?, ?, ?, ?)";
				addressstmt = con.prepareStatement(addressSQL, Statement.RETURN_GENERATED_KEYS);
				
				addressstmt.setInt(1, addressID);
				addressstmt.setString(2, street);
				addressstmt.setString(3, city);
				addressstmt.setString(4, state);
				addressstmt.setString(5, zipCode);
				
				addressstmt.executeUpdate();
			}
          

          stmt.setInt(1, id+1);
          stmt.setInt(2, addressID);
          stmt.setString(3, bedroom);
          stmt.setString(4, bathroom);
          stmt.setString(5, type);
          stmt.setString(6, price);
          ownstmt.setInt(1, id + 1);
          ownstmt.setString(2, landlordID);
          
         // Create an instance of PropertyBean
          propertyBean property = new propertyBean();

          // Set the property_id value
          property.setPropertyID(id+1);

          // Set the propertyBean as a request attribute
          session.setAttribute("propertyBean", property);
          
          int rowsAffected = stmt.executeUpdate();
          if (rowsAffected > 0) {
        	ownstmt.executeUpdate();
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