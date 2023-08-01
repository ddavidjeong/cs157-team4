<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="object.propertyBean" %>
<%@ page import="java.util.*" %>
<%@ page import="object.userBean" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% userBean userInfo = (userBean)session.getAttribute("userInfo"); %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Modify/Update property</title>
	<style>
		tr:nth-child(even) {background-color: #f2f2f2;}
	</style>
</head>
<body>
	<h2>Modify/Update property</h2>

	<form method="post" action="modifyProperty.jsp">
      Number of Bedroom:
      <input type="number" name="numBedRoom" required><br><br>
      
      Number of Bathroom:
      <input type="number" name="numBath" required><br><br>
      
      Type:
      <input type="text" name="type" required><br><br>
      
      Price per night:
      <input type="number" name="price" requred><br><br>
       
    
	<table border="1">
      <tr>
      	<td>Option number</td>
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
            String password = "Hazuki_0824";
            String login_sql = "SELECT * FROM property join own using (property_id) " 
            		+ "join address using (address_id) WHERE landlord_id = ?";
            
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
            
            try (Connection con = DriverManager.getConnection(connectionURL, user, password);
                 PreparedStatement stmt = con.prepareStatement(login_sql)) {
                
                stmt.setString(1, userInfo.getLandlord_id());
                Integer optionNum = 1;
                
                // Execute SQL statement and get result
                try (ResultSet rs = stmt.executeQuery()) {
                	List<propertyBean> options = new ArrayList<propertyBean>();
                    while (rs.next()) {
                    	propertyBean property = new propertyBean();
                        out.println("<tr>"
                        		+ "<td>" + optionNum + "</td>"
                                + "<td>" + rs.getInt("bd_count") + "</td>"
                                + "<td>" + rs.getInt("br_count") + "</td>"
                                + "<td>" + rs.getString("type") + "</td>"
                                + "<td>" + rs.getDouble("price") + "</td>"
                                + "<td>" + rs.getString("street") + "</td>"
                                + "<td>" + rs.getString("city") + "</td>"
                                + "<td>" + rs.getString("state") + "</td>"
                                + "<td>" + rs.getInt("zip_code") + "</td>"
                                + "</tr>");
                        property.setOption(optionNum);
                        property.setPropertyID(rs.getInt("property_id"));
                        
                        options.add(property);
                        optionNum++;
                    }
        			session.setAttribute("propertyOption", options);
                    
                }
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException caught: " + e.getMessage());
        }
    %>
    
    <input type="submit" value="submit"><br><br>
      
		Select one room for creating new listing
    	<select name="property">
    		<c:forEach items="${propertyOption}" var="property">
            	<option value="${property.option}">${property.option}</option>
        	</c:forEach>
   	 	</select>  
    </form>
    
    </table><br><br>
    Back to select page
     <a href="landlordPage.jsp" target="_blank"><button type="button">Back</button></a><br/><br/>
</body>
</html>
