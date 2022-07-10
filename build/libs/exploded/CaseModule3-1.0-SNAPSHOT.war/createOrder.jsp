<%--
  Created by IntelliJ IDEA.
  User: hauhc1203
  Date: 09/07/2022
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Order</title>
  <link rel="stylesheet" href="css/styles.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />



</head>
<body style="background-color: wheat" >
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

            <div style="width: auto;display: flex;" id="logout"> <h4 style="padding-right: 10px;">Xin chao, ${sessionScope.lastname}</h4>

              <a href="/login?action=logout">
                <button class="btn btn-outline-dark" type="submit">
                  Logout
                </button></a>
            </div>
          </c:when>
          <c:otherwise>

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



  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12">
        <div class="card card-registration card-registration-2" style="border-radius: 15px">
          <div class="card-body p-0">
            <div class="row g-0">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="d-flex justify-content-between align-items-center mb-5">
                    <h1 class="fw-bold mb-0 text-black">Tạo đơn hàng</h1>
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
                        <button class="btn btn-link px-2"
                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                          <i class="fa fa-minus" ></i>
                        </button>

                        <input id="form1" style="width: 45px" min="0" name="quantity" value="${entry.getValue()}" type="number"
                               class="form-control form-control-sm" />

                        <button class="btn btn-link px-2"
                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                          <i class="fa fa-plus"></i>
                        </button>
                      </div>
                      <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                        <h6 class="mb-0">${entry.getKey().getPrice()*entry.getValue()} VNĐ</h6>
                      </div>
                      <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                        <a href="/orders?action=removeItem&id=${entry.getKey().getIdProduct()}" class="text-muted"><i class="fa fa-times"></i></a>
                      </div>
                    </div>
                    <hr class="my-4">
                  </c:forEach>
                  <hr class="my-4">

                  <div class="row mb-4 d-flex justify-content-between align-items-center">
                    <div class="col-md-12 col-lg-4 col-xl-4">
                      <h4>Tổng tiền: </h4>

                    </div>
                    <div class="col-md-3 col-lg-3 col-xl-3">
                      <h4>${sessionScope.cart.getTotalValue()} VNĐ</h4>


                    </div>


                    <hr class="my-4">
                    <form action="/orders?action=create" method="post">
                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                      <div class="col-md-6 col-lg-6 col-xl-6">
                        <h4>Địa chỉ giao hàng: </h4>
                        <input placeholder="nhập vap địa chỉ" type="text" name="address" required id="address"><br><br>
                      </div>
                      <div class="col-md-6 col-lg-6 col-xl-6" style="padding-left: 200px">
                        <h4>Phương thức thanh toán: </h4>
                        <select  name="payment" >

                          <option class="nameCategory" value="">Thanh toán khi nhận hàng</option>

                        </select>

                      </div>

                      <hr class="my-4">


                      <div class="row mb-4 d-flex  align-items-center" style="display: flex;justify-content: center;">
                      <button type="submit" class="btn btn-info" style=" width: 140px;height: 60px" id="confirm">Xác nhận</button>


                      </div>
                    </div>
                    </form>

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
<script>

  let link1=document.getElementById("confirm")

  let quantity = document.querySelectorAll('.form-control-sm');


  let link3=document.getElementById("address")


  link1.addEventListener('click',function (evt){
    let c=0;
    let diachi=link3.value
    console.log(diachi)
    for (let i = 0; i < quantity.length; i++) {
      console.log( quantity[i].value
      )
      c+= quantity[i].getAttribute('value')
    }
    console.log(c)
    if (c==0){
      alert("Chưa có gì để mua !!!")
    }else if (diachi!=""){
      alert("Đặt hàng thành công !!!")

    }

  })



</script>
</html>
