<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="object.*"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
List<orderBean> orderList = (List<orderBean>) session.getAttribute("orderOption");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
</head>
<body>
	<h1>Payment Confirmation</h1>
	<%
		String choice = request.getParameter("order");
		int num = Integer.parseInt(choice);
		
		int orderID = 0;
		orderBean order = null;
		for (orderBean option : orderList) {
			if (option.getOption() == num) {
				order = option;
				break;
			}
		}
		
		String user = "root";
		String password = "pass";
		
        try {
    		java.sql.Connection con;
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user,
    		password);
    		con.setAutoCommit(false);

    		try {
    			String paySql = "Insert payment (payment_id, order_id, "
    					+ "payment_date, tenant_id) value (?, ?, ?, ?);";
    			String update = "Update orders set pay_status = '1' where order_id = ?;";
    			PreparedStatement stmt = con.prepareStatement(paySql, Statement.RETURN_GENERATED_KEYS);
    			PreparedStatement stmtUpdate = con.prepareStatement(update, Statement.RETURN_GENERATED_KEYS);

    			stmtUpdate.setInt(1, order.getOrder_id());
    			
          		ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM payment");
          		int id = 0;
          		if (rs.next()) {
              		id = rs.getInt(1) + 1;
          		}
          		rs.close();
          		 
    			stmt.setInt(1, id);
    			stmt.setInt(2, order.getOrder_id());
    			stmt.setString(3, java.time.LocalDate.now().toString());
    			stmt.setString(4, order.getTenant_id());

    			int rowsAffected = stmt.executeUpdate();
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
    		<c:when test="${affect > 0}">
    			<h2>Successfully paid</h2>
    			<p>
    				Back to choosing role page <a href="tenant_or_landlord.jsp"><button>back</button>
    				</a>
    			</p>
    			<p>
    				Logout <a href="MainPage.jsp"><button>logout</button>
    				</a>
    			</p>
    		</c:when>
    		<c:otherwise>
    			<h2>Error during process</h2>
    		Back to choosing order page
    		<a href="chooseOrder.jsp"><button>back</button></a>
    		</c:otherwise>
    	</c:choose>
    </body>
    </html>
