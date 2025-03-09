package diving_service.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import diving_service.model.entity.Member;
import diving_service.model.entity.Vlog;
import diving_service.util.CommonTool;

public class VlogDao {

	private Connection conn;

	public VlogDao(Connection conn) {
		this.conn = conn;
	}

	// 找某人的所有vlog and 其個人資訊
	public List<Vlog> findAllVlogsByMemberId(Integer memberId) throws SQLException {
		final String SQL = """
				        SELECT v.*, m.member_name, m.member_photo, m.birthdate, m.diving_license
				        FROM [diving_service].[dbo].[diving_vlog] v
				        JOIN [diving_service].[dbo].[members] m
				        ON v.member_id = m.id
				        WHERE v.member_id = ?
				        ORDER BY v.created_at desc,v.diving_date desc
				""";
		List<Vlog> vlogs = new ArrayList<>();
		PreparedStatement ps = conn.prepareStatement(SQL);
		ps.setInt(1, memberId);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Vlog vlog = new Vlog();
			vlog.setVlogId(rs.getInt("id"));
			vlog.setDivingType(rs.getString("diving_type"));
			vlog.setDivingDate(rs.getDate("diving_date"));
			vlog.setDivingDuration(rs.getInt("diving_duration"));
			vlog.setLocation(rs.getString("location"));
			vlog.setMaxDepth(rs.getFloat("max_depth"));
			vlog.setAvgTemp(rs.getFloat("avg_temp"));
			vlog.setVisibility(rs.getFloat("visibility"));
			vlog.setTankPressOrigin(rs.getInt("tank_original_pressure"));
			vlog.setTankPressRemain(rs.getInt("tank_remaining_pressure"));
			vlog.setTankType(rs.getString("tank_type"));
			vlog.setComments(rs.getString("comments"));

			vlog.setWeather(rs.getString("weather"));
			vlog.setEnterWaterTime(rs.getTime("enter_water_time"));
			vlog.setExitWaterTime(rs.getTime("exit_water_time"));
			vlog.setAvgDepth(rs.getFloat("avg_depth"));
			vlog.setPartner(rs.getString("partner"));
			vlog.setDivingPhoto(rs.getBytes("diving_photo"));
			vlog.setCreatedAt(
					CommonTool.formatLocalDateTime(CommonTool.getLocalDateTimeFromResultSet(rs, "created_at")));

			Member member = new Member();
			member.setMemberName(rs.getString("member_name"));
			member.setMemberPhoto(rs.getBytes("member_photo"));
			member.setBirthDate(rs.getDate("birthdate"));
			member.setDivingLicense(rs.getString("diving_license"));

			vlog.setMember(member);
			vlogs.add(vlog);
		}

		rs.close();
		ps.close();
		return vlogs;
	}

	// 從vlog資訊找到po文者的資訊
	public Vlog findVlogWithMemberByVlogId(Integer vlogId) throws SQLException {
		final String SQL = """
								select* from [diving_service].[dbo].[diving_vlog] as v
								left join [diving_service].[dbo].[members] as m
								on v.member_id =m.id where v.id=?
				""";
		Vlog vlog = null;
		PreparedStatement ps = conn.prepareStatement(SQL);
		ps.setInt(1, vlogId);

		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			vlog = new Vlog();
			vlog.setVlogId(rs.getInt("id"));
			vlog.setDivingType(rs.getString("diving_type"));
			vlog.setDivingDate(rs.getDate("diving_date"));
			vlog.setDivingDuration(rs.getInt("diving_duration"));
			vlog.setLocation(rs.getString("location"));
			vlog.setMaxDepth(rs.getFloat("max_depth"));
			vlog.setAvgTemp(rs.getFloat("avg_temp"));
			vlog.setVisibility(rs.getFloat("visibility"));
			vlog.setTankPressOrigin(rs.getInt("tank_original_pressure"));
			vlog.setTankPressRemain(rs.getInt("tank_remaining_pressure"));
			vlog.setTankType(rs.getString("tank_type"));
			vlog.setComments(rs.getString("comments"));

			vlog.setWeather(rs.getString("weather"));
			vlog.setEnterWaterTime(rs.getTime("enter_water_time"));
			vlog.setExitWaterTime(rs.getTime("exit_water_time"));
			vlog.setAvgDepth(rs.getFloat("avg_depth"));
			vlog.setPartner(rs.getString("partner"));
			vlog.setDivingPhoto(rs.getBytes("diving_photo"));
			vlog.setCreatedAt(
					CommonTool.formatLocalDateTime(CommonTool.getLocalDateTimeFromResultSet(rs, "created_at")));

			Member member = new Member();
			member.setMemberId(rs.getInt("member_id"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberPhoto(rs.getBytes("member_photo"));
			member.setBirthDate(rs.getDate("birthdate"));
			member.setDivingLicense(rs.getString("diving_license"));
			vlog.setMember(member);
		} else {
			throw new RuntimeException("目標 Vlog 不存在。vlog_id: %s".formatted(vlogId));
		}
		rs.close();
		ps.close();
		return vlog;
	}

	// 用vlog id找此vlog的資訊
	public Vlog findVlogByVlogId(Integer vlogId) throws SQLException {
		final String SQL = "select* from [diving_service].[dbo].[diving_vlog] where id=?";
		Vlog vlog = null;
		PreparedStatement ps = conn.prepareStatement(SQL);
		ps.setInt(1, vlogId);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			vlog.setVlogId(rs.getInt("id"));
			vlog.setDivingType(rs.getString("diving_type"));
			vlog.setDivingDate(rs.getDate("diving_date"));
			vlog.setDivingDuration(rs.getInt("diving_duration"));
			vlog.setMaxDepth(rs.getFloat("max_depth"));
			vlog.setLocation(rs.getString("location"));
			vlog.setAvgTemp(rs.getFloat("avg_temp"));
			vlog.setVisibility(rs.getFloat("visibility"));
			vlog.setTankPressOrigin(rs.getInt("tank_original_pressure"));
			vlog.setTankPressRemain(rs.getInt("tank_remaining_pressure"));
			vlog.setTankType(rs.getString("tank_type"));
			vlog.setComments(rs.getString("comments"));

			vlog.setWeather(rs.getString("weather"));
			vlog.setEnterWaterTime(rs.getTime("enter_water_time"));
			vlog.setExitWaterTime(rs.getTime("exit_water_time"));
			vlog.setAvgDepth(rs.getFloat("avg_depth"));
			vlog.setPartner(rs.getString("partner"));
			vlog.setDivingPhoto(rs.getBytes("diving_photo"));
			vlog.setCreatedAt(
					CommonTool.formatLocalDateTime(CommonTool.getLocalDateTimeFromResultSet(rs, "created_at")));

		} else {
			throw new RuntimeException("目標 Vlog 不存在。vlog_id: %s".formatted(vlogId));
		}

		rs.close();
		ps.close();
		return vlog;

	}

	// 在一次查詢中，取得所有vlog，與po文者的資訊
	public List<Vlog> findAllVlogWithMember() throws SQLException {
		final String SQL = """
								select* from [diving_service].[dbo].[diving_vlog] as v
								left join [diving_service].[dbo].[members] as m
								on v.member_id =m.id ORDER BY v.created_at desc,v.diving_date desc
				""";
		List<Vlog> vlogs = new ArrayList<Vlog>();
		PreparedStatement ps = conn.prepareStatement(SQL);

		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Vlog vlog = new Vlog();
			vlog.setVlogId(rs.getInt("id"));
			vlog.setDivingType(rs.getString("diving_type"));
			vlog.setDivingDate(rs.getDate("diving_date"));
			vlog.setDivingDuration(rs.getInt("diving_duration"));
			vlog.setLocation(rs.getString("location"));
			vlog.setMaxDepth(rs.getFloat("max_depth"));
			vlog.setAvgTemp(rs.getFloat("avg_temp"));
			vlog.setVisibility(rs.getFloat("visibility"));
			vlog.setTankPressOrigin(rs.getInt("tank_original_pressure"));
			vlog.setTankPressRemain(rs.getInt("tank_remaining_pressure"));
			vlog.setTankType(rs.getString("tank_type"));
			vlog.setComments(rs.getString("comments"));

			vlog.setWeather(rs.getString("weather"));
			vlog.setEnterWaterTime(rs.getTime("enter_water_time"));
			vlog.setExitWaterTime(rs.getTime("exit_water_time"));
			vlog.setAvgDepth(rs.getFloat("avg_depth"));
			vlog.setPartner(rs.getString("partner"));
			vlog.setDivingPhoto(rs.getBytes("diving_photo"));
			vlog.setCreatedAt(
					CommonTool.formatLocalDateTime(CommonTool.getLocalDateTimeFromResultSet(rs, "created_at")));

			Member member = new Member(); 
			member.setMemberId(rs.getInt("member_id"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberPhoto(rs.getBytes("member_photo"));
			member.setBirthDate(rs.getDate("birthdate"));
			member.setDivingLicense(rs.getString("diving_license"));

			vlog.setMember(member);
			vlogs.add(vlog);
		}

		rs.close();
		ps.close();
		return vlogs;
	}

	// 新增vlog
	public void createVlog(Vlog vlog) throws SQLException {
		final String SQL = """
				INSERT INTO [diving_service].[dbo].[diving_vlog]
				           ([member_id], [diving_type], [diving_date], [diving_duration], [location],
				            [max_depth], [avg_temp], [visibility], [tank_original_pressure], [tank_remaining_pressure],
				            [tank_type], [comments], [weather], [enter_water_time], [exit_water_time], [avg_depth],
				            [partner], [diving_photo])
				VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
								""";

		java.util.Date divingDate = vlog.getDivingDate();
		// 準備執行 SQL 語句
		PreparedStatement ps = conn.prepareStatement(SQL);

		ps.setInt(1, vlog.getMember().getMemberId()); // member_id
		ps.setString(2, vlog.getDivingType()); // diving_type
//		ps.setDate(3, new java.sql.Date(vlog.getDivingDate().getTime())); // diving_date
		ps.setInt(4, vlog.getDivingDuration()); // diving_duration
		ps.setString(5, vlog.getLocation()); // location
		ps.setFloat(6, vlog.getMaxDepth()); // max_depth
		ps.setFloat(7, vlog.getAvgTemp()); // avg_temp
		ps.setFloat(8, vlog.getVisibility()); // visibility
		ps.setInt(9, vlog.getTankPressOrigin()); // tank_original_pressure
		ps.setInt(10, vlog.getTankPressRemain()); // tank_remaining_pressure
		ps.setString(11, vlog.getTankType()); // tank_type
		ps.setString(12, vlog.getComments()); // comments
		ps.setString(13, vlog.getWeather()); // weather (第13欄位)
		ps.setTime(14, vlog.getEnterWaterTime()); // enter_water_time (第14欄位)
		ps.setTime(15, vlog.getExitWaterTime()); // exit_water_time
		ps.setFloat(16, vlog.getAvgDepth()); // avg_depth
		ps.setString(17, vlog.getPartner()); // partner
		ps.setBytes(18, vlog.getDivingPhoto()); // diving_photo

		if (divingDate != null) {
			ps.setDate(3, new Date(divingDate.getTime())); // 只有當 birthDate 不是 null 時才執行
		} else {
			ps.setNull(3, java.sql.Types.DATE); // 如果是 null，就設置為 SQL null
		}

		ps.execute();
		ps.close();
	}

	// 刪除vlog
	public boolean deleteByVlogId(int vlogId) throws SQLException {
		final String SQL = "DELETE FROM [diving_service].[dbo].[diving_vlog] WHERE id = ?";
		try (PreparedStatement ps = conn.prepareStatement(SQL)) { // 使用 try-with-resources 自動管理資源
			ps.setInt(1, vlogId);
			return ps.executeUpdate() > 0; // 回傳受影響的行數是否大於 0
		} catch (SQLException e) {
			System.err.println("刪除失敗: " + e.getMessage());
			return false; // 如果出錯，返回 false
		}
	}

	// 更新 vlog
	public void updateVlogById(Integer vlogId, Vlog vlog) throws SQLException {
		final String SQL = """
				UPDATE [diving_service].[dbo].[diving_vlog]
				SET
				    [diving_type] = ?,
				    [diving_date] = ?,
				    [diving_duration] = ?,
				    [location] = ?,
				    [max_depth] = ?,
				    [avg_temp] = ?,
				    [visibility] = ?,
				    [tank_original_pressure] = ?,
				    [tank_remaining_pressure] = ?,
				    [tank_type] = ?,
				    [comments] = ?,
				    [weather] = ?,
				    [enter_water_time] = ?,
				    [exit_water_time] = ?,
				    [avg_depth] = ?,
				    [partner] = ?,
				    [diving_photo] = ?
				WHERE [id] = ?;
				""";

		try (PreparedStatement ps = conn.prepareStatement(SQL)) {
			ps.setString(1, vlog.getDivingType()); // diving_type
			ps.setDate(2, new java.sql.Date(vlog.getDivingDate().getTime())); // diving_date
			ps.setInt(3, vlog.getDivingDuration()); // diving_duration
			ps.setString(4, vlog.getLocation()); // location
			ps.setFloat(5, vlog.getMaxDepth()); // max_depth
			ps.setFloat(6, vlog.getAvgTemp()); // avg_temp
			ps.setFloat(7, vlog.getVisibility()); // visibility
			ps.setInt(8, vlog.getTankPressOrigin()); // tank_original_pressure
			ps.setInt(9, vlog.getTankPressRemain()); // tank_remaining_pressure
			ps.setString(10, vlog.getTankType()); // tank_type
			ps.setString(11, vlog.getComments()); // comments
			ps.setString(12, vlog.getWeather()); // weather
			ps.setTime(13, vlog.getEnterWaterTime()); // enter_water_time
			ps.setTime(14, vlog.getExitWaterTime()); // exit_water_time
			ps.setFloat(15, vlog.getAvgDepth()); // avg_depth
			ps.setString(16, vlog.getPartner()); // partner
			ps.setBytes(17, vlog.getDivingPhoto()); // diving_photo
			ps.setInt(18, vlogId); // id

			ps.executeUpdate(); // 執行更新
		}
	}

	// 查詢某個特定 vlog 在會員中的順序
    public int getVlogOrderForMember(int memberId, int vlogId) {
    	final String SQL = "SELECT id, vlog_order " +
                     "FROM ( " +
                     "    SELECT id, " +
                     "           ROW_NUMBER() OVER (ORDER BY diving_date ASC, exit_water_time ASC) AS vlog_order " +
                     "    FROM [diving_service].[dbo].[diving_vlog] " +
                     "    WHERE member_id = ? " +
                     ") AS ranked_vlogs " +
                     "WHERE id = ?";

        try (PreparedStatement stmt = conn.prepareStatement(SQL)) {
            stmt.setInt(1, memberId);  // 設定會員 ID
            stmt.setInt(2, vlogId);    // 設定 vlog ID

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("vlog_order");  // 回傳該 vlog 在會員中的順序
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return -1;  // 如果查無此 vlog，可以返回 -1 表示查詢錯誤
    }
}
