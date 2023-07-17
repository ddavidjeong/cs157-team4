<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="object.userBean" %>
<% userBean userInfo = (userBean)session.getAttribute("userInfo"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>'s Profile </title>
</head>
<body>
		<div class="mx-auto text-center" style="width: 70%;">
		<table class="table table-striped">
		<thead>
			 <tr>
			 	<th scope="col">User ID</th>
			 	<th scope="col">First Name</th>
			 	<th scope="col">Last Name</th>
			 	<th scope="col">Email Address</th>
			 	<th scope="col">Tenant ID</th>
			 	<th scope="col">Landlord ID</th>
			 </tr>
		</thead>
		<tbody>			 
			 <tr>
			 	<td><%= userInfo.getUser_id() %></td>
			 	<td><%= userInfo.getFirstName() %></td>
			 	<td><%= userInfo.getLastName() %></td>
			 	<td><%= userInfo.getEmailAddress() %></td>
			 	<td><%= userInfo.getTenant_id() %></td>
			 	<td><%= userInfo.getLandlord_id() %></td>
			 </tr>
		</tbody>
		</table>
<p>		
		Order History 
		<form method="post" action=order.jsp">
		<input type="submit" value="next">
		</form>
		<br>
		back to user type page
		<a href= "tenant_or_landlord.jsp"><button>back</button></a>
</p>
</div>
</body>
</html>
