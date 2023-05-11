<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%@include file="/common/web/header.jsp" %>
    <title>Danh sách đơn hàng</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="<c:url value="/css/vieworder.css"/>">


    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>

</head>
<body>

<br>
<br>
<br>
<br>
<h1 class="text-center"><b style="font-family: Arial, sans-serif; font-weight: bold; font-size: 44px; color: #51d070;">
    Danh Sách Đơn Mua</b> </h1>
<br>
<br>
<section>
    <div class="container">
        <div class="row">
            <div class="col-12 mb-3 mb-lg-5">
                <div class="position-relative card table-nowrap table-card">
                    <div class="card-header align-items-center">
                        <h5 class="mb-0">Danh sách đơn hàng của ${customer.fullname}!</h5>
                        <p class="mb-0 small text-muted">${customer.email }</p>
                    </div>
                    <div class="table-responsive">
                        <table class="table mb-0">
                            <thead class="small text-uppercase bg-body text-muted">
                            <tr>
                                <th>Mã đơn</th>
                                <th>Ngày</th>
                                <th>Người nhận</th>
                                <th>Liên hệ</th>
                                <th>Địa chỉ</th>
                                <th>Ghi chú</th>
                                <th>Số lượng</th>
                                <th>Tổng giá</th>
                                <th>Trạng thái</th>
                                <th>Chi tiết</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach var="item" items="${order}">
                                <form>
                                    <tr class="align-middle">
                                        <td class="text-center" id="orderId" name="orderId">
                                                ${item.orderId}
                                        </td>
                                        <td class="text-center">
                                                ${item.date}
                                        </td>
                                        <td class="text-center">
                                                ${item.customer.fullname}
                                        </td>
                                        <td class="text-center">
                                                ${item.phone}
                                        </td>
                                        <td style="max-width: 20ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                ${item.address}
                                        </td>
                                        <td class="text-center"
                                            style="max-width: 20ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                                ${item.note}
                                        </td>
                                        <td class="text-center">
                                                ${item.totalQuantity}
                                        </td>
                                        <td class="text-center">
                                                ${item.totalPrice}
                                        </td>

                                        <td>
                                            <span>${item.status}</span>
                                        </td>
                                        <td class="text-center">
                                            <a title="submit" href="/order/detail/${item.orderId}" class="text-secondary">Chi tiết</a>
                                        </td>

                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer text-end">
                        <a href="/profile" class="btn btn-gray">Quay lại trang cái nhân</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<br>
<br>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>