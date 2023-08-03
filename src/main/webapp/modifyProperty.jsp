<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="object.*" %>
<% List<propertyBean> roomList = (List<propertyBean>)session.getAttribute("propertyOption"); %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String choice = request.getParameter("property");%>
<% int num = Integer.parseInt(choice);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modify/Update property</title>
</head>
<body>
	<h2>Modify/Update exist listings</h2>
	<%
	int numBedRoom = Integer.parseInt(request.getParameter("numBedRoom"));
	int numBath = Integer.parseInt(request.getParameter("numBath"));
	String type = request.getParameter("type");
	double price = Integer.parseInt(request.getParameter("price"));
	String user = "root";
	String password = "pass";

	userBean userInfo = (userBean) session.getAttribute("userInfo");
	int propertyID = 0;

	for (propertyBean property : roomList) {
		if (property.getOption() == num) {
			propertyID = property.getPropertyID();
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
			String modifySql = "UPDATE property SET bd_count = ?, "
			+ "br_count = ?, type = ?, price = ? where property_id = ?";
			PreparedStatement stmt = con.prepareStatement(modifySql, Statement.RETURN_GENERATED_KEYS);

			stmt.setInt(1, numBedRoom);
			stmt.setInt(2, numBath);
			stmt.setString(3, type);
			stmt.setDouble(4, price);
			stmt.setInt(5, propertyID);

			int rowsAffected = stmt.executeUpdate();
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
			<h2>Successfully created new listing</h2>
			<p>
				Back to landlord page <a href="landlordPage.jsp"><button>back</button>
				</a>
			</p>
			<p>
				Go back to choosing role page <a href="tenant_or_landlord.jsp"><button>back</button>
				</a>
			</p>
		</c:when>
		<c:otherwise>
			<h2>Error during process</h2>
		Back to choosing property page
		<a href="propertyForUpdate.jsp"><button>back</button></a>
		</c:otherwise>
	</c:choose>
</body>
</html>
