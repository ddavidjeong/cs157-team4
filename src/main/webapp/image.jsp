<!DOCTYPE html>
<html>
<head>
    <title>Image Upload</title>
</head>
<body>
    <form action="<%=request.getContextPath()%>/UploadServlet" method="post" enctype="multipart/form-data">
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required><br/><br/>
        <input type="submit" value="Upload">
    </form>
</body>
</html>
