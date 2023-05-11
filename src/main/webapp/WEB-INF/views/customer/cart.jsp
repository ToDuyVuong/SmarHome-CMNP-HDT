<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/common/web/header.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/cart.css"/>">

    <title>Giỏ hàng</title>

    <meta name=" viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


</head>
<body class="h-100 gradient-custom">
<br>
<br>

<section>
    <div class="container px-3 my-5 clearfix">


        <div class="card">
            <div class="card-header">
            </div>
            <div class="row p-2 mt-3 justify-content-between mx-sm-2">

                <div class="row justify-content-start ">
                    <div class="col">
                        <h1 class="text-center"
                            style="font-family: Arial, sans-serif; font-weight: bold; font-size: 44px; color: #51d070;">
                            Giỏ Hàng</h1>
                    </div>
                </div>
                <div>
                    <!-- Hiển thông báo -->
                    <c:if test="${messageCart != null}">
                        <div class="alert alert-primary text-center" role="alert">
                            <i>${messageCart}</i>
                        </div>
                    </c:if>
                </div>

                <div class="col">
                    <%-- Lấy ngày giờ hiện tại --%>
                    <% java.util.Date currentDateTime = new java.util.Date(); %>
                    <%-- Định dạng ngày tháng năm --%>
                    <% java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
                    <% String formattedDate = dateFormat.format(currentDateTime); %>
                    <%-- Định dạng giờ phút giây --%>
                    <% java.text.SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("HH'h'mm''"); %>
                    <% String formattedTime = timeFormat.format(currentDateTime); %>
                    <%-- <h1>Thời gian hiện tại: <%= formattedTime %> - <%= formattedDate %></h1>--%>

                    <p class="text-muted space mb-0 shop">Smart Home Shop</p>
                    <p class="text-muted space mb-0 shop">Mã giỏ hàng: ${cart.cartId}</p>
                    <p class="text-muted space mb-0 shop">Khách hàng: ${cart.customer.fullname}</p>
                    <p class="text-muted space mb-0 shop">Thời gian: <%= formattedTime %> - <%= formattedDate %>
                    </p>


                </div>
                <div class="col text-right">
                    <a href="http://localhost:8080/"
                       class="btn btn-outline-primary btn-sm">
                        <i class="fa fa-shopping-cart"></i> Tiếp tục mua
                    </a>
                </div>
            </div>


            <form method="post" action="order">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered m-0">
                            <thead>
                            <tr>
                                <th>
                                    <div class="form-check d-flex align-items-center justify-content-center">
                                        <input type="checkbox" class="form-check-input select-all-products"
                                               id="select-all-products">
                                    </div>
                                </th>
                                <th class="text-center py-3 px-4" style="width: 180px;">Hình ảnh</th>
                                <th class="text-center py-3 px-4" style="min-width: 400px;">Tên Sản Phẩm &amp; Mô tả</th>
                                <th class="text-center py-3 px-4" style="width: 130px;">Số lượng</th>
                                <th class="text-center text-right py-3 px-4" style="width: 120px;">Đơn Giá</th>
                                <th class="text-center text-right py-3 px-4" style="width: 120px;">Số Tiền</th>
                                <th class="text-center align-middle py-3 px-0" style="width: 50px;">Xóa</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${cartItems}">
                                <tr>
                                    <td>
                                        <div class="form-check d-flex align-items-center justify-content-center">
                                            <input type="checkbox" class="form-check-input select-product"
                                                   data-price="${item.products.price}"
                                                   data-id="${item.products.productId}" value="${item.cartItemId}"
                                                   id="checkProductToCart" name="${item.cartItemId}">
                                        </div>
                                    </td>
                                    <td class="hidden-xs text-center">
                                        <a href="#productdetail">

                                            <img src="${item.products.image}"
                                                 alt="Hình ảnh sản phẩm"title="" width="150"
                                                 height="150">
<%--                                                                                            <img src="https://www.bootdey.com/image/200x200/"--%>
<%--                                                                                                 alt="Age Of Wisdom Tan Graphic Tee" title="" width="150"--%>
<%--                                                                                                 height="150">--%>
                                        </a>
                                    </td>
                                    <td id="description-${item.products.productId}"><b>${item.products.name}</b> <br >
                                        Thông tin sản phẩm: ${item.products.description}</td>
                                    <td>
                                        <div class="quantity d-flex justify-content-center align-items-center text-center">
                                            <div class="input-group align-self-center">
                                                <div class="input-group-prepend">
                                                    <a class="btn btn-outline-secondary"
                                                       href="/cart/minus/${item.products.productId}">-</a>
                                                </div>
                                                <span class="form-control text-center quantity-input"
                                                      data-id="${item.products.productId}"
                                                      data-price="${item.products.price}">${item.quantity}
                                                </span>
                                                <div class="input-group-append">
                                                    <a class="btn btn-outline-secondary"
                                                       href="/cart/add/${item.products.productId}">+</a>
                                                </div>
                                            </div>
                                        </div>
                                    </td>

                                    <td class="text-right">${item.products.price } VNĐ</td>
                                    <td class="text-right">${item.products.price * item.quantity} VNĐ</td>
                                    <td class="text-center">
                                        <a href="/cart/remove/${item.cartItemId}"
                                           class="shop-tooltip close float-none text-danger " title=""
                                           data-original-title="Remove">×</a>
                                    </td>
                                </tr>



                                <script>
                                    var text = document.getElementById("description-${item.products.productId}").innerHTML;
                                    var maxLength = 250;
                                    var trimmedString = text.substr(0, maxLength);
                                    trimmedString = trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")))
                                    document.getElementById("description-${item.products.productId}").innerHTML = trimmedString + "...";
                                </script>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <!-- / Shopping cart table -->
                    <br>
                    <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">

                        <div class="container">
                            <div class="row">
                                <div class="col-md-8">
                                    <!-- Các phần khác của trang nằm bên trái -->
                                </div>
                                <div class="col-md-4">
                                    <!-- Bảng nằm bên phải -->
                                    <div class="card mb-4">
                                        <div class="card-header py-3">
                                            <h5 class="mb-0">Tóm tắt đơn</h5>
                                        </div>
                                        <div class="card-body">
                                            <ul class="list-group list-group-flush">
                                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                                    Tổng số sản phẩm
                                                    <span id="sum-item-cart"></span>
                                                </li>
<%--                                                <li class="list-group-item d-flex justify-content-between align-items-center px-0">--%>
<%--                                                    Vận chuyển--%>
<%--                                                    <span>Miễn phí</span>--%>
<%--                                                </li>--%>
                                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                                    <div>
                                                        <strong>Tổng đơn</strong>
                                                    </div>
                                                    <span><strong id="total-price" value="${totalPrice}"></strong></span>
                                                </li>
                                            </ul>
                                            <div class="d-flex justify-content-center">
                                                <button type="submit" class="btn btn-lg btn-primary mt-2">Thanh toán
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>


        </div>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">

</script>

<script>
    // khai bao cac bien
    let selectProductCheckboxes = document.querySelectorAll('.select-product');
    let quantityInputs = document.querySelectorAll('.quantity-input');
    // Class sẻ nhận giá trị trả về
    let totalSpan = document.querySelector('#total-price');
    let sumItemCart = document.querySelector('#sum-item-cart');
    let selectAllCheckbox = document.getElementById("select-all-products");
    // Phần tính toán tổng đơn và tổng số sản phẩm
    function updateTotal() {
        let total = 0;
        let sumItem = 0;
        for (let i = 0; i < selectProductCheckboxes.length; i++) {
            if (selectProductCheckboxes[i].checked) {
                let productId = selectProductCheckboxes[i].getAttribute('data-id');
                let price = selectProductCheckboxes[i].getAttribute('data-price');
                let quantityInput = document.querySelector('.quantity-input[data-id="' + productId + '"]');
                let quantity = quantityInput.textContent;
                let itemTotal = price * quantity;
                total += itemTotal;
                sumItem += parseInt(quantity);
            }
        }
        if (document.querySelectorAll('.select-product:not(:checked)').length > 0) {
            selectAllCheckbox.checked = false;
        }
        sumItemCart.textContent = sumItem;

        totalSpan.textContent = +total + ' VNĐ';
    }

    for (let i = 0; i < selectProductCheckboxes.length; i++) {
        selectProductCheckboxes[i].addEventListener('change', updateTotal);
    }

    for (let i = 0; i < quantityInputs.length; i++) {
        quantityInputs[i].addEventListener('change', updateTotal);
    }

    updateTotal();

    selectAllCheckbox.addEventListener("click", function () {
        selectProductCheckboxes.forEach(function (checkbox) {
            checkbox.checked = selectAllCheckbox.checked;
        });

        updateTotal();
    });
</script>


</body>
</html>