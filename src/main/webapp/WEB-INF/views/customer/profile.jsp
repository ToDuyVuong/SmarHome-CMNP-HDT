<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/web/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang cá nhân</title>

<%--    <%@include file="/common/taglib.jsp" %>--%>


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

</head>
<body>
<%--<%@include file="/common/web/header.jsp" %>--%>
<br><br><br><br><br>
<h1 class="text-center"><b style="font-family: Arial, sans-serif; font-weight: bold; font-size: 44px; color: #51d070;">
    Thông Tin Cá Nhân</b> </h1>
<br><br>
<section style="background-color: #eee;">
    <div class="container py-5">
        <div class="row">
            <div class="col">
                <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="/">Trang chủ</a></li>
                        <%--                        <li class="breadcrumb-item"><a href="#">User</a></li>--%>
                        <li class="breadcrumb-item active" aria-current="page">Trang cá nhân</li>
                    </ol>
                </nav>
            </div>
        </div>
        <div>
            <!-- Hiển thông báo -->
            <c:if test="${message != null}">
                <div class="alert alert-primary" role="alert">
                    <i>${message}</i>
                </div>
            </c:if>
        </div>

        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-body text-center">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp"
                             alt="avatar"
                             class="rounded-circle img-fluid" style="width: 150px;">
                        <h5 class="my-3"><c:out value="${customer.fullname}"/></h5>
                        <p class="text-muted mb-1"><c:out value="${customer.username}"/></p>
                        <p class="text-muted mb-4"><c:out value="${customer.address}"/></p>
                        <div class="d-flex justify-content-center mb-2">
                            <%--<button type="button" class="btn btn-primary">Chỉnh sửa</button>
                            <button type="button" class="btn btn-outline-primary ms-1">Đổi mật khẩu</button>--%>
                            <a
                                    href="<c:url value="/profile/editProfile"/>"
                                    class="btn btn-primary"><i class="fas fas-bars"></i>Chỉnh sửa</a>

                            <a
                                    href="<c:url value="/profile/changePassword"/>"
                                    class="btn btn-outline-primary ms-1"><i class="fas fas-bars"></i>Đổi mật khẩu</a>


                            <a href="<c:url value="/order/view"/>"
                                    class="btn btn-success"><i class="fas fas-bars"></i>Đơn mua</a>
                        </div>
                    </div>
                </div>

            </div>


            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Mã kháchh hàng:</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><c:out value="${customer.customerId}"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Họ và tên:</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><c:out value="${customer.fullname}"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Email:</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><c:out value="${customer.email}"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Tài khoản:</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><c:out value="${customer.username}"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Điện thoại:</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><c:out value="${customer.phone}"/></p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Giới tính:</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0">
                                    <c:if test="${customer.gender}">
                                        Nam
                                    </c:if>
                                    <c:if test="${not customer.gender}">
                                        Nữ
                                    </c:if>
                                </p>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Ngày sinh</p>
                            </div>
                            <div class="col-sm-9">

                                <input class="form-control" id="birthday" type="date" placeholder="Ngày sinh."
                                       value="${customer.birthday}" id="birthday"
                                       name="birthday" aria-describedby="birthday" disabled>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-sm-3">
                                <p class="mb-0">Địa chỉ:</p>
                            </div>
                            <div class="col-sm-9">
                                <p class="text-muted mb-0"><c:out value="${customer.address}"/></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a class="btn btn-danger" href="/logout"
                       role="button">Đăng xuất <span class="badge badge-light"></span>
                    </a>
                </div>



            </div>
        </div>
    </div>
</section>



</body>
<%--<%@include file="/common/web/footer.jsp" %>--%>

</html>
