<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 7/8/2022
  Time: 11:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>Thêm sản phẩm</title>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        form{
            width: 500px;
            height:  auto;
            margin: auto;
            padding: 50px;
            border: 3px dotted red;
            position: relative;
        }
        select,input{
            width: 300px;
            height: auto;
        }
        h3   {
            text-align: center;

        }
        button{
            position: relative;
            left: 50%;
            transform: translateX(-50%);;
        }


    </style>
</head>
<body>
<form action="/admin?action=edit&id=${product.idProduct}" method="get" >
    <h3>Sửa Thông Tin Sản Phẩm </h3>
    <br>

    <table>
        <%--            <tr>--%>
        <%--                <td>Mã SP:</td>--%>
        <%--                <td><input type="text" name="id" id="id"></td>--%>
        <%--            </tr>--%>
        <tr>
            <td>Loại SP</td>
            <td><select  name="category" id="category" required value="${productss.category}>
                <c:forEach var="c" items="${sessionScope.categories}">
                    <option value="${c.idCategory}">${c.nameCategory}</option>
                </c:forEach>
            </select>  </td>
        </tr>
        <tr>
            <td>Tên SP</td>
            <td><input type="text" name="nameProduct" id="nameProduct" type="text" required autofocus value="${productss.idProduct}"></td>
        </tr>
        <tr>
            <td>Ảnh</td>
            <td><input type="text" name="imgURL" id="imgURL" required value="${productss.imgURL}"></td>
        </tr>
        <tr>
            <td>Giá</td>
            <td><input type="text" name="price" id="price" required value="${productss.price}></td>
        </tr>
        <tr>
            <td>Số lượng</td>
            <td><input type="number" name="quantity" id="quantity" required value="${productss.quantity}></td>
        </tr>
        <tr>
        <tr>
            <td>Đã bán</td>
            <td><input type="number" name="quantity_sold" id="quantity_sold" required value="${productss.quantity_sold}></td>
        <tr>
            <br><br>
            <button type="submit" class="btn btn-primary">Sửa</button>
        </tr>
    </table>


</form>

</body>
<script>
    let x=${product.idCategory};
    let category = document.querySelectorAll('.nameCategory');
    for (let i = 0; i < category.length; i++) {
        let value1= category[i].getAttribute('value')
        if (value1==x){
            category[i].setAttribute('selected',true)
        }

    }
</script>
</html>