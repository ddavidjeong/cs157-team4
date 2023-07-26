<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Page</title>
</head>
<body>
    <h1>Welcome to the Payment Page</h1>

   
    <form method="post">
        Enter tenant ID: <input type="text" name="tenant_id" required><br>
        Enter order ID: <input type="text" name="order_id" required><br>
        Enter amount: <input type="number" name="amount" required><br>
        <input type="submit" value="Make Payment">
    </form>

   
    <%
    if (request.getMethod().equalsIgnoreCase("post")) {
        // Retrieve payment details from the form
        String tenantId = request.getParameter("tenant_id");
        int orderId = Integer.parseInt(request.getParameter("order_id"));
        int amount = Integer.parseInt(request.getParameter("amount"));

       
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/lease";
            String username = "root";
            String password = "FlagFoot#30";
            Connection conn = DriverManager.getConnection(url, username, password);

            
            int paymentId = (int) (Math.random() * 1000);

            // Insert the payment record into the 'payment' table
            String insertQuery = "INSERT INTO payment (payment_id, order_id, tenant_id, amount, payment_date) VALUES (?, ?, ?, ?, NOW())";
            PreparedStatement pstmt = conn.prepareStatement(insertQuery);
            pstmt.setInt(1, paymentId);
            pstmt.setInt(2, orderId);
            pstmt.setString(3, tenantId);
            pstmt.setInt(4, amount);
            pstmt.executeUpdate();

            conn.close();

            // Set the success message to be displayed on the page
            out.println("<p><strong>Payment successful. Your payment ID is: " + paymentId + "</strong></p>");
        } catch (Exception e) {
            // Set the error message to be displayed on the page
            out.println("<p><strong>Payment failed. Please try again.</strong></p>");
            out.println(e);
        }
    }
    %>
</body>
</html>
