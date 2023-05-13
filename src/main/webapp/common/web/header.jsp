<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>

    <!-- Site meta -->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%--    <title>TNP2</title>--%>

    <%--Logo trên tab--%>
    <link rel="shortcut icon"
          href="https://img.freepik.com/free-vector/gradient-go-logo-template_23-2148964380.jpg?w=826&t=st=1680178760~exp=1680179360~hmac=8e2917c920ef0dda095760f665290c5fc674ecb547826f5d5aff2db75d7fb9b2"
          type="image/x-icon">

    <!-- CSS -->
    <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            rel="stylesheet" type="text/css">
    <link
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600"
            rel="stylesheet" type="text/css">
    <link href="css/style.css" rel="stylesheet" type="text/css">

    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>


    <style>
        .popover-body {
            max-width: 200px;
        }
    </style>


</head>


<body>
<nav class="navbar navbar-expand-md navbar navbar-light fixed-top" style="background-color: #80ea6e;">
    <div class="container">
        <a class="navbar-brand" href="/">Smart Home Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarsExampleDefault"
                aria-controls="navbarsExampleDefault" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end"
             id="navbarsExampleDefault">
            <ul class="navbar-nav m-auto">
                <li class="nav-item active"><a class="nav-link" href=/home>Trang
                    Chủ<span class="sr-only">(current)</span>
                </a></li>
                <li class="nav-item"><a class="nav-link" href="/product">Sản
                    Phẩm</a></li>

                <c:if test="${not empty sessionScope.id}">
                    <li class="nav-item"><a class="nav-link" href="/profile">Xin Chào:
                        <c:if test="${not empty sessionScope.id}">

                            <%=session.getAttribute("fullname")%>
                        </c:if>
                    </a></li>
                </c:if>


            </ul>


            <form method="GET" action="/product/search/${txt}" class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" id="txt" value="" class="form-control"
                           placeholder="Tìm Kiếm" name="keyword"/>
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>


            <div class="btn-group">
                <button type="button" class="btn btn-sm ml-3" id="dropdownButton">
                    <i style='font-size:24px' class='far'>&#xf2bd;</i>
                </button>
                <div class="dropdown-menu" id="dropdownMenu">

                    <ul>
                        <c:if test="${not empty sessionScope.id}">
                            <li style='font-size:21px'><a href="/profile" style='color: blue;'><i class='far' >&#xf2bd;</i> Cá nhân</a></li>
                            <li style='font-size:21px'><a href="/cart" style='color: green;'><i class="fa" >&#xf07a;</i> Giỏ hàng</a></li>
                            <li style='font-size:21px'><a href="/logout" style='color: red;'><i class="fas fa-sign-out-alt" ></i> Đăng xuất</a></li>
                        </c:if>
                        <c:if test="${empty sessionScope.id}">
                            <li style='font-size:20px' ><a href="/login"  style='color: orange;'><i class="fas fa-sign-in-alt" ></i> Đăng nhập</a></li>
                        </c:if>
                    </ul>

<%--                    <ul>--%>
<%--                        <c:if test="${not empty sessionScope.id}">--%>
<%--                            <li  style='font-size:21px'><a href="/profile"><i class='far'>&#xf2bd;</i> Cá nhân</a></li>--%>
<%--                            <li style='font-size:21px'><a href="/cart"><i class="fa">&#xf07a;</i> Giỏ hàng</a></li>--%>
<%--                            <li style='font-size:21px'><a href="/logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>--%>
<%--                        </c:if>--%>
<%--                        <c:if test="${empty sessionScope.id}">--%>
<%--                            <li style='font-size:21px'><a href="/login"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a></li>--%>
<%--                        </c:if>--%>
<%--                    </ul>--%>
<%--                    <ul>--%>


<%--                        <c:if test="${not empty sessionScope.id}">--%>
<%--                            <li style='font-size:20px'><a href="/profile">--%>
<%--                                <i class='far'>&#xf2bd;</i>--%>
<%--                                Cá nhân</a></li>--%>
<%--                            <li style='font-size:20px'><a href="/cart">--%>
<%--                                <i class="fa">&#xf07a;</i>--%>
<%--                                Giỏ hàng</a></li>--%>
<%--                            <li style='font-size:20px'><a href="/logout"><i class="fas fa-sign-out-alt"></i>--%>
<%--                                Đăng xuất</a></li>--%>

<%--                        </c:if>--%>
<%--                        <c:if test="${empty sessionScope.id}">--%>
<%--                            <li style='font-size:20px'><a href="/login"><i class="fas fa-sign-in-alt"></i> Đăng nhập</a>--%>
<%--                            </li>--%>
<%--                        </c:if>--%>
<%--                    </ul>--%>
                </div>
            </div>


        </div>
    </div>
</nav>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        var dropdownButton = $("#dropdownButton");
        var dropdownMenu = $("#dropdownMenu");

        dropdownButton.mouseenter(function () {
            dropdownMenu.show();
        });

        dropdownButton.mouseleave(function () {
            dropdownMenu.hide();
        });

        dropdownMenu.mouseenter(function () {
            dropdownMenu.show();
        });

        dropdownMenu.mouseleave(function () {
            dropdownMenu.hide();
        });
    });
</script>
</body>
