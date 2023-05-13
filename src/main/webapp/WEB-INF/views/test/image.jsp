<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Image Upload</title>

    <style>
        .upload__img-preview {
            max-width: 200px;
            max-height: 200px;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<h1>Image Upload</h1>




<%--POST nhiều ảnh--%>
<%--<div>--%>
<%--    <form:form method="POST" action="/upload" enctype="multipart/form-data">--%>
<%--        <div class="upload__btn-box">--%>
<%--            <label for="listImage">Upload Images:</label>--%>
<%--            <input type="file" id="listImage" name="listImage" multiple="multiple" required />--%>
<%--            <button type="submit">Upload</button>--%>
<%--        </div>--%>
<%--    </form:form>--%>
<%--    <div id="imagePreview"></div>--%>
<%--</div>--%>


<%--POST 1 ảnh duy nhất--%>
<div>
    <form method="POST" action="/upload" enctype="multipart/form-data">
        <label for="listImage">Upload Images:</label>
        <input type="file" id="listImage" name="listImage" required />
        <button type="submit">Upload</button>
    </form>
    <div id="imagePreview"></div>
</div>



<c:forEach var="img" items="${listImage}">
    <img class="upload__img-preview" src="${img.urlImage}" alt="Uploaded Image" width="200" />
</c:forEach>

<h2>List of Images</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Image URL</th>
        <th>Preview</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="image" items="${listImage}">
        <tr>
            <td>${image.id}</td>
            <td>${image.urlImage}</td>
            <td><img src="${image.urlImage}" alt="Image" width="100" height="100" /></td>
        </tr>
    </c:forEach>
    </tbody>
</table>




<script>
    document.getElementById("listImage").addEventListener("change", function(event) {
        var files = event.target.files;
        var imagePreview = document.getElementById("imagePreview");
        imagePreview.innerHTML = ""; // Xóa nội dung cũ trong imagePreview

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            if (!file.type.startsWith('image/')){ continue; } // Kiểm tra file có phải hình ảnh không
            var img = document.createElement("img");
            img.classList.add("img-responsive");
            img.style.width = "200px";
            img.style.height = "200px";
            img.style.margin = "10px";
            img.file = file;
            imagePreview.appendChild(img); // Thêm hình ảnh vào imagePreview

            // Đọc và hiển thị hình ảnh
            var reader = new FileReader();
            reader.onload = (function(aImg) { return function(e) { aImg.src = e.target.result; }; })(img);
            reader.readAsDataURL(file);
        }
    });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


</body>
</html>
