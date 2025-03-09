package diving_service.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import diving_service.model.dao.MemberDao;
import diving_service.model.dao.VlogDao;
import diving_service.model.entity.Vlog;
import diving_service.util.ConnectionFactory;

public class VlogService {
	// 找某人的所有vlog &個人資訊
	public List<Vlog> getAllVlogsByMemberId(Integer memberId) throws SQLException {
		try (Connection conn = ConnectionFactory.getConnection()) {
			VlogDao vlogDao = new VlogDao(conn);
			List<Vlog> Vlogs = vlogDao.findAllVlogsByMemberId(memberId);


			return Vlogs;
		} catch (SQLException e) {
			// 在 Service 層處理異常，可以選擇記錄錯誤日誌或轉換錯誤信息
			throw new RuntimeException("無法獲取該會員的所有 Vlog 資料，memberId: " + memberId, e);
		}
	}

	// 用某vlog id找member資訊
	public Vlog getVlogWithMemberByVlogId(Integer id) {
		try (Connection conn = ConnectionFactory.getConnection()) {
			VlogDao vlogDao = new VlogDao(conn);
			Vlog vlog = vlogDao.findVlogWithMemberByVlogId(id);

			if (vlog == null) {
				vlog = new Vlog();
			}
			return vlog;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	// Read某篇vlog
	public Vlog getVlogById(Integer id) {
		try (Connection conn = ConnectionFactory.getConnection()) {
			VlogDao vlogDao = new VlogDao(conn);
			Vlog vlog = vlogDao.findVlogByVlogId(id);

			if (vlog == null) {
				vlog = new Vlog();
			}
			return vlog;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	// 找所有人的vlog及其會員資訊
	public List<Vlog> getAllVlogWithMember() {
		try (Connection conn = ConnectionFactory.getConnection()) {
			VlogDao vlogDao = new VlogDao(conn);
			MemberDao memberDao = new MemberDao(conn);
			List<Vlog> vlogs = vlogDao.findAllVlogWithMember();
			return vlogs;
		} catch (SQLException e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

//	 找countVlog
    public int displayVlogOrderForMember(int memberId, int vlogId) {
    	try (Connection conn = ConnectionFactory.getConnection()) {
    		VlogDao vlogDao = new VlogDao(conn);
			return vlogDao.getVlogOrderForMember(memberId, vlogId);
    	}catch (SQLException e) {
			e.printStackTrace();
			return -1;
		} 
    }

//	============create==============
	public void createVlog(Vlog vlog) {
		try (Connection conn = ConnectionFactory.getConnection()) {

			VlogDao vlogDao = new VlogDao(conn);
			vlogDao.createVlog(vlog);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean deleteVlog(int vlogId) {
		try (Connection conn = ConnectionFactory.getConnection()) {
			VlogDao vlogDAO = new VlogDao(conn);
			return vlogDAO.deleteByVlogId(vlogId); // 假設 deleteByVlogId 返回布林值
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateVlogById(Integer vlogId, Vlog vlog) {
		try (Connection conn = ConnectionFactory.getConnection()) {
			VlogDao vlogDao = new VlogDao(conn);
			vlogDao.updateVlogById(vlogId, vlog);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
