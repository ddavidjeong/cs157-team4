<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Main Page</title>
  </head>
  <body>
    <h1>Welcome to Short_Term_Leasing System</h1>
    
    <% 
      String db = "Short_Term_Leasing";
      out.println("If you are using this system for the first time, please click Sign Up.<br/><br/>");
    %>
    <form action="signup.jsp">
      <input type="submit" value="Sign Up">
    </form>
    
    <% 
      out.println("If you are a returning user, please click Login.<br/><br/>");
    %>
    <form action="login.jsp">
      <input type="submit" value="Login">
    </form>
  </body>
</html>
