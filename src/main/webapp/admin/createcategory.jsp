<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 7/9/2022
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Thêm loại sản phẩm mới</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Tạo mới loại sản phẩm</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/admin/dashboard.jsp">Quay lại trang Sản phẩm</a>
</p>

<form action="/admin?action=createc" method="post">
    <fieldset>
        <legend>Thông tin loại sản phẩm</legend>
        <table>
            <%--            <tr>--%>
            <%--                <td>Mã SP:</td>--%>
            <%--                <td><input type="text" name="id" id="id"></td>--%>
            <%--            </tr>--%>
            <tr>
                <td>Loại SP</td>
                <td><select  name="category" id="category">
                    <c:forEach var="c" items="${sessionScope.categories}">
                        <option value="${c.idCategory}">${c.nameCategory}</option>
                    </c:forEach>
                </select>  </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>