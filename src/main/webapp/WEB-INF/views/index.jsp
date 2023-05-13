<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%--    <%@include file="/common/web/header.jsp" %>--%>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>


<%@include file="/common/web/header.jsp" %>
<br>
<br>
<br>


<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Smart Home Shop</h1>
        <p class="lead text-muted mb-0"></p>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col">

            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <c:forEach items="${products}" var="product" varStatus="status">
                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                            <img src="${product.image}" alt="Hình ảnh sản phẩm" title="">
                        </div>
                    </c:forEach>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

        </div>


        <div class="col-12 col-md-3">
            <div class="card">
                <div class="card-header bg-success text-white text-uppercase">
                    <i class="fa fa-heart"></i> Sản phẩm hàng đầu
                </div>
                <img src="${bestproduct.image}"
                     alt="Hình ảnh sản phẩm" title="" width="250"
                     height="150" class="mx-auto" style="margin-top: 10px;">
                <div class="card-body">
                    <h4 class="card-title"><a href="/product/detail/${bestproduct.productId}"
                                              title="View Product">${bestproduct.name}</a>
                    </h4>
                    <div class="row">
                        <div class="col">
                            <p class="bloc_left_price">Giá bán: ${bestproduct.price} VNĐ</p>
                        </div>
                        <div class="col">
                            <c:choose>
                                <c:when test="${bestproduct.quantity > 0}">
                                    <a href="<c:if test='${not empty sessionScope.id}'>
                                                    /cart/add/${bestproduct.productId}</c:if>
                                                          <c:if test='${empty sessionScope.id}'>
                                                              /login</c:if>"
                                       class="btn btn-success btn-block">Thêm giỏ hàng</a>
                                </c:when>
                                <c:otherwise>
                                    <button disabled class="btn btn-danger btn-block">Hết hàng
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container mt-3">
    <div class="row">
        <div class="col-sm">
            <div class="card">
                <div class="card-header bg-primary text-white text-uppercase">
                    <i class="fa fa-star"></i> Sản phẩm mới
                </div>
                <div class="card-body">
                    <div class="row">


                        <c:forEach items="${products}" var="product">
                            <div class="col-sm">
                                <div class="card">
                                    <img src="${product.image}"
                                         alt="Hình ảnh sản phẩm" title="" width="180"
                                         height="150" class="mx-auto" style="margin-top: 10px;">
                                    <div class="card-body">

                                        <h4 class="card-title"><a href="/product/detail/${product.productId}"
                                                                  title="${product.name}">${product.name.substring(0, 15)}</a>
                                        </h4>
                                        <p class="card-text"
                                           id="description-${product.productId}">${product.description}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="bloc_left_price">Giá bán: ${product.price} VNĐ</p>
                                            </div>
                                            <div class="col">
                                                <c:choose>
                                                    <c:when test="${product.quantity > 0}">
                                                        <a href="<c:if test='${not empty sessionScope.id}'>
                                                    /cart/add/${product.productId}</c:if>
                                                          <c:if test='${empty sessionScope.id}'>
                                                              /login</c:if>"
                                                           class="btn btn-success btn-block">Thêm giỏ hàng</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button disabled class="btn btn-danger btn-block">Hết hàng
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script>
                                var text = document.getElementById("description-${product.productId}").innerHTML;
                                var maxLength = 100;
                                var trimmedString = text.substr(0, maxLength);
                                trimmedString = trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")))
                                document.getElementById("description-${product.productId}").innerHTML = trimmedString + "...";
                            </script>

                        </c:forEach>


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="container mt-3 mb-4">
    <div class="row">
        <div class="col-sm">
            <div class="card">
                <div class="card-header bg-primary text-white text-uppercase">
                    <i class="fa fa-trophy"></i> Sản phẩm bán chạy
                </div>
                <div class="card-body">
                    <div class="row">


                        <c:forEach items="${topproducts}" var="product">
                            <div class="col-sm">
                                <div class="card">
                                    <img src="${product.image}"
                                         alt="Hình ảnh sản phẩm" title="" width="150"
                                         height="150" class="mx-auto" style="margin-top: 10px;">
                                    <div class="card-body">

                                        <h4 class="card-title"><a href="/product/detail/${product.productId}"
                                                                  title="${product.name}">${product.name.substring(0, 15)}</a>
                                        </h4>

                                        <p class="card-text"
                                           id="description-${product.productId}-best">${product.description}</p>

                                        <div class="row">
                                            <div class="col">
                                                <p class="bloc_left_price">Giá bán: ${product.price} VNĐ</p>
                                            </div>
                                            <div class="col">
                                                <c:choose>
                                                    <c:when test="${product.quantity > 0}">
                                                        <a href="<c:if test='${not empty sessionScope.id}'>
                                                    /cart/add/${product.productId}</c:if>
                                                          <c:if test='${empty sessionScope.id}'>
                                                              /login</c:if>"
                                                           class="btn btn-success btn-block">Thêm giỏ hàng</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button disabled class="btn btn-danger btn-block">Hết hàng
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script>
                                var text = document.getElementById("description-${product.productId}-best").innerHTML;
                                var maxLength = 100;
                                var trimmedString = text.substr(0, maxLength);
                                trimmedString = trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")))
                                document.getElementById("description-${product.productId}-best").innerHTML = trimmedString + "...";
                            </script>

                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>


</body>
<%@include file="/common/web/footer.jsp" %>

</html>