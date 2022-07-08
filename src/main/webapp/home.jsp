
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Shop Homepage - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />



</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
                        <li><a class="dropdown-item" href="/product?role=user">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/home">Top sales</a></li>
                    </ul>
                </li>
            </ul>
            <div class="d-flex" style="width: 200px;display: flex ;justify-content: space-between">
                    <button class="btn btn-outline-dark" type="submit" onclick="displayCart()" >
                        <i class="bi-cart-fill me-1"></i>
                        Cart
                        <span class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.soSp}</span>
                    </button>
                <a href="/login">
                <button class="btn btn-outline-dark" type="submit">
                   Login
                </button></a>

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


<div class=" px-4 px-lg-5 mt-5"  >
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <a class="navbar-brand" href="/home">Top Sales</a>
        <a class="navbar-brand" href="/home?action=showall">All Product</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <c:forEach var="c" items="${sessionScope.category}">
                    <li class="nav-item">
                        <a class="nav-link" href="/home?action=showByCategory&idCategory=${c.getIdCategory()}">${c.getNameCategory()}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </nav>
</div>
<div class="container px-4 px-lg-5 mt-5"  >


    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
        <c:forEach var="p" items="${sessionScope.products}">

            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="${p.imgURL}"  alt="..." width="100px" height="220px" />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">${p.nameProduct}</h5>
                            <!-- Product price-->
                            <div>Price: ${p.price} VNĐ</div>

                            <div>Sold: ${p.quantity_sold}</div>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="/cart?action=add&id=${p.idProduct}">Add to cart</a></div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>

</div>
<%--Cart--%>

<div style="  position: fixed ;top:6%;left: 60% ; font-size: 23px;
    width: 600px ;
    height:  auto;
    display: none;
    background-color: wheat;
    border-radius: 15px;

" id="cart1" >
    <div class="title" style="text-align:center ; color: #6a1a21; font-size: 34px"><big >  Chi tiết Giỏ hàng </big></div>

    <div class="pricing">
        <div class="row" style="color: #146c43">
            <div class="col-4">
                <span class="name" >Tên Sản Phẩm</span>
            </div>
            <div class="col-4" style="text-align: center">
                <span class="" >Số Lượng</span>
            </div>
            <div class="col-4">
                <span class="price">Thành tiền</span>
            </div>
            <c:forEach var="entry" items="${sessionScope.cart.getDetail()}">
                <div class="col-4">
                    <span class="name">${entry.getKey().getNameProduct()}</span>
                </div>
                <div class="col-4" style="text-align: center">
                    <span class="">${entry.getValue()}</span>
                </div>
                <div class="col-4">
                    <span class="price">${entry.getKey().getPrice()*entry.getValue()} VNĐ</span>
                </div>
            </c:forEach>

        </div>

    </div>
    <div class="total">
        <div class="row" style="color: red">
            <div class="col-8" ><big>Tổng:</big>  </div>
            <div class="col-4"><big>${sessionScope.cart.getTotalValue()} VNĐ</big></div>
        </div>
    </div>
    <div class="total">
        <div class="row" >
            <div class="col-12"style="display: flex; justify-content: center">
                <a href=""><button style="width: 200px;height: 36px;font-size: 24px;display: flex;justify-content: center" class="btn btn-primary">Mua</button></a>
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

<script>
    let link=document.getElementById("cart1")
    let c=0;
    function displayCart(){
        if (c==0){
            link.style.display='block';
            c++
        }else {
            link.style.display='none';
            c--;
        }
    }


</script>
</html>
