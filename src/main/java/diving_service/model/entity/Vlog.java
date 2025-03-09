package diving_service.model.entity;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import diving_service.util.CommonTool;

public class Vlog {

	private Integer vlogSeq;
	private Integer vlogId;
	private String divingType;
	private Date divingDate = CommonTool.getDefaultDate();
	private Integer divingDuration;
	private String location;
	private Float maxDepth;
	private Float avgTemp;
	private Float visibility;
	private Integer tankPressOrigin;
	private Integer tankPressRemain;
	private String tankType;
	private String comments;
	private Member member = new Member();

	private String weather;
	private Time enterWaterTime;
	private Time exitWaterTime;
	private Float avgDepth;
	private String partner;
	private byte[] divingPhoto;
	private String base64DivingPhoto;
	private List<Vlog> vlogs = new ArrayList();
	private String createdAt;

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public byte[] getDivingPhoto() {
		return divingPhoto;
	}

	public void setDivingPhoto(byte[] divingPhoto) {
		if (divingPhoto != null) {
			this.divingPhoto = divingPhoto;
			// 根據圖片內容獲取 MIME 類型
			String mimeType = CommonTool.getMimeType(divingPhoto);
			// 將圖片轉為 base64 字符串
			this.base64DivingPhoto = "data:%s;base64,".formatted(mimeType)
					+ Base64.getEncoder().encodeToString(divingPhoto);
		} else {
			// 如果 memberPhoto 為 null，則將 base64Photo 設為 null
			this.divingPhoto = null;
			this.base64DivingPhoto = null;
		}
	}

	public String getBase64DivingPhoto() {
		return base64DivingPhoto;
	}

	public void setBase64DivingPhoto(String base64DivingPhoto) {
		this.base64DivingPhoto = base64DivingPhoto;
	}

	public List<Vlog> getVlogs() {
		return vlogs;
	}

	public void setVlogs(List<Vlog> vlogs) {
		this.vlogs = vlogs;
	}

	public Integer getVlogSeq() {
		return vlogSeq;
	}

	public void setVlogSeq(Integer vlogSeq) {
		this.vlogSeq = vlogSeq;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public Time getEnterWaterTime() {
		return enterWaterTime;
	}

	public void setEnterWaterTime(Time enterWaterTime) {
		this.enterWaterTime = enterWaterTime;
	}

	public Time getExitWaterTime() {
		return exitWaterTime;
	}

	public void setExitWaterTime(Time exitWaterTime) {
		this.exitWaterTime = exitWaterTime;
	}

	public Float getAvgDepth() {
		return avgDepth;
	}

	public void setAvgDepth(Float avgDepth) {
		this.avgDepth = avgDepth;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public Integer getVlogId() {
		return vlogId;
	}

	public void setVlogId(Integer vlogId) {
		this.vlogId = vlogId;
	}

	public String getDivingType() {
		return divingType;
	}

	public void setDivingType(String divingType) {
		this.divingType = divingType;
	}

	public Date getDivingDate() {
		return divingDate;
	}

	public void setDivingDate(Date divingDate) {
		this.divingDate = divingDate;
	}

	public Integer getDivingDuration() {
		return divingDuration;
	}

	public void setDivingDuration(Integer divingDuration) {
		this.divingDuration = divingDuration;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Float getMaxDepth() {
		return maxDepth;
	}

	public void setMaxDepth(Float maxDepth) {
		this.maxDepth = maxDepth;
	}

	public Float getAvgTemp() {
		return avgTemp;
	}

	public void setAvgTemp(Float minTemp) {
		this.avgTemp = minTemp;
	}

	public Float getVisibility() {
		return visibility;
	}

	public void setVisibility(Float visibility) {
		this.visibility = visibility;
	}

	public Integer getTankPressOrigin() {
		return tankPressOrigin;
	}

	public void setTankPressOrigin(Integer tankPressOrigin) {
		this.tankPressOrigin = tankPressOrigin;
	}

	public Integer getTankPressRemain() {
		return tankPressRemain;
	}

	public void setTankPressRemain(Integer tankPressRemain) {
		this.tankPressRemain = tankPressRemain;
	}

	public String getTankType() {
		return tankType;
	}

	public void setTankType(String tankType) {
		this.tankType = tankType;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
}