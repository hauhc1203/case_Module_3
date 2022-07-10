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
    <link href="css/styles.css" rel="stylesheet" />

    <link rel="stylesheet" href="/css/orderDetail.css">

</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="position: fixed;width: 100%; z-index: 1">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">H Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="/home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/home?action=showall">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/home">Top sales</a></li>
                    </ul>
                </li>
            </ul>
            <div class="d-flex" style="width: auto ;display: flex ;justify-content: space-between">


                <c:choose>
                    <c:when test="${sessionScope.account!=null}">
                        <a href="/orders?action=showByAcc&idAcc=${sessionScope.account.getIdAccount()}"><button class="btn btn-outline-dark">Your Orders</button></a>
                        <button class="btn btn-outline-dark" type="submit" onclick="displayCart()" >
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.soSp}</span>
                        </button>
                        <div style="width: auto;display: flex;" id="logout"> <h4>Xin chao, ${sessionScope.lastname}</h4>

                            <a href="/login?action=logout">
                                <button class="btn btn-outline-dark" type="submit">
                                    Logout
                                </button></a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-outline-dark" type="submit" onclick="displayCart()" >
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.soSp}</span>
                        </button>
                        <a href="/login" id="login">
                            <button class="btn btn-outline-dark" type="submit">
                                Login
                            </button></a>
                    </c:otherwise>
                </c:choose>



            </div>
        </div>
    </div>
</nav>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Shop in style</h1>
            <p class="lead fw-normal text-white-50 mb-0">Bán mọi thứ bạn cần !</p>
        </div>
    </div>
</header>



<div style="width: auto;min-height: 600px;padding-top: 10px;padding-bottom: 10px">
    <div class="card">
        <div class="title" style="font-size: 30px">Chi tiết hóa đơn</div>
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
</div>



<%--Cart--%>

<div style="  position: fixed ;top:8%;left: 60% ; font-size: 23px;
    width: 700px ;
    height: auto;
    display: none;
    background-color: wheat;
    border-radius: 15px;
    overflow:auto;
    max-height: 500px;

" id="cart1" >

    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div class="card card-registration card-registration-2" style="border-radius: 15px">
                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <div class="d-flex justify-content-between align-items-center mb-5">
                                        <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                        <h6 class="mb-0 text-muted">${sessionScope.soSp} items</h6>
                                    </div>
                                    <c:forEach var="entry" items="${sessionScope.cart.getDetail()}">
                                        <hr class="my-4">

                                        <div class="row mb-4 d-flex justify-content-between align-items-center">
                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                <img
                                                        src="${entry.getKey().getImgURL()}"
                                                        class="img-fluid rounded-3" alt="Cotton T-shirt">
                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                <h6 class="text-muted">${entry.getKey().getCategory().getNameCategory() }</h6>
                                                <h6 class="text-black mb-0">${entry.getKey().getNameProduct()}</h6>
                                            </div>
                                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                    <%--                                                    <button class="btn btn-link px-2"--%>
                                                    <%--                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">--%>
                                                    <%--                                                        <i class="fa fa-minus" ></i>--%>
                                                    <%--                                                    </button>--%>

                                                <input id="${entry.getKey().getIdProduct()}" style="width: 60px" min="0" name="quantity" value="${entry.getValue()}" type="number"
                                                       class="form-control form-control-sm"  />

                                                    <%--                                                    <button class="btn btn-link px-2"--%>
                                                    <%--                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">--%>
                                                    <%--                                                        <i class="fa fa-plus"></i>--%>
                                                    <%--                                                    </button>--%>
                                            </div>
                                            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                <h6 class="mb-0">${entry.getKey().getPrice()*entry.getValue()} VNĐ</h6>
                                            </div>
                                            <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                <a   href="/cart?action=remove&id=${entry.getKey().getIdProduct()}" class="text-muted"><i class="fa fa-times"></i></a>
                                            </div>
                                        </div>
                                        <hr class="my-4">
                                    </c:forEach>


                                    <div class="row mb-4 d-flex  align-items-center" style="display: flex;justify-content: center;}">
                                        <a href="/orders?action=create" style="width: 15%" id="haha"><button class="btn btn-info">Order</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white"></p>Copyright &copy; H-Shop 2022</div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
<script src="js/cart.js"></script>

</body>
</html>
