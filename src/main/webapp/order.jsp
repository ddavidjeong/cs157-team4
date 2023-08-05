<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="object.optionBean" %>
<%@ page import="object.userBean" %>
<%@ page import="object.propertyBean"%>

<% List<optionBean> room = (List<optionBean>)session.getAttribute("roomOption"); %>
<% userBean userInfo = (userBean)session.getAttribute("userInfo"); %>
<% String choice = request.getParameter("room");%>
<% int num = Integer.parseInt(choice);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Booking Room</title>
<style>
      body {
        background-color: #f8bbd0; /* Set the background color to a light pink */
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
<h1>Are you booking this room?</h1>

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
    int propertyId=0;
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
		 propertyId = order.getproperty();
	      break;
	 	}
	 }
	

    // Create a new instance of PropertyBean and set the property_id value
    propertyBean propertyBean = new propertyBean();
    propertyBean.setPropertyID(propertyId);

    // Store the PropertyBean in the session attribute
    session.setAttribute("propertyBean", propertyBean);
	
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
    <h1>Displaying Room</h1>
    <img src="serveImage" alt="Image not found" />
</body>
</html>