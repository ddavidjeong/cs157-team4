<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Property Page</title>
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
<h1> Property Show below </h1>

<form method="post" action="modifysuccessproperty.jsp">
    <label for="propertyid">property id:</label>
    <input type="number" id="propertyid" name="propertyid" required><br/><br/>
    
    <label for="bd_count">bedroom count:</label>
    <input type="number" id="bd_count" name="bd_count"><br/><br/>
    
    <label for="br_count">bathroom count:</label>
    <input type="number" id="br_count" name="br_count"><br/><br/>
    
    <label for="type">type:</label>
    <input type="text" id="type" name="type"><br/><br/>
    
    <label for="price">price:</label>
    <input type="number" id="price" name="price"><br/><br/>
    

    <input type="submit" value="Modify">
</form>

<table border="1">
    <tr>
        <td>Property IDS</td>
        <td>address_id</td>
        <td>bedroom count</td>
        <td>bathroom count</td>
        <td>type</td>
        <td>price</td>
    </tr>
    <%
    String user = "root";
    String password = "Hazuki_0824";
    try {

        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user, password);
        Statement stmt = con.createStatement();
        ResultSet listing = stmt.executeQuery("SELECT * FROM property");

        while (listing.next()) {
            out.println("<tr>" + "<td>" + listing.getInt(1) + "</td>" + "<td>" + listing.getString(2) + "</td>" + "<td>" + listing.getString(3) + "</td>"
                    + "<td>" + listing.getString(4) + "</td>" + "<td>" + listing.getString(5) + "</td>" + "<td>" + listing.getString(6) + "</td>"
                    + "</tr>");
        }
        listing.close();
        stmt.close();
        con.close();

    } catch (SQLException e) {
        out.println("SQLException caught: " + e.getMessage());
    }
    %>
</table>
</body>
</html>
