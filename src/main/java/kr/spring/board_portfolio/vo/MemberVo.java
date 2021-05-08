package kr.spring.board_portfolio.vo;

public class MemberVo {

	private String mb_id;
	private String mb_nickname;
	private String mb_pw;
	private String mb_email;
	private String mb_division;
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_nickname() {
		return mb_nickname;
	}
	public void setMb_nickname(String mb_nickname) {
		this.mb_nickname = mb_nickname;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_division() {
		return mb_division;
	}
	public void setMb_division(String mb_division) {
		this.mb_division = mb_division;
	}
	@Override
	public String toString() {
		return "MemberVo [mb_id=" + mb_id + ", mb_nickname=" + mb_nickname + ", mb_pw=" + mb_pw + ", mb_email="
				+ mb_email + ", mb_division=" + mb_division + "]";
	}
}
