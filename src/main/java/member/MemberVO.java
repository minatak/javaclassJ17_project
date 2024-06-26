package member;

public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String nickName;
	private String name;
	private String email;
	private String gender;
	private String birthday;
	private String photo;
	private String country;
	private String city;
	private String nativeLanguage;
	private String learningLanguage;
	private String languageLevel;
	private String content;
	private String userDel;
	private int level;
	private String startDate;
	private String lastDate;
	
	private String myFlag; // 내 나라의 국기
	private String myLangFlag; // 모국어 국기
	private String wantLangFlag; // 배우고 싶은 언어의 나라 국기
	
	private String menuMid;		// 메뉴에서 보여주는 아이디
	private String menuPhoto;	// 메뉴에서 보여주는 회원 사진
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getNativeLanguage() {
		return nativeLanguage;
	}
	public void setNativeLanguage(String nativeLanguage) {
		this.nativeLanguage = nativeLanguage;
	}
	public String getLearningLanguage() {
		return learningLanguage;
	}
	public void setLearningLanguage(String learningLanguage) {
		this.learningLanguage = learningLanguage;
	}
	public String getLanguageLevel() {
		return languageLevel;
	}
	public void setLanguageLevel(String languageLevel) {
		this.languageLevel = languageLevel;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserDel() {
		return userDel;
	}
	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getMyFlag() {
		return myFlag;
	}
	public void setMyFlag(String myFlag) {
		this.myFlag = myFlag;
	}
	public String getMyLangFlag() {
		return myLangFlag;
	}
	public void setMyLangFlag(String myLangFlag) {
		this.myLangFlag = myLangFlag;
	}
	public String getWantLangFlag() {
		return wantLangFlag;
	}
	public void setWantLangFlag(String wantLangFlag) {
		this.wantLangFlag = wantLangFlag;
	}
	public String getMenuMid() {
		return menuMid;
	}
	public void setMenuMid(String menuMid) {
		this.menuMid = menuMid;
	}
	public String getMenuPhoto() {
		return menuPhoto;
	}
	public void setMenuPhoto(String menuPhoto) {
		this.menuPhoto = menuPhoto;
	}
	
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", nickName=" + nickName + ", name=" + name
				+ ", email=" + email + ", gender=" + gender + ", birthday=" + birthday + ", photo=" + photo + ", country="
				+ country + ", city=" + city + ", nativeLanguage=" + nativeLanguage + ", learningLanguage=" + learningLanguage
				+ ", languageLevel=" + languageLevel + ", content=" + content + ", userDel=" + userDel + ", level=" + level
				+ ", startDate=" + startDate + ", lastDate=" + lastDate + ", myFlag=" + myFlag + ", myLangFlag=" + myLangFlag
				+ ", wantLangFlag=" + wantLangFlag + ", menuMid=" + menuMid + ", menuPhoto=" + menuPhoto + "]";
	}
}
