package diving_service.util;

import javax.servlet.http.HttpServletRequest;

import diving_service.model.entity.Member;

public class AuthTool {

	public static Member getLoggedInMember(HttpServletRequest request) {

		Object loggedInMember = request.getSession().getAttribute("loggedInMember");

		if (loggedInMember == null) {
			return null;
		}

		return (Member) loggedInMember;
	};
}
