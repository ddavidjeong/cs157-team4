<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Modify Success</title>
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
<h1>Modify Status</h1>

<%
String property_id = request.getParameter("propertyid");
String bd_count = request.getParameter("bd_count");
String br_count = request.getParameter("br_count");
String type = request.getParameter("type");
String price = request.getParameter("price");

String adminid = (String) session.getAttribute("adminid");


String db = "lease";
String user = "root";
String password = "Sheep88517565";
String cm1 = "UPDATE lease.property SET bd_count=? WHERE property_id=?";
String cm2 = "UPDATE lease.property SET br_count=? WHERE property_id=?";
String cm3 = "UPDATE lease.property SET type=? WHERE property_id=?";
String cm4 = "UPDATE lease.property SET price=? WHERE property_id=?";
//String cm5 = "UPDATE lease.listings SET max_headcount=? WHERE listing_id=?";
String cm6 = "INSERT INTO lease.updateproperty (admin_id,property_id) VALUES (?,?)";

try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user, password);
    con.setAutoCommit(false); // Start transaction
    int rowsAffected = 0;
    
    try {
        
        if(!bd_count.equals("")){
        	PreparedStatement pstmtbd_count = con.prepareStatement(cm1);
        	pstmtbd_count.setInt(1, Integer.parseInt(bd_count));
        	pstmtbd_count.setInt(2, Integer.parseInt(property_id));
        	rowsAffected=pstmtbd_count.executeUpdate();
        	pstmtbd_count.close();
        }
        if(!br_count.equals("")){
        	PreparedStatement pstmtbr_count = con.prepareStatement(cm2);
        	pstmtbr_count.setInt(1, Integer.parseInt(bd_count));
        	pstmtbr_count.setInt(2, Integer.parseInt(property_id));
        	rowsAffected=pstmtbr_count.executeUpdate();
        	pstmtbr_count.close();
        }
        if(!type.equals("")){
        	PreparedStatement pstmttype = con.prepareStatement(cm3);
        	pstmttype.setString(1, type);
        	pstmttype.setInt(2, Integer.parseInt(property_id));
        	rowsAffected=pstmttype.executeUpdate();
        	pstmttype.close();
        }
        if(!price.equals("")){
        	PreparedStatement pstmtprice = con.prepareStatement(cm4);
        	pstmtprice.setInt(1, Integer.parseInt(price));
        	pstmtprice.setInt(2, Integer.parseInt(property_id));
        	rowsAffected=pstmtprice.executeUpdate();
        	pstmtprice.close();
        }
        

        if (rowsAffected > 0) {
            con.commit(); // Commit the transaction if both deletions succeed
            %>
            <p>Property with ID <%= property_id %> and related records have been successfully modify.</p>
            <a href="admin.jsp">Go back to admin page</a>
            <%
        } else {
            con.rollback(); // Rollback the transaction if the listing deletion fails
            %>
            <p>Deletion failed. property with ID <%= property_id %> was not found.</p>
            <a href="admin.jsp">Go back to admin page</a>
            <%
        }
        PreparedStatement pstmtupdateproperty = con.prepareStatement(cm6);
        pstmtupdateproperty.setInt(1, Integer.parseInt(adminid));
        pstmtupdateproperty.setInt(2, Integer.parseInt(property_id));
    	rowsAffected=pstmtupdateproperty.executeUpdate();
    	pstmtupdateproperty.close();
        
    } catch (SQLException ex) {
        con.rollback(); // Rollback the transaction if any SQL exception occurs
        throw ex; // Rethrow the exception to handle it in the outer catch block
    } finally {
        con.setAutoCommit(true); // Reset the auto-commit to its default state
    }
    con.close();
} catch (SQLException | ClassNotFoundException e) {
    out.println("Exception caught: " + e.getMessage());
}

%>
<a href="adminPage.jsp" target="_blank"><button type="button">Back</button></a><br/><br/>
</body>
</html>
