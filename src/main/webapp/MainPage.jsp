<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Main Page</title>
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
    <% 
      out.println("If you are an admin, please click Admin.<br/><br/>");
    %>
    <form action="admin.jsp">
      <input type="submit" value="Admin">
    </form>
    <img src="serveImage" alt="Image not found" />
  </body>
</html>
