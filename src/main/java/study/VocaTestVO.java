package study;

public class VocaTestVO {
	private int idx;
	private String memberMid;
	private int vocaIdx;
	private String category;
	private int score;
	private String testDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMemberMid() {
		return memberMid;
	}
	public void setMemberMid(String memberMid) {
		this.memberMid = memberMid;
	}
	public int getVocaIdx() {
		return vocaIdx;
	}
	public void setVocaIdx(int vocaIdx) {
		this.vocaIdx = vocaIdx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getTestDate() {
		return testDate;
	}
	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}
	@Override
	public String toString() {
		return "vocaTestVO [idx=" + idx + ", memberMid=" + memberMid + ", vocaIdx=" + vocaIdx + ", category=" + category
				+ ", score=" + score + ", testDate=" + testDate + "]";
	}
	
}
