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
    <title>Dash Board</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    <style>
        tr,th,td,table{
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        table{
            width: 1000px;
            margin: auto;
            /*position: absolute;*/
            /*left: 50%;*/
            /*transform: translateX(-50%);*/
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
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }
        .table-responsive {
            margin: 30px 0;
        }
        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            border-radius: 3px;
            min-width: 1000px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #fff;
            padding: 16px 30px;
            min-width: 100%;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-title .btn-group {
            float: right;
        }
        .table-title .btn {
            color: #fff;
            float: right;
            font-size: 13px;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }
        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }
        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }
        table.table tr th:first-child {
            width: 60px;
        }
        table.table tr th:last-child {
            width: 100px;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }
        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }
        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
            outline: none !important;
        }
        table.table td a:hover {
            color: #2196F3;
        }
        table.table td a.edit {
            color: #FFC107;
        }
        table.table td a.delete {
            color: #F44336;
        }
        table.table td i {
            font-size: 19px;
        }
        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }
        .pagination {
            float: right;
            margin: 0 0 5px;
        }
        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }
        .pagination li a:hover {
            color: #666;
        }
        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }
        .pagination li.active a:hover {
            background: #0397d6;
        }
        .pagination li.disabled i {
            color: #ccc;
        }
        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }
        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }
        /* Custom checkbox */
        .custom-checkbox {
            position: relative;
        }
        .custom-checkbox input[type="checkbox"] {
            opacity: 0;
            position: absolute;
            margin: 5px 0 0 3px;
            z-index: 9;
        }
        .custom-checkbox label:before{
            width: 18px;
            height: 18px;
        }
        .custom-checkbox label:before {
            content: '';
            margin-right: 10px;
            display: inline-block;
            vertical-align: text-top;
            background: white;
            border: 1px solid #bbb;
            border-radius: 2px;
            box-sizing: border-box;
            z-index: 2;
        }
        .custom-checkbox input[type="checkbox"]:checked + label:after {
            content: '';
            position: absolute;
            left: 6px;
            top: 3px;
            width: 6px;
            height: 11px;
            border: solid #000;
            border-width: 0 3px 3px 0;
            transform: inherit;
            z-index: 3;
            transform: rotateZ(45deg);
        }
        .custom-checkbox input[type="checkbox"]:checked + label:before {
            border-color: #03A9F4;
            background: #03A9F4;
        }
        .custom-checkbox input[type="checkbox"]:checked + label:after {
            border-color: #fff;
        }
        .custom-checkbox input[type="checkbox"]:disabled + label:before {
            color: #b8b8b8;
            cursor: auto;
            box-shadow: none;
            background: #ddd;
        }
        /* Modal styles */
        .modal .modal-dialog {
            max-width: 400px;
        }
        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }
        .modal .modal-content {
            border-radius: 3px;
            font-size: 14px;
        }
        .modal .modal-footer {
            background: #ecf0f1;
            border-radius: 0 0 3px 3px;
        }
        .modal .modal-title {
            display: inline-block;
        }
        .modal .form-control {
            border-radius: 2px;
            box-shadow: none;
            border-color: #dddddd;
        }
        .modal textarea.form-control {
            resize: vertical;
        }
        .modal .btn {
            border-radius: 2px;
            min-width: 100px;
        }
        .modal form label {
            font-weight: normal;
        }
    </style>
</head>
<tbody>
<div>
    <nav-bar>

    </nav-bar>
</div>
<div class="container-xl">
    <div class="table-responsive">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row"> <th colspan="5" class = col-sm-6> <h2>Danh sách <b>Loại Sản Phẩm</b></h2> </th>
                </div>
            </div>
<table class="table table-striped table-hover">
    <tr>
    <tr>

        <td  colspan="5" style="text-align: left " >
            <div class="hau">
                <form action="/admin?action=search" method="post" style="margin: 0">
                    <input type="search" placeholder="nhập tên sản phầm" name="key" class="search" required>
                    <button type="submit" class="btn btn-info">Tìm kiếm </button>
                </form>
            </div>
        </td>

    </tr>
    <th>Mã Loại SP</th>
    <th>Tên</th>
    <th>Số lượng</th>

    <th colspan="2">Hành động</th>
    </tr>
    <c:forEach var="categorie" items="${sessionScope.categories}">
        <tr>
            <td>${categorie.idCategory}</td>
            <td>${categorie.nameCategory}</td>
            <td>${categorie.productQuantity}</td>

            <td><a href="/admin?action=edit&id=${categorie.idCategory}" ><button type="button" class="btn btn-warning">Edit</button>
            </a>
            <a  href="/admin?action=delete&id=${categorie.idCategory}"  class="delete"  ><button type="button" class="btn btn-danger" >Delete</button>
            </a></td>
        </tr>
    </c:forEach>
</table>
        </div>
<%--    </div>--%>

<%--&lt;%&ndash;<a href="/admin?action=insert" methods="post">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <button type="button" class="btn btn-primary">Thêm loại sản phẩm</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;</a>&ndash;%&gt;--%>
<%--</div>--%>

<%--<div><form action="/admin?action=search" method="post" style="margin: 0">--%>
<%--    <input type="search" placeholder="nhập vào tên" name="key"  class="search">--%>
<%--    <button type="submit" class="btn btn-info">Search</button>--%>
<%--</form>--%>
<%--</div>--%>


    <div class="container-xl">
        <div class="table-responsive">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Danh Sách <b>Sản Phẩm</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="/admin?action=create" methods="post" class="btn btn-success" ><i class="material-icons">&#xE147;</i> <span>Thêm sản phẩm mới</span></a>
                            <a><form action="/admin?action=search" method="post" style="margin: 0">
                                <input type="search" placeholder="nhập vào tên" name="key1"  class="search">
                                <button type="submit" class="btn btn-info">Search</button>
                            </form>
                            </a>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
    <th>Mã SP</th>
    <th>Loại SP</th>
    <th>Tên SP</th>
    <th>Ảnh SP</th>
    <th>Giá</th>
    <th>Số Lượng SP</th>
    <th>Đã bán</th>
    <th colspan="2">Hành động</th>
    </tr>
                    </thead>
                    <tbody>
    <c:forEach var="p" items="${sessionScope.products}"
    >
        <tr>
            <td>${p.idProduct}</td>
            <td>${p.category.getNameCategory()}</td>
            <td>${p.nameProduct}</td>
            <td><img src="${p.imgURL}" alt="">   </td>
            <td>${p.price}</td>
            <td>${p.quantity}</td>
            <td>${p.quantity_sold}</td>
            <td><a href="/admin?action=edit&id=${p.idProduct}" class="edit" ><i class="material-icons"  title="Edit">&#xE254;</i></a>
            <a href="/admin?action=delete&id=${p.idProduct}" class="delete" ><i class="material-icons"  title="Delete">&#xE872;</i></a>
            </td>
        </tr>
    </c:forEach>
</table>
                <div class="clearfix">
                    <div class="hint-text">Hiển thị <b>5</b> out of <b>25</b> Sản phẩm</div>
                    <ul class="pagination">
                        <li class="page-item disabled"><a href="#">Previous</a></li>
                        <li class="page-item active"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">2</a></li>
                        <li class="page-item "><a href="#" class="page-link">3</a></li>
                        <li class="page-item"><a href="#" class="page-link">4</a></li>
                        <li class="page-item"><a href="#" class="page-link">5</a></li>
                        <li class="page-item"><a href="#" class="page-link">Next</a></li>
                    </ul>
    </div>
    </div>
</div>

<%--<a href="/admin?action=create">--%>
<%--    <button type="button" class="btn btn-primary">Create</button>--%>
<%--</a>--%>
</tbody>
</body>
</html>
