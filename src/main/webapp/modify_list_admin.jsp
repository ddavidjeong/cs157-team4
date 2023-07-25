<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Listing Page</title>
</head>
<body>
<h1> Listing Show below </h1>

<form method="post" action="modifysuccess.jsp">
    <label for="listingid">listing id:</label>
    <input type="number" id="listingid" name="listingid" required><br/><br/>
    
    <label for="propertyid">property id:</label>
    <input type="number" id="propertyid" name="propertyid"><br/><br/>
    
    <label for="landlordid">landlord id:</label>
    <input type="text" id="landlordid" name="landlordid"><br/><br/>
    
    <label for="startdate">start date:</label>
    <input type="date" id="startdate" name="startdate"><br/><br/>
    
    <label for="enddate">end date:</label>
    <input type="date" id="endate" name="enddate"><br/><br/>
    
    <label for="headcount">max headcount:</label>
    <input type="number" id="headcount" name="headcount"><br/><br/>
    
     <label for="booking">booking status:</label>
    <input type="number" id="booking" name="booking"><br/><br/>

    <input type="submit" value="Modify">
</form>

<table border="1">
    <tr>
        <td>Listing IDs</td>
        <td>Property IDS</td>
        <td>Landlord IDs</td>
        <td>start date</td>
        <td>end date</td>
        <td>max headcount</td>
        <td>booking status</td>
    </tr>
    <%
    String db = "shortterm_release";
    String user = "root";
    String password = "Sheep88517565";
    try {

        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shortterm_release?autoReconnect=true&useSSL=false", user, password);
        Statement stmt = con.createStatement();
        ResultSet listing = stmt.executeQuery("SELECT * FROM listings");

        while (listing.next()) {
            out.println("<tr>" + "<td>" + listing.getInt(1) + "</td>" + "<td>" + listing.getString(2) + "</td>" + "<td>" + listing.getString(3) + "</td>"
                    + "<td>" + listing.getString(4) + "</td>" + "<td>" + listing.getString(5) + "</td>" + "<td>" + listing.getString(6) + "</td>"
                    + "<td>" + listing.getString(7) + "</td>" + "</tr>");
        }
        listing.close();
        stmt.close();
        con.close();

    } catch (SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
    }
    %>
</table>
</body>
</html>
