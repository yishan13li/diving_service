<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<%
    // 獲取當前日期 (yyyy-MM-dd 格式)
    String today = LocalDate.now().toString();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" href="${root}/assets/favicon.ico" type="image/x-icon">
    <meta name="author" content="templatemo">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>個人資料</title>

    <!-- Bootstrap core CSS -->
    <link href="${root}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="${root}/assets/css/fontawesome.css">
    <link rel="stylesheet" href="${root}/assets/css/templatemo-snapx-photography.css">
    <link rel="stylesheet" href="${root}/assets/css/owl.css">
    <link rel="stylesheet" href="${root}/assets/css/animate.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style type="text/css">
.profile-photo {
    width: 300px;  /* 設定圖片的寬度 */
    height: 300px; /* 設定圖片的高度 */
    object-fit: cover; /* 保持比例並裁切圖片以符合容器 */
    border-radius: 50%; /* 圓形顯示 */
    margin: 0 auto; /* 居中顯示 */
}

        .profile-info {
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }

        .profile-container {
            margin: 70px auto;
        }

        .profile-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .profile-table td {
            padding: 10px;
            text-align: right;
            color: gray;
        }

        .profile-table .label {
            font-weight: bold;
            color: gray;
            text-align: left;
        }

        h2 {
            color: gray;
        }

        /* 無法編輯時的樣式 */
        .readonly {
            background-color: white;
            color: gray;
        }

        /* 編輯時的樣式 */
        .editable {
            background-color: #f0f0f0;
            color: black;
        }

        /* 隱藏的按鈕 */
        .hidden {
            display: none;
        }

        .profile-table td input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
        }

        .btn_margin {
            margin: 20px;
            
        }

		.button_container{
		    margin-top: 20px;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    width: 100%; /* 確保占滿父容器寬度 */
    max-width: 100%; /* 防止被其他父容器限制 */
		}
.photo_container_width {
    width: 300px;  /* 容器寬度 */
    height: 300px; /* 容器高度 */
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden; /* 超出部分隱藏 */
    border-radius: 50%; /* 圓形容器 */
}
            
.diving-license-group {
    display: flex;
    align-items: center;  /* 垂直居中對齊 */
    margin-bottom: 10px;
    flex-direction: row;  /* 確保 checkbox 和 label 顯示為橫向排列 */
    width: 100%;  /* 確保容器占滿父容器的寬度 */
    box-sizing: border-box;  /* 包括內邊距和邊框在內的寬度計算 */
}

.diving-license-group label {
    margin-left: 10px; /* 給 label 增加一些左邊距離 */
    text-align: left; /* 確保 label 的文字左對齊 */
    flex: 1; /* 確保 label 占滿剩餘空間 */
}

.diving-license-group input {
    margin-right: 10px;  /* 增加 checkbox 和 label 之間的間距 */
}

    </style>
</head>
<body>
    <!-- header -->
    <jsp:include page="/WEB-INF/view/component/header.jsp"></jsp:include>
    <!-- header end -->

    <!-- Profile Section -->
    <main>
        <div class="container py-5">
            <div class="row profile-container">
                <div class="col-lg-9 mx-auto">
                    <h2>基本資料</h2>
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="photo_container_width">
                                    <!-- 顯示會員照片，若無照片則顯示預設圖 -->
                                    <c:if test="${empty memberInfo.base64Photo}">
                                        <img src="${root}/assets/images/noImg.png" class="profile-photo img-fluid" alt="預設頭像">
                                    </c:if>
                                    <c:if test="${not empty memberInfo.base64Photo}">
                                        <!-- 顯示會員上傳的照片 -->
                                        <img src="${memberInfo.base64Photo}" class="profile-photo img-fluid" alt="會員頭像">
                                    </c:if>
                                </div>
                                <div class="profile-info">
                                    <form id="profileForm" method="post" action="${root}/UpdateMember" enctype="multipart/form-data" accept-charset="UTF-8">
                                        <table class="profile-table">
                                            <tr>
                                                <td class="label">姓名:</td>
                                                <td>
                                                    <input type="text" name="memberName" value="${memberInfo.memberName}" readonly class="form-control readonly" id="memberName">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="label">Email:</td>
                                                <td>
                                                    <input type="text" name="email" value="${memberInfo.email}" readonly class="form-control readonly" id="email">
                                                	<c:if test="${not empty errorMessage}">
													    <div class="alert alert-danger">
													        <span>${errorMessage}</span>
													    </div>
													</c:if>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="label">Password:</td>
                                                <td>
 <input type="password" name="password" value="********" disabled readonly class="form-control readonly" id="password">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="label">生日:</td>
                                                <td>
                                                    <input type="date" name="birthDate" value="${memberInfo.birthDate}" max="<%= java.time.LocalDate.now() %>" readonly class="form-control readonly" id="birthDate">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="label">潛水證照:</td>
<td>
    <div class="diving-license-group">
        <label><input type="checkbox" name="divingLicense" value="(OW)" class="readonly" disabled
            <c:if test="${not empty memberInfo.divingLicense && memberInfo.divingLicense.indexOf('(OW)') >= 0}">checked</c:if>>開放水域潛水員(OW)</label>
    </div>
    <div class="diving-license-group">
        <label><input type="checkbox" name="divingLicense" value="(AOW)" class="readonly" disabled
            <c:if test="${not empty memberInfo.divingLicense && memberInfo.divingLicense.indexOf('(AOW)') >= 0}">checked</c:if>>進階開放水域潛水員(AOW)</label>
    </div>
    <div class="diving-license-group">
        <label><input type="checkbox" name="divingLicense" value="(Rescue)" class="readonly" disabled
            <c:if test="${not empty memberInfo.divingLicense && memberInfo.divingLicense.indexOf('(Rescue)') >= 0}">checked</c:if>>救援潛水員(Rescue)</label>
    </div>
    <div class="diving-license-group">
        <label><input type="checkbox" name="divingLicense" value="(DM)" class="readonly" disabled
            <c:if test="${not empty memberInfo.divingLicense && memberInfo.divingLicense.indexOf('(DM)') >= 0}">checked</c:if>>潛水長(DM)</label>
    </div>
    <div class="diving-license-group">
        <label><input type="checkbox" name="divingLicense" value="(Instructor)" class="readonly" disabled
            <c:if test="${not empty memberInfo.divingLicense && memberInfo.divingLicense.indexOf('(Instructor)') >= 0}">checked</c:if>>教練(Instructor)</label>
    </div>
</td>
                                             
<%--                                                     
<input type="text" name="divingLicense" value="${memberInfo.divingLicense}" readonly class="form-control readonly" id="divingLicense"> --%>
                                            </tr>
                                            <tr>
                                                <td class="label">大頭貼:</td>
                                                <td>
                                                    <!-- 編輯大頭貼時仍然可以上傳圖片 -->
                                                    <input type="file" accept="image/*" name="memberPhoto" id="memberPhoto" class="form-control" ${isEditing ? "" : "disabled"}>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="button_container">
	                                        <button type="button" class="btn btn-primary btn_margin" id="editButton" onclick="toggleEdit()">修改資料</button>
	                                        <button type="submit" class="btn btn-success hidden btn_margin" id="saveButton">確定修改</button>
                                    	</div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- footer -->
    <jsp:include page="/WEB-INF/view/component/footer.jsp"></jsp:include>

    <!-- Scripts -->
    <script src="${root}/vendor/jquery/jquery.min.js"></script>
    <script src="${root}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="${root}/assets/js/isotope.min.js"></script>
    <script src="${root}/assets/js/owl-carousel.js"></script>
    <script src="${root}/assets/js/tabs.js"></script>
    <script src="${root}/assets/js/popup.js"></script>
    <script src="${root}/assets/js/custom.js"></script>
    <script type="text/javascript">
        function toggleEdit() {
            const editButton = document.getElementById("editButton");
            const saveButton = document.getElementById("saveButton");

            const isEditing = editButton.textContent === "編輯中...";

            const fields = document.querySelectorAll("input");
            fields.forEach(field => {
                if (isEditing) {
                    field.readOnly = true;
                    field.classList.add("readonly");
                    field.classList.remove("editable");
                    if (field.type === "file"  || field.type === "checkbox") {
                        field.disabled = true;
                    }
                } else {
                    field.readOnly = false;
                    field.classList.add("editable");
                    field.classList.remove("readonly");
                    if (field.type === "file"  || field.type === "checkbox") {
                        field.disabled = false;
                    }
                }
            });

            if (isEditing) {
                editButton.textContent = "修改資料";
                saveButton.classList.add("hidden");
                editButton.disabled = false;
            } else {
                editButton.textContent = "編輯中...";
                saveButton.classList.remove("hidden");
                editButton.disabled = true;
                editButton.classList.add("hidden");
            }
        }
    </script>
</body>
</html>
