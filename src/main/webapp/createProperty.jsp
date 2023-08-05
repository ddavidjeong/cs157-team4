<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="object.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add new property</title>
</head>
<body>
	<%
	String bedroom = request.getParameter("bedroom");
	String bathroom = request.getParameter("NOBR");
	String type = request.getParameter("type");
	String price = request.getParameter("Price");
	String street = request.getParameter("street");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String zipCode = request.getParameter("zipCode");
	userBean userInfo = (userBean) session.getAttribute("userInfo");
	String landlordID = userInfo.getLandlord_id();
	String user = "root";
	String password = "Hazuki_0824";

	try {
		java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user,
		password);
		con.setAutoCommit(false);

		try {
			String query = "INSERT INTO property (property_id, address_id, bd_count, br_count, type, price) VALUES (?, ?, ?, ?, ?, ?)";
			String ownSQL = "INSERT INTO own (property_id, landlord_id) VALUES (?, ?)";
			String checkSQL = "SELECT address_id from address where "
					+ "street = ? AND city = ? AND state = ? AND zip_code = ?";
			PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			PreparedStatement ownstmt = con.prepareStatement(ownSQL, Statement.RETURN_GENERATED_KEYS);
			PreparedStatement addressstmt = con.prepareStatement(checkSQL, Statement.RETURN_GENERATED_KEYS);
			
			addressstmt.setString(1, street);
			addressstmt.setString(2, city);
			addressstmt.setString(3, state);
			addressstmt.setString(4, zipCode);
			
			ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM property");
			ResultSet check = addressstmt.executeQuery();
			
			int id = 0;
			if (rs.next()) {
				id = rs.getInt(1);
			}
			
			int addressID = 0;
			if(check.next()) {
				addressID = check.getInt(1);
			}
			else {// add new address into address table
				ResultSet numAddress = stmt.executeQuery("SELECT COUNT(*) FROM address");
				if(numAddress.next()){
					addressID = numAddress.getInt(1) + 1;
				}
			
				String addressSQL = "INSERT INTO address (address_id, street, city, state, zip_code) VALUES (?, ?, ?, ?, ?)";
				addressstmt = con.prepareStatement(addressSQL, Statement.RETURN_GENERATED_KEYS);
				
				addressstmt.setInt(1, addressID);
				addressstmt.setString(2, street);
				addressstmt.setString(3, city);
				addressstmt.setString(4, state);
				addressstmt.setString(5, zipCode);
				
				addressstmt.executeUpdate();
			}

			stmt.setInt(1, id + 1);
			stmt.setInt(2, addressID);
			stmt.setString(3, bedroom);
			stmt.setString(4, bathroom);
			stmt.setString(5, type);
			stmt.setString(6, price);
			ownstmt.setInt(1, id + 1);
			ownstmt.setString(2, landlordID);
			int rowsAffected = stmt.executeUpdate();
			if (rowsAffected > 0) {
				ownstmt.executeUpdate();
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
			<h2>Successfully created new property</h2>
			<p>
				Go back to landlord page <a href="landlordPage.jsp"><button>back</button>
				</a>
			</p>
			<p>
				Go back to choosing role page <a href="tenant_or_landlord.jsp"><button>back</button>
				</a>
			</p>
		</c:when>
		<c:otherwise>
			<h2>Error during process</h2>
			Back to add property page
		<a href="add_property.jsp"><button>back</button></a>
		</c:otherwise>
	</c:choose>
</body>
</html>