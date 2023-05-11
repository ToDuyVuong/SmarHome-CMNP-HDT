forgot.jsp<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>

  <%@include file="/common/web/header.jsp" %>
  <title>Đổi mật khẩu</title>


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
<br><br>
<br><br>

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
            <form method="post" action="/newpassword">
              <!-- Form Group (new password)-->
              <div class="mb-3">
                <label class="small mb-1" for="newpassword">Mật khẩu mới:</label>
                <input class="form-control" id="newpassword" type="password" name="newpassword"
                       placeholder="Nhập mật khẩu mới.">
              </div>
              <!-- Form Group (confirm password)-->
              <div class="mb-3">
                <label class="small mb-1" for="confirmpassword">Xác nhận mật khẩu mới:</label>
                <input class="form-control" id="confirmpassword" type="password" name="confirmpassword"
                       placeholder="Xác nhận mật khẩu mới.">
              </div>
              <div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                  <!-- Save changes button-->
                  <button type="submit" class="btn btn-success" type="button">Lưu lại</button>
                  <button type="button" class="btn btn-danger" onclick="location.reload();">Hủy
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

</body>
</html>
