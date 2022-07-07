<%--
  Created by IntelliJ IDEA.
  User: hauhc1203
  Date: 06/07/2022
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <title>Chi tiết đơn hàng</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        tr,th,td,table{
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        table{
            width: 1000px;
            margin: auto;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }
        img{
            height: 160px;
            width: 160px;
        }
        .hau{
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 22px;
        }
        .search{
            height: 35px;
        }

    </style>
</head>
<body>
<div>
    Mã đơn hàng: <input type="number" value="${sessionScope.order.getIdOrder()}" disabled>
    Người mua : <input type="text" value="${sessionScope.order.getAccount()}" disabled>


    <table >
        <tr>
        <tr><th colspan="8" >Chi tiết đơn hàng </th></tr>
        <th>Tên sản phẩm</th>
        <th>Số lượng</th>

        </tr>
        <c:forEach var="entry" items="${sessionScope.order.getDetail()}">
            <tr>
                <td style="text-align: left ;">${entry.getKey().getNameProduct()}</td>
                <td>${entry.getValue()}</td>
            </tr>
        </c:forEach>
    </table>
</div>



</body>
</body>
</html>
