

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lấy lại mật khẩu</title>

    <%@include file="/common/taglib.jsp" %>
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

</head>
<body>

<br><br>

<br>
<%--<h1>hello</h1>--%>
<%--<br>--%>
<%--<h1>nhập user name</h1>--%>
<%--<h1>chọn để tìm và ẩn khi có</h1>--%>
<%--<h1>đúng thì hiển thị </h1>--%>
<%--<h1>nhập otp</h1>--%>
<%--<h1>chuyển qua nhập pas mới</h1>--%>

<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div
                class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <c:choose>
                            <c:when test="${message == 'Tài khoản tồn tại!'}">
                                <form method=POST action="/otp">
                                    <h3 class="mb-5">Nhập Mã OTP</h3>

                                    <!-- Hiển thông báo -->
                                    <c:if test="${message != null}">
                                        <div class="alert alert-primary" role="alert">
                                            <i>${message}</i>
                                        </div>
                                    </c:if>


                                    <div class="form-outline mb-4">
                                        <input type="text" name="otp" id="otp"
                                               class="form-control form-control-lg" placeholder="Mã OTP"/>

                                    </div>
                                    <br>

                                    <button class="btn btn-primary btn-lg btn-block" type="submit">Nhập mã</button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form method=POST action="/forgot">
                                    <h3 class="mb-5">Lấy lại mật khẩu</h3>

                                    <!-- Hiển thông báo -->
                                    <c:if test="${message != null}">
                                        <div class="alert alert-primary" role="alert">
                                            <i>${message}</i>
                                        </div>
                                    </c:if>


                                    <div class="form-outline mb-4">
                                        <input type="text" name="username" id="username"
                                               class="form-control form-control-lg" placeholder="Tài khoản"/>
                                    </div>
                                    <br>

                                    <button class="btn btn-primary btn-lg btn-block" type="submit">Lấy lại</button>
                                </form>
                            </c:otherwise>
                        </c:choose>

                       <%-- <form method=POST action="/forgot">
                            <h3 class="mb-5">Lấy lại mật khẩu</h3>

                            <!-- Hiển thông báo -->
                            <c:if test="${message != null}">
                                <div class="alert alert-primary" role="alert">
                                    <i>${message}</i>
                                </div>
                            </c:if>


                            <div class="form-outline mb-4">
                                <input type="text" name="username" id="username"
                                       class="form-control form-control-lg"
                                       value="${us.username}" placeholder="Tài khoản"/>
                            </div>
                            <br>

                            <button class="btn btn-primary btn-lg btn-block" type="submit">Đăng nhập</button>
                        </form>--%>
                        <hr class="my-4">
                        <div>
                            <p class="text-center text-muted mt-5 mb-0">
                                Tạo tài khoản mới? <a href="register"
                                                      class="fw-bold text-body"><i>Đăng ký</i></a>
                            </p>

                            <p class="text-center text-muted mt-5 mb-0">
                                Quay lại đăng nhập? <a href="login"
                                                  class="fw-bold text-body"><i>Đăng nhập</i></a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>


</body>


</html>