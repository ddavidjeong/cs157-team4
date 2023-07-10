<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Login</title>
    </head>
  <body>
    <h1> This is Login Page </h1>
    <form method="post" action="login.jsp">
      <label for="userid">userid:</label>
      <input type="number" id="userid" name="userid" required><br/><br/>
      
      <label for="Email">Email:</label>
      <input type="text" id="Email" name="Email" required><br/><br/>
      
      <input type="submit" value="Login">
    </form>

    <%
     String userid = request.getParameter("userid");
     String Email = request.getParameter("Email");
     String db = "lease";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "Sheep88517565";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM User WHERE userid = " + userid);
            if(rs.next()){
              if(rs.getString(2).equals(Email)){
                 out.println("Successful Login Welcome");
              }
              else{
                   out.println("Re-enter");
                  }
              
            }
            else{
              out.println("Re-enter");
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
