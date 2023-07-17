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
    <form action="search.jsp">
      <input type="submit" value="Tenant">
    </form>
    
    <% 
      out.println("If you are Landlord, please click Landlord Button<br/><br/>");
    %>
    <form action="add_property.jsp">
      <input type="submit" value="Landlord">
    </form>

    <p>you can check your profile here
    <a href="profile.jsp"><button>Profile page</button> </a>
    </p>
  </body>
</html>
