<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="object.optionBean" %>
<%@ page import="object.userBean" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>order Confirmation</title>
</head>
<body>
	<%
    	userBean userInfo = (userBean)session.getAttribute("userInfo");
		optionBean order = (optionBean)session.getAttribute("order");
    	String user = "root";
    	String password = "Hazuki_0824";
    	
    	try {
    		java.sql.Connection con;
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user,
    		password);
    		con.setAutoCommit(false);
        	try {
          		String query = "INSERT INTO orders (order_id, tenant_id, listing_id) VALUES (?, ?, ?)";
          		String update = "UPDATE listings set booking_status = '1' where listing_id = ?";
          		PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
          		PreparedStatement stmtUpdate = con.prepareStatement(update, Statement.RETURN_GENERATED_KEYS);
          
          		ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM orders");
          		int id = 0;
          		if (rs.next()) {
              		id = rs.getInt(1) + 1;
          		}
          		rs.close();
          
          		stmt.setInt(1, id);
          		stmt.setString(2, userInfo.getTenant_id());
          		stmt.setInt(3, order.getListing_ID());
          		stmtUpdate.setInt(1, order.getListing_ID());
          
          		int rowsAffected = stmt.executeUpdate();
          		request.setAttribute("booking", rowsAffected);
      			if (rowsAffected > 0) {
        			stmtUpdate.executeUpdate();
    				con.commit();
    			} else {
    				con.rollback();
    			}
    			request.setAttribute("affect", rowsAffected);
    		} catch (SQLException e) {
    			con.rollback();
    			out.println("SQLException caught: " + e.getMessage());
    		} finally {
    			con.setAutoCommit(true); // Reset the auto-commit to its default state
    		}
    		con.close();
    	} catch (ClassNotFoundException e) {
    		out.println("ClassNotFoundException caught: " + e.getMessage());
    	}
     %>
	<c:choose>
		<c:when test="${booking > 0}">
			<h2>Order Confirmed</h2>
			<h3>Thank you for booking!</h3>
     	You successfully booking the room
     	<p>
				Search new room <a href="search.jsp"><button>search</button> </a>
			</p>
			<p>
				Go back to choosing role page <a href="tenant_or_landlord.jsp"><button>back</button>
				</a>
			</p>
		</c:when>
		<c:otherwise>
			<h2>Error during process</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>
