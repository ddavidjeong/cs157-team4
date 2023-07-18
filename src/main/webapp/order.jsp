<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="object.optionBean" %>
<%@ page import="object.userBean" %>
<% List<optionBean> room = (List<optionBean>)session.getAttribute("roomOption"); %>
<% userBean userInfo = (userBean)session.getAttribute("userInfo"); %>
<% String choice = request.getParameter("room");%>
<% int num = Integer.parseInt(choice);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Booking Room</title>
</head>
<body>
<h1>Are you booking this room you?</h1>
<table border="1">
      <tr>
        <td>start date</td>
        <td>end date</td>
        <td>number of people</td>
        <td>number of bedroom</td>
        <td>number of bathroom</td>
        <td>price per night</td>
        <td>state</td>
      </tr>
<%
	for(optionBean order: room) {
	 if (order.getOption().equals(num)){
		 out.println("<tr>"
                 + "<td>" + order.getStartDate() + "</td>"
                 + "<td>" + order.getEndDate() + "</td>"
                 + "<td>" + order.getNumPeople() + "</td>"
                 + "<td>" + order.getNumBedRoom() + "</td>"
                 + "<td>" + order.getNumBath() + "</td>"
                 + "<td>" + order.getPrice() + "</td>"
                 + "<td>" + order.getState() + "</td>"
                 + "</tr>");
		 session.setAttribute("order", order);
	      break;
	 	}
	 }
	%>
</table>
<p>		
		Order confirm
		<a href= "orderConfirmation.jsp"><button>next</button></a>
		<br>
		Choose other room
		Go back to result page
		<a href= "result.jsp"><button>back</button></a>
</p>
</body>
</html>