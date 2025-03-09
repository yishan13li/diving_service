package diving_service.util;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

@javax.servlet.annotation.WebListener
public class WebListener implements ServletContextListener {
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("伺服器初始化...");
		ServletContext context = sce.getServletContext();
		context.setAttribute("root", context.getContextPath());
		// 參數root為專案名(全域)，以後寫絕對路徑就直接寫root即可
	}

	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("伺服器關閉...");
	}

}
