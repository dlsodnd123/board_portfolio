package kr.spring.board_portfolio.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVo {
	private int bo_num;
	private String bo_mb_nickname;
	private String bo_title;
	private String bo_content;
	private Date bo_registerDate;
	private String bo_isDel;
	private int bo_view;
	private int bo_recommendation;
	private int bo_Notrecommendation;
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public String getBo_mb_nickname() {
		return bo_mb_nickname;
	}
	public void setBo_mb_nickname(String bo_mb_nickname) {
		this.bo_mb_nickname = bo_mb_nickname;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public String getBo_registerDate() {
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String dateString = simpleFormat.format(bo_registerDate);
		return dateString;
	}
	public void setBo_registerDate(Date bo_registerDate) {
		this.bo_registerDate = bo_registerDate;
	}
	public String getBo_isDel() {
		return bo_isDel;
	}
	public void setBo_isDel(String bo_isDel) {
		this.bo_isDel = bo_isDel;
	}
	public int getBo_view() {
		return bo_view;
	}
	public void setBo_view(int bo_view) {
		this.bo_view = bo_view;
	}
	public int getBo_recommendation() {
		return bo_recommendation;
	}
	public void setBo_recommendation(int bo_recommendation) {
		this.bo_recommendation = bo_recommendation;
	}
	public int getBo_Notrecommendation() {
		return bo_Notrecommendation;
	}
	public void setBo_Notrecommendation(int bo_Notrecommendation) {
		this.bo_Notrecommendation = bo_Notrecommendation;
	}
	@Override
	public String toString() {
		return "BoardVo [bo_num=" + bo_num + ", bo_mb_nickname=" + bo_mb_nickname + ", bo_title=" + bo_title
				+ ", bo_content=" + bo_content + ", bo_registerDate=" + bo_registerDate + ", bo_isDel=" + bo_isDel
				+ ", bo_view=" + bo_view + ", bo_recommendation=" + bo_recommendation + ", bo_Notrecommendation="
				+ bo_Notrecommendation + "]";
	}
}
