package diving_service.controller.page;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import diving_service.model.entity.Member;
import diving_service.model.entity.Vlog;
import diving_service.service.VlogService;
import diving_service.util.AuthTool;

@MultipartConfig
@WebServlet("/UpdateVlog")
public class UpdateVlog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 設定請求的字符編碼為 UTF-8，避免亂碼問題
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 從 session 中取得當前登入的會員
		Member loggedInMember = AuthTool.getLoggedInMember(request);
		// 取得要更新的 vlogId
		String vlogIdStr = request.getParameter("vlogId");
		if (vlogIdStr == null || vlogIdStr.isEmpty()) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Vlog ID is missing.");
			return;
		}
		int vlogId = Integer.parseInt(vlogIdStr);

		// 從 VlogService 查詢對應的 vlog
		VlogService vlogService = new VlogService();
		Vlog vlog = vlogService.getVlogWithMemberByVlogId(vlogId); // 根據 vlogId 查找日誌

		// 將會員資料與 vlog 資料傳遞給 JSP 顯示
		request.setAttribute("memberInfo", loggedInMember);
		request.setAttribute("vlog", vlog);
		request.getRequestDispatcher("/WEB-INF/view/updateVlog.jsp").forward(request, response);
		;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 設定請求的字符編碼為 UTF-8，避免亂碼問題
		request.setCharacterEncoding("UTF-8");

		// 從請求中取得參數
		String vlogIdStr = request.getParameter("vlogId");
		String divingType = request.getParameter("divingType");
		String divingDateStr = request.getParameter("divingDate");
		String divingDurationStr = request.getParameter("divingDuration");
		String location = request.getParameter("location");
		String maxDepthStr = request.getParameter("maxDepth");
		String avgTempStr = request.getParameter("avgTemp");
		String visibilityStr = request.getParameter("visibility");
		String tankPressOriginStr = request.getParameter("tankPressOrigin");
		String tankPressRemainStr = request.getParameter("tankPressRemain");
		String tankType = request.getParameter("tankType");
		String comments = request.getParameter("comments");
		String weather = request.getParameter("weather");
		String avgDepthStr = request.getParameter("avgDepth");
		String partner = request.getParameter("partner");
		Part divingPhotoPart = request.getPart("divingPhoto");
		String base64DivingPhoto = request.getParameter("base64DivingPhoto");
		
		// 處理日期和時間
		java.util.Date divingDate = null;
		try {
			divingDate = new SimpleDateFormat("yyyy-MM-dd").parse(divingDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		int vlogId = vlogIdStr != null && !vlogIdStr.isEmpty() ? Integer.parseInt(vlogIdStr) : 0; // 預設為 0 或其他適當值
		int divingDuration = divingDurationStr != null && !divingDurationStr.isEmpty()
				? Integer.parseInt(divingDurationStr)
				: 0;
		float maxDepth = maxDepthStr != null && !maxDepthStr.isEmpty() ? Float.parseFloat(maxDepthStr) : 0.0f;
		float avgTemp = avgTempStr != null && !avgTempStr.isEmpty() ? Float.parseFloat(avgTempStr) : 0.0f;
		float visibility = visibilityStr != null && !visibilityStr.isEmpty() ? Float.parseFloat(visibilityStr) : 0.0f;
		int tankPressOrigin = tankPressOriginStr != null && !tankPressOriginStr.isEmpty()
				? Integer.parseInt(tankPressOriginStr)
				: 0;
		int tankPressRemain = tankPressRemainStr != null && !tankPressRemainStr.isEmpty()
				? Integer.parseInt(tankPressRemainStr)
				: 0;
		float avgDepth = avgDepthStr != null && !avgDepthStr.isEmpty() ? Float.parseFloat(avgDepthStr) : 0.0f;

		String enterWaterTimeStr = request.getParameter("enterWaterTime");
		String exitWaterTimeStr = request.getParameter("exitWaterTime");

		Time enterWaterTime = null;
		Time exitWaterTime = null;
		try {
			if (enterWaterTimeStr != null && enterWaterTimeStr.length() == 5) {
				enterWaterTimeStr += ":00";
			}
			if (exitWaterTimeStr != null && exitWaterTimeStr.length() == 5) {
				exitWaterTimeStr += ":00";
			}

			enterWaterTime = Time.valueOf(enterWaterTimeStr);
			exitWaterTime = Time.valueOf(exitWaterTimeStr);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
			enterWaterTime = Time.valueOf("00:00:00");
			exitWaterTime = Time.valueOf("00:00:00");
		}

		// 處理上傳的圖片
		byte[] divingPhoto = null;

		if (divingPhotoPart != null && divingPhotoPart.getSize() > 0) {
		    // 有新圖片，處理新圖片
		    try (InputStream in = divingPhotoPart.getInputStream()) {
		        divingPhoto = in.readAllBytes(); // 將新圖片轉成 byte[]
		    }
		} else if (base64DivingPhoto != null && !base64DivingPhoto.isEmpty()) {
		    // 沒有新圖片，使用舊圖片（Base64 解碼）
		    divingPhoto = java.util.Base64.getDecoder().decode(base64DivingPhoto.split(",")[1]);
		}

		// 從 session 中取得登入會員
		Member loggedInMember = AuthTool.getLoggedInMember(request);

		// 封裝 Vlog 物件
		Vlog vlog = new Vlog();
		vlog.setVlogId(vlogId); // 設置 vlog 的 ID
		vlog.setDivingType(divingType);
		vlog.setDivingDate(divingDate);
		vlog.setDivingDuration(divingDuration);
		vlog.setLocation(location);
		vlog.setMaxDepth(maxDepth);
		vlog.setAvgTemp(avgTemp);
		vlog.setVisibility(visibility);
		vlog.setTankPressOrigin(tankPressOrigin);
		vlog.setTankPressRemain(tankPressRemain);
		vlog.setTankType(tankType);
		vlog.setComments(comments);
		vlog.setWeather(weather);
		vlog.setEnterWaterTime(enterWaterTime);
		vlog.setExitWaterTime(exitWaterTime);
		vlog.setAvgDepth(avgDepth);
		vlog.setPartner(partner);
		vlog.setDivingPhoto(divingPhoto);

		// 呼叫 VlogService 更新資料
		VlogService vlogService = new VlogService();
		try {
			vlogService.updateVlogById(vlogId, vlog); // 嘗試更新資料
			if (!response.isCommitted()) {
				response.sendRedirect(request.getContextPath() + "/page/vlog?vlogId=" + vlogId);
			}
		} catch (Exception e) {
			e.printStackTrace();
			if (!response.isCommitted()) {
				response.getWriter().write("更新失敗");
			}
		}
	}
}
