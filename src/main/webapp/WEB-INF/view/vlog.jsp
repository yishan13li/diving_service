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

            <title>Dive Log</title>

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
                border: 2px #ccc;
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

              .row.text-start.pt-5.border-top {
                border-top: none;
              }

              .comment-wrap,
              .comment-body {
                max-width: 600px;
                /* 設置最大寬度 */
                width: 100%;
                /* 使其佔滿父容器的寬度 */
                margin-left: auto;
                margin-right: auto;
              }

              .license {
                border-bottom: 2px solid #d3d3d3;
                /* 設置淺灰色的底部邊框 */
                padding-bottom: 2px;
                /* 給文字底部一些間距，使邊框不會太靠近文字 */
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
                        <!-- 用 <a> 標籤包裹圖片，當點擊圖片時跳轉到該會員的個人頁面 -->
                        <a href="${root}/page/vlogs?memberId=${vlog.member.memberId}">
                          <c:if test="${vlog.member.base64Photo==null}">
                            <img src="${root}/assets/images/noImg.png" alt="Image" class="profile-pic"
                              style="width: 100px; height: 100px; border-radius: 50%;">
                          </c:if>
                          <c:if test="${vlog.member.base64Photo!=null}">
                            <img src="${vlog.member.base64Photo}" alt="Image" class="profile-pic"
                              style="width: 100px; height: 100px; border-radius: 50%;">
                          </c:if>

                        </a>
                      </figure>
                      <!-- 用 <a> 標籤包裹名字，當點擊名字時跳轉到該會員的個人頁面 -->
                      <a href="${root}/page/vlogs?memberId=${vlog.member.memberId}">
                        <span class="d-inline-block mt-1"
                          style="font-size: 1.5rem; font-weight: bold;">${vlog.member.memberName}</span>
                      </a>
                      <div class="license">${vlog.member.divingLicense}</div>
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
                              <!--     當 vlog 的 memberId 和 loggedInMember.id 相同時顯示修改按鈕 -->
                              <a href="${root}/UpdateVlog?vlogId=${vlog.vlogId}" class="btn btn-primary btn-sm">編輯</a>
                            </c:if>
                          </h3>
                          <div class="date-container">
                            <table
                              style="width: 100%; border-collapse: collapse; margin-top: 0px; border: 1px solid #ddd;">
                              <tr>
                                <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
                                  <strong>地點:</strong> ${vlog.location}<br>
                                  <strong>氣象:</strong> ${vlog.weather}
                                </td>
                                <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
                                  <strong>潛水種類:</strong> ${vlog.divingType}<br>
                                  <strong>氣瓶種類:</strong> ${vlog.tankType}
                                </td>
                                <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
                                  <strong>潛伴:</strong> ${vlog.partner}<br>
                                </td>
                              </tr>
                              <tr>
                                <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
                                  <strong>下水時間:</strong>
                                  <fmt:formatDate value="${vlog.enterWaterTime}" pattern="HH:mm" /><br>
                                  <strong>出水時間:</strong>
                                  <fmt:formatDate value="${vlog.exitWaterTime}" pattern="HH:mm" /> <br><br>
                                  <strong>潛水時長:</strong> ${vlog.divingDuration} 分鐘<br>
                                </td>
                                <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
                                  <strong>平均深度:</strong> ${vlog.avgDepth} m<br>
                                  <strong>最大深度:</strong> ${vlog.maxDepth} m<br><br>
                                  <strong>平均溫度:</strong> ${vlog.avgTemp} °C
                                </td>
                                <td style="padding: 10px; vertical-align: top; border: 1px solid #ddd;">
                                  <strong>氣瓶原始氣壓:</strong> ${vlog.tankPressOrigin} bar<br>
                                  <strong>氣瓶殘壓:</strong> ${vlog.tankPressRemain} bar<br><br>
                                  <strong>能見度:</strong> ${vlog.visibility} m
                                </td>
                              </tr>
                            </table>
                          </div>
                          <p style="text-indent: 1em;">
                          <c:if test="${vlog.base64DivingPhoto==null}">
                            <img alt="Diving Photo" class="diveImg" src="${root}/assets/images/whale_shark.jpg">
                          </c:if>
                          <c:if test="${vlog.base64DivingPhoto!=null}">
                            <img alt="Diving Photo" class="diveImg" src="${vlog.base64DivingPhoto}"
                              style="max-width: 100%; height: auto; margin-bottom: 15px;">
                           </c:if>
<%--                             ${vlog.comments} --%>
                          </p>
                          <div class="date" style="font-size: 0.7rem; color: #555;text-align: right;">${vlog.createdAt}
                          </div>
                        </div>
                      </div>

<!--                       <div class="row text-start"> -->
<!--                         <div class="col-md-12"> -->
<!--                           <div class="custom-pagination"> -->
<!--                             <div class="pt-5 comment-wrap"> -->
<!--                               <h3 class="mb-5 heading">6 Comments</h3> -->
<!--                               <ul> -->
<!--                                 <li class="comment"> -->
<!--                                   <div class="vcard"> -->
<!--                                     <img src="images/person_1.jpg" alt="Image placeholder"> -->
<!--                                   </div> -->
<!--                                   <div class="comment-body"> -->
<!--                                     <h3>Jean Doe</h3> -->
<!--                                     <div class="meta">January 9, 2018 at 2:21pm</div> -->
<!--                                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum -->
<!--                                       necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente -->
<!--                                       iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p> -->
<!--                                     <p><a href="#" class="reply rounded">Reply</a></p> -->
<!--                                   </div> -->
<!--                                 </li> -->
<!--                                 <li class="comment"> -->
<!--                                   <div class="vcard"> -->
<!--                                     <img src="images/person_2.jpg" alt="Image placeholder"> -->
<!--                                   </div> -->
<!--                                   <div class="comment-body"> -->
<!--                                     <h3>Jean Doe</h3> -->
<!--                                     <div class="meta">January 9, 2018 at 2:21pm</div> -->
<!--                                     <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum -->
<!--                                       necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente -->
<!--                                       iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p> -->
<!--                                     <p><a href="#" class="reply rounded">Reply</a></p> -->
<!--                                   </div> -->
<!--                               </ul> -->
<!--                               <div class="comment-form-wrap" style="margin-left:auto;margin-right:auto"> -->
<!--                                 <h3>Leave a comment</h3> -->
<!--                                 <form action="#"> -->
<!--                                   <div class="form-group"> -->
<!--                                     <textarea id="message" placeholder="Write a comment..." rows="3"></textarea> -->
<!--                                   </div> -->
<!--                                   <div class="form-group"> -->
<!--                                     <input type="submit" value="Post Comment" class="btn btn-primary"> -->
<!--                                   </div> -->
<!--                                 </form> -->
<!--                               </div> -->

<!--                             </div> -->
<!--                           </div> -->
<!--                         </div> -->
<!--                       </div> -->
                    </div>



                    <!-- 側欄開始 -->
                    <div class="col-lg-4 sidebar">

                      <!-- 搜尋框 -->
                      <div class="sidebar-box search-form-wrap mb-4">
                        <form action="#" class="sidebar-search-form">
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
            <script>
              document.querySelectorAll(".license").forEach(function (el) {
                el.textContent = el.textContent.replace(/[()]/g, " "); // 替換括號
              });
            </script>

          </body>

          </html>