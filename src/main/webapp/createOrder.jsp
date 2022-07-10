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
</head>
<body style="background-color: wheat" >

  <form action="" method="post" >
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

                          <input class="form1" style="width: 45px" min="0" name="quantity" value="${entry.getValue()}" type="number"
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
                          <a href="/cart?action=remove&id=${entry.getKey().getIdProduct()}" class="text-muted"><i class="fa fa-times"></i></a>
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


                      <div class="row mb-4 d-flex justify-content-between align-items-center">
                      <div class="col-md-6 col-lg-6 col-xl-6">
                        <h4>Địa chỉ giao hàng: </h4>
                        <input placeholder="nhập vap địa chỉ" type="text" name="address" required><br><br>
                      </div>
                      <div class="col-md-6 col-lg-6 col-xl-6" style="padding-left: 200px">
                        <h4>Phương thức thanh toán: </h4>
                        <select  name="payment" >

                          <option class="nameCategory" value="">Thanh toán khi nhận hàng</option>

                        </select>

                      </div>


                    <hr class="my-4">


                    <div class="row mb-4 d-flex  align-items-center" style="display: flex;justify-content: center;">
                      <a href="/orders?action=create" style="width: 15%;"><button class="btn btn-info" style=" width: 140px;height: 60px">Xác nhận</button></a>
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

    </div>




  </form>



</body>
</html>
