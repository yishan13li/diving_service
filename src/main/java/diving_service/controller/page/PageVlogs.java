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

@WebServlet("/page/vlogs")
public class PageVlogs extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object m = session.getAttribute("loggedInMember");
		int loggedInMemberId = -1;

		if (m != null) {
			Member loggedInMember = (Member) m;
			loggedInMemberId = loggedInMember.getMemberId();
		}

		String memberIdStr = request.getParameter("memberId");
		int pageOwnerId = -1; // 預設值為 -1（未指定）
		List<Vlog> vlogs = null;
		boolean isOwner = false;
		String vlogSeqStr = request.getParameter("vlogSeq");

		try {
			if (memberIdStr != null && !memberIdStr.isEmpty()) {
				pageOwnerId = Integer.parseInt(memberIdStr);
			} else if (loggedInMemberId != -1) {
				pageOwnerId = loggedInMemberId; // 預設為登入者的頁面
			}

			if (pageOwnerId != -1) {
				VlogService vlogService = new VlogService();
				vlogs = vlogService.getAllVlogsByMemberId(pageOwnerId);
				isOwner = (loggedInMemberId == pageOwnerId); // 判斷登入者是否為頁面擁有者

				// 設定每個 Vlog 的順序
				for (Vlog vlog : vlogs) {
					int vlogOrder = vlogService.displayVlogOrderForMember(pageOwnerId, vlog.getVlogId());
					vlog.setVlogSeq(vlogOrder); // 假設 Vlog 類別有 setVlogSeq 方法來設定順序
				}
			}
		} catch (SQLException | NumberFormatException e) {
			e.printStackTrace();
			request.setAttribute("error", "Error fetching Vlogs.");
		}
		// 設置 vlogSeq
		int vlogSeq = (vlogSeqStr != null && !vlogSeqStr.isEmpty()) ? Integer.parseInt(vlogSeqStr) : -1; // 如果沒有
																											// vlogSeq，設置為
																											// -1
		request.setAttribute("vlogSeq", vlogSeq);
		// 將 vlogs 和是否顯示新增按鈕的條件設置到 request 屬性
		request.setAttribute("Vlogs", vlogs);
		request.setAttribute("isOwner", isOwner);

		// 頁面跳轉
		request.getRequestDispatcher("/WEB-INF/view/vlogs.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
