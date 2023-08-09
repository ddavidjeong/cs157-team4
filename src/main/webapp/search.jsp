<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Search</title>
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
    <div style="text-align: center">
    <h1>User Search for a Room</h1>
    
    <form method="post" action="result.jsp">
        <label for="locationInput">Location (State):</label>
        <input type="text" id="locationInput" name="location" required>
        
        <br><br>
        
        <label for="checkinInput">Check-in Date:</label>
        <input type="date" id="checkinInput" name="checkinDate" required>
        
        <br><br>
        
        <label for="checkoutInput">Check-out Date:</label>
        <input type="date" id="checkoutInput" name="checkoutDate" required>
        
        <br><br>
        
        <input type="submit" value="Submit">
        <a href="tenant_or_landlord.jsp" target="_blank"><button type="button">Back</button></a><br/><br/>
    </form>
</body>
</html>
