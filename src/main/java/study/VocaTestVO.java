package study;

public class VocaTestVO {
	private int idx;
	private String memberMid;
	private int vocaIdx;
	private String category;
	private int score;
	private String testDate;
	
    private String word;
    private String correctMeaning;
    private String userAnswer;
    private boolean correct;
	
    // Default constructor
    public VocaTestVO() {}

    // Constructor with parameters
    public VocaTestVO(String word, String correctMeaning, String userAnswer, boolean correct) {
        this.word = word;
        this.correctMeaning = correctMeaning;
        this.userAnswer = userAnswer;
        this.correct = correct;
    }
	
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
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getCorrectMeaning() {
		return correctMeaning;
	}
	public void setCorrectMeaning(String correctMeaning) {
		this.correctMeaning = correctMeaning;
	}
	public String getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	public boolean isCorrect() {
		return correct;
	}
	public void setCorrect(boolean correct) {
		this.correct = correct;
	}
	@Override
	public String toString() {
		return "VocaTestVO [idx=" + idx + ", memberMid=" + memberMid + ", vocaIdx=" + vocaIdx + ", category=" + category
				+ ", score=" + score + ", testDate=" + testDate + ", word=" + word + ", correctMeaning=" + correctMeaning
				+ ", userAnswer=" + userAnswer + ", correct=" + correct + "]";
	}
}
