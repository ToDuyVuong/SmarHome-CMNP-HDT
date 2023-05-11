<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/common/web/header.jsp" %>


    <meta charset="utf-8">

    <link rel="stylesheet" href="<c:url value="/css/checkout.css"/>">
    <link rel="javascript" src="<c:url value="/js/checkout.js"/>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
          integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>


    <title>Hóa đơn</title>


</head>


<body>

<br><br>


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
                        <p class="text-muted space mb-0 shop">Thời gian: <%= formattedTime %> - <%= formattedDate %>
                        </p>
                    </div>
                    <div class="col">
                        <div class="row justify-content-start ">
                            <div class="col">
                                <img class="irc_mi img-fluid cursor-pointer " src="https://i.imgur.com/jFQo2lD.png"
                                     width="70" height="70">
                            </div>
                        </div>
                    </div>
                    <div class="col-auto">
                        <img class="irc_mi img-fluid bell" src="https://i.imgur.com/uSHMClk.jpg" width="30" height="30">
                    </div>
                </div>
                <div class="row  mx-auto justify-content-center text-center">
                    <div class="col-12 mt-3 ">

                        <nav aria-label="breadcrumb" class="second ">
                            <ol class="breadcrumb indigo lighten-6 first  ">
                                <li class="breadcrumb-item font-weight-bold "><a class="black-text text-uppercase "
                                                                                 href="/"><span class="mr-md-3 mr-1">Quay lại cửa hàng</span></a><i
                                        class="fa fa-angle-double-right " aria-hidden="true"></i></li>
                                <li class="breadcrumb-item font-weight-bold"><a class="black-text text-uppercase"
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
                               Cảm Ơn Bạn Đã Đặt Hàng</b></h1>

                        </div>
                    </div>

                    <div class="row justify-content-start ">
                        <%--                    <div class="col">--%>
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


                                <div class="col-12">

                                    <div class="col-5">
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label for="fullname" id="fullname">Họ và tên: </label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <p class="text-muted mb-0 flex-fill">${customer.fullname}</p>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label>Số điện thoại: </label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <p class="text-muted mb-0 flex-fill" id="phone">${phone}</p>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label>Địa chỉ: </label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <p class="text-muted mb-0 flex-fill" id="address">${address}</p>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <label for="date" id="date">Ngày mua: </label>
                                            </div>
                                            <div class="col-sm-9 d-flex">
                                                <p class="text-muted mb-0 flex-fill"><%= formattedDate %>
                                                </p>
                                            </div>
                                        </div>

                                    </div>




                                    <div cclass="col-5">
                                        <div>

                                            <div class="row mt-4">
                                                <div class="col"><p><b
                                                        style="font-family: Arial, sans-serif; font-weight: bold; font-size: 25px; color: #17c4be;">
                                                    Vận chuyển</b></p>
                                                </div>
                                            </div>


                                                <div class="form-group row justify-content-between">
                                                    <label  class="col-auto col-form-label">
                                                        <b>Hình thức vận chuyển:</b> ${shippingmethod}</label>

                                                </div>



                                            <br>

                                        </div>
                                    </div>



                                </div>


                            </div>
                        </div>


                        <div class="row justify-content-start ">

                            <%--                    <div class="col">--%>
                            <div class="card border-0 ">
                                <form method="get" action="/">

                                    <div class="card-header card-2">
                                        <p class="card-text text-muted mt-md-4  mb-2 space text-center"><b
                                                style="font-family: Arial, sans-serif; font-weight: bold; font-size: 25px; color: #17c4be;">Danh
                                            sách đơn hàng</b>
                                        </p>
                                        <hr class="my-2">
                                    </div>
                                    <div class="card-body pt-0">
                                        <c:forEach var="item" items="${selectedCartItems}">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input"
                                                       style="display:none;" value="${item.cartItemId}"
                                                       id="checkProductToCart" name="${item.cartItemId}" checked>
                                            </div>
                                            <div class="row  justify-content-between">
                                                <div class="col-auto col-md-7">
                                                    <div class="media flex-column flex-sm-row">



<%--                                                        <img class=" img-fluid" src="https://i.imgur.com/6oHix28.jpg"--%>
<%--                                                             width="62"--%>
<%--                                                             height="62">--%>

                                                        <img src="${item.products.image}"
                                                             alt="Hình ảnh sản phẩm"title="" width="150"
                                                             height="150">


                                                        <div class="media-body  my-auto">
                                                            <div class="row ">
                                                                <div class="col-auto"><p class="mb-0">
                                                                    <b>${item.products.name}</b></p>
                                                                    <small class="text-muted">
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
                                            <hr class="my-2">
                                        </c:forEach>
                                        <div>
                                            <div class="row ">
                                                <div class="col">
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1"><b>Tổng sản phẩm:</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1">
                                                            <b id="quantity-order" name="quantity-order">
                                                                ${totalQuantity}
                                                            </b>
                                                            <b>
                                                                sản phẩm
                                                            </b>
                                                        </p>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1"><b>Tổng tiền hàng:</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1"><b
                                                                id="total-order"
                                                                class="total-order">${totalPrice - shippingcost} </b><b>VNĐ</b>
                                                        </p>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1 tex"><b>Thuế VAT 10%:</b></p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1">
                                                            <b>${Math.floor((totalPrice - shippingcost) * 0.1)} VNĐ</b></p></div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1 text-danger"><b>Khuyển
                                                            mãi:</b>
                                                        </p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1 text-danger">
                                                            <b>
                                                                - ${Math.floor((totalPrice - shippingcost) * 0.1)} VNĐ</b></p></div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col"><p class="mb-1"><b>Phí vận chuyển:</b> </p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><b><p
                                                                class="mb-1 shipping-fee-2"
                                                                id="shipping-fee-2"> ${shippingcost} VNĐ</p></b>
                                                        </div>
                                                    </div>
                                                    <div class="row justify-content-between">
                                                        <div class="col-4"><p class="mb-1  text-danger"><b>Tổng thanh
                                                            toán:</b>
                                                        </p>
                                                        </div>
                                                        <div class="flex-sm-col col-auto"><p class="mb-1  text-danger ">
                                                            <b id="total-price" value="total-price">
                                                            </b><b>${totalPrice} VNĐ</b></p>
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
                                                        <label for="shipping-method" class="col-auto col-form-label">
                                                            <b>
                                                                Hình thức thanh toán:
                                                            </b>
                                                        </label>
                                                        <div class="col-auto">
                                                            <select class="form-control" name="payment-method"
                                                                    id="payment-method" disabled>
                                                                <option value="pay">
                                                                    Thanh toán trực tiếp khi nhận hàng
                                                                </option>
                                                                <option value="credit-card" disabled>
                                                                    Thẻ tín dụng
                                                                </option>
                                                                <option value="bank-transfer" disabled>
                                                                    Chuyển khoản ngân hàng
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <hr class="mt-0">

                                                    <div class="row mb-5 mt-4">
                                                        <div class="col-sm-3">
                                                            <label>Ghi chú: </label>
                                                        </div>
                                                        <div class="col-sm-9">
                                                            <p class="text-muted mb-0">
                                                                <c:out value="${note}"/></p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <a href="/">
                                                <button  type="submit" class="btn btn-primary btn-lg btn-block">
                                                        Tiếp tục mua hàng
                                                    </button>
                                                </a>




                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<%--<input type="hidden" id="total-value" name="total" value="">--%>
<%--<script>--%>
<%--    let totalPriceElem = document.getElementById('total-price');--%>
<%--    let shippingMethodElem = document.getElementById('shipping-method');--%>
<%--    let shippingFeeElem = document.getElementById('shipping-fee');--%>
<%--    let shippingFeeElem2 = document.getElementById('shipping-fee-2');--%>
<%--    let totalValueElem = document.getElementById('total-value');--%>
<%--    let totalOrder = parseInt(document.getElementById("total-order").textContent);--%>
<%--    let basicShippingFee = 0;--%>
<%--    let fastShippingFee = 30000;--%>
<%--    let expressShippingFee = 60000;--%>

<%--    function updateTotalPrice() {--%>
<%--        let shippingFee = basicShippingFee;--%>
<%--        if (shippingMethodElem.value === 'fast') {--%>
<%--            shippingFee = fastShippingFee;--%>
<%--        } else if (shippingMethodElem.value === 'express') {--%>
<%--            shippingFee = expressShippingFee;--%>
<%--        }--%>
<%--        // Cập nhật phí vận chuyển vào HTML--%>

<%--        if (totalOrder > 100000) {--%>
<%--            shippingFee = 0;--%>
<%--        }--%>
<%--        let total = parseInt(totalOrder) + parseInt(shippingFee);--%>
<%--        totalPriceElem.innerHTML = total;--%>
<%--        totalValueElem.value = total;--%>

<%--        shippingFeeElem.innerHTML = shippingFee + ` VNĐ`;--%>
<%--        shippingFeeElem2.innerHTML = shippingFee + ` VNĐ`;--%>


<%--    }--%>

<%--    shippingMethodElem.addEventListener('change', updateTotalPrice);--%>


<%--    shippingFeeElem.innerHTML = basicShippingFee + ` VNĐ`;--%>

<%--    updateTotalPrice();--%>


<%--</script>--%>


</body>
</html>