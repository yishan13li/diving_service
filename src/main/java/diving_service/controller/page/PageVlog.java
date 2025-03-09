package diving_service.controller.page;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import diving_service.model.entity.Member;
import diving_service.model.entity.Vlog;
import diving_service.service.VlogService;

@WebServlet("/page/vlog")
public class PageVlog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object m = session.getAttribute("loggedInMember");
		int memberId = -1;

		if (m != null) {
			Member loggedInMember = (Member) m;
			memberId = loggedInMember.getMemberId();
		}

		String vlogIdStr = request.getParameter("vlogId");
		String vlogSeqStr = request.getParameter("vlogSeq");
		Vlog vlog = null;

		try {
			VlogService vlogService = new VlogService();
			if (vlogIdStr != null && !vlogIdStr.isEmpty()) {
				// 獲取 vlog
				Integer vlogId = Integer.parseInt(vlogIdStr);
				vlog = vlogService.getVlogWithMemberByVlogId(vlogId);

				// 設置 vlogSeq
				int vlogSeq = (vlogSeqStr != null && !vlogSeqStr.isEmpty()) ? Integer.parseInt(vlogSeqStr) : -1; // 如果沒有
																													// vlogSeq，設置為
																													// -1
				request.setAttribute("vlogSeq", vlogSeq);
			}

			if (vlog != null) {
				// 比較 vlog 的 memberId 和登入使用者的 memberId
				boolean isOwner = (vlog.getMember().getMemberId() == memberId);
				request.setAttribute("isOwner", isOwner); // 設置是否為該 vlog 的擁有者

				request.setAttribute("vlog", vlog);
				request.getRequestDispatcher("/WEB-INF/view/vlog.jsp").forward(request, response);
			} else {
				request.setAttribute("error", "Vlog not found.");
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
			request.setAttribute("error", "Invalid parameters.");
		}
	}
}
