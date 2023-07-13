<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Tenant or Landlord</title>
  </head>
  <body>
    <h1>Please choose the role you want: Tenant or Landlord</h1>
    
    <% 
      out.println("If you are Tenant, Please click Tenant Button<br/><br/>");
    %>
    <form action="">
      <input type="submit" value="Tenant">
    </form>
    
    <% 
      out.println("If you are Landlord, please click Landlord Button<br/><br/>");
    %>
    <form action="adding_room.jsp">
      <input type="submit" value="Landlord">
    </form>
  </body>
</html>

