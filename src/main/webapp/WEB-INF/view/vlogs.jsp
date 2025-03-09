<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.time.LocalDate" %>
      <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

            <title>Dive Journal</title>

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
                background-size: cover;
                background-position: center;
                padding-top: 20px;
              }

              .date-container {
                display: flex;
                align-items: center;
                /* 垂直居中 */
                gap: 15px;
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
                border: 2px #ccc;
                /* 添加邊框 */
                gap: 10px;
              }

              .custom-img {
                min-width: 250px;
                /* 設置最小寬度 */
                width: 250px;
                /* 設置最小寬度 */
                height: 250px;
                /* 設定固定高度 */
                object-fit: cover;
                border-radius: 10px;
                border: 2px #ccc;
                margin-right: 30px;
              }

              .review {
                display: -webkit-box;
                -webkit-line-clamp: 2;
                /* 顯示兩行 */
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
                /* 超出部分顯示為省略號 */
                font-size: 1rem;
                /* 可以調整字體大小 */
                line-height: 1.5;
                /* 控制行高 */
                color: #555;
                /* 調整字體顏色 */
                width: 100%;
                /* 設定寬度為父元素的 80% */
                max-width: 700px;
                /* 設定最大寬度為 300px（可根據需要調整） */
                text-align: justify;
                text-indent: 2em;
                /* 開頭空兩格 */
              }

              .blog-entry {
                display: flex;
                justify-content: flex-start;
                align-items: flex-start;
              }
                         .license {
        border-bottom: 2px solid #d3d3d3;  /* 設置淺灰色的底部邊框 */
    padding-bottom: 2px;  /* 給文字底部一些間距，使邊框不會太靠近文字 */
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
                    <p class="lead text-muted" style="font-size: 1.2rem; line-height: 1.5;">
        <h2>Dive Logs</h2>
<div class="dive-logs-header" style="display: flex; align-items: center;">
    <!-- 左邊部分：照片和名字 -->
    <div class="profile-info" style="display: flex; align-items: center; margin-right: 20px;">
        <figure class="author-figure mb-0 me-3 d-inline-block">
<a href="javascript:void(0);" onclick="window.location.href=window.location.href;" style="text-decoration: none;">
    <c:if test="${Vlogs[0].member.base64Photo==null}">
        <img src="${root}/assets/images/noImg.png" alt="Image" class="profile-pic"
             style="width: 100px; height: 100px; border-radius: 50%;">
    </c:if>
    <c:if test="${Vlogs[0].member.base64Photo!=null}">
        <img src="${Vlogs[0].member.base64Photo}" alt="Image" class="profile-pic"
             style="width: 100px; height: 100px; border-radius: 50%;">
    </c:if>
</a>
        </figure>
  <a href="javascript:void(0);" onclick="window.location.href=window.location.href;" style="text-decoration: none;">
    <span class="d-inline-block mt-1" style="font-size: 1.5rem; font-weight: bold;">
        ${Vlogs[0].member.memberName}
    </span>
</a>

    </div>

    <!-- 右邊部分：Dive Logs -->
    <div class="dive-logs-title">
        <span class="license">${Vlogs[0].member.divingLicense}</span>
    </div>
</div>

                    </p>
                  </div>
                </div>
              </section>
              <hr>
              <c:if test="${isOwner}">
                <!--     當 vlog 的 memberId 和 loggedInMember.id 相同時顯示按鈕 -->
                <a href="${root}/CreateVlog" class="btn btn-primary btn-sm" style="float:center;">Create Log</a>
              </c:if>

              <div class="section search-result-wrap">
                <div class="container">
                  <div class="row posts-entry">
                    <div class="col-lg-8">
                      <c:forEach items="${Vlogs}" var="v">
                        <c:if test="${isOwner}">
                          <!-- 當 vlog 的 memberId 和 loggedInMember.id 相同時顯示按鈕 -->
                          <a href="javascript:void(0);" class="btn btn-primary btn-sm delete-btn"
                            data-vlog-id="${v.vlogId}">Delete</a>
                        </c:if>
                        <div class="blog-entry d-flex blog-entry-search-item">
                                                 <c:if test="${v.base64DivingPhoto==null}">
                        <img class="img-fluid custom-img" src="${root}/assets/images/whale_shark.jpg" alt="Image">
                        </c:if>
                        <c:if test="${v.base64DivingPhoto!=null}">
                          <img class="img-fluid custom-img" src="${v.base64DivingPhoto}" alt="Image">
                          </c:if>
                          <div>
                            <div class="date-container"
                              style="display: flex; justify-content: space-between; align-items: center;">
                              <div>
                                                  <a href="${root}/page/vlogs?memberId=${v.member.memberId}" style="display: inline-block;">
                    <c:if test="${v.member.base64Photo==null}">
                        <img class="profile-pic" alt="Profile Picture" src="${root}/assets/images/noImg.png">
                        </c:if>
                        <c:if test="${v.member.base64Photo!=null}">
                        <img class="profile-pic" alt="Profile Picture" src="${v.member.base64Photo}">
                    	</c:if>
                    </a>
                    <a href="${root}/page/vlogs?memberId=${v.member.memberId}" style="text-decoration: none; color: inherit;">
                        <span style="font-size: 1.5rem; font-weight: bold;">${v.member.memberName}</span>
                    </a>
                              </div>
                              <span class="date" style="text-align: right;">
                                ${v.createdAt} &bullet; <span>ScubaDiving</span>
                              </span>
                            </div>
                            <br>

                            <p style="text-align: left; text-indent: 2em;">
                              <fmt:formatDate value="${v.divingDate}" pattern="yyyy/MM/dd" />, ${v.location},
                              ${v.weather}, ${v.divingType}<br>
                            </p>
                            <div class="review" style="text-align: right;">
                              ${v.comments} <!-- 假設這是潛水心得 -->
                            </div>
                            <p style="text-align: right; margin-top: 40px;">
                              <a href="${root}/page/vlog?vlogId=${v.vlogId}&vlogSeq=${v.vlogSeq}"
                                class="btn btn-sm btn-outline-primary">Read More</a>
                            </p>
                          </div>
                        </div>
                        <hr>
                      </c:forEach>

                      <!-- 頁碼 -->
                      <div class="row text-start pt-5 border-top">
                        <div class="col-md-12">
                          <div class="custom-pagination">
<!--                             <span>1</span> -->
<!--                             <a href="#">2</a> -->
<!--                             <a href="#">3</a> -->
<!--                             <a href="#">4</a> -->
<!--                             <span>...</span> -->
<!--                             <a href="#">15</a> -->
                          </div>
                        </div>
                      </div>

                    </div>
                    <!-- 側欄開始 -->
                    <div class="col-lg-4 sidebar">

                      <!-- 搜尋框 -->
                      <div class="sidebar-box search-form-wrap mb-4">
                        <form action="#" class="sidebar-search-form">
                          <!--               <span class="bi-search" style="position: absolute; top: 50%; left: 10px; transform: translateY(-50%);"></span> -->
                          <input type="text" class="form-control" id="s" placeholder="Type a keyword and hit enter">
                        </form>
                      </div>
                      <div class="sidebar-box">
                        <!-- 受歡迎-->
                        <h3 class="heading">Popular Logs Top 5</h3>
                        <div class="post-entry-sidebar">
                          <ul>
                              <li>
                                <a href="">
                                  <img src="${root}/assets/images/popular_1.jpg" alt="Image placeholder" class="me-4 rounded">
                                  <div class="text">
                                    <h6>跟小琉球的綠蠵龜 小班合照 他表情超有戲XDD</h6>
                                    <div class="post-meta">
                                      <span class="mr-2">2010年8月18日 </span>
                                    </div>
                                  </div>
                                </a>
                              </li>
                                                            <li>
                                <a href="">
                                  <img src="${root}/assets/images/popular_2.jpg" alt="Image placeholder" class="me-4 rounded">
                                  <div class="text">
                                    <h6>超大魚群 密集恐懼慎入!!</h6>
                                    <div class="post-meta">
                                      <span class="mr-2">2006年10月2日</span>
                                    </div>
                                  </div>
                                </a>
                              </li>
                                                            <li>
                                <a href="">
                                  <img src="${root}/assets/images/popular_3.jpg" alt="Image placeholder" class="me-4 rounded">
                                  <div class="text">
                                    <h6>魟魚真的好萌 好像帶回家><(或是我不要回家嘻嘻)</h6>
                                    <div class="post-meta">
                                      <span class="mr-2">2018年3月26日</span>
                                    </div>
                                  </div>
                                </a>
                              </li>
                                                            <li>
                                <a href="">
                                  <img src="${root}/assets/images/popular_4.jpg" alt="Image placeholder" class="me-4 rounded">
                                  <div class="text">
                                    <h6>沈船大體驗!!!可惜沒找到寶藏 可惡!</h6>
                                    <div class="post-meta">
                                      <span class="mr-2">2022年1月26日</span>
                                    </div>
                                  </div>
                                </a>
                              </li>
                                                        <li>
                                <a href="">
                                  <img src="${root}/assets/images/popular_5.jpg" alt="Image placeholder" class="me-4 rounded">
                                  <div class="text">
                                    <h6>潛水證照GET!超推PADI考照心得分享不得不看!</h6>
                                    <div class="post-meta">
                                      <span class="mr-2">2014年5月3日 </span>
                                    </div>
                                  </div>
                                </a>
                              </li>
                          </ul>
                        </div>
                      </div>

                      <!-- 類型文章數量 -->
                      <div class="sidebar-box">
                        <h3 class="heading">Categories</h3>
                        <ul class="categories">
                        <li><a href="#">ScubaDiving <span>(24)</span></a></li>
                          <li><a href="#">FreeDiving <span>(9)</span></a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </main>

            <!-- header -->
            <jsp:include page="/WEB-INF/view/component/footer.jsp"></jsp:include>
            <!-- header end -->


            <script src="${root}/assets2/js/bootstrap.bundle.min.js"></script>
            <script src="${root}/assets2/js/tiny-slider.js"></script>

            <script src="${root}/assets2/js/flatpickr.min.js"></script>


            <script src="${root}/assets2/js/aos.js"></script>
            <script src="${root}/assets2/js/glightbox.min.js"></script>
            <script src="${root}/assets2/js/navbar.js"></script>
            <script src="${root}/assets2/js/counter.js"></script>
            <script src="${root}/assets2/js/custom.js"></script>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            
<script>
document.addEventListener('DOMContentLoaded', function () {
    console.log('Script Loaded');

    // 查找所有帶有 delete-btn 類的按鈕
    document.querySelectorAll('.delete-btn').forEach(function (deleteBtn) {
        // 設置按鈕點擊事件
        deleteBtn.addEventListener('click', function () {
            // 彈出確認訊息
            const isConfirmed = confirm('確定要刪除這篇文嗎？');
            if (!isConfirmed) {
                return; // 如果使用者取消，就不執行後續程式
            }

            const vlogId = this.getAttribute('data-vlog-id');

            // 使用 fetch 發送刪除請求
            fetch('${root}/DeleteVlog', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: "vlogId=" + vlogId,
            })
            .then(response => {
                return response.text().then(text => {
                    if (!response.ok) {
                        alert(`Error: ${text}`);
                        console.error(`Server returned error: ${text}`);
                        throw new Error(`Server error: ${text}`);
                    }
                    alert('刪除成功');
                    location.reload(); // 刪除成功後刷新頁面
                });
            })
            .catch(error => {
                alert('刪除失敗!');
                console.error('Fetch error:', error);
            });
        });
    });
});
    </script>
    <script>
  document.querySelectorAll(".license").forEach(function (el) {
    el.textContent = el.textContent.replace(/[()]/g, " "); // 替換括號
  });
</script>


          </body>

          </html>