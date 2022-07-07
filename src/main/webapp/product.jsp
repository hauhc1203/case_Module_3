<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 07/07/2022
  Time: 8:58 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>STT</th>
        <th>Loai</th>
        <th>Ten</th>
        <th>Anh</th>
        <th>Gia</th>
        <th>So luong</th>
    </tr>
    <c:forEach var="p" items="${products}">
        <tr>
            <td>${p.idProduct}
            </td>

            <td>${p.getCategory().getNameCategory()}</td>
            <td>${p.nameProduct}</td>
            <td>${p.imgURL}</td>
            <td>${p.price}</td>
            <td>${p.quantity}</td>
            <td>${p.quantity_sold}</td>

            <td><a href="/cart?action=add&id=${sanpham.idProduct}"><button type="button" >Add</button>
            </a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
