<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 10/07/2022
  Time: 10:26 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm loại sản phẩm</title>
</head>
<body>
<h1>Tạo mới loại sản phẩm</h1>
<form action="/admin?action=createcategory" method="post">
    <h1> Thông tin category</h1>
<table>
<tr>
<td>Mã loại sản phẩm</td>
    <td><input type="text" name="category" id="category"></td>
</tr>
    <tr>
        <td>Tên loại sản phẩm</td>
        <td><input type="text" name="nameCategory" id="nameCategory"></td>
    </tr>
    <tr>
        <td>Tên loại sản phẩm</td>
        <td><input type="text" name="productQuantity" id="productQuantity"></td>
    </tr>
    <tr>
        <td>
        </td>
        <td><input type="submit" value="Create category"></td>
    </tr>
</table>
</form>
</body>
</html>
