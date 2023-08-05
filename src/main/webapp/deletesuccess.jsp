<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Delete Success</title>
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
<h1>Deletion Status</h1>

<%
String list_id = request.getParameter("listingid");
String db = "lease";
String user = "root";
String password = "Hazuki_0824";
//String cm1 = "DELETE FROM lease.create WHERE listing_id=?;";
String cm2 = "DELETE FROM lease.listings WHERE listing_id=? AND booking_status=0;";
//String cm3 = "DELETE FROM lease.property WHERE property_id=?;";
//String cm4 = "DELETE FROM lease.release WHERE listing_id=?;";

try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user, password);
    con.setAutoCommit(false); // Start transaction
    int rowsAffected = 0;
    
    try {
        /* // Step 1: Delete related records in the 'update' table
        PreparedStatement pstmtUpdate = con.prepareStatement(cm1);
        pstmtUpdate.setInt(1, Integer.parseInt(list_id));
        pstmtUpdate.executeUpdate();
        pstmtUpdate.close(); */
        
        
     /* // Step 2: Delete the listing from the 'listings' table
        PreparedStatement pstmtrent = con.prepareStatement(cm3);
        pstmtrent.setInt(1, Integer.parseInt(list_id));
        pstmtrent.executeUpdate();
        pstmtrent.close(); */
        
     /* // Step 3: Delete the listing from the 'listings' table
        PreparedStatement pstmtrelease = con.prepareStatement(cm4);
        pstmtrelease.setInt(1, Integer.parseInt(list_id));
        pstmtrelease.executeUpdate();
        pstmtrelease.close(); */
        PreparedStatement pstmtListing = con.prepareStatement(cm2);
        pstmtListing.setInt(1, Integer.parseInt(list_id));
        rowsAffected = pstmtListing.executeUpdate();
        pstmtListing.close();
        
        
        

        if (rowsAffected > 0) {
            con.commit(); // Commit the transaction if both deletions succeed
            %>
            <p>Listing with ID <%= list_id %> and related records have been successfully deleted.</p>
            <a href="listing.jsp">Go back to listing page</a>
            <%
        } else {
            con.rollback(); // Rollback the transaction if the listing deletion fails
            %>
            <p>Deletion failed. Listing with ID <%= list_id %> was not found.</p>
            <a href="listing.jsp">Go back to listing page</a>
            <%
        }
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
