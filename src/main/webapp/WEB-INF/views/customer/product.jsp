<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/common/web/header.jsp" %>


    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sản phẩm</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<br>
<br>
<br>

<section>
    <div class="container">
        <div class="row">
            <div class="col">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/category">Category</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Product</li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-3">


                <%-- List category dùng foreach                --%>
                <div class="card bg-light mb-3">

                    <div class="card-header bg-primary text-white">
                        <i class="fa fa-list"></i> Loại sản phẩm
                    </div>
                    <c:forEach items="${categories}" var="category">
                        <form action="/category/${category.categoryId}" method="get">
                            <a href="/category/${category.categoryId}">
                                <option value="${category.categoryId}">${category.name}</option>
                            </a>
                        </form>
                    </c:forEach>
                </div>

            </div>


            <div class="col">
                <div class="row">

                    <div class="col">
                        <div class="row mt-4">
                            <c:forEach items="${products}" var="product">

<%--                                <div class="col-12 col-md-6 col-lg-4">--%>
                                <div class="col-12 col-md-6 col-lg-4 mb-4">
                                    <div class="card">

                                        <img src="${product.image}"
                                             alt="Hình ảnh sản phẩm" title="" width="250"
                                             height="150" class="mx-auto" style="margin-top: 10px;">


                                        <div class="card-body">

                                            <h4 class="card-title"><a href="/product/detail/${product.productId}"
                                                                      title="${product.name}">${product.name.substring(0, 20)}</a>
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


                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <c:forEach begin="1" end="${totalPages}" var="page">
                                <li class="page-item ${currentPage == page ? 'active' : ''}">
                                    <a class="page-link" href="?page=${page}">${page}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

    </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
</script>


</body>
</html>
