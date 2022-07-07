<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<form action="/admin" method="get">
    <label for="myfile">Select a file:</label>
    <input type="file" id="myfile" name="myfile"  accept="image/*">
    <input type="submit" value="Gửi">
</form>
</body>
</html>