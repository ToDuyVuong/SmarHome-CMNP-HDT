<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">


    <title>Chi tiết sản phẩm</title>
    <%@include file="/common/web/header.jsp" %>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">

    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>

    <script
            src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


    <link rel="stylesheet" href="<c:url value="/css/productdetail.css"/>">

</head>

<body>
<br>
<br>
<br>
<section>
    <div class="container">
        <div class="card">
            <div class="container-fliud">
                <div class="wrapper row">
                    <div class="preview col-md-6">

                        <div class="preview-pic tab-content">


                            <div class="tab-pane active" id="pic-1">

                                <%--                                <img src="http://placekitten.com/400/252"/>--%>

                                <img src="${product.image}"
                                     alt="Hình ảnh sản phẩm" title="" width="300"
                                     height="300">


                            </div>


                        </div>


                    </div>
                    <div class="details col-md-6">
                        <h3 class="product-title">${product.name}</h3>
                        <div class="rating">
                            <div class="stars">
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                                <span class="fa fa-star checked"></span>
                            </div>
                            <%--                        <span class="review-no">41 reviews</span>--%>
                        </div>
                        <p class="product-description">${product.description}</p>

                        <h5 class="price">Giá sản phẩm: <span>${product.price} VNĐ</span></h5>
                        <%--                    <p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>--%>
                        <h5 >Còn lại:
                            <span class="size" data-toggle="tooltip" title="small">${product.quantity}</span> Sản
                            phẩm
                        </h5>
                        <h5>Đã bán: ${product.sold}</h5>
                        <h5>Số lượng chọn mua:
                            <span>1</span>
                        </h5>
                        <br>
                        <br>







                        <div class="action">
                            <div class="col">
                                <c:choose>
                                    <c:when test="${product.quantity > 0}">
                                        <a href="<c:if test='${not empty sessionScope.id}'>/cart/add/${product.productId}</c:if><c:if test='${empty sessionScope.id}'>/login</c:if>"
                                           class="btn btn-success btn-block">Thêm giỏ hàng</a>
                                    </c:when>
                                    <c:otherwise>
                                        <button disabled class="btn btn-danger btn-block">Hết hàng</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <br>
                            <div class="col">
                                <a href="/product" class="btn btn-default btn-block" style="background: #80ea6e">Sản phẩm khác</a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


</body>
</html>