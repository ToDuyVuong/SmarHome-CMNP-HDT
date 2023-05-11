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
    <title>Đơn hàng</title>


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


    <link rel="stylesheet" href="<c:url value="/css/checkout.css"/>">
    <link rel="javascript" src="<c:url value="/js/checkout.js"/>">

    <%--    <style>--%>
    <%--        .modal {--%>
    <%--            display: flex !important;--%>
    <%--            align-items: center;--%>
    <%--            justify-content: center;--%>
    <%--        }--%>

    <%--        .modal-dialog {--%>
    <%--            margin: 0;--%>
    <%--            position: relative;--%>
    <%--            top: auto;--%>
    <%--            left: auto;--%>
    <%--            transform: none !important;--%>
    <%--        }--%>
    <%--    </style>--%>


</head>


<body>

<br><br>
<section>
    <form method="post" action="checkout" id="order-form">


        <div class=" container-fluid my-5 ">
            <div class="row justify-content-center ">
                <div class="col-xl-10">
                    <div class="card shadow-lg ">
                        <div class="row p-2 mt-3 justify-content-between mx-sm-2">
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

                                <p class="text-muted space mb-0 shop">Shop TNP4</p>
                                <p class="text-muted space mb-0 shop">Mã giỏ hàng: ${customer.customerId}</p>
                                <p class="text-muted space mb-0 shop">Khách hàng: ${customer.fullname}</p>
                                <p class="text-muted space mb-0 shop">Thời gian: <%= formattedTime %>
                                    - <%= formattedDate %>
                                </p>
                            </div>
                            <div class="col">
                                <div class="row justify-content-start ">
                                    <div class="col">
                                        <img class="irc_mi img-fluid cursor-pointer "
                                             src="https://i.imgur.com/jFQo2lD.png"
                                             width="70" height="70">
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <img class="irc_mi img-fluid bell" src="https://i.imgur.com/uSHMClk.jpg" width="30"
                                     height="30">
                            </div>
                        </div>
                        <div class="row  mx-auto justify-content-center text-center">
                            <div class="col-12 mt-3 ">

                                <nav aria-label="breadcrumb" class="second ">
                                    <ol class="breadcrumb indigo lighten-6 first  ">
                                        <li class="breadcrumb-item font-weight-bold "><a
                                                class="black-text text-uppercase "
                                                href="/"><span class="mr-md-3 mr-1">Quay lại cửa hàng</span></a><i
                                                class="fa fa-angle-double-right " aria-hidden="true"></i></li>
                                        <li class="breadcrumb-item font-weight-bold"><a
                                                class="black-text text-uppercase"
                                                href="/cart"><span class="mr-md-3 mr-1">Về giỏ hàng</span></a>
                                        </li>
                                    </ol>
                                </nav>
                            </div>
                        </div>

                        <div class="row justify-content-around">
                            <div class="row justify-content-start ">
                                <div class="col">
                                    <h1 class="text-center"><b
                                            style="font-family: Arial, sans-serif; font-weight: bold; font-size: 44px; color: #51d070;">
                                        Đơn Hàng</b></h1>

                                </div>
                            </div>


                            <div class="col-md-5">
                                <div class="card border-0">
                                    <div class="card-body">
                                        <div class="row justify-content-between">
                                            <div class="col-auto mt-0"><p><b>Cửa hàng:</b></p></div>
                                            <div class="col-auto"><p><b>Smart Home Shop</b></p></div>
                                        </div>
                                        <hr class="mt-0">
                                        <div class="row justify-content-between">
                                            <div class="col-auto mt-0"><p><b>Email cửa hàng:</b></p></div>
                                            <div class="col-auto"><p><b>smarthomeshop@gmail.com</b></p></div>
                                        </div>
                                        <hr class="mt-0">
                                        <div class="row mt-4">
                                            <div class="col"><p class="text-center"><b
                                                    style="font-family: Arial, sans-serif; font-weight: bold; font-size: 25px; color: #17c4be;">
                                                Thông tin nhận hàng</b></p>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label for="username" id="username">Tài khoản: <sup class="text-danger">*</sup></label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <p class="text-muted mb-0 flex-fill"><c:out
                                                        value="${customer.username}"/></p>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label for="fullname" id="fullname">Họ và tên: <sup class="text-danger">*</sup></label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <p class="text-muted mb-0 flex-fill"><c:out
                                                        value="${customer.fullname}"/></p>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label for="email" id="email">Email: <sup
                                                        class="text-danger">*</sup></label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <p class="text-muted mb-0 flex-fill"><c:out
                                                        value="${customer.email}"/></p>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label for="phone">Số điện thoại: <sup
                                                        class="text-danger">*</sup></label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <input class="form-control" id="phone" type="tel"
                                                       value="${customer.phone}"
                                                       name="phone">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label for="address">Địa chỉ: <sup class="text-danger">*</sup></label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <input class="form-control" type="text" value="${customer.address}"
                                                       id="address"
                                                       name="address" aria-describedby="address">
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label for="date" id="date">Ngày mua: <sup
                                                        class="text-danger">*</sup></label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <p class="text-muted mb-0 flex-fill"><%= formattedDate %>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row mb-md-5">
                                            <div class="col">
                                                <a href="<c:url value="/profile/editProfile"/>"
                                                   class="btn btn-block btn-outline-primary-active btn-lg"
                                                   style="font-family: Arial, sans-serif; font-weight: bold;"><i
                                                        class="fas fas-bars"></i>Chỉnh sửa thông tin cá nhân</a>
                                            </div>
                                        </div>

                                        <hr class="mt-0">

                                        <div>

                                            <div class="row mt-4">
                                                <div class="col"><p><b
                                                        style="font-family: Arial, sans-serif; font-weight: bold; font-size: 25px; color: #17c4be;">
                                                    Vận chuyển</b></p>
                                                </div>
                                            </div>
                                            <form>

                                                <div class="form-group row justify-content-between">
                                                    <label for="shipping-method" class="col-auto col-form-label"><b>
                                                        Hình thức vận chuyển:</b></label>
                                                    <div class="col-auto">
                                                        <select class="form-control" id="shipping-method"
                                                                name="shipping-method" <%--disabled--%>>
                                                            <option value="basic">Cơ bản</option>
                                                            <option value="fast">Giao hàng nhanh</option>
                                                            <option value="express">Hỏa tốc</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group row justify-content-between">
                                                    <label for="shipping-method" class="col-auto col-form-label">
                                                        <b>Phí vận chuyển:</b></label>
                                                    <div class="flex-sm-col col-auto"><b><p class="mb-1"
                                                                                            id="shipping-fee"></p>
                                                    </b>
                                                    </div>
                                                </div>
                                            </form>


                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-5">
                                <div class="card border-0 ">
                                    <div class="card-header card-2">
                                        <p class="card-text text-muted mt-md-4  mb-2 space text-center"><b
                                                style="font-family: Arial, sans-serif; font-weight: bold; font-size: 25px; color: #17c4be;">Danh
                                            sách đơn hàng</b>
                                        </p>
                                        <hr class="my-2">
                                    </div>
                                    <div class="card-body pt-0">
                                        <c:forEach var="item" items="${cartItemOrder}">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input"
                                                       style="display:none;" value="${item.cartItemId}"
                                                       id="checkProductToCart" name="${item.cartItemId}" checked>
                                            </div>
                                            <div class="row  justify-content-between">
                                                <div class="col-auto col-md-7">
                                                    <div class="media flex-column flex-sm-row">

                                                        <img src="${item.products.image}"
                                                             alt="Hình ảnh sản phẩm" title="" width="150"
                                                             height="150">

                                                        <div class="media-body  my-auto">
                                                            <div class="row ">
                                                                <div class="col-auto"><p class="mb-0">
                                                                    <b >${item.products.name.substring(0, 20)}</b></p>
                                                                    <small class="text-muted"
                                                                           id="description-${item.products.productId}">
                                                                            ${item.products.description}</small>



                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class=" pl-0 flex-sm-col col-auto  my-auto"><p
                                                        class="boxed-1">${item.quantity}</p></div>
                                                <div class=" pl-0 flex-sm-col col-auto  my-auto "><p>
                                                    <b>${item.quantity * item.products.price} VNĐ</b></p></div>
                                            </div>



                                            <script>
                                                var text = document.getElementById("description-${item.products.productId}").innerHTML;
                                                var maxLength = 100;
                                                var trimmedString = text.substr(0, maxLength);
                                                trimmedString = trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")))
                                                document.getElementById("description-${item.products.productId}").innerHTML = trimmedString + "...";
                                            </script>
                                            <hr class="my-2">
                                        </c:forEach>
                                        <div>
                                            <div class="row ">
                                                <div class="col">
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1"><b>Tổng sản phẩm:</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1">
                                                            <b id="quantity-order"
                                                               name="quantity-order">${ quantity}</b><b>
                                                            sản
                                                            phẩm</b></p>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1"><b>Tổng tiền hàng:</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1"><b
                                                                id="total-order"
                                                                class="total-order">${total} </b><b>VNĐ</b>
                                                        </p>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1 tex"><b>Thuế VAT 10%:</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1">
                                                            <b>${Math.floor(total * 0.1)} VNĐ</b></p></div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1 text-danger"><b>Khuyển
                                                            mãi:</b>
                                                        </p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1 text-danger">
                                                            <b>
                                                                - ${Math.floor(total * 0.1)} VNĐ</b></p></div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col"><p class="mb-1"><b>Phí vận chuyển:</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><b><p
                                                                class="mb-1 shipping-fee-2"
                                                                id="shipping-fee-2"></p></b>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1  text-danger"><b>Tổng thanh
                                                            toán:</b>
                                                        </p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1  text-danger ">
                                                            <b id="total-price" value="total-price">
                                                            </b><b> VNĐ</b></p>
                                                        </div>
                                                    </div>
                                                    <hr class="my-0">
                                                </div>
                                            </div>

                                            <div class="row mb-5 mt-4">
                                                <div>
                                                    <div class="row mt-4">
                                                        <div class="col">
                                                            <p>
                                                                <b style="font-family: Arial, sans-serif; font-weight: bold; font-size: 25px; color: #17c4be;">Thanh
                                                                    toán</b>
                                                            </p>
                                                        </div>
                                                    </div>

                                                    <div class="form-group row justify-content-between">
                                                        <label for="shipping-method" class="col-auto col-form-label"><b>Hình
                                                            thức thanh toán:</b></label>
                                                        <div class="col-auto">
                                                            <select class="form-control" name="payment-method"
                                                                    id="payment-method" disabled>
                                                                <option value="pay">Thanh toán trực tiếp khi nhận hàng
                                                                </option>
                                                                <option value="credit-card" disabled>Thẻ tín dụng
                                                                </option>
                                                                <option value="bank-transfer" disabled>Chuyển khoản ngân
                                                                    hàng
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <hr class="mt-0">

                                                    <div class="row mb-5 mt-4">
                                                        <div class="col-sm-3">
                                                            <label for="note">Ghi chú: </label>
                                                        </div>
                                                        <div class="col-sm-9 d-flex">
                                                            <input class="form-control" type="text" value="" id="note"
                                                                   name="note" aria-describedby="note">
                                                        </div>
                                                    </div>
                                                </div>


                                                <button type="button"
                                                        class="btn btn-block btn-outline-primary-active btn-lg"
                                                        style="font-family: Arial, sans-serif; font-weight: bold;"
                                                        onclick="confirmSubmit();">
                                                    Thanh toán đơn
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                    <%--                            </form>--%>
                                </div>
                            </div>

                            <div style="background: #4bb8a9; border: 2px solid #28a745;">


                                <!-- Modal xác nhận -->
                                <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
                                     aria-labelledby="confirmModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmModalLabel">Xác nhận thanh toán!</h5>
                                                <button type="button" class="close" onclick="closedForm();"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                Bạn có chắc chắn muốn thanh toán đơn hàng này không?
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" onclick="closedForm();">
                                                    Đóng
                                                </button>

                                                <button type="button" class="btn btn-primary" onclick="submitForm();"
                                                        style="font-family: Arial, sans-serif; font-weight: bold; background-color: #28a745;"
                                                >Thanh toán
                                                </button>
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


<input type="hidden" id="total-value" name="total" value="">
<script>
    let totalPriceElem = document.getElementById('total-price');
    let shippingMethodElem = document.getElementById('shipping-method');
    let shippingFeeElem = document.getElementById('shipping-fee');
    let shippingFeeElem2 = document.getElementById('shipping-fee-2');
    let totalValueElem = document.getElementById('total-value');
    let totalOrder = parseInt(document.getElementById("total-order").textContent);
    let basicShippingFee = 20000
    let fastShippingFee = 30000;
    let expressShippingFee = 50000;

    function updateTotalPrice() {
        let shippingFee = basicShippingFee;
        if (shippingMethodElem.value === 'fast') {
            shippingFee = fastShippingFee;
        } else if (shippingMethodElem.value === 'express') {
            shippingFee = expressShippingFee;
        }
        // Cập nhật phí vận chuyển vào HTML

        if (totalOrder > 300000 && shippingMethodElem.value === 'basic') {
            shippingFee = 0;
        }
        let total = parseInt(totalOrder) + parseInt(shippingFee);
        totalPriceElem.innerHTML = total;
        totalValueElem.value = total;

        shippingFeeElem.innerHTML = shippingFee + ` VNĐ`;
        shippingFeeElem2.innerHTML = shippingFee + ` VNĐ`;


    }

    shippingMethodElem.addEventListener('change', updateTotalPrice);


    shippingFeeElem.innerHTML = basicShippingFee + ` VNĐ`;

    updateTotalPrice();


</script>


<script>


    function confirmSubmit() {
        $('#confirmModal').modal('show');
    }

    function submitForm() {
        $('#confirmModal').modal('hide');
        $('form').submit();
    }

    function closedForm() {
        $('#confirmModal').modal('hide');
    }
</script>


</body>
</html>