package kr.spring.board_portfolio.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CommentVo {

	private int com_num;
	private String com_mb_nickname;
	private int com_bo_num;
	private String com_content;
	private Date com_registerDate;
	private String com_isDel;
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getCom_mb_nickname() {
		return com_mb_nickname;
	}
	public void setCom_mb_nickname(String com_mb_nickname) {
		this.com_mb_nickname = com_mb_nickname;
	}
	public int getCom_bo_num() {
		return com_bo_num;
	}
	public void setCom_bo_num(int com_bo_num) {
		this.com_bo_num = com_bo_num;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public Date getCom_registerDate() {
		return com_registerDate;
	}
	public void setCom_registerDate(Date com_registerDate) {
		this.com_registerDate = com_registerDate;
	}
	public String getCom_isDel() {
		return com_isDel;
	}
	public void setCom_isDel(String com_isDel) {
		this.com_isDel = com_isDel;
	}
	@Override
	public String toString() {
		return "CommentVo [com_num=" + com_num + ", com_mb_nickname=" + com_mb_nickname + ", com_bo_num=" + com_bo_num
				+ ", com_content=" + com_content + ", com_registerDate=" + com_registerDate + ", com_isDel=" + com_isDel
				+ "]";
	}
	
}
