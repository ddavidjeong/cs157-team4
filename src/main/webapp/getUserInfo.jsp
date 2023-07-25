<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
	<tr>
    	<td>User ID</td>
       	<td>First Name</td>
       	<td>Last Name</td>
       	<td>Email Address</td>
       	<td>Tenant ID</td>
       	<td>Landlord ID</td>
    </tr>	
	<%
      String firstName = request.getParameter("firstName");
      String lastName = request.getParameter("lastName");

      String user = "root";
      String password = "Hazuki_0824";
    	
      
      try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
        
        try (Connection con = DriverManager.getConnection(url, user, password)) {
          String userInfoSql = "select * from users where first_name = ? AND last_name = ?";
          PreparedStatement stmt = con.prepareStatement(userInfoSql, Statement.RETURN_GENERATED_KEYS);
          
          
          stmt.setString(1, firstName);
          stmt.setString(2, lastName);
          try (ResultSet rs = stmt.executeQuery()) {
              while (rs.next()) {
                  out.println("<tr>"
                  		+ "<td>" + rs.getInt("user_id") + "</td>"
                  		+ "<td>" + rs.getString("first_name") + "</td>"
                  		+ "<td>" + rs.getString("last_name") + "</td>"
                        + "<td>" + rs.getString("email_address") + "</td>"
                        + "<td>" + rs.getString("tenant_id") + "</td>"
                        + "<td>" + rs.getString("landlord_id") + "</td>"
                        + "</tr>");
                  
              }              
          }
        }
		} catch (SQLException e) {
  			out.println("SQLException caught: " + e.getMessage());
		} catch (ClassNotFoundException e) {
  			out.println("ClassNotFoundException caught: " + e.getMessage());
		}
	%>	 
	
	Back to login page
	<a href="login.jsp" target="_blank"><button type="button">Back</button></a><br/><br/>

</body>
</html>