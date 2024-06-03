package study;

public class VocaVO {
	private int idx;
	private String memberMid;
	private String category;
	private String word;
	private String meaning;
	private String partOfSpeech;
	private String example;
	
	private String wordCnt;
	
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getMeaning() {
		return meaning;
	}
	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}
	public String getPartOfSpeech() {
		return partOfSpeech;
	}
	public void setPartOfSpeech(String partOfSpeech) {
		this.partOfSpeech = partOfSpeech;
	}
	public String getExample() {
		return example;
	}
	public void setExample(String example) {
		this.example = example;
	}
	public String getWordCnt() {
		return wordCnt;
	}
	public void setWordCnt(String wordCnt) {
		this.wordCnt = wordCnt;
	}
	
	@Override
	public String toString() {
		return "VocaVO [idx=" + idx + ", memberMid=" + memberMid + ", category=" + category + ", word=" + word
				+ ", meaning=" + meaning + ", partOfSpeech=" + partOfSpeech + ", example=" + example + ", wordCnt=" + wordCnt
				+ "]";
	}
}
