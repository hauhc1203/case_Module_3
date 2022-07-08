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
    <link rel="stylesheet" href="/css/orderDetail.css">

</head>
<body>
<div class="card">
    <div class="title">Chi tiết hóa đơn</div>
    <div class="info">
        <div class="row">
            <div class="col-7 pull-right">
                <span class="heading">Mã đơn hàng</span>
                <span class="details">${sessionScope.order.getIdOrder()}</span>
            </div>
            <div class="col-5">
                <span class="heading">Ngày mua: </span>
                <span class="details">${sessionScope.order.getOrDate()}</span>
            </div>

            <div class="col-7">
                <span class="heading">Địa chỉ: </span>
                <span class="details">${sessionScope.order.getAddress()}</span>
            </div>
            <div class="col-5">
                <span class="heading">Trạng thái:  </span>
                <span class="details">${sessionScope.order.getStatusDelivery()}</span>
            </div>
            <div class="col-12">
                <span class="heading">Người mua: </span>
                <span class="details">${sessionScope.order.getAccount().getFullName()}</span>
            </div>


        </div>
    </div>
    <div class="pricing">
        <div class="row">
            <div class="col-6">
                <span class="name">Tên Sản Phẩm</span>
            </div>
            <div class="col-3">
                <span class="">Số Lượng</span>
            </div>
            <div class="col-3">
                <span class="price">Thành tiền</span>
            </div>
            <c:forEach var="entry" items="${sessionScope.order.getDetail()}">
                <div class="col-6">
                    <span class="name">${entry.getKey().getNameProduct()}</span>
                </div>
                <div class="col-3">
                    <span class="">${entry.getValue()}</span>
                </div>
                <div class="col-3">
                    <span class="price">${entry.getKey().getPrice()*entry.getValue()} VNĐ</span>
                </div>
            </c:forEach>

        </div>

    </div>
    <div class="total">
        <div class="row">
            <div class="col-9">Tổng </div>
            <div class="col-3"><big>${sessionScope.order.getTotalValue()} VNĐ</big></div>
        </div>
    </div>

    <div class="col-12" style="display: flex;justify-content: center">
       <a href="/orders?action=${sessionScope.action}&idAcc=${sessionScope.idAcc}" style="color: white"> <button class="btn btn-primary">Trở về</button></a>
    </div>

</div>


</body>
</html>
