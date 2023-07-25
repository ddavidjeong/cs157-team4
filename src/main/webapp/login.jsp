<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Login</title>
  </head>
  <body>
    <h1>This is the Login Page</h1>
    <form method="post" action="<%=request.getContextPath() %>/LoginServlet">
      <label for="userid">userid:</label>
      <input type="number" id="userid" name="userid" required><br/><br/>
      
      <label for="Email">Email:</label>
      <input type="text" id="Email" name="Email" required><br/><br/>
      
      <input type="submit" value="Login">
    </form>

    <br><br>
    Forgot user ID or email address?
     <a href="identify.jsp" target="_blank"><button type="button">Back</button></a><br/><br/>
  </body>
</html>
