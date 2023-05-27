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
    <!-- Bootstrap CSS -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/ra.css"/>


    <link rel="stylesheet" th:href="@{/css/signin.css}"/>

    <title>Đăng ký tài khoản</title>
</head>
<body>


<%--<%@include file="/common/web/header.jsp"%>--%><br>
<section class="row" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div
                class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                <div class="card" style="border-radius: 15px;">
                    <div class="card-body p-5">
                        <form action="<c:url value = "register/add" />" method=POST
                              enctype="multipart/form-data" onsubmit="return confirm('Xác nhận đăng ký.');">
                            <h2 class="text-uppercase text-center mb-5">Đăng Ký Tài
                                Khoản</h2>

                            <!-- Hiển thông báo -->
                            <c:if test="${messageRegister != null}">
                                <div class="alert alert-primary" role="alert">
                                    <i>${messageRegister}</i>
                                </div>
                            </c:if>

<%--                            <div>--%>
<%--                                <c:if test="${not empty sessionScope.messageRegister}">--%>
<%--                                    <div class="alert alert-primary" role="alert">--%>
<%--                                        <i><%=session.getAttribute("messageRegister")%>--%>
<%--                                        </i>--%>
<%--                                    </div>--%>
<%--                                </c:if>--%>
<%--                            </div>--%>

                            <div>

                                <%-- <div class="mb-3">
                                <label for="ID_USER" class="form-label">User ID</label> <input
                                    type="hidden" value="${user.is_Edit()}"> <input
                                    type="text" readonly="readonly" class="form-control"
                                    value="${user.getID_USER() }" id="ID_USER" name="ID_USER"
                                    aria-describedby="ID_USER" placeholder="ID">
                            </div> --%>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="fullname">Họ và tên:</label> <input
                                        type="text" value="${customer.fullname}" id="fullname"
                                        name="fullname" aria-describedby="fullname"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="username">Tài khoản:</label> <input
                                        type="text" value="${customer.username}" id="username"
                                        name="username" aria-describedby="username"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="email"> Email:</label> <input
                                        type="email" value="${customer.email}" id="email"
                                        name="email" aria-describedby="email"
                                        class="form-control form-control-lg"/>
                                </div>

                                    <div class="col-md-6 mb-4">
                                        <label class="form-label" for="form3Example1cg">Giới tính:</label><br>
                                        <div class="form-check form-check-inline">
                                            <c:if test="${customer.gender == false}">
                                                <input class="form-check-input" type="radio" name="gender" id="femaleGender" value="false" checked="checked" />
                                            </c:if>
                                            <c:if test="${customer.gender == true}">
                                                <input class="form-check-input" type="radio" name="gender" id="femaleGender" value="false" />
                                            </c:if>
                                            <label class="form-check-label" for="femaleGender">Nữ</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <c:if test="${customer.gender == true}">
                                                <input class="form-check-input" type="radio" name="gender" id="maleGender" value="true" checked="checked" />
                                            </c:if>
                                            <c:if test="${customer.gender == false}">
                                                <input class="form-check-input" type="radio" name="gender" id="maleGender" value="true" />
                                            </c:if>
                                            <label class="form-check-label" for="maleGender">Nam</label>
                                        </div>
                                    </div>

<%--                                <div class="col-md-6 mb-4">--%>
<%--                                    <label class="form-label" for="form3Example1cg">Giới--%>
<%--                                        tính:</label><br>--%>
<%--                                    <div class="form-check form-check-inline">--%>
<%--                                        <input class="form-check-input" type="radio" name="gender"--%>
<%--                                               id="femaleGender" value="false"--%>
<%--                                               checked="${customer.gender == true}"/> <label--%>
<%--                                            class="form-check-label " for="femaleGender">Nữ</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-check form-check-inline">--%>
<%--                                        <input class="form-check-input" type="radio" name="gender"--%>
<%--                                               id="maleGender" value="true"--%>
<%--                                        checked="${customer.gender == false}"/> <label--%>
<%--                                            class="form-check-label" for="maleGender">Nam</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="birthday">Ngày sinh:</label> <input
                                        type="date" value="${customer.birthday}" id="birthday"
                                        name="birthday" aria-describedby="birthday"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4 ">
                                    <label class="form-label" for="phone">Số điện thoại:</label> <input
                                        type="tel" value="${customer.phone}" id="phone" name="phone"
                                        class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="address">Địa chỉ:</label> <input
                                        type="text" value="${customer.address}" id="address"
                                        name="address" class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="password">Mật khẩu:</label> <input
                                        type="password" value="${customer.password}" id="password"
                                        name="password" class="form-control form-control-lg"/>
                                </div>

                                <div class="form-outline mb-4">
                                    <label class="form-label" for="password2">Xác nhận lại
                                        mật khẩu:</label> <input type="password"
                                                                 value="${customer.password2}" id="password2"
                                                                 name="password2"
                                                                 class="form-control form-control-lg"/>
                                </div>

                            </div>

                            <div class="d-flex justify-content-center">
                                <button type="submit"
                                        class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Đăng Ký
                                </button>
                            </div>

                            <p class="text-center text-muted mt-5 mb-0">
                                Đã có một tài khoản? <a href="login"
                                                        class="fw-bold text-body"><i>Đăng nhập</i></a>
                            </p>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>

</section>



</body>
<%--<%@include file="/common/web/footer.jsp" %>--%>

</html>