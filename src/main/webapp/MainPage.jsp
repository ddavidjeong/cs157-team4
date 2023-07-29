<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Main Page</title>
    <style>
	    body {
		    background-color: pink;
	    }
	  </style>
  </head>
  <body>
    <div style="text-align: center">
    	<h1>Welcome to Short_Term_Leasing System</h1>
  		<img src="images/room.jpg" >
	</div>
	<br><br>
    <% 
      String db = "Short_Term_Leasing";
      out.println("If you are using this system for the first time, please click Sign Up.<br>");
    %>
    <form action="signup.jsp">
      <input type="submit" value="Sign Up">
    </form>
    <% 
      out.println("If you are a returning user, please click Login.<br>");
    %>
    <form action="login.jsp">
      <input type="submit" value="Login">
    </form>
    <% 
      out.println("If you are a admin, please click Admin.<br>");
    %>
    <form action="admin.jsp">
      <input type="submit" value="Admin">
    </form>
  </body>
</html>
