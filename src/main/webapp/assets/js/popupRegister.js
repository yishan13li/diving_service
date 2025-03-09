(function ($) {
    $.fn.extend({
        leanModal: function (options) {
            var defaults = { top: 100, overlay: 0.5, closeButton: null };
            var overlay = $("<div id='lean_overlay'></div>");
            $("body").append(overlay);
            options = $.extend(defaults, options);
            return this.each(function () {
                var o = options;
                
                // 獲取 modal ID
                var modal_id = $(this).attr("href"); 

                // 點擊關閉按鈕關閉 modal
                $("#lean_overlay").click(function () { close_modal(modal_id) });
                $(o.closeButton).click(function () { close_modal(modal_id) });

                var modal_height = $(modal_id).outerHeight();
                var modal_width = $(modal_id).outerWidth();

                // 顯示遮罩層
                $("#lean_overlay").css({ "display": "block", opacity: 0 });
                $("#lean_overlay").fadeTo(200, o.overlay);

                // 顯示 modal
                $(modal_id).css({
                    "display": "block",
                    "position": "fixed",
                    "opacity": 0,
                    "z-index": 11000,
                    "left": 50 + "%",
                    "margin-left": -(modal_width / 2) + "px",
                    "top": o.top + "px"
                });

                // 動畫效果
                $(modal_id).fadeTo(200, 1);

                // 預設顯示註冊表單 (user_register)，並隱藏登入表單 (user_login)
                $(modal_id).find(".user_register").show();
                $(modal_id).find(".user_login").hide();
                $(modal_id).find(".social_login").hide();
            });

            function close_modal(modal_id) {
                $("#lean_overlay").fadeOut(200);
                $(modal_id).css({ "display": "none" });
				window.location.href = root1 + "/page/index";  // 或者 root + "/page/index" 根據需要調整
            }
        }
    })
})(jQuery);

$(document).ready(function () {
    // 自動打開 modal，並預設顯示註冊表單 (user_register)
    $("#modal").leanModal({ closeButton: ".modal_close" });
    $("#modal").show(); // 顯示 modal

    // 當點擊切換到社交登入時，隱藏註冊表單並顯示社交登入
    $("#login_form").click(function() {
        $(".user_register").hide();
        $(".user_login").hide();
        $(".social_login").show();
    });

    // 當點擊返回時，切換回註冊表單部分
    $(".back_btn").click(function() {
        $(".social_login").hide();
        $(".user_login").hide();
        $(".user_register").show();
    });
	
	$(".modal_close").click(function(e) {
	    e.preventDefault();  // 防止表單的默認提交行為
	    close_modal("#modal"); // 調用關閉 modal 函數
	});
});
