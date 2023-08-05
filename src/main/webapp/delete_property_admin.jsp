<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Listing Page</title>
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

<form method="post" action="deletesuccessproperty.jsp">
    <label for="propertyid">property id:</label>
    <input type="number" id="propertyid" name="propertyid" required><br/><br/>

    <input type="submit" value="Delete">
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
    String db = "lease";
    String user = "root";
    String password = "Hazuki_0824";
    try {

        java.sql.Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user, password);
        Statement stmt = con.createStatement();
        ResultSet listing = stmt.executeQuery("SELECT * FROM lease.property");

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
