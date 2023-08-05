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
String list_id = request.getParameter("listingid");
String start_date = request.getParameter("startdate");
String end_date = request.getParameter("enddate");
String max_headcount = request.getParameter("headcount");


String db = "lease";
String user = "root";
String password = "Sheep88517565";
//String cm1 = "UPDATE lease.listings SET property_id=? WHERE listing_id=?";
//String cm2 = "UPDATE lease.listings SET landlord_id=? WHERE listing_id=?";
String cm3 = "UPDATE lease.listings SET start_date=? WHERE listing_id=?";
String cm4 = "UPDATE lease.listings SET end_date=? WHERE listing_id=?";
String cm5 = "UPDATE lease.listings SET max_headcount=? WHERE listing_id=?";
//String cm6 = "UPDATE lease.listings SET booking_status=? WHERE listing_id=?";

try {
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user, password);
    con.setAutoCommit(false); // Start transaction
    int rowsAffected = 0;
    
    try {
        
        
        if(!start_date.equals("")){
        	PreparedStatement pstmtstart_date = con.prepareStatement(cm3);
        	pstmtstart_date.setString(1, start_date);
        	pstmtstart_date.setInt(2, Integer.parseInt(list_id));
        	rowsAffected=pstmtstart_date.executeUpdate();
        	pstmtstart_date.close();
        }
        if(!end_date.equals("")){
        	PreparedStatement pstmtend_date = con.prepareStatement(cm4);
        	pstmtend_date.setString(1, end_date);
        	pstmtend_date.setInt(2, Integer.parseInt(list_id));
        	rowsAffected=pstmtend_date.executeUpdate();
        	pstmtend_date.close();
        }
        if(!max_headcount.equals("")){
        	PreparedStatement pstmtmax_headcount = con.prepareStatement(cm5);
        	pstmtmax_headcount.setInt(1, Integer.parseInt(max_headcount));
        	pstmtmax_headcount.setInt(2, Integer.parseInt(list_id));
        	rowsAffected=pstmtmax_headcount.executeUpdate();
        	pstmtmax_headcount.close();
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
