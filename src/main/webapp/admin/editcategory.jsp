<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 10/07/2022
  Time: 11:02 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<form action="/admin?action=editcategory$id=${sessionScope.category.idCategory}" method="post">

<h3> Sửa thông tin loại sản phẩm</h3>
<table>
    <tr>
        <td> Loại SP</td>
        <td> <input type="number" name="category" id="category" value="${sessionScope.category.idCategory}">

        </td>
    </tr>
    <tr>
        <td>Tên loại SP</td>
        <td> <input type="text" name="nameCategory" id="nameCategory" value="${sessionScope.category.nameCategory}"></td>
    </tr>
    <tr>
        <td> Số lượng SP</td>
        <td> <input type="number" name="productQuantity" id="productQuantity" value="${sessionScope.category.productQuantity}"></td>
    </tr>


</table>
    <button type="submit" class="btn btn-primary">Edit</button>
</form>
</body>

</html>
