checkout.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/common/web/header.jsp" %>
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!-- Bao gồm Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


    <link rel="stylesheet" href="<c:url value="/css/dataleorderitem.css"/>">

</head>
<body>

<br>
<br><br>
<br>

<section class="h-100 gradient-custom">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-10 col-xl-8">
                <div class="card" style="border-radius: 10px;">
                    <div class="card-header px-4 py-5">
                        <h5 class="text-muted mb-0">Cảm ơn bạn đã mua hàng, <span
                                style="color: #a8729a;">${order.customer.fullname}</span>!</h5>
                    </div>
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0" style="color: #a8729a;">Hóa đơn</p>

                            <div class="small text-muted mb-0">
                                <p style="color: #2F2D3B">Trạng thái đơn hàng: ${order.status}</p>
                                <p>Số điện thoại nhận: ${order.phone}</p>
                                <p>Địa chỉ: ${order.address}</p>


                            </div>
                        </div>


                        <c:forEach var="item" items="${orderItems}">
                            <form>

                                <div class="card shadow-0 border mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-2">

                                                <img src="${item.product.image}"
                                                     alt="Hình ảnh sản phẩm" title="" width="150"
                                                     height="150">
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0"
                                                   title="${product.name}">${item.product.name}</p>
                                            </div>


                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small"
                                                   id="description-${item.product.description}">
                                                        ${item.product.description}</p>

                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">Số lượng: ${item.quantity}</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">Giá: ${item.price}</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <a title="submit" href="/product/detail/${item.product.productId}"
                                                   class="text-secondary">Xem sản phẩm</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <script>
                                var text = document.getElementById("description-${item.product.description}").innerHTML;
                                var maxLength = 125;
                                var trimmedString = text.substr(0, maxLength);
                                trimmedString = trimmedString.substr(0, Math.min(trimmedString.length, trimmedString.lastIndexOf(" ")))
                                document.getElementById("description-${item.product.description}").innerHTML = trimmedString + "...";
                            </script>
                        </c:forEach>


                        <div class="d-flex justify-content-between pt-2">
                            <p class="text-muted mb-0">Mã đơn : ${order.orderId}</p>
                            <p class="text-muted mb-0"><span
                                    class="fw-bold me-4">Tổng sản phẩm:</span> ${order.totalQuantity}</p>
                        </div>

                        <div class="d-flex justify-content-between pt-2">
                            <p class="text-muted mb-0">Ngày đặt hàng : ${order.date}</p>
                            <p class="text-muted mb-0"><span class="fw-bold me-4">Giảm giá: </span>
                                -${(order.totalPrice-shippingcost) * 0.1}</p>
                        </div>

                        <div class="d-flex justify-content-between">
                            <p class="text-muted mb-0">Mã giảm giá: Không</p>
                            <p class="text-muted mb-0"><span
                                    class="fw-bold me-4">Thuế VAT 10%: </span> ${(order.totalPrice-shippingcost) * 0.1}
                            </p>
                        </div>

                        <div class="d-flex justify-content-between mb-5">
                            <p class="text-muted mb-0">Hình thức vận chuyển: ${order.shipTo}</p>
                            <p class="text-muted mb-0"><span class="fw-bold me-4">Phí vận chuyển: </span>
                                ${shippingcost} VNĐ
                            </p>
                        </div>


                        <div class="d-flex justify-content-between total-price">
                            <p class="text-muted mb-0" style="color: black">Tổng tiền hàng:</p>
                            <p class="text-muted mb-0"><span
                                    class="fw-bold me-4">${order.totalPrice - shippingcost} VNĐ</span></p>
                        </div>
                    </div>
                    <div class="card-footer border-0 px-4 py-5"
                         style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                        <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">
                            Tổng đơn: <span class="h2 mb-0 ms-2">${order.totalPrice} VNĐ</span></h5>

                    </div>
                </div>

                <div class="card-footer text-center">
                    <c:if test="${order.status == 'PENDING'}">
                        <button class="btn btn-danger" onclick="showCancelOrderModal(${order.orderId})">Hủy đơn hàng
                        </button>
                    </c:if>
                </div>

                <div class="card-footer text-center">
                    <a href="/order/view" class="btn btn-gray" style="color: #2F2D3B">Quay lại danh sách đơn hàng của
                        bạn</a>
                </div>
            </div>

            <div style="background: #4bb8a9">

                <!-- Modal xác nhận -->
                <div class="modal fade" id="cancelOrderModal" tabindex="-1" role="dialog"
                     aria-labelledby="cancelOrderModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="cancelOrderModalLabel">Xác nhận hủy đơn hàng</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Bạn có chắc chắn muốn hủy đơn hàng không?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                                <button type="button" class="btn btn-danger" onclick="cancelOrder()">Hủy đơn hàng
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>


</section>

<br>
<br>
<br>

<!-- Bao gồm jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Bao gồm thư viện JavaScript của Bootstrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
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
<script>
    let orderId;

    function showCancelOrderModal(id) {
        orderId = id;
        $('#cancelOrderModal').modal('show');
    }

    function cancelOrder() {
        window.location.href = `/order/canceled/${orderId}`;
    }
</script>
</body>
</html>