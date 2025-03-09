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
@WebServlet("/CreateVlog")
public class CreateVlog extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 設定請求的字符編碼為 UTF-8，避免亂碼問題
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 從 session 中取得當前登入的會員
		Member loggedInMember = AuthTool.getLoggedInMember(request);

		// 將會員資料傳遞給 JSP 顯示
		request.setAttribute("memberInfo", loggedInMember);
		request.getRequestDispatcher("/WEB-INF/view/createVlog.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 設定請求的字符編碼為 UTF-8，避免亂碼問題
		request.setCharacterEncoding("UTF-8");
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
		java.util.Date divingDate = null;
		try {
			divingDate = new SimpleDateFormat("yyyy-MM-dd").parse(divingDateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int divingDuration = Integer.parseInt(divingDurationStr);
		float maxDepth = Float.parseFloat(maxDepthStr);
		float avgTemp = Float.parseFloat(avgTempStr);
		float visibility = Float.parseFloat(visibilityStr);
		int tankPressOrigin = Integer.parseInt(tankPressOriginStr);
		int tankPressRemain = Integer.parseInt(tankPressRemainStr);
		float avgDepth = Float.parseFloat(avgDepthStr);

		// 假設 enterWaterTimeStr 和 exitWaterTimeStr 是從表單提交的時間字串
		String enterWaterTimeStr = request.getParameter("enterWaterTime");
		String exitWaterTimeStr = request.getParameter("exitWaterTime");

		Time enterWaterTime = null;
		Time exitWaterTime = null;
		try {
			if (enterWaterTimeStr != null && enterWaterTimeStr.length() == 5) {
				enterWaterTimeStr += ":00"; // 補上秒數
			}
			if (exitWaterTimeStr != null && exitWaterTimeStr.length() == 5) {
				exitWaterTimeStr += ":00"; // 補上秒數
			}

			enterWaterTime = Time.valueOf(enterWaterTimeStr); // 轉換為時間
			exitWaterTime = Time.valueOf(exitWaterTimeStr); // 轉換為時間
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
			// 若格式錯誤，可以設置預設時間
			enterWaterTime = Time.valueOf("00:00:00"); // 預設值
			exitWaterTime = Time.valueOf("00:00:00"); // 預設值
		}

		// 取得上傳的圖片
		InputStream in = divingPhotoPart.getInputStream();
		byte[] divingPhoto = in.readAllBytes();
		in.close();

		// 從 session 中取得登入會員
		Member loggedInMember = AuthTool.getLoggedInMember(request);

		// 封裝 Vlog 物件
		Vlog vlog = new Vlog();
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
		vlog.setMember(loggedInMember);

		// 呼叫 VlogService 來插入資料
		VlogService vlogService = new VlogService();
		try {
			vlogService.createVlog(vlog); // 嘗試提交資料
			// 成功提交後檢查響應是否已提交，若未提交則進行重定向
			if (!response.isCommitted()) {
				response.sendRedirect(request.getContextPath() + "/page/vlogs");
			}

		} catch (Exception e) {
			e.printStackTrace();
			// 若提交失敗，可以顯示錯誤頁面或其他處理
			if (!response.isCommitted()) {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
						"Error occurred while creating the vlog.");
			}
		}
	}

}
