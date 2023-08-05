<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.concurrent.TimeUnit"%>
<%@ page import="object.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
</head>
<body>
    <h1>Welcome to the Payment Page</h1>
    <h2>Choose order to pay</h2>

	<form method="post" action="payment.jsp">
	<table border="1">
      <tr>
      	<td>Option number</td>
        <td>Order ID</td>
        <td>Total</td>

      </tr>

 	<% 
 		userBean userInfo = (userBean)session.getAttribute("userInfo");
        try {
            String user = "root";
            String password = "Hazuki_0824";
            String orderSql = "SELECT * FROM orders join listings using (listing_id) " 
            		+ "join property using (property_id) WHERE tenant_id = ? AND pay_status = 0";
            
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
            
            try (Connection con = DriverManager.getConnection(connectionURL, user, password);
            	PreparedStatement stmt = con.prepareStatement(orderSql)) {
                stmt.setString(1, userInfo.getTenant_id());
                Integer optionNum = 1;
                
                // Execute SQL statement and get result
                try (ResultSet rs = stmt.executeQuery()) {
                	List<orderBean> options = new ArrayList<orderBean>();
                	double total = 0;
                	Date start;
                	Date end;
                    while (rs.next()) {
                    	orderBean order = new orderBean();
                    	start = rs.getDate("start_date");
                    	end = rs.getDate("end_date");
                        long diffInMillies = Math.abs(end.getTime() - start.getTime());
                        long diff = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                    	total = diff * rs.getDouble("price");
                        
                        out.println("<tr>"
                        		+ "<td>" + optionNum + "</td>"
                        		+ "<td>" + rs.getInt("order_id") + "</td>"
                        		+ "<td>" + total + "</td>"
                                + "</tr>");
                        order.setOption(optionNum);
                        order.setOrder_id(rs.getInt("order_id"));
                        order.setPrice(total);
                        order.setTenant_id(userInfo.getTenant_id());
           
                        options.add(order);
                        optionNum++;
                    }
        			session.setAttribute("orderOption", options);
                }
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            out.println("ClassNotFoundException caught: " + e.getMessage());
        }
    %>
   	 
      
		Select one order 
    	<select name="order">
    		<c:forEach items="${orderOption}" var="order">
            	<option value="${order.option}">${order.option}</option>
        	</c:forEach>
        <input type="submit" value="submit">
   	 	</select> 
    </form> 	
    </table><br><br>
    
     Go back to profile
     <a href="profile.jsp" target="_blank"><button type="button">Back</button></a>
</body>
</html>