<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="object.*" %>
<%@ page import="java.util.*" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% userBean userInfo = (userBean)session.getAttribute("userInfo"); %>

<html>
<head>
    <title>Modify/Update Listings</title>
</head>
<body>
  <h2>Modify/Update Listing</h2>
  
  <form method="post" action="modifyListing.jsp">
      Start Date:
      <input type="date" name="start" required><br><br>
      
      End Date:
      <input type="date" name="end" required><br><br>
      
      Max Number of People:
      <input type="text"name="num" required><br><br>
      
      <input type="submit" value="submit"><br><br> 
      
    
	<table border="1">
      <tr>
      	<td>Option number</td>
        <td>Start Date</td>
        <td>End Date</td>
        <td>Max Number of People</td>
        <td>Number of Bedroom</td>
        <td>Number of Bathroom</td>
        <td>Type</td>
        <td>Price per night</td>
        <td>Street</td>
        <td>City</td>
        <td>State</td>
        <td>Zip Code</td>
      </tr>

 	<% 
        try {
            String user = "root";
            String password = "pass";
            String listing_sql = "SELECT * FROM listings join property using (property_id) " 
            		+ "join address using (address_id) WHERE landlord_id = ?";
            
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
            
            try (Connection con = DriverManager.getConnection(connectionURL, user, password);
                 PreparedStatement stmt = con.prepareStatement(listing_sql)) {
                
                stmt.setString(1, userInfo.getLandlord_id());
                Integer optionNum = 1;
                
                // Execute SQL statement and get result
                try (ResultSet rs = stmt.executeQuery()) {
                	List<listingBean> options = new ArrayList<listingBean>();
                    while (rs.next()) {
                    	listingBean listing = new listingBean();
                        out.println("<tr>"
                        		+ "<td>" + optionNum + "</td>"
                        		+ "<td>" + rs.getString("start_date") + "</td>"
                        		+ "<td>" + rs.getString("end_date") + "</td>"
                        		+ "<td>" + rs.getInt("max_headcount") + "</td>"
                                + "<td>" + rs.getInt("bd_count") + "</td>"
                                + "<td>" + rs.getInt("br_count") + "</td>"
                                + "<td>" + rs.getString("type") + "</td>"
                                + "<td>" + rs.getDouble("price") + "</td>"
                                + "<td>" + rs.getString("street") + "</td>"
                                + "<td>" + rs.getString("city") + "</td>"
                                + "<td>" + rs.getString("state") + "</td>"
                                + "<td>" + rs.getInt("zip_code") + "</td>"
                                + "</tr>");
                        listing.setOption(optionNum);
                        listing.setListingID(rs.getInt("listing_id"));
                        listing.setStartDate(rs.getDate("start_date"));
                        listing.setEndDate(rs.getDate("end_date"));
                        listing.setNumPeople(rs.getInt("max_headcount"));
                        
                        options.add(listing);
                        optionNum++;
                    }
        			session.setAttribute("listingOption", options);
                    
                }
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException caught: " + e.getMessage());
        }
    %>
   	 
      
      Select one listing to modify/Update
    	<select name="listing">
    		<c:forEach items="${listingOption}" var="listing">
            	<option value="${listing.option}">${listing.option}</option>
        	</c:forEach>
   	 	</select> 
    </form> 	
    </table><br><br>
    Back to select page
     <a href="landlordPage.jsp" target="_blank"><button>Back</button></a><br/><br/>
</body>
</html>
