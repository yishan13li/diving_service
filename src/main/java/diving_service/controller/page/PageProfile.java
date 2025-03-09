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

@WebServlet("/page/profile")
public class PageProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int memberId = -1; /// 初始值為-1，表示還沒有會員登入
		HttpSession session = request.getSession();// 登入成功時存了一個物件
		Object m = session.getAttribute("loggedInMember");

		if (m != null) {
			Member loggedInMember = (Member) m;
			memberId = loggedInMember.getMemberId();
		}
		MemberService memberService = new MemberService();
		Member readMember = memberService.getMemberById(memberId);

		request.setAttribute("memberInfo", readMember);
		request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
