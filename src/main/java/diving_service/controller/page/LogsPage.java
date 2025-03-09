package diving_service.controller.page;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import diving_service.model.entity.Member;
import diving_service.model.entity.Vlog;
import diving_service.service.VlogService;

@WebServlet("/LogsPage")
public class LogsPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int loggedInMemberId = -1; // 用於保存當前登入用戶的 ID
		HttpSession session = request.getSession();
		Object m = session.getAttribute("loggedInMember");

		if (m != null) {
			Member loggedInMember = (Member) m;
			loggedInMemberId = loggedInMember.getMemberId();
		}

		// 取得 URL 傳入的 memberId
		String memberIdStr = request.getParameter("memberId");
		int memberId = (memberIdStr != null && !memberIdStr.isEmpty()) ? Integer.parseInt(memberIdStr) : -1;

		VlogService vlogService = new VlogService();
		List<Vlog> filteredVlogs = null;
		try {
			if (memberId != -1) {
				// 如果有指定 memberId，查詢該會員的 Vlogs
				filteredVlogs = vlogService.getAllVlogsByMemberId(memberId);
			} else {
				// 如果未指定 memberId，則顯示所有 Vlogs
				filteredVlogs = vlogService.getAllVlogWithMember();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "Error fetching Vlogs.");
		}

		// 判斷當前頁面的擁有者是否是登入者
		boolean isOwner = (loggedInMemberId == memberId);
		String vlogSeqStr = request.getParameter("vlogSeq");
		int vlogSeq = (vlogSeqStr != null && !vlogSeqStr.isEmpty()) ? Integer.parseInt(vlogSeqStr) : -1; // 如果沒有
		// vlogSeq，設置為
		// -1
		request.setAttribute("vlogSeq", vlogSeq);
		// 設置屬性到 request
		request.setAttribute("AllVlogs", filteredVlogs);
		request.setAttribute("isOwner", isOwner);
		request.setAttribute("pageOwnerId", memberId); // 設置當前頁面擁有者的 ID

		// 頁面跳轉
		request.getRequestDispatcher("/WEB-INF/view/logsPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
