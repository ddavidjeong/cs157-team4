<html>
  <head>
    <title>Sign up</title>
    <style>
      body {
        background-color: #f8bbd0; /* make backgroudn pink*/
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
    <h1>Register</h1>
    <form method="post" action="checkUser.jsp">
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
    </div>
  </body>
</html>
