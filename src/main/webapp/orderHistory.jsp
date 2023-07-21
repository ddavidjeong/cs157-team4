<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="object.userBean" %>
    <%@ page import="java.sql.*" %>
    <% userBean userInfo = (userBean)session.getAttribute("userInfo"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order History</title>
</head>
<body>
<h1>Order History</h1>

	<table border="1">
      <tr>
      	<td>Order ID</td>
        <td>Start Date</td>
        <td>End Date</td>
        <td>Room type</td>
        <td>Number of people</td>
        <td>Price per night</td>
      </tr>

<% 
        try {
            String user = "root";
            String password = "pass";
            String order_sql = "select * from orders "
            		+ "join listings using (listing_id) "
    				+ "join property using (property_id) " 
    						+ "where tenant_id = ?";
            
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
            
            try (Connection con = DriverManager.getConnection(connectionURL, user, password);
                 PreparedStatement stmt = con.prepareStatement(order_sql)) {
                
                stmt.setString(1, userInfo.getTenant_id()) ;

                // Execute SQL statement and get result
                try (ResultSet rs = stmt.executeQuery()) {
                	while(rs.next()) {
        				out.println("<tr>"
        				+ "<td>" + rs.getInt("order_id") + "</td>"
        				+ "<td>" + rs.getDate("start_date") + "</td>"
        				+ "<td>" + rs.getDate("end_date") + "</td>"
        				+ "<td>" + rs.getString("type") + "</td>"
        				+ "<td>" + rs.getInt("max_headcount") + "</td>"
        				+ "<td>" + rs.getInt("price") + "</td>");
        			
        			}
                }
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException caught: " + e.getMessage());
        }
    %>
    <p>
    Go back to profile page
    <a href="profile.jsp"><button>back</button> </a>
    </p>
</body>
</html>
