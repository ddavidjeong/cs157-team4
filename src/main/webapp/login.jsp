<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Login</title>
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
