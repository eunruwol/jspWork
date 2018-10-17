package kr.or.ddit.user.model;

import java.util.Date;

public class ProdVo {
	private String prod_id;		// 제품 아이디
	private String prod_name;	// 제품 명
	private String lprod_nm;	// 제품 그룹명
	private Date prod_insdate;	// 제품등록일(yyyy/MM/dd)
	private String buyer_email;	// 바이어 이메일
	private String buyer_id;	// 바이어 아이디
	private String buyer_name;	// 바이어 이름
	private String buyer_mail;	// 바이어 이메일
	
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public String getLprod_nm() {
		return lprod_nm;
	}
	public void setLprod_nm(String lprod_nm) {
		this.lprod_nm = lprod_nm;
	}
	public Date getProd_insdate() {
		return prod_insdate;
	}
	public void setProd_insdate(Date prod_insdate) {
		this.prod_insdate = prod_insdate;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getBuyer_id() {
		return buyer_id;
	}
	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}
	public String getBuyer_mail() {
		return buyer_mail;
	}
	public void setBuyer_mail(String buyer_mail) {
		this.buyer_mail = buyer_mail;
	}
	
	@Override
	public String toString() {
		return "ProdVo [prod_id=" + prod_id + ", prod_name=" + prod_name
				+ ", lprod_nm=" + lprod_nm + ", prod_insdate=" + prod_insdate
				+ ", buyer_email=" + buyer_email + ", buyer_id=" + buyer_id
				+ ", buyer_name=" + buyer_name + ", buyer_mail=" + buyer_mail
				+ "]";
	}
}