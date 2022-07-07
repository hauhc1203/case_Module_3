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
<table hidden="true">
    <tr>
    <tr><th colspan="9" >Danh sách SP</th></tr>
    <tr>
        <td  colspan="9" style="text-align: left " >
            <div class="hau">
                <a href="/student?action=create">
                    <button type="button" class="btn btn-primary">Create</button>
                </a>
                <form action="/student?action=search" method="post" style="margin: 0">
                    <input type="search" placeholder="nhập vào tên" name="key"  class="search">
                    <button type="submit" class="btn btn-info">Search</button>
                </form>
            </div>
        </td>

    </tr>
    <th>MÃ SP</th>
    <th>Loại SP</th>
    <th>Tên SP</th>
    <th>Ảnh SP</th>
    <th>Giá</th>
    <th>Số Lượng SP</th>
    <th>Đã bán</th>
    <th colspan="2">Hành động</th>
    </tr>
    <c:forEach var="p" items="${sessionScope.products}">
        <tr>
            <td>${p.idProduct}</td>
            <td>${p.category.getNameCategory()}</td>
            <td>${p.nameProduct}</td>
            <td><img src="${p.imgURL}" alt="">   </td>
            <td>${p.price}</td>
            <td>${p.quantity}</td>
            <td>${p.quantity_sold}</td>
            <td><a href="/student?action=edit&id=${p.idProduct}"><button type="button" class="btn btn-warning">Edit</button>
            </a></td>
            <td><a  href="/student?action=delete&id=${p.idProduct}"  class="delete"  ><button type="button" class="btn btn-danger" >Delete</button>
            </a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
