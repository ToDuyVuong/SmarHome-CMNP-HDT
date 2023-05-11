<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%--    <%@include file="/common/taglib.jsp" %>--%>
    <title>Chỉnh sửa thông tin</title>
    <%--    <style ><link rel="stylesheet" type="text/css" href="/css/rcs.css"></style>--%>


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

    <%@include file="/common/web/header.jsp" %>
</head>
<body>

<br>
<br>
<br><br>
<br>
<br>
<h1 class="text-center"><b style="font-family: Arial, sans-serif; font-weight: bold; font-size: 44px; color: #51d070;">
    Chỉnh Sửa Thông Tin Cá Nhân</b> </h1>
<br>
<br>
<div class="container-xl px-4 mt-4">
    <%--    <!-- Account page navigation-->--%>
    <%--    <nav class="nav nav-borders">--%>
    <%--        <a class="nav-link active ms-0" href="https://www.bootdey.com/snippets/view/bs5-edit-profile-account-details" target="__blank">Profile</a>--%>
    <%--        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-billing-page" target="__blank">Billing</a>--%>
    <%--        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-security-page" target="__blank">Security</a>--%>
    <%--        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-edit-notifications-page"  target="__blank">Notifications</a>--%>
    <%--    </nav>--%>
    <%--    <hr class="mt-0 mb-4">--%>
    <div class="row">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">Ảnh</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <%--                    <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">--%>

                    <c:choose>
                        <c:when test="${customer.gender}">
                            <img class="img-account-profile rounded-circle mb-2"
                                 src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        </c:when>
                        <c:otherwise>
                            <img class="img-account-profile rounded-circle mb-2"
                                 src="http://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                        </c:otherwise>
                    </c:choose>


                    <!-- Profile picture help block-->
                    <%--                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>--%>
                    <!-- Profile picture upload button-->
                    <%--                    <button class="btn btn-primary" type="button">Upload new image</button>--%>
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Chỉnh sửa thông tin cá nhân</div>
                <div class="card-body">
                    <form method="POST" action="saveEditProfile" enctype="multipart/form-data"
                          onsubmit="return confirm('Xác nhận chỉnh sửa thông tin.');">
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <div class="col-md-6">
                                <label for="id" class="small mb-1">Mã khách hàng:</label> <input
                                    type="text" readonly="readonly" class="form-control"
                                    value="${customer.customerId }" id="id" name="id"
                                    aria-describedby="id" placeholder="Mã khách hàng.">
                            </div>
                            <div class="col-md-6">
                                <label for="username" class="small mb-1">Tài khoản:</label> <input
                                    type="text" readonly="readonly" class="form-control"
                                    value="${customer.username }" id="username" name="username"
                                    aria-describedby="username" placeholder="Tài khoản.">
                            </div>
                        </div>
                        <!-- Form Group (email address)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="email">Email:</label>
                            <input class="form-control" type="email" value="${customer.email}" id="email"
                                   name="email" aria-describedby="email">
                        </div>
                        <!-- Form Group (Họ và tên)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="fullname">Họ và tên:</label>
                            <input class="form-control" type="text" value="${customer.fullname}" id="fullname"
                                   name="fullname" aria-describedby="fullname" placeholder="Họ và tên."/>
                        </div>

                        <div class="mb-3">
                            <label class="small mb-1" for="gender">Giới tính:</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="femaleGender"
                                       value="false"
                                ${customer.gender == false ? 'checked' : ''} />
                                <label class="form-check-label" for="femaleGender">Nữ</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="maleGender" value="true"
                                ${customer.gender == true ? 'checked' : ''} />
                                <label class="form-check-label" for="maleGender">Nam</label>
                            </div>
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="birthday">Ngày sinh:</label>
                                <input class="form-control" id="birthday" type="date" placeholder="Ngày sinh."
                                       value="${customer.birthday}" id="birthday"
                                       name="birthday" aria-describedby="birthday">
                            </div>
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="phone">Số điện thoại:</label>
                                <input class="form-control" id="phone" type="tel" value="${customer.phone}" id="phone"
                                       name="phone">
                            </div>
                        </div>
                        <!-- Form Group (address)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="email">Địa chỉ:</label>
                            <input class="form-control" type="text" value="${customer.address}" id="address"
                                   name="address" aria-describedby="address">
                        </div>

                        <div>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <!-- Save changes button-->
                                <button type="submit" class="btn btn-success" type="button">Lưu lại</button>
                                <%--                            <button class="btn btn-danger" type="button">Hủy</button>--%>
                                <button type="button" class="btn btn-danger" onclick="location.reload();">Hủy</button>

                            </div>
                            <a
                                    href="<c:url value="/profile"/>"
                                    class="btn btn-primary"><i class="fas fas-bars"></i>Quay lại</a></div>


                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />--%>

<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <div class="col-12">--%>
<%--            <!-- Page title -->--%>
<%--            <div class="my-5">--%>
<%--                <h3>My Profile</h3>--%>
<%--                <hr>--%>
<%--            </div>--%>
<%--            <!-- Form START -->--%>
<%--            <form class="file-upload">--%>
<%--                <div class="row mb-5 gx-5">--%>
<%--                    <!-- Contact detail -->--%>
<%--                    <div class="col-xxl-8 mb-5 mb-xxl-0">--%>
<%--                        <div class="bg-secondary-soft px-4 py-5 rounded">--%>
<%--                            <div class="row g-3">--%>
<%--                                <h4 class="mb-4 mt-0">Contact detail</h4>--%>
<%--                                <!-- First Name -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label">First Name *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="First name" value="Scaralet">--%>
<%--                                </div>--%>
<%--                                <!-- Last name -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label">Last Name *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Last name" value="Doe">--%>
<%--                                </div>--%>
<%--                                <!-- Phone number -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label">Phone number *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Phone number" value="(333) 000 555">--%>
<%--                                </div>--%>
<%--                                <!-- Mobile number -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label">Mobile number *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Phone number" value="+91 9852 8855 252">--%>
<%--                                </div>--%>
<%--                                <!-- Email -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label for="inputEmail4" class="form-label">Email *</label>--%>
<%--                                    <input type="email" class="form-control" id="inputEmail4" value="example@homerealty.com">--%>
<%--                                </div>--%>
<%--                                <!-- Skype -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label">Skype *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Phone number" value="Scaralet D">--%>
<%--                                </div>--%>
<%--                            </div> <!-- Row END -->--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Upload profile -->--%>
<%--                    <div class="col-xxl-4">--%>
<%--                        <div class="bg-secondary-soft px-4 py-5 rounded">--%>
<%--                            <div class="row g-3">--%>
<%--                                <h4 class="mb-4 mt-0">Upload your profile photo</h4>--%>
<%--                                <div class="text-center">--%>
<%--                                    <!-- Image upload -->--%>
<%--                                    <div class="square position-relative display-2 mb-3">--%>
<%--                                        <i class="fas fa-fw fa-user position-absolute top-50 start-50 translate-middle text-secondary"></i>--%>
<%--                                    </div>--%>
<%--                                    <!-- Button -->--%>
<%--                                    <input type="file" id="customFile" name="file" hidden="">--%>
<%--                                    <label class="btn btn-success-soft btn-block" for="customFile">Upload</label>--%>
<%--                                    <button type="button" class="btn btn-danger-soft">Remove</button>--%>
<%--                                    <!-- Content -->--%>
<%--                                    <p class="text-muted mt-3 mb-0"><span class="me-1">Note:</span>Minimum size 300px x 300px</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div> <!-- Row END -->--%>

<%--                <!-- Social media detail -->--%>
<%--                <div class="row mb-5 gx-5">--%>
<%--                    <div class="col-xxl-6 mb-5 mb-xxl-0">--%>
<%--                        <div class="bg-secondary-soft px-4 py-5 rounded">--%>
<%--                            <div class="row g-3">--%>
<%--                                <h4 class="mb-4 mt-0">Social media detail</h4>--%>
<%--                                <!-- Facebook -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label"><i class="fab fa-fw fa-facebook me-2 text-facebook"></i>Facebook *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Facebook" value="http://www.facebook.com">--%>
<%--                                </div>--%>
<%--                                <!-- Twitter -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label"><i class="fab fa-fw fa-twitter text-twitter me-2"></i>Twitter *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Twitter" value="http://www.twitter.com">--%>
<%--                                </div>--%>
<%--                                <!-- Linkedin -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label"><i class="fab fa-fw fa-linkedin-in text-linkedin me-2"></i>Linkedin *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Linkedin" value="http://www.linkedin.com">--%>
<%--                                </div>--%>
<%--                                <!-- Instragram -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label"><i class="fab fa-fw fa-instagram text-instagram me-2"></i>Instagram *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Instragram" value="http://www.instragram.com">--%>
<%--                                </div>--%>
<%--                                <!-- Dribble -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label"><i class="fas fa-fw fa-basketball-ball text-dribbble me-2"></i>Dribble *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Dribble" value="http://www.dribble.com">--%>
<%--                                </div>--%>
<%--                                <!-- Pinterest -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label class="form-label"><i class="fab fa-fw fa-pinterest text-pinterest"></i>Pinterest *</label>--%>
<%--                                    <input type="text" class="form-control" placeholder="" aria-label="Pinterest" value="http://www.pinterest.com">--%>
<%--                                </div>--%>
<%--                            </div> <!-- Row END -->--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <!-- change password -->--%>
<%--                    <div class="col-xxl-6">--%>
<%--                        <div class="bg-secondary-soft px-4 py-5 rounded">--%>
<%--                            <div class="row g-3">--%>
<%--                                <h4 class="my-4">Change Password</h4>--%>
<%--                                <!-- Old password -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label for="exampleInputPassword1" class="form-label">Old password *</label>--%>
<%--                                    <input type="password" class="form-control" id="exampleInputPassword1">--%>
<%--                                </div>--%>
<%--                                <!-- New password -->--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <label for="exampleInputPassword2" class="form-label">New password *</label>--%>
<%--                                    <input type="password" class="form-control" id="exampleInputPassword2">--%>
<%--                                </div>--%>
<%--                                <!-- Confirm password -->--%>
<%--                                <div class="col-md-12">--%>
<%--                                    <label for="exampleInputPassword3" class="form-label">Confirm Password *</label>--%>
<%--                                    <input type="password" class="form-control" id="exampleInputPassword3">--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div> <!-- Row END -->--%>
<%--                <!-- button -->--%>
<%--                <div class="gap-3 d-md-flex justify-content-md-end text-center">--%>
<%--                    <button type="button" class="btn btn-danger btn-lg">Delete profile</button>--%>
<%--                    <button type="button" class="btn btn-primary btn-lg">Update profile</button>--%>
<%--                </div>--%>
<%--            </form> <!-- Form END -->--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
</body>
</html>
