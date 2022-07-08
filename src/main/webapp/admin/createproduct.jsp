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
    <a href="/student">Back to student list</a>
</p>

<form action="/student?action=create" method="post">
    <fieldset>
        <legend>Studen information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id" id="id"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Birth:</td>
                <td><input type="date" name="birth" id="Birth"></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address" id="address"></td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td><input type="text" name="phone" id="phone"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id="email"></td>
            </tr>
            <tr>
                <td>Class:</td>
                <td><select name="class" id="class">
                    <c:forEach var="c" items="${classStudent}">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>