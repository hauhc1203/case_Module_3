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
    <link href="css/styles.css" rel="stylesheet" />
    <style>
        tr,th,td,table{
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
            font-size: 30px;
        }
        table{
            width: 1500px;
            margin: auto;

        }
        img{
            height: 160px;
            width: 160px;
        }
        .hau{
            display: flex;
            justify-content: right;
            align-items: center;
            padding: 0 22px;
        }
        .search{
            height: 35px;
        }

    </style>
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
                        <a style="padding-right: 10px;" href="/orders?action=showByAcc&idAcc=${sessionScope.account.getIdAccount()}"><button class="btn btn-outline-dark">Your Orders</button></a>
                        <button style="padding-right: 10px;" class="btn btn-outline-dark" type="submit" onclick="displayCart()" >
                            <i class="bi-cart-fill me-1"></i>
                            Cart
                            <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.soSp}</span>
                        </button>
                        <div style="width: auto;display: flex;" id="logout"> <h4 style="padding-right: 10px;">Xin chao, ${sessionScope.lastname}</h4>

                            <a href="/login?action=logout">
                                <button class="btn btn-outline-dark" type="submit">
                                    Logout
                                </button></a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <button style="padding-right: 10px;" class="btn btn-outline-dark" type="submit" onclick="displayCart()" >
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


<div class=" px-4 px-lg-5 mt-5"   >
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="display: flex;justify-content: center">
        <a class="navbar-brand" href="/orders?action=showByAcc&idAcc=${sessionScope.account.getIdAccount()}">Tất cả đơn hàng</a>
        <a style="padding:10px" class="navbar-brand" href="/orders?action=showByAcc&status=dangxuly&idAcc=${sessionScope.account.getIdAccount()}">Đang Xử lý</a>
        <a class="navbar-brand" href="/orders?action=showByAcc&status=hoanthanh&idAcc=${sessionScope.account.getIdAccount()}">Lịch sử mua hàng</a>

    </nav>
</div>
<div style="width: auto; min-height: 600px; padding-top: 80px">
    <table >
        <tr>
        <tr><th colspan="8" >Danh sách đơn hàng</th></tr>

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
                <td><a  content="${order.statusDelivery}" class="cancel"  ><button type="button" class="btn btn-danger" >Hủy</button>
                </a></td>
            </tr>
            <%--        href="/orders?action=cancel&id=${order.idOrder}"--%>
        </c:forEach>
    </table>



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
                                        <a href="/orders?action=create" style="width: 15%" id="confirm"><button class="btn btn-info">Order</button></a>
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
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>


</body>



<script src="js/cart.js"></script>





<script>


    let cancelLinks = document.querySelectorAll('.cancel');

    for (let i = 0; i < cancelLinks.length; i++) {
        cancelLinks[i].addEventListener('click', function(event) {
            event.preventDefault();
            let trangThai=  cancelLinks[i].getAttribute("content")

            if (trangThai!="Đang giao") {
                window.location.href = this.getAttribute('href');
            }else {
                alert("đơn hàng đang được  giao. Không thể Hủy ")
            }
        });
    }
</script>
</html>
