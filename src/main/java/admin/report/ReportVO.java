package admin.report;

public class ReportVO {
	private int idx;
	private String reportedMid;
	private String reportingMid;
	private String reason;
	private String reportDate;
	
	private String mid; // member 테이블의 정보
	private String nickName;
	private String name;
	private String email;
	private String gender;
	private String birthday;
	private String startDate;
	private String show;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getReportedMid() {
		return reportedMid;
	}
	public void setReportedMid(String reportedMid) {
		this.reportedMid = reportedMid;
	}
	public String getReportingMid() {
		return reportingMid;
	}
	public void setReportingMid(String reportingMid) {
		this.reportingMid = reportingMid;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	
	@Override
	public String toString() {
		return "ReportVO [idx=" + idx + ", reportedMid=" + reportedMid + ", reportingMid=" + reportingMid + ", reason="
				+ reason + ", reportDate=" + reportDate + ", mid=" + mid + ", nickName=" + nickName + ", name=" + name
				+ ", email=" + email + ", gender=" + gender + ", birthday=" + birthday + ", startDate=" + startDate + ", show="
				+ show + "]";
	}
}
