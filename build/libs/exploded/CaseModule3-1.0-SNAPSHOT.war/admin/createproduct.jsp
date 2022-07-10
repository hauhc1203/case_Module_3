<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Thêm sản phẩm mới</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Tạo mới sản phẩm</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/admin/dashboard.jsp">Quay lại trang Sản phẩm</a>
</p>

<form action="/admin?action=create" method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
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
            <tr>
                <td>Tên SP</td>
                <td><input type="text" name="nameProduct" id="nameProduct"></td>
            </tr>
            <tr>
                <td>Ảnh</td>
                <td><input type="text" name="imgURL" id="imgURL"></td>
            </tr>
            <tr>
                <td>Giá</td>
                <td><input type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Số lượng</td>
                <td><input type="number" name="quantity" id="quantity"></td>
            </tr>
            <tr>

                <td></td>
                <td><button type="submit" >Tạo Sản Phẩm</td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>