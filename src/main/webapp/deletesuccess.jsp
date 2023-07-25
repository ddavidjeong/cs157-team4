<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Delete Success</title>
</head>
<body>
<h1>Deletion Status</h1>

<%
String list_id = request.getParameter("listingid");
String db = "shortterm_release";
String user = "root";
String password = "Sheep88517565";
String cm1 = "DELETE FROM shortterm_release.create WHERE listing_id=?;";
String cm2 = "DELETE FROM shortterm_release.listings WHERE listing_id=? AND booking_status=0;";
String cm3 = "DELETE FROM shortterm_release.rent WHERE listing_id=?;";
String cm4 = "DELETE FROM shortterm_release.release WHERE listing_id=?;";

try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shortterm_release?autoReconnect=true&useSSL=false", user, password);
    con.setAutoCommit(false); // Start transaction
    
    try {
        // Step 1: Delete related records in the 'update' table
        PreparedStatement pstmtUpdate = con.prepareStatement(cm1);
        pstmtUpdate.setInt(1, Integer.parseInt(list_id));
        pstmtUpdate.executeUpdate();
        pstmtUpdate.close();
        
        
     // Step 2: Delete the listing from the 'listings' table
        PreparedStatement pstmtrent = con.prepareStatement(cm3);
        pstmtrent.setInt(1, Integer.parseInt(list_id));
        pstmtrent.executeUpdate();
        pstmtrent.close();
        
     // Step 3: Delete the listing from the 'listings' table
        PreparedStatement pstmtrelease = con.prepareStatement(cm4);
        pstmtrelease.setInt(1, Integer.parseInt(list_id));
        pstmtrelease.executeUpdate();
        pstmtrelease.close();
        
        // Step 4: Delete the listing from the 'listings' table
        PreparedStatement pstmtListing = con.prepareStatement(cm2);
        pstmtListing.setInt(1, Integer.parseInt(list_id));
        int rowsAffected = pstmtListing.executeUpdate();
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
