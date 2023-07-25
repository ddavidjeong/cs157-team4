<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Modify Success</title>
</head>
<body>
<h1>Modify Status</h1>

<%
String list_id = request.getParameter("listingid");
String property_id = request.getParameter("propertyid");
String landlord_id = request.getParameter("landlordid");
String start_date = request.getParameter("startdate");
String end_date = request.getParameter("enddate");
String max_headcount = request.getParameter("headcount");
String booking_status = request.getParameter("booking");

String db = "shortterm_release";
String user = "root";
String password = "Sheep88517565";
String cm1 = "UPDATE shortterm_release.listings SET property_id=? WHERE listing_id=?";
String cm2 = "UPDATE shortterm_release.listings SET landlord_id=? WHERE listing_id=?";
String cm3 = "UPDATE shortterm_release.listings SET start_date=? WHERE listing_id=?";
String cm4 = "UPDATE shortterm_release.listings SET end_date=? WHERE listing_id=?";
String cm5 = "UPDATE shortterm_release.listings SET max_headcount=? WHERE listing_id=?";
String cm6 = "UPDATE shortterm_release.listings SET booking_status=? WHERE listing_id=?";

try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shortterm_release?autoReconnect=true&useSSL=false", user, password);
    con.setAutoCommit(false); // Start transaction
    int rowsAffected = 0;
    
    try {
        if(!property_id.equals("")){
        	PreparedStatement pstmtproperty_id = con.prepareStatement(cm1);
        	pstmtproperty_id.setInt(1, Integer.parseInt(property_id));
            pstmtproperty_id.setInt(2, Integer.parseInt(list_id));
            pstmtproperty_id.executeUpdate();
            pstmtproperty_id.close();	
        }
        if(!landlord_id.equals("")){
        	PreparedStatement pstmtlandlord_id = con.prepareStatement(cm2);
        	pstmtlandlord_id.setString(1, landlord_id);
        	pstmtlandlord_id.setInt(2, Integer.parseInt(list_id));
        	pstmtlandlord_id.executeUpdate();
        	pstmtlandlord_id.close();
        }
        if(!start_date.equals("")){
        	PreparedStatement pstmtstart_date = con.prepareStatement(cm3);
        	pstmtstart_date.setString(1, start_date);
        	pstmtstart_date.setInt(2, Integer.parseInt(list_id));
        	pstmtstart_date.executeUpdate();
        	pstmtstart_date.close();
        }
        if(!end_date.equals("")){
        	PreparedStatement pstmtend_date = con.prepareStatement(cm4);
        	pstmtend_date.setString(1, end_date);
        	pstmtend_date.setInt(2, Integer.parseInt(list_id));
        	pstmtend_date.executeUpdate();
        	pstmtend_date.close();
        }
        if(!max_headcount.equals("")){
        	PreparedStatement pstmtmax_headcount = con.prepareStatement(cm5);
        	pstmtmax_headcount.setInt(1, Integer.parseInt(max_headcount));
        	pstmtmax_headcount.setInt(2, Integer.parseInt(list_id));
        	pstmtmax_headcount.executeUpdate();
        	pstmtmax_headcount.close();
        }
        if(!booking_status.equals("")){
        	PreparedStatement pstmtbooking_status = con.prepareStatement(cm6);
        	pstmtbooking_status.setString(1, booking_status);
        	pstmtbooking_status.setInt(2, Integer.parseInt(list_id));
        	rowsAffected=pstmtbooking_status.executeUpdate();
        	pstmtbooking_status.close();
        }
        
        
        

        if (rowsAffected > 0) {
            con.commit(); // Commit the transaction if both deletions succeed
            %>
            <p>Listing with ID <%= list_id %> and related records have been successfully Modify.</p>
            <a href="listing.jsp">Go back to listing page</a>
            <%
        } else {
            con.rollback(); // Rollback the transaction if the listing deletion fails
            %>
            <p>Modify failed. Listing with ID <%= list_id %> was not found.</p>
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
