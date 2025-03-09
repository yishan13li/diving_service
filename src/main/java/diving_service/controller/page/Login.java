package diving_service.controller.page;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import diving_service.model.entity.Member;
import diving_service.service.MemberService;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		// TODO: 實作 login
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		MemberService memberService = new MemberService();
		Member loggedInMember = memberService.login(email, password);

		// 表示登入失敗
		if (loggedInMember == null) {
			session.setAttribute("message", "登入失敗，帳號或密碼錯誤，請重新輸入");
			response.sendRedirect(request.getContextPath() + "/page/login");
			return;
		}

		// 帳號被禁止使用
		if (!loggedInMember.getEnabled()) {
			session.setAttribute("message", "此帳號已被禁用，請聯繫系統管理員");
			response.sendRedirect(request.getContextPath() + "/page/login");
			return;
		}
		// 走到這裡，則表示登入成功
		session.setAttribute("loggedInMember", loggedInMember);
		response.sendRedirect(request.getContextPath() + "/page/index");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}