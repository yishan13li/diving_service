<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String root1 = request.getContextPath(); %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="icon" href="${root}/assets/favicon.ico" type="image/x-icon">
        <meta name="author" content="templatemo">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
            rel="stylesheet">

        <title>Login</title>
        
		<script type="text/javascript">
            var root1 = "<%= root1 %>";  // JSP 會將 ${root} 替換為具體的值
        </script>
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


    </head>

    <body>
        <!-- header -->
        <jsp:include page="/WEB-INF/view/component/header.jsp"></jsp:include>
        <!-- header end -->

       <div id="modal" class="popupContainer" style="display:none;">
            <div class="popupHeader">
                <span class="header_title">Login</span>
                <span class="modal_close"><i class="fa fa-times"></i></span>
            </div>

            <section class="popupBody">
                            <!-- Username & Password Login form -->
                <div class="user_login">
                    <form action="${root}/Login" method="post">
                        <label>Email</label>
                        <input name="email" type="text" id="email" required/>
                        <br />

                        <label>Password</label>
                        <input name="password" type="password" id="password" required />
						<br>
						
						<div class="mt-0" style="color: red">${message}</div>
						${message=""}
						
                        <div class="checkbox">
                            <input id="remember" type="checkbox" />
                            <label for="remember">Remember me on this computer</label>
                        </div>

                        <div class="action_btns">
                            <div class="one_half"><a href="#" class="btn back_btn"><i
                                        class="fa fa-angle-double-left"></i> Back</a></div>

                           	<div class="one_half last"><button type="submit" class="btn btn_red">Login</button></div>

                        </div>
                        
                        
                    </form>

                    <a href="#" class="forgot_password">Forgot password?</a>
                </div>
                
                <!-- Social Login 社群網站登入 -->
                <div class="social_login">
                    <div class="">
                        <a href="#" class="social_box fb">
                            <span class="icon"><i class="fab fa-facebook"></i></span>
                            <span class="icon_title">Connect with Facebook</span>

                        </a>

                        <a href="#" class="social_box google">
                            <span class="icon"><i class="fab fa-google-plus"></i></span>
                            <span class="icon_title">Connect with Google</span>
                        </a>
                    </div>

                    <div class="centeredText">
                        <span>Or use your Email address</span>
                    </div>

                    <div class="action_btns">
                        <div class="one_half"><a href="#" id="login_form" class="btn">Login</a></div>
                        <div class="one_half last"><a href="#" id="register_form" class="btn">Sign up</a></div>
                    </div>
                </div>

                <!-- Register Form -->
                <div class="user_register">
                    <form action="" method="post">
                        <label>Username</label>
                        <input name="username" type="text" id="username" required />
                        <br />
                        <label>Email Address</label>
                        <input name="email" type="email" id="email" required/>
                        <br />

                        <label>Password</label>
                        <input name="password" type="password" id="password" required/>
                        <br />

						<!-- error_message -->
						<div class="mt-1" style="color: red">${message}</div>
						${message=""}
						
                        <div class="checkbox">
                            <input id="send_updates" type="checkbox" />
                            <label for="send_updates">Send me occasional email updates</label>
                        </div>

                        <div class="action_btns">
                            <div class="one_half"><a href="#" class="btn back_btn"><i
                                        class="fa fa-angle-double-left"></i> Back</a></div>
                            <div class="one_half last"><button type="submit" class="btn btn_red">Register</button></div>
                        </div>
                        

                    </form>
                </div>

            </section>
        </div>

        <!-- ***** Main Banner Area Start ***** -->
        <div class="main-banner">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 offset-lg-1">
                        <div class="header-text">
                            <h2>DiVenture</h2><br>
                            <h2>探索海底世界</h2><br>
                            <h2><em>記錄</em>   每一次<em>冒險!</em></h2>
                            <p>一個專為潛水愛好者設計的平台，讓你輕鬆記錄每一次潛水經歷。無論是探索珊瑚礁、沉船尋寶還是夜潛，每一段旅程都有它的故事，我們幫助你保存下這些珍貴的回憶。加入我們，開始你的潛水日誌之旅，分享與保存每一刻的冒險！</p>
                            <div class="buttons">
                                <div class="big-border-button">
                                    <a href="login.html">馬上註冊</a>
                                </div>
                                <div class="icon-button">
                                    <a href="https://youtube.com/templatemo" target="_blank"><i class="fa fa-play"></i>
                                        Watch Our Video Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <!-- footer -->
        <jsp:include page="/WEB-INF/view/component/footer.jsp"></jsp:include>


    </body>
        <!-- Scripts -->
        <!-- Bootstrap core JavaScript -->
        <script src="${root}/vendor/jquery/jquery.min.js"></script>
        <script src="${root}/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="${root}/assets/js/isotope.min.js"></script>
        <script src="${root}/assets/js/owl-carousel.js"></script>
        <script src="${root}/assets/js/tabs.js"></script>
        <script src="${root}/assets/js/popupLogin.js"></script>
        <script src="${root}/assets/js/custom.js"></script>
        <script type="text/javascript">
			const emailInput = document.querySelector("#emailInput");
			const passwordInput = document.querySelector("#passwordInput");
		</script>

    </html>