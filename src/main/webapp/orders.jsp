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

    <title>Đơn Hàng Của bạn</title>
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
    <nav-bar>

    </nav-bar>
</div>


<table >
    <tr>
    <tr><th colspan="8" >Danh sách đơn hàng</th></tr>
    <tr>
        <td  colspan="8" style="text-align: left " >
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
    <th>Mã đơn hàng</th>
    <th>Người đặt</th>
    <th>Ngày đặt</th>
    <th>Địa chỉ</th>

    <th>Trạng thái </th>
    <th>Tổng tiền</th>

    <th colspan="2">Hành động</th>
    </tr>
    <c:forEach var="order" items="${sessionScope.orders}">
        <tr>
            <td>${order.idOrder}</td>
            <td>${order.account.getFullName()}</td>
            <td>${order.orDate}</td>

            <td>${order.address}</td>
            <td>${order.statusDelivery}</td>
            <td>${order.totalValue}</td>
            <td><a href="/orders?action=showDetail&idOrder=${order.idOrder}"><button type="button" class="btn btn-warning">Chi tiết</button>
            </a></td>
            <td><a  href="/student?action=delete&id=${order.idOrder}"  class="delete"  ><button type="button" class="btn btn-danger" >Hủy</button>
            </a></td>
        </tr>
    </c:forEach>
</table>
</body>
</body>
</html>
