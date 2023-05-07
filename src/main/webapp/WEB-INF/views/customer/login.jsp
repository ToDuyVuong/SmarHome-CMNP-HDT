<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>

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



<br>
<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div
                class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <form method=POST action="">
                            <h3 class="mb-5">Đăng nhâp</h3>

                            <!-- Hiển thông báo -->
                            <c:if test="${message != null}">
                                <div class="alert alert-primary" role="alert">
                                    <i>${message}</i>
                                </div>
                            </c:if>


                            <div class="form-outline mb-4">
                                <input type="text" name="username" id="username"
                                       class="form-control form-control-lg"
                                       value="${us.username}" placeholder="Tài khoản" required/>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" name="password" id="password"
                                       class="form-control form-control-lg"
                                       value="${us.password}" placeholder="Mật khẩu" required/>
                            </div>

                            <button class="btn btn-primary btn-lg btn-block" type="submit">Đăng nhập</button>
                        </form>
                        <hr class="my-4">
                        <div>
                            <p class="text-center text-muted mt-5 mb-0">
                                Tạo tài khoản mới? <a href="register"
                                                      class="fw-bold text-body"><i>Đăng ký</i></a>
                            </p>
                        </div>
                        <div>
                            <p class="text-center text-muted mt-5 mb-0">
                                Quên mật khẩu? <a href="forgot"
                                                  class="fw-bold text-body"><i>Lấy lại</i></a>
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

<%--<%@include file="/common/web/footer.jsp" %>--%>

</html>