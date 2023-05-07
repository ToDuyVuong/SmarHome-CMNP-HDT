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
<%--                                <li class="nav-item"><a class="nav-link" href="/login">Đăng--%>
<%--                                    Nhập</a></li>--%>

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




            <div>
                <a class="btn btn-sm ml-3" <c:if test="${not empty sessionScope.id}">
                    href="/profile"
                </c:if>
                        <c:if test="${ empty sessionScope.id}">
                            href="/login"
                        </c:if>><i style='font-size:24px' class='far'>&#xf2bd;</i>
                </a>

                <a class="btn btn-sm ml-3"
                        <c:if test="${not empty sessionScope.id}">
                            href="/cart"
                        </c:if>
                        <c:if test="${ empty sessionScope.id}">
                            href="/login"
                        </c:if>> <i
                        class="fa fa-shopping-cart"></i><!--  Giỏ Hàng <span
						class="badge badge-light"></span> -->
                </a>
            </div>

<%--            <!-- logout -->--%>
<%--            <c:if test="${not empty sessionScope.id}">--%>
<%--                <div>--%>
<%--                    <a class="btn btn-success btn-sm ml-3" href="/logout"--%>
<%--                       role="button">Logout User <span class="badge badge-light"></span>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </c:if>--%>


            <%-- <!-- Session  -->
            <p>

                <li class="nav-item">Chào mừng
                <%=session.getAttribute("id")%>
                đến với trang web của chúng tôi!</li>
            </p>
--%>


        </div>
    </div>
</nav>

</body>
