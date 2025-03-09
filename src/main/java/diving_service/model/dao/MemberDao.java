package diving_service.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import diving_service.model.entity.Member;

public class MemberDao {

	// newDAO物件必傳入參數conn //好幾個dao同進同退
	private Connection conn;

	public MemberDao(Connection conn) {
		this.conn = conn;
	}

	// 會員登入(找會員) 用email跟pwd找member
	public Member findMemberByEmailAndPassword(String email, String password) throws SQLException {
		final String SQL = "SELECT * FROM [diving_service].[dbo].[members] "
				+ "WHERE email = ? "
				+ "AND password = ?";
		Member member = null;

		PreparedStatement ps = conn.prepareStatement(SQL);
		ps.setString(1, email);
		ps.setString(2, password);

		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			member = new Member();
			member.setMemberId(rs.getInt("id"));
			member.setMemberName(rs.getString("member_name"));
			member.setPassword(rs.getString("password"));
			member.setEnabled(rs.getBoolean("enabled"));
			member.setEmail(rs.getString("email"));
			member.setRole(rs.getString("role"));
			member.setMemberPhoto(rs.getBytes("member_photo"));
			member.setBirthDate(rs.getDate("birthdate"));
			member.setDivingLicense(rs.getString("diving_license"));
			member.setCreatedAt(rs.getDate("created_at"));
			member.setUpdatedAt(rs.getDate("updated_at"));
			
	    }
		rs.close();
		ps.close();

		return member;
	}

	// 新增會員
	public void createMember(Member member) throws SQLException {
		final String SQL = """
				INSERT INTO [diving_service].[dbo].[members]
						([member_name],[email],
						 [password])
					   VALUES(?, ?,?) """;
		
		PreparedStatement ps = conn.prepareStatement(SQL);
		ps.setString(1, member.getMemberName());
		ps.setString(2, member.getEmail().trim());
		ps.setString(3, member.getPassword());

		ps.execute();
		ps.close();
	}

	// 此信箱是否已註冊過
	public boolean isEmailExist(String email) throws SQLException {
		final String SQL = "select count(*) from [diving_service].[dbo].[members] where email=?";

		PreparedStatement ps = conn.prepareStatement(SQL);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			return rs.getInt(1) > 0;
		}

		rs.close();
		ps.close();
		return false; // 如果沒找到該電子郵件，則返回 false
	}
	
	public boolean isEmailExistForUpdate(Integer id, String email) throws SQLException {
	    final String SQL = "select count(*) from [diving_service].[dbo].[members] where email=? and id != ?";

	    PreparedStatement ps = conn.prepareStatement(SQL);
	    ps.setString(1, email);
	    ps.setInt(2, id);
	    ResultSet rs = ps.executeQuery();

	    if (rs.next()) {
	        return rs.getInt(1) > 0; // 如果查詢結果大於 0，表示信箱已經存在且不是當前會員的信箱
	    }

	    rs.close();
	    ps.close();
	    return false; // 沒有找到重複的信箱
	}

	// read >>根據memberId找member的所有資料 id==null會拋錯誤
	public Member findMemberById(Integer memberId) throws SQLException {
		final String SQL = "select*from [diving_service].[dbo].[members] where id=?";

		Member member = null;
		PreparedStatement ps = conn.prepareStatement(SQL);
		ps.setInt(1, memberId);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			member = new Member();
			member.setMemberId(rs.getInt("id"));
			member.setMemberName(rs.getString("member_name"));
			member.setPassword(rs.getString("password"));
			member.setEnabled(rs.getBoolean("enabled"));
			member.setEmail(rs.getString("email"));
			member.setRole(rs.getString("role"));
			member.setMemberPhoto(rs.getBytes("member_photo"));
			member.setBirthDate(rs.getDate("birthdate"));
			member.setDivingLicense(rs.getString("diving_license"));
			member.setCreatedAt(rs.getDate("created_at"));
			member.setUpdatedAt(rs.getDate("updated_at"));
			
		}
		rs.close();
		ps.close();

		if (member == null) {
			throw new RuntimeException("找不到指定的 member。member_id: %s".formatted(memberId));
		}
		return member;

	}

	// read>> 查詢所有member的集合    
	public List<Member> findAllMember() throws SQLException {
		final String SQL = "select*from members ";

		PreparedStatement ps = conn.prepareStatement(SQL);
		ResultSet rs = ps.executeQuery();

		List<Member> members = new ArrayList<>();

		Member member = null;
		Integer previousMemberId = -1;

		while (rs.next()) {
			// 取得當下那筆資料的 memberId
			Integer currentMemberId = rs.getInt("memberId");

			// 若與上筆 memberId 不相等，則表示是新的 member，以下會建立一個新的 member
			if (previousMemberId != currentMemberId) {

				// 迴圈跑到這，member 還是舊狀態(上一筆member)，只要舊狀態不為 null，就將上一筆 member 加入 members
				if (member != null) {
					members.add(member);
				}
				// 建立當下 member
				member = new Member();
				member.setMemberId(rs.getInt("id"));
				member.setMemberName(rs.getString("member_name"));
				member.setPassword(rs.getString("password"));
				member.setEnabled(rs.getBoolean("enabled"));
				member.setEmail(rs.getString("email"));
				member.setRole(rs.getString("role"));
				member.setMemberPhoto(rs.getBytes("member_photo"));
				member.setBirthDate(rs.getDate("birthdate"));
				member.setDivingLicense(rs.getString("diving_license"));
				member.setCreatedAt(rs.getDate("created_at"));
				member.setUpdatedAt(rs.getDate("updated_at"));
			}

			previousMemberId = currentMemberId;
		}
		rs.close();
		ps.close();
		return members;

	}

	public void updateMemberById(Integer id, Member member) throws SQLException {

		final String SQL = """
				update [diving_service].[dbo].[members] set member_name=?,email=?,password=?,member_photo=?,birthdate=?,diving_license=?
					 where id=?""";
		java.util.Date birthDate=member.getBirthDate();
		
		PreparedStatement ps = conn.prepareStatement(SQL);
		ps.setString(1, member.getMemberName());
		ps.setString(2, member.getEmail());
		ps.setString(3, member.getPassword());
		ps.setBytes(4, member.getMemberPhoto());
		
		if (birthDate != null) {
		    ps.setDate(5, new Date(birthDate.getTime()));  // 只有當 birthDate 不是 null 時才執行
		} else {
		    ps.setNull(5, java.sql.Types.DATE);  // 如果是 null，就設置為 SQL null
		}
		
		ps.setString(6, member.getDivingLicense());
		ps.setInt(7, id);

		ps.execute();
		ps.close();
	}
}
