<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

    <%@include file="/common/web/header.jsp" %>
    <title>Đổi mật khẩu</title>
    <%--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
    <%--    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
    <%--    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>


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
    <!------ Include the above in your HEAD tag ---------->
    <link rel="stylesheet" th:href="@{/css/style.css}"/>

</head>
<body>
<%@include file="/common/web/header.jsp" %>
<br>
<br><br><br><br>
<h1 class="text-center"><b style="font-family: Arial, sans-serif; font-weight: bold; font-size: 44px; color: #51d070;">
   Thay Đổi Mật Khẩu</b> </h1>
<br>
<section class="vh-100">
    <div class="container-xl px-4 mt-4">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <!-- Change password card-->
                <div class="card mb-4">
                    <div class="card-header">Thay đổi mật khẩu</div>
                    <div class="card-body">
                        <!-- Hiển thông báo -->
                        <c:if test="${message != null}">
                            <div class="alert alert-primary" role="alert">
                                <i>${message}</i>
                            </div>
                        </c:if>
                        <form method="post" action="/profile/changePassword">
                            <!-- Form Group (current password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="password">Mật khẩu cũ:</label>
                                <input class="form-control" id="password" type="password" name="password"
                                       placeholder="Nhập mật khẩu cũ.">
                            </div>
                            <!-- Form Group (new password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="password2">Mật khẩu mới:</label>
                                <input class="form-control" id="password2" type="password" name="password2"
                                       placeholder="Nhập mật khẩu mới.">
                            </div>
                            <!-- Form Group (confirm password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="newpassword">Xác nhận mật khẩu mới:</label>
                                <input class="form-control" id="newpassword" type="password" name="newpassword"
                                       placeholder="Xác nhận mật khẩu mới.">
                            </div>
                            <div>
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                    <!-- Save changes button-->
                                    <button type="submit" class="btn btn-success" type="button">Lưu lại</button>
                                    <%--                            <button class="btn btn-danger" type="button">Hủy</button>--%>
                                    <button type="button" class="btn btn-danger" onclick="location.reload();">Hủy
                                    </button>
                                </div>
                                <a
                                        href="<c:url value="/profile"/>"
                                        class="btn btn-primary"><i class="fas fas-bars"></i>Quay lại</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<%--<section class="vh-100" >
    <div class="container-xl px-4 mt-4">

        &lt;%&ndash;    <hr class="mt-0 mb-4">&ndash;%&gt;
        <div class="row">
            <div class="col-lg-8">
                <!-- Change password card-->
                <div class="card mb-4">
                    <div class="card-header">Change Password</div>
                    <div class="card-body">
                        <form>
                            <!-- Form Group (current password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="currentPassword">Current Password</label>
                                <input class="form-control" id="currentPassword" type="password"
                                       placeholder="Enter current password">
                            </div>
                            <!-- Form Group (new password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="newPassword">New Password</label>
                                <input class="form-control" id="newPassword" type="password"
                                       placeholder="Enter new password">
                            </div>
                            <!-- Form Group (confirm password)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="confirmPassword">Confirm Password</label>
                                <input class="form-control" id="confirmPassword" type="password"
                                       placeholder="Confirm new password">
                            </div>
                            <button class="btn btn-primary" type="button">Save</button>
                        </form>
                    </div>
                </div>


            </div>
        </div></div>

</section>--%>

</body>
</html>
