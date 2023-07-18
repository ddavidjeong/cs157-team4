<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="object.optionBean" %>
<%@ page import="java.util.*" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
      	<td>Option number</td>
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
            String password = "Hazuki_0824";
            String login_sql = "SELECT a.start_date, a.end_date, a.number_people, b.bd_count, b.br_count, b.price, c.state, a.listing_id "
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
                Integer optionNum = 1;
                
                // Execute SQL statement and get result
                try (ResultSet rs = stmt.executeQuery()) {
                	List<optionBean> options = new ArrayList<optionBean>();
                    while (rs.next()) {
                    	optionBean option = new optionBean();
                        out.println("<tr>"
                        		+ "<td>" + optionNum + "</td>"
                                + "<td>" + rs.getDate(1) + "</td>"
                                + "<td>" + rs.getDate(2) + "</td>"
                                + "<td>" + rs.getInt(3) + "</td>"
                                + "<td>" + rs.getInt(4) + "</td>"
                                + "<td>" + rs.getInt(5) + "</td>"
                                + "<td>" + rs.getDouble(6) + "</td>"
                                + "<td>" + rs.getString(7) + "</td>"
                                + "</tr>");
                        option.setOption(optionNum);
                        option.setStartDate(rs.getDate(1));
                        option.setEndDate(rs.getDate(2));
                        option.setNumPeople(rs.getInt(3));
                        option.setNumBedRoom(rs.getInt(4));
                        option.setNumBath(rs.getInt(5));
                        option.setPrice(rs.getDouble(6));
                        option.setState(rs.getString(7));
                        option.setListing_ID(rs.getInt(8));
                        
                        options.add(option);
                        optionNum++;
                    }
        			session.setAttribute("roomOption", options);
                    
                }
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException caught: " + e.getMessage());
        }
    %>
    
	<form action="order.jsp" method="post">
	Select one room for booking
    <select name="room" name="room">
    	<c:forEach items="${roomOption}" var="room">
            <option value="${room.option}">${room.option}</option>
        </c:forEach>
    </select>
        <br/><br/>
    <input type="submit" value="Submit" />
    </form>
</body>
</html>
