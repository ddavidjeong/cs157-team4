<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Sign up</title>
    </head>
  <body>
    <h1> This is Sign up Page </h1>
    <form method="post" action="signup.jsp">
      <label for="userid">userid:</label>
      <input type="number" id="userid" name="userid" required><br/><br/>
      
      <label for="Email">Email:</label>
      <input type="text" id="Email" name="Email" required><br/><br/>
      
      <label for="FN">First Name:</label>
      <input type="text" id="FN" name="FN" required><br/><br/>
      
      <label for="LN">Last Name:</label>
      <input type="text" id="LN" name="LN" required><br/><br/>
      
      <input type="submit" value="Sign Up">
    </form>

    <%
     String userid = request.getParameter("userid");
     String Email = request.getParameter("Email");
     String fn = request.getParameter("FN");
     String ln = request.getParameter("LN");
     String db = "lease";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "Sheep88517565";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM User WHERE userid = "+userid);
            if(rs.next()){
              out.println("The user already exist<br/><br/>");
              out.println("Please Click Login Button");
            }else{
              PreparedStatement stmt1= con.prepareStatement("INSERT INTO users (user_id, email_address,first_name,last_name) VALUES (?, ?, ?, ?)");
              stmt1.setString(1, userid);
              stmt1.setString(2, Email);
              stmt1.setString(3, fn);
              stmt1.setString(4, ln);
              stmt1.executeUpdate();
              out.println("Successful sign in<br/><br/>");
              out.println("Please Click Login Button");
              
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
    <form action="login.jsp">
      <input type="submit" value="Login">
    </form>
  </body>
</html>
