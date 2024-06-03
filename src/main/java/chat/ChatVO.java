package chat;

public class ChatVO {
	private int idx;
	private String senderMid;
	private String receiverMid;
	private String message;
	private String chatDate;
	
	private String photo;
	private int date_diff;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSenderMid() {
		return senderMid;
	}
	public void setSenderMid(String senderMid) {
		this.senderMid = senderMid;
	}
	public String getReceiverMid() {
		return receiverMid;
	}
	public void setReceiverMid(String receiverMid) {
		this.receiverMid = receiverMid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getChatDate() {
		return chatDate;
	}
	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getDate_diff() {
		return date_diff;
	}
	public void setDate_diff(int date_diff) {
		this.date_diff = date_diff;
	}
	
	@Override
	public String toString() {
		return "ChatVO [idx=" + idx + ", senderMid=" + senderMid + ", receiverMid=" + receiverMid + ", message=" + message
				+ ", chatDate=" + chatDate + ", photo=" + photo + ", date_diff=" + date_diff + "]";
	}
}
