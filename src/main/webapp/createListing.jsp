<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="object.userBean" %>
<%@ page import="object.propertyBean" %>
<% List<propertyBean> roomList = (List<propertyBean>)session.getAttribute("propertyOption"); %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String choice = request.getParameter("property");%>
<% int num = Integer.parseInt(choice);%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Creating new listing</title>
</head>
<body>
    <%
      String start = request.getParameter("start");
      String end = request.getParameter("end");
      String numPeople = request.getParameter("num");
      String db = "lease";
      String user = "root";
      String password = "Hazuki_0824";
      
      userBean userInfo = (userBean)session.getAttribute("userInfo");
      String landlordID = userInfo.getLandlord_id();
      int propertyID = 0;
      
      for(propertyBean property: roomList) {
    		 if (property.getOption() == num){
    			 propertyID = property.getPropertyID();
    		      break;
    		 	}
    		 }
    	
      try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
        
        try (Connection con = DriverManager.getConnection(url, user, password)) {
          String createSql = "INSERT INTO listings (listing_id, property_id, landlord_id, start_date, "
        		  + "end_date, max_headcount, booking_status) VALUES (?, ?, ?, ?, ?, ?, ?)";
          PreparedStatement stmt = con.prepareStatement(createSql, Statement.RETURN_GENERATED_KEYS);
          
          ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM listings");
          int id = 0;
          if (rs.next()) {
              id = rs.getInt(1);
          }
          rs.close();
          
          stmt.setInt(1, id+1);
          stmt.setInt(2, propertyID);
          stmt.setString(3, landlordID);
          stmt.setString(4, start);
          stmt.setString(5, end);
          stmt.setString(6, numPeople);
          stmt.setInt(7, 0);
          
          int rowsAffected = stmt.executeUpdate();
          request.setAttribute("affect", rowsAffected);
        }
		} catch (SQLException e) {
  			out.println("SQLException caught: " + e.getMessage());
		} catch (ClassNotFoundException e) {
  			out.println("ClassNotFoundException caught: " + e.getMessage());
		}
	%>
	<c:choose>
		<c:when test="${affect > 0}">
		<h2>Successfully created new listing</h2>
		<p>Create new listing or add new property
			<a href="addingOrCreating.jsp"><button>back</button> </a>
		</p>
		<p>Go back to choosing role page
			<a href="tenant_or_landlord.jsp"><button>back</button> </a>
		</p>
		</c:when>
	<c:otherwise>
		<h2>Error during process</h2>
		Back to choosing room page
		<a href="chooseProperty.jsp"><button>back</button></a>
	</c:otherwise>
</c:choose>
</body>
</html>