package diving_service.controller.page;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import diving_service.model.entity.Member;
import diving_service.model.entity.Vlog;
import diving_service.service.VlogService;
import diving_service.util.AuthTool;

@WebServlet("/DeleteVlog")
public class DeleteVlog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 獲取 vlogId
		String vlogId = request.getParameter("vlogId");
		// 從 session 中取得當前登入的會員
		Member loggedInMember = AuthTool.getLoggedInMember(request);

		// 將 vlogId 轉為整數
		int vlogIdInt;
		try {
			vlogIdInt = Integer.parseInt(vlogId);
		} catch (NumberFormatException e) {
			response.getWriter().write("Invalid vlogId format");
			return;
		}

		try {
			// 查詢 vlog 資料
			VlogService vlogService = new VlogService();
			Vlog vlog = vlogService.getVlogWithMemberByVlogId(vlogIdInt);

			// 確認 vlog 是否存在
			if (vlog == null) {
				response.getWriter().write("Vlog not found.");
				return;
			}

			// 驗證使用者權限
			if (!vlog.getMember().getMemberId().equals(loggedInMember.getMemberId())) {
				response.getWriter().write("您沒有刪除的權限");
				return;
			}
			if (vlog.getMember() == null) {
				response.getWriter().write("Vlog member is null.");
				return;
			}

			// 執行刪除操作
			boolean isDeleted = vlogService.deleteVlog(vlogIdInt);
			if (isDeleted) {
				response.getWriter().write("刪除成功!");
			} else {
				response.getWriter().write("刪除失敗");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("Oops...刪除時發生問題! " + e.getMessage());
		}
	}
}
