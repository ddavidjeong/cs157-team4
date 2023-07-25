<%@ page import="java.sql.*" %>
<html>
  <head>
    <title>Payments</title>
  </head>
  <body>
    <h1>This is the Page for Inserting Transactions</h1>
    <form method="post" action="">
      <label for="balance">Your Current Balance:</label>
      <input type="number" id="balance" name="balance" required><br/><br/>
      
       <label for="order_id">Order ID:</label>
      <input type="number" id="order_id" name="order_id" required><br/><br/>
      
     
    </form>
    

    <%
      String payment_id = request.getParameter("payment_id");
      //String order_id = request.getParameter("order_id");
      String date = request.getParameter("payment_date");
      String tenant_id = request.getParameter("tenant_id");
     
      String db = "lease";
      String user = "root";
      String password = "FlagFoot#30";
      
      try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false";
        
        try (Connection con = DriverManager.getConnection(url, user, password)) {
          String query = "INSERT INTO payment (payment_id, payment_date, tenant_id) VALUES (?, ?, ?)";
          PreparedStatement stmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
          
          ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM payment");
          int id = 0;
          if (rs.next()) {
              id = rs.getInt(1);
          }
          rs.close();
          
          stmt.setInt(1, id+1);
          stmt.setString(2, payment_id);
          stmt.setString(4, tenant_id);
          
          
          int rowsAffected = stmt.executeUpdate();
          if (rowsAffected > 0) {
            out.println("Payment Succesful<br/><br/>");
          } else {
            out.println("Insert failed<br/><br/>");
          }
        }
      } catch (SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
      } catch (ClassNotFoundException e) {
        out.println("ClassNotFoundException caught: " + e.getMessage());
      }
    %>
  </body>
</html>
