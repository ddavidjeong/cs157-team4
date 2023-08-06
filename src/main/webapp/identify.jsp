<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Identify user ID or email address</title>
<style>
body {
	background-color: #f8bbd0; /* make backgroudn pink*/
}

h2 {
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
		<h2>Check your user ID or email address</h2>
		<form method="post" action="getUserInfo.jsp">
			First Name: <input type="text" id="firstName" name="firstName"
				required><br />
			<br /> Last Name: <input type="text" id="lastName" name="lastName"
				required><br />
			<br /> <input type="submit" value="submit">
	</div>
	</form>

</body>
</html>
