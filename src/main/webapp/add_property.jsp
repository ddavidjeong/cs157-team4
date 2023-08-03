<html>
  <head>
    <title>Adding Room</title>
  </head>
  <body>
    <h1>This is the Adding Property Page</h1>
    <form method="post" action="createProperty.jsp">
      <label for="bedroom">Number of Bedroom</label>
      <input type="number" id="bedroom" name="bedroom" required><br/><br/>
      
      <label for="N0BR">Number of Bathroom</label>
      <input type="number" id="NOBR" name="NOBR" required><br/><br/>
      
      <label for="type">Type:</label>
      <input type="text" id="type" name="type" required><br/><br/>
      
      <label for="Price">Price:</label>
      <input type="number" id="Price" name="Price" required><br/><br/>
      
      <label for="street">Street:</label>
      <input type="text" id="street" name="street" required><br/><br/>
      
      <label for="city">City:</label>
      <input type="text" id="city" name="city" required><br/><br/>
      
      <label for="state">State:</label>
      <input type="text" id="state" name="state" required><br/><br/>
      
      <label for="zipCode">Zip Code:</label>
      <input type="number" id="zipCode" name="zipCode" required><br/><br/>
      
      <input type="submit" value="submit">
      <a href="landlordPage.jsp" target="_blank"><button type="button">back</button></a><br/><br/>
    </form>
    
  </body>
</html>
