<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Room Search</title>
</head>
<body>
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
