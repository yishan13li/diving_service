package diving_service.model.entity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import diving_service.util.CommonTool;

public class Member {

	private Integer memberId;
	private String memberName;
	private String password;
	private Boolean enabled;
	private String email;
	private String role;
	private byte[] memberPhoto;
	private Date birthDate = CommonTool.getDefaultDate();
	private String divingLicense;
	private Date createdAt;
	private Date updatedAt;
	private String base64Photo;
	private List<Member> members = new ArrayList<>();
//	private List<DivingRecord> DiveRecords = new ArrayList<>();
//	private List<DivingPhoto> DivingPhotos = new ArrayList<>();

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Member [memberId=");
		builder.append(memberId);
		builder.append(", memberName=");
		builder.append(memberName);
		builder.append(", password=");
		builder.append(password);
		builder.append(", enabled=");
		builder.append(enabled);
		builder.append(", email=");
		builder.append(email);
		builder.append(", role=");
		builder.append(role);
		builder.append(", memberPhoto=");
		builder.append(Arrays.toString(memberPhoto));
		builder.append(", birthDate=");
		builder.append(birthDate);
		builder.append(", divingLicense=");
		builder.append(divingLicense);
		builder.append(", createdAt=");
		builder.append(createdAt);
		builder.append(", updatedAt=");
		builder.append(updatedAt);
		builder.append(", base64Photo=");
		builder.append(base64Photo);
		builder.append(", members=");
		builder.append(members);
		builder.append("]");
		return builder.toString();
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public byte[] getMemberPhoto() {
		return memberPhoto;
	}

	public void setMemberPhoto(byte[] memberPhoto) {
	    // 檢查 memberPhoto 是否為 null
	    if (memberPhoto != null) {
	        this.memberPhoto = memberPhoto;
	        // 根據圖片內容獲取 MIME 類型
	        String mimeType = CommonTool.getMimeType(memberPhoto);
	        // 將圖片轉為 base64 字符串
	        this.base64Photo = "data:%s;base64,".formatted(mimeType) + Base64.getEncoder().encodeToString(memberPhoto);
	    } else {
	        // 如果 memberPhoto 為 null，則將 base64Photo 設為 null
	        this.memberPhoto = null;
	        this.base64Photo = null;
	    }
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getDivingLicense() {
		return divingLicense;
	}

	public void setDivingLicense(String divingLicense) {
		this.divingLicense = divingLicense;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getBase64Photo() {
		return base64Photo;
	}

	public void setBase64Photo(String base64Photo) {
		this.base64Photo = base64Photo;
	}

	public List<Member> getMembers() {
		return members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

}
