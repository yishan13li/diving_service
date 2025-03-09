package diving_service.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URLConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.logging.Logger;

public class CommonTool {

	private static final Logger log = Logger.getLogger("CommonTool");

	// 預設日期
	public static Date getDefaultDate() {
		Date defaultDate = new Date();
		defaultDate.setTime(0);
		return defaultDate;
	}

	// java日期時間轉成sql date
	public static java.sql.Date convertUtilToSqlDate(Date date) {
		if (date == null) {
			return new java.sql.Date(getDefaultDate().getTime());
		}
		return new java.sql.Date(date.getTime());
	}

	public static String getMimeType(byte[] imageBytes) {

		try {
			ByteArrayInputStream bais = new ByteArrayInputStream(imageBytes);

			String mimeType = URLConnection.guessContentTypeFromStream(bais);

			bais.close();

			return mimeType;
		} catch (IOException e) {
			log.warning("讀取圖片 mime-type 出錯，使用預設 image/png");
			return "image/png";
		}

	}

	private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("yyyy年MM月dd日 HH:mm");

	public static String formatLocalDateTime(LocalDateTime dateTime) {
		return dateTime != null ? dateTime.format(FORMATTER) : null;
	}

	public static LocalDateTime getLocalDateTimeFromResultSet(ResultSet rs, String columnLabel) throws SQLException {
		Timestamp timestamp = rs.getTimestamp(columnLabel);
		return timestamp != null ? timestamp.toLocalDateTime() : null;
	}
}
