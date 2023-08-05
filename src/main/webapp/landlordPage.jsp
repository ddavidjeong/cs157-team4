<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Landlord Page</title>
    <style>
	body {
		background-color: pink;
	}
	</style>
</head>
<body>
    <div style="text-align: center">
    	<h1>Select your action</h1>	
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
	</div>
</body>
</html>