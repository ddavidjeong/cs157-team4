<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Result</title>
</head>
<body>
    <h1>Search Result</h1>
    
    <%-- Retrieve the form data from the URL parameters --%>
    <% String location = request.getParameter("location"); %>
    <% String checkinDate = request.getParameter("checkinDate"); %>
    <% String checkoutDate = request.getParameter("checkoutDate"); %>
    
    <%-- Display the user's input --%>
    <p>Location: <%= location %></p>
    <p>Check-in Date: <%= checkinDate %></p>
    <p>Check-out Date: <%= checkoutDate %></p>
    
    <%-- Process the form data or perform further operations --%>
    <h1>Available Room Page</h1>
    
    <table border="1">
      <tr>
        <td>start date</td>
        <td>end date</td>
        <td>number of people</td>
        <td>number of bedroom</td>
        <td>number of bathroom</td>
        <td>price per night</td>
        <td>state</td>
      </tr>
    <% 
        try {
            String db = "shortterm_release";
            String user = "root";
            String password = "Sheep88517565";
            String login_sql = "SELECT a.start_date, a.end_date, a.number_people, b.bd_count, b.br_count, b.price, c.state "
                    + "FROM shortterm_release.listings a "
                    + "LEFT JOIN shortterm_release.property b ON a.property_id = b.property_id "
                    + "LEFT JOIN shortterm_release.address c ON b.address_id = c.address_id "
                    + "WHERE a.start_date >= ? AND a.end_date <= ? AND c.state = ?";
            
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/shortterm_release?autoReconnect=true&useSSL=false";
            
            try (Connection con = DriverManager.getConnection(connectionURL, user, password);
                 PreparedStatement stmt = con.prepareStatement(login_sql)) {
                
                stmt.setString(1, checkinDate);
                stmt.setString(2, checkoutDate);
                stmt.setString(3, location);
                // Execute SQL statement and get result
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        out.println("<tr>"
                                + "<td>" + rs.getDate(1) + "</td>"
                                + "<td>" + rs.getDate(2) + "</td>"
                                + "<td>" + rs.getInt(3) + "</td>"
                                + "<td>" + rs.getInt(4) + "</td>"
                                + "<td>" + rs.getInt(5) + "</td>"
                                + "<td>" + rs.getDouble(6) + "</td>"
                                + "<td>" + rs.getString(7) + "</td>"
                                + "</tr>");
                    }
                }
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException caught: " + e.getMessage());
        }
    %>
</body>
</html>
