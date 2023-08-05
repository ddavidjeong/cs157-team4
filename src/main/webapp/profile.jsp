<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="object.userBean" %>
<% userBean userInfo = (userBean)session.getAttribute("userInfo"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title><%= userInfo.getFirstName() %>'s Profile </title>
</head>
<body>
	<h1><%= userInfo.getFirstName() %>'s Profile</h1>
		<table border="1">
		<tr>
      			<td>User ID</td>
        		<td>First Name</td>
        		<td>Last Name</td>
        		<td>Email Address</td>
        		<td>Tenant ID</td>
        		<td>Landlord ID</td>
       	 	</tr>	 
		<tr>
	    		<td><%= userInfo.getUser_id() %></td>
			<td><%= userInfo.getFirstName() %></td>
			<td><%= userInfo.getLastName() %></td>
			<td><%= userInfo.getEmailAddress() %></td>
			<td><%= userInfo.getTenant_id() %></td>
			<td><%= userInfo.getLandlord_id() %></td>
		</tr>
		</table>
	<p>		
		Order History 
		<form method="post" action="orderHistory.jsp">
		<input type="submit" value="next">
		</form>
		<br>
		Go to payment page
		<a href="chooseOrder.jsp"><button>next</button></a>
		</br></br>
		Go back to user type page
		<a href= "tenant_or_landlord.jsp"><button>back</button></a>
	</p>
	</div>
</body>
</html>
