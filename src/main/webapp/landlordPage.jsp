<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Landlord Page</title>
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
	<h2>Select your action</h2>	
	<h3>Property</h3>
	<p>Add new property
    		<a href="add_property.jsp"><button>add</button> </a>
    	</p> 
    	
    	<p>Modify/Update exist property
    		<a href="propertyForUpdate.jsp"><button>modify</button></a>
    	</p>
    
    	<h3>Listing</h3>
	<p>Create new listing
    		<a href="chooseProperty.jsp"><button>create</button> </a>
    	</p> 
    	
    	<p>Modify/Update exist listings
    		<a href="chooseListing.jsp"><button>modify</button></a>
    	</p>
    	
    	<p>Back to choosing role page
    		<a href="tenant_or_landlord.jsp"><button>back</button></a>
    	</p>
</body>
</html>