<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="object.*"%>
<%
List<listingBean> listings = (List<listingBean>) session.getAttribute("listingOption");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String choice = request.getParameter("listing");
%>
<%
int num = Integer.parseInt(choice);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify/Update listings</title>
<style>
body {
	background-color: #f8bbd0;
	/* Set the background color to a light pink */
}

h1 {
	color: #007bff; /* Set the heading color to a blue shade */
}

form {
	margin-top: 20px;
}

/* Style the buttons */
input[type="submit"] {
	background-color: #4CAF50; /* Green background color for buttons */
	color: white; /* White text color for buttons */
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

/* Add some spacing between buttons */
form:not(:last-child) {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<h1>Modify/Update exist listings</h2>
	<%
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	String numPeople = request.getParameter("num");
	String user = "root";
	String password = "Hazuki_0824";

	userBean userInfo = (userBean) session.getAttribute("userInfo");
	int listingID = 0;

	for (listingBean listing : listings) {
		if (listing.getOption() == num) {
			listingID = listing.getListingID();
			break;
		}
	}

	try {
		java.sql.Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user,
		password);
		con.setAutoCommit(false);

		try {
			String modifySql = "UPDATE listings SET start_date = ?, "
			+ "end_date = ?, max_headcount = ? where listing_id = ?";
			PreparedStatement stmt = con.prepareStatement(modifySql, Statement.RETURN_GENERATED_KEYS);

			stmt.setString(1, start);
			stmt.setString(2, end);
			stmt.setString(3, numPeople);
			stmt.setInt(4, listingID);

			int rowsAffected = stmt.executeUpdate();
			request.setAttribute("affect", rowsAffected);
			if (rowsAffected > 0) {
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
			<h2>Successfully modified listing</h2>
			<form action="landlordPage.jsp">
				Go back to landlord page <input type="submit" value="back">
			</form>

			<form action="tenant_or_landlord.jsp">
				Go back to choosing role page <input type="submit" value="back">
			</form>
		</c:when>
		<c:otherwise>
			<h2>Error during process</h2>
			<form action="chooseListing.jsp">
				Back to choosing listing page <input type="submit" value="back">
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>
