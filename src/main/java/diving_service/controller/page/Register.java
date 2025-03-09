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

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		// 使用者輸入的字串參數

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// 進行註冊操作
		Member newMember = new Member();
		newMember.setMemberName(username);
		newMember.setEmail(email);
		
		//使用加密密碼
		MemberService memberService = new MemberService();
		String hashedPassword = memberService.hashPassword(password); // 加密密碼
        newMember.setPassword(hashedPassword); // 設置加密後的密碼

		// 使用 MemberService 進行註冊
		Member registerMember = memberService.registerMember(newMember);

		if (registerMember == null) {
			// 註冊失敗
			session.setAttribute("messageRegister", "此信箱已註冊過，請改用其他信箱註冊");
			response.sendRedirect(request.getContextPath() + "/page/register");
			return;
		}
		// 註冊完成後轉向到登入頁面，或顯示註冊成功的訊息
		session.setAttribute("registerMember", registerMember);
		response.sendRedirect(request.getContextPath() + "/page/login");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}