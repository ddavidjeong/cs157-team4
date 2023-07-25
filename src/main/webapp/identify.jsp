<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Identify user ID or email address</title>
</head>
<body>
	<h2>Check your user ID or email address</h2>
	<form method="post" action="getUserInfo.jsp">
      First Name:
      <input type="text" id="firstName" name="firstName" required><br/><br/>
      
      Last Name:
      <input type="text" id="lastName" name="lastName" required><br/><br/>
      
      <input type="submit" value="submit">
    </form>

</body>
</html>