<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.time.LocalDate" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="icon" href="${root}/assets/favicon.ico" type="image/x-icon">
  <meta name="author" content="templatemo">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

  <title>Vlogs</title>

  <!-- Bootstrap core CSS -->
  <link href="${root}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Additional CSS Files -->
  <link rel="stylesheet" href="${root}/assets/css/fontawesome.css">
  <link rel="stylesheet" href="${root}/assets/css/templatemo-snapx-photography.css">
  <link rel="stylesheet" href="${root}/assets/css/owl.css">
  <link rel="stylesheet" href="${root}/assets/css/animate.css">
  <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
    crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link rel="stylesheet" href="${root}/assets2/css/style.css">

  <style type="text/css">
    body {
      background-image: url('${root}/assets/images/dive-background.jpg');
      background-size: cover;
      background-position: center;
      padding-top: 20px;
    }

    .date-container {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .profile-pic {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      object-fit: cover;
      border: 2px solid #ccc;
    }

    .custom-img {
      width: 200px;
      height: 200px;
      object-fit: cover;
    }

    .diveImg {
      width: 700px;
      height: 600px;
      object-fit: cover;
      margin: 20px auto;
      display: block;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .comment-form-wrap {
      width: 100%;
      max-width: 900px;
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .comment-form-wrap table {
      width: 100%;
      border-collapse: collapse;
    }

    .comment-form-wrap td {
      padding: 10px;
      border: 1px solid #ddd;
      vertical-align: top;
    }

    .comment-form-wrap input, .comment-form-wrap textarea {
      width: 100%;
      padding: 10px;
      font-size: 1rem;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    .comment-form-wrap input[type="submit"] {
      background-color: #007bff;
      color: #fff;
      padding: 10px 20px;
      font-size: 1rem;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .comment-form-wrap input[type="submit"]:hover {
      background-color: #0056b3;
    }

    .row.text-start.pt-5.border-top {
      border-top: none;
    }
  a:hover {
    color: #007bff; /* 懸停時的顏色 */
    text-decoration: none; /* 懸停時移除下劃線 */
  }
  </style>
</head>

<body>
  <!-- header -->
  <jsp:include page="/WEB-INF/view/component/header.jsp"></jsp:include>
  <!-- header end -->

  <main>
    <section class="text-center container">
      <div class="row" style="margin-top: 0; padding-top: 0; display: flex; justify-content: center;">
        <div class="col-lg-6 col-md-8 mx-auto">
          <div class="date-container">
            <figure class="author-figure mb-0 me-3 d-inline-block">
              <a href="${root}/member/${vlog.member.memberId}">
                <img src="${vlog.member.base64Photo}" alt="Image" class="profile-pic" style="width: 100px; height: 100px; border-radius: 50%;">
              </a>
            </figure>
            <a href="${root}/member/${vlog.member.memberId}">
              <span class="d-inline-block mt-1" style="font-size: 1.5rem; font-weight: bold;">${vlog.member.memberName}</span>
            </a>
            <div>${vlog.member.divingLicense}</div>
          </div>
        </div>
      </div>
    </section>
    <hr>

    <div class="section search-result-wrap">
      <div class="container">
        <div class="row posts-entry">
          <div class="col-lg-8">
            <div class="blog-entry d-flex blog-entry-search-item">
              <div>
                <h3 class="mb-4">
                  Dive Record #${vlogSeq}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <fmt:formatDate value="${vlog.divingDate}" pattern="yyyy年MM月dd日" />
                  <c:if test="${isOwner}">
                    <a href="${root}/UpdateVlog?vlogId=${vlog.vlogId}" class="btn btn-primary btn-sm">編輯</a>
                  </c:if>
                </h3>
                <div class="comment-form-wrap">
                  <form action="${root}/UpdateVlog" method="POST" enctype="multipart/form-data">
                  <input type="hidden" name="vlogId" value="${vlog.vlogId}" />
                    <table>
                      <tr>
                        <td>
                          <strong>潛水日期:</strong>
                          <input type="date" name="divingDate" value="${vlog.divingDate}" required><br>
                          <strong>地點:</strong>
                          <input type="text" name="location" value="${vlog.location}" required><br>
                          <strong>氣象:</strong>
                          <input type="text" name="weather" value="${vlog.weather}" required>
                        </td>
                        <td>
                          <strong>潛水種類:</strong>
                          <input type="text" name="divingType" value="${vlog.divingType}" required><br>
                          <strong>氣瓶種類:</strong>
                          <input type="text" name="tankType" value="${vlog.tankType}" required>
                        </td>
                        <td>
                          <strong>潛伴:</strong>
                          <input type="text" name="partner" value="${vlog.partner}" required><br>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <strong>下水時間:</strong>
                          <input type="time" name="enterWaterTime" value="${vlog.enterWaterTime}" required><br>
                          <strong>出水時間:</strong>
                          <input type="time" name="exitWaterTime" value="${vlog.exitWaterTime}" required> <br><br>
                          <strong>潛水時長(分鐘):</strong>
                          <input type="number" name="divingDuration" value="${vlog.divingDuration}" required> <br>
                        </td>
                        <td>
                          <strong>平均深度(m):</strong>
                          <input type="number" name="avgDepth" value="${vlog.avgDepth}" required><br>
                          <strong>最大深度(m):</strong>
                          <input type="number" name="maxDepth" value="${vlog.maxDepth}" required><br><br>
                          <strong>平均溫度(°C):</strong>
                          <input type="number" name="avgTemp" value="${vlog.avgTemp}" required>
                        </td>
                        <td>
                          <strong>氣瓶原始氣壓(bar):</strong>
                          <input type="number" name="tankPressOrigin" value="${vlog.tankPressOrigin}" required><br>
                          <strong>氣瓶殘壓(bar):</strong>
                          <input type="number" name="tankPressRemain" value="${vlog.tankPressRemain}" required><br><br>
                          <strong>能見度(m):</strong>
                          <input type="number" name="visibility" value="${vlog.visibility}" required><br>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="3">
                          <strong>潛水心得:</strong><br>
                          <textarea name="comments" rows="4" required>${vlog.comments}</textarea>
                        </td>
                      </tr>
                      <tr>
<td colspan="3">
    <!-- 舊圖片的 Base64 -->
    <input type="hidden" name="base64DivingPhoto" value="${vlog.base64DivingPhoto}">

    <!-- 新圖片欄位 -->
    <label for="divingPhoto">更新照片：</label>
    <input type="file" name="divingPhoto" id="divingPhoto" accept="image/*">

    <!-- 圖片預覽區 -->
    <div id="imagePreview" style="margin-top: 10px;">
        <img id="previewImg" 
             src="data:image/jpeg;base64,${vlog.base64DivingPhoto}" 
             alt="預覽" 
             style="max-width: 300px; max-height: 300px; display: block;">
    </div>
</td>

                      </tr>
                    </table>
                    <br>
                    <input type="submit" value="確認修改">
                    <a href="javascript:history.back();" style=" text-decoration: underline;font-size=20px;">
  取消修改，返回上一頁
</a>
                    
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
  <script>
    document.getElementById('divingPhoto').addEventListener('change', function (event) {
        const file = event.target.files[0]; // 獲取用戶選擇的檔案
        const previewImg = document.getElementById('previewImg'); // 預覽圖片元素

        if (file) {
            const reader = new FileReader(); // 建立 FileReader
            reader.onload = function (e) {
                previewImg.src = e.target.result; // 將圖片內容設定為 src
            };
            reader.readAsDataURL(file); // 讀取檔案，轉換為 Base64
        } else {
            // 如果沒有選擇檔案，顯示舊圖片或清空預覽
            previewImg.src = "data:image/jpeg;base64,${vlog.base64DivingPhoto}";
        }
    });
</script>
  
</body>
</html>
