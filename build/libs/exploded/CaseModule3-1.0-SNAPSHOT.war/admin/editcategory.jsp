<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 7/9/2022
  Time: 4:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Thêm sản phẩm</title>
    <meta charset="UTF-8">

</head>
<body>
<form action="/admin?action=editc&id=${sessionScope.category.idCategory}" method="post" >
    <h3>Sửa Thông Tin Sản Phẩm </h3>
    <br>

    <table>
        <tr>
            <td>Loại SP</td>
            <td><select  name="category" id="category">
                <c:forEach var="c" items="${sessionScope.categories}">
                    <option class="nameCategory" value="${c.getIdCategory()}">${c.getNameCategory()}</option>
                </c:forEach>
            </select>  </td>
    </table>
    <button type="submit" class="btn btn-primary">Sửa</button>

</form>

</body>
</html>
