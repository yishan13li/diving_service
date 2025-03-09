package diving_service.controller.page;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import diving_service.model.entity.Member;
import diving_service.service.MemberService;
import diving_service.util.AuthTool;

@WebServlet("/UpdateMember")
@MultipartConfig

public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 顯示當前會員資料
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 // 設定請求的字符編碼為 UTF-8，避免亂碼問題
	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html; charset=UTF-8");
		
		// 從 session 中取得當前登入的會員
		Member loggedInMember = AuthTool.getLoggedInMember(request);

		// 將會員資料傳遞給 JSP 顯示
		request.setAttribute("memberInfo", loggedInMember);
		request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
	}

	// 處理會員資料更新
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 取得表單中傳來的參數
		String memberName = request.getParameter("memberName");
		String email = request.getParameter("email");
//		String password = request.getParameter("password");
		String perBirthDate = request.getParameter("birthDate");
//		String divingLicense = request.getParameter("divingLicense");
		String[] divingLicense = request.getParameterValues("divingLicense");
		Part memberPhotoPart = request.getPart("memberPhoto");

	    // 檢查信箱是否修改
	    Member loggedInMember = AuthTool.getLoggedInMember(request);
	    
		// 將生日字串轉換為 Date 物件，處理空值情況
		Date birthDate = null;
		if (perBirthDate != null && !perBirthDate.isEmpty()) {
			try {
				birthDate = new SimpleDateFormat("yyyy-MM-dd").parse(perBirthDate);
			} catch (ParseException e) {
				e.printStackTrace(); // 可以處理錯誤，或者給使用者返回錯誤訊息
			}
		}
		
	    // 預設值為 null，當上傳檔案時會設置為非 null
	    byte[] memberPhoto = null;

	    // 如果有選擇檔案，則進行處理
	    if (memberPhotoPart != null && memberPhotoPart.getSize() > 0) {
	        InputStream in = memberPhotoPart.getInputStream();
	        memberPhoto = in.readAllBytes(); // 將檔案轉為 byte[]
	        in.close();
	    }
		
		// 從 session 中取得當前登入的會員

		// 更新會員資料
		loggedInMember.setMemberName(memberName);
		loggedInMember.setEmail(email);
		
//	    // 如果密碼欄位不為空，則加密並更新密碼
//	    if (password != null && !password.trim().isEmpty()) {
//	        MemberService memberService = new MemberService();
//	        String hashedPassword = memberService.hashPassword(password); // 加密新密碼
//	        loggedInMember.setPassword(hashedPassword); // 更新加密後的密碼
//	    }
		
		loggedInMember.setBirthDate(birthDate); // 若是空值，birthDate 會是 null
		
	    if (divingLicense != null) {
	        String divingLicenseStr = String.join(",", divingLicense); // 可以選擇將其存為逗號分隔字串
	        loggedInMember.setDivingLicense(divingLicenseStr);
	    }

		   // 如果有上傳檔案，更新會員的照片欄位
	    if (memberPhoto != null) {
	        loggedInMember.setMemberPhoto(memberPhoto);
	    }
		
		// 呼叫 Service 更新資料
		MemberService memberService = new MemberService();
		boolean updateSuccess = memberService.updateMemberById(loggedInMember.getMemberId(), loggedInMember);
        if (!updateSuccess) {
            // 信箱已經被使用，處理錯誤情況，顯示錯誤訊息
    		request.setAttribute("memberInfo", loggedInMember);
            request.setAttribute("errorMessage", "此信箱已經被註冊，無法使用！");
            request.getRequestDispatcher("/WEB-INF/view/profile.jsp").forward(request, response);
        } else {
            // 更新成功，重導向至會員資料頁
            response.sendRedirect(request.getContextPath() + "/page/profile");
        }
	}
}
