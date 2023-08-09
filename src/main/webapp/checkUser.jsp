<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
      body {
        background-color: #f8bbd0; /* Set the background color to a light pink */
      }

      2 {
        color: #007bff; /* Set the heading color to a blue shade */
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
    </style>
</head>
<body>
	<%
     	String userid = request.getParameter("userid");
     	String Email = request.getParameter("Email");
     	String fn = request.getParameter("FN");
     	String ln = request.getParameter("LN");
        String user; // assumes database name is the same as username
        user = "root";
        String password = "Sheep88517565";
        try {
    		java.sql.Connection con;
    		Class.forName("com.mysql.jdbc.Driver");
    		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lease?autoReconnect=true&useSSL=false", user,
    		password);
    		con.setAutoCommit(false);
    		try{
            	String sql = "SELECT * FROM users WHERE user_id = ? OR email_address = ?";
            	PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            
           		stmt.setString(1, userid);
           		stmt.setString(2, Email);
            	ResultSet rs = stmt.executeQuery();
            	int rowsAffected = -1;
        
            	if(!rs.next()){
    				ResultSet num = stmt.executeQuery("SELECT COUNT(*) FROM users");
    				int id = 0;
    				if (num.next()) {
    					id = num.getInt(1) + 1;
    				}
              		PreparedStatement stmt1= con.prepareStatement("INSERT INTO users (user_id, email_address,first_name,last_name, landlord_id, tenant_id) VALUES (?, ?, ?, ?, ?, ?)");
              		stmt1.setString(1, userid);
             		stmt1.setString(2, Email);
              		stmt1.setString(3, fn);
              		stmt1.setString(4, ln);
              		stmt1.setString(5, "L" + id);
              		stmt1.setString(6, "T" + id);
              		rowsAffected = stmt1.executeUpdate();
  					if (rowsAffected > 0) {
						con.commit();
					} 
  					else {
						con.rollback();
					}
            	}
            	request.setAttribute("affect", rowsAffected);
        } catch (SQLException e) {
    		con.rollback();
    		out.println("SQLException caught: " + e.getMessage());
    	} finally {
    		con.setAutoCommit(true); // Reset the auto-commit to its default state
    	}
    	con.close();
    	} catch (ClassNotFoundException e) {
    		out.println("ClassNotFoundException caught: " + e.getMessage());
    	}
    %>
	<c:choose>
		<c:when test="${affect > 0}">
			<div style="text-align: center">
				<h2>Successfully created new account</h2>
				<p>
					Go to login page
					<a href="login.jsp"><button>next</button></a>
				</p>
			</div>
		</c:when>
		<c:when test="${affect < 0}">
			<div style="text-align: center">
				<h2>Either User ID or email address is already used.</h2>
				Back to Main Page
				<a href="MainPage.jsp"><button>back</button></a>
			</div>
		</c:when>
		<c:otherwise>
			<div style="text-align: center">
				<h2>Error during process</h2>
				Back to Main Page
				<a href="MainPage.jsp"><button>back</button></a>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
