<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Room Page</title>
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
    <h1> Available Room Page </h1>
    
    <table border="1">
      <tr>
        <td>Address_id</td>
        <td>state</td>
        <td>zip code</td>
   </tr>
   <a href="add_property.jsp" target="_blank"><button type="button">Back to add property</button></a><br/><br/>
    <% 
     String db = "lease";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Sheep88517565";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false",user, password);
            out.println("Address id"+"<br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM address");
            
            while (rs.next()) {
                out.println("<tr>"+"<td>"+rs.getInt(1)+"</td>" + "<td>" + rs.getString(2) + "</td>" + "<td>"+rs.getString(3)+"</td>"+"</tr>");
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
