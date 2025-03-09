<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.time.LocalDate" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <% // 獲取當前日期 (yyyy-MM-dd 格式) String today=LocalDate.now().toString(); %>
          <!DOCTYPE html>
          <html>

          <head>
            <meta charset="UTF-8">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="icon" href="${root}/assets/favicon.ico" type="image/x-icon">
            <meta name="author" content="templatemo">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
              rel="stylesheet">

            <title>Create Log</title>

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

            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;600;700&display=swap"
              rel="stylesheet">


            <link rel="stylesheet" href="${root}/assets2/fonts/icomoon/style.css">
            <link rel="stylesheet" href="${root}/assets2/fonts/flaticon/font/flaticon.css">

            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

            <link rel="stylesheet" href="${root}/assets2/css/tiny-slider.css">
            <link rel="stylesheet" href="${root}/assets2/css/aos.css">
            <link rel="stylesheet" href="${root}/assets2/css/glightbox.min.css">
            <link rel="stylesheet" href="${root}/assets2/css/style.css">

            <link rel="stylesheet" href="${root}/assets2/css/flatpickr.min.css">
            <style type="text/css">
              body {
                /*             font-family: 'Roboto', sans-serif; */
                background-image: url('${root}/assets/images/dive-background.jpg');
                background-size: cover;
                background-position: center;
                padding-top: 20px;
              }

              .date-container {
                display: flex;
                align-items: center;
                /* 垂直居中 */
                gap: 10px;
                /* 圖片和文字之間的間距 */
              }

              .profile-pic {
                width: 50px;
                /* 設定固定寬度 */
                height: 50px;
                /* 設定固定高度 */
                border-radius: 50%;
                /* 圓形圖片 */
                object-fit: cover;
                /* 保證圖片完整顯示 */
                border: 2px solid #ccc;
                /* 可選：添加邊框 */
              }

              .custom-img {
                width: 200px;
                /* 設定固定寬度 */
                height: 200px;
                /* 設定固定高度 */
                object-fit: cover;
                /* 保證圖片不會變形，保持比例 */
              }

              .diveImg {
                width: 700px;
                /* 固定圖片寬度 */
                height: 600px;
                /* 固定圖片高度 */
                object-fit: cover;
                /* 圖片內容覆蓋並裁剪多餘部分 */
                margin: 20px auto;
                /* 上下留白並置中 */
                display: block;
                /* 讓圖片以塊級元素顯示 */
                border: 2px;
                /* 可選：添加邊框 */
                border-radius: 10px;
                /* 可選：圓角效果 */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                /* 可選：陰影效果 */
              }

              .comment-form-wrap {
                width: 100%;
                max-width: 600px;
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
              }

              textarea {
                width: 100%;
                padding: 10px;
                font-size: 1rem;
                border: 1px solid #ccc;
                border-radius: 5px;
                resize: none;
                outline: none;
                max-width: 600px;
              }

              textarea:focus {
                border-color: #007bff;
              }

              input[type="submit"] {
                background-color: #007bff;
                color: #fff;
                padding: 10px 20px;
                font-size: 1rem;
                border: none;
                border-radius: 5px;
                cursor: pointer;
              }

              input[type="submit"]:hover {
                background-color: #0056b3;
              }

            </style>
          </head>

          <body>
            <!-- header -->
            <jsp:include page="/WEB-INF/view/component/header.jsp"></jsp:include>
            <!-- header end -->

            <main>

              <div class="section search-result-wrap">
                <div class="container">
                  <div class="row posts-entry">
                    <div class="col-lg-8">
                      <div class="blog-entry d-flex blog-entry-search-item">
                        <div>

                          <h3 class="mb-4" style="margin:50px;">新增潛水記錄</h3>
                          
                          <div class="date-container">
                            <form action="${root}/CreateVlog" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
<table style="width: 100%; border-collapse: collapse; margin-top: 0px; border: 1px solid #ddd;">
  <!-- 新增一列，合併三欄 -->
  <tr>
    <td colspan="3" style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
      <label for="divingDate"><strong>潛水日期:</strong></label>
      <input type="date" id="divingDate" name="divingDate" class="form-control" required max="<%= java.time.LocalDate.now() %>">

    </td>
  </tr>
  <!-- 原來的第一列 -->
  <tr>
    <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
      <label for="location"><strong>地點:</strong></label>
      <input type="text" id="location" name="location" class="form-control" required><br>
      <label for="weather"><strong>氣象:</strong></label>
      <input type="text" id="weather" name="weather" class="form-control">
    </td>
    <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
      <label for="divingType"><strong>潛水種類:</strong></label>
      <input type="text" id="divingType" name="divingType" class="form-control"><br>
      <label for="tankType"><strong>氣瓶種類:</strong></label>
      <input type="text" id="tankType" name="tankType" class="form-control">
    </td>
    <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
      <label for="partner"><strong>潛伴:</strong></label>
      <input type="text" id="partner" name="partner" class="form-control">
    </td>
  </tr>
  <!-- 其餘的表格內容保持不變 -->
  <tr>
    <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
      <label for="enterWaterTime"><strong>下水時間:</strong></label>
      <input type="time" id="enterWaterTime" name="enterWaterTime" class="form-control"><br>
      <label for="exitWaterTime"><strong>出水時間:</strong></label>
      <input type="time" id="exitWaterTime" name="exitWaterTime" class="form-control"><br><br>
      <label for="divingDuration"><strong>潛水時長:</strong></label>
      <input type="number" id="divingDuration" name="divingDuration" class="form-control" placeholder="分鐘">
    </td>
    <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
      <label for="avgDepth"><strong>平均深度:</strong></label>
      <input type="number" id="avgDepth" name="avgDepth" class="form-control" placeholder="m"><br>
      <label for="maxDepth"><strong>最大深度:</strong></label>
      <input type="number" id="maxDepth" name="maxDepth" class="form-control" placeholder="m"><br><br>
      <label for="avgTemp"><strong>平均溫度:</strong></label>
      <input type="number" id="avgTemp" name="avgTemp" class="form-control" placeholder="°C">
    </td>
    <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
      <label for="tankPressOrigin"><strong>氣瓶原始氣壓:</strong></label>
      <input type="number" id="tankPressOrigin" name="tankPressOrigin" class="form-control" placeholder="psi"><br>
      <label for="tankPressRemain"><strong>氣瓶殘壓:</strong></label>
      <input type="number" id="tankPressRemain" name="tankPressRemain" class="form-control" placeholder="psi"><br><br>
      <label for="visibility"><strong>能見度:</strong></label>
      <input type="number" id="visibility" name="visibility" class="form-control" placeholder="m">
    </td>
  </tr>
<tr>
  <td colspan="3" style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
    <label for="divingPhoto" style="margin-top: 15px;"><strong>照片上傳:</strong></label>
    <input type="file" id="divingPhoto" name="divingPhoto" class="form-control" accept="image/*" onchange="previewImage(event)"><br>
    
    <!-- 顯示預覽圖片的區域 -->
    <div id="imagePreview">
      <img id="previewImg" src="" alt="預覽圖片" class="custom-img" style="display: none;">
    </div>
    
    <label for="comments"><strong>心得:</strong></label>
    <textarea id="comments" name="comments" class="form-control" rows="4"></textarea><br>
    <button type="submit" class="btn btn-primary">提交</button>
  </td>
</tr>
                            </form>
                          </div>

                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </main>

            <script src="${root}/assets2/js/bootstrap.bundle.min.js"></script>
            <script src="${root}/assets2/js/tiny-slider.js"></script>
            <script src="${root}/assets2/js/flatpickr.min.js"></script>
            <script src="${root}/assets2/js/aos.js"></script>
            <script src="${root}/assets2/js/glightbox.min.js"></script>
            <script src="${root}/assets2/js/navbar.js"></script>
            <script src="${root}/assets2/js/counter.js"></script>
            <script src="${root}/assets2/js/custom.js"></script>
            
            <script>
  function previewImage(event) {
    var reader = new FileReader();  // FileReader 物件用來讀取文件
    reader.onload = function() {
      var previewImg = document.getElementById('previewImg');
      previewImg.src = reader.result;  // 設定圖片的 src 為讀取的文件
      previewImg.style.display = 'block';  // 顯示圖片
    };
    reader.readAsDataURL(event.target.files[0]);  // 讀取選中的文件
  }
</script>
          </body>

          </html>