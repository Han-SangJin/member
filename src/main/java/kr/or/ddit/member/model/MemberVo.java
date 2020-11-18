package kr.or.ddit.member.model;

import java.sql.Date;

import org.hibernate.validator.constraints.NotEmpty;

public class MemberVo {
	
	private String userid;
	private String pass;
	private String usernm;
	private String alias;
	private String addr1;
	private String addr2;
	private Date reg_dt;
	private String zipcode;
	private String filename;
	private String realFilename;
	
	
	public MemberVo() {
	}
	
	
	public MemberVo(String userid, String pass, String usernm, String alias, String addr1, String addr2, String zipcode, String filename, String realFilename) {
		this.userid = userid;
		this.pass = pass;
		this.usernm = usernm;
		this.alias = alias;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.zipcode = zipcode;
		this.filename = filename;
		this.realFilename = realFilename;
	}
	
	



	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getRealFilename() {
		return realFilename;
	}
	public void setRealFilename(String realFilename) {
		this.realFilename = realFilename;
	}
	
	
	
	@Override
	public String toString() {
		return "MemberVo [userid=" + userid + ", pass=" + pass + ", usernm=" + usernm + ", alias=" + alias + ", addr1="
				+ addr1 + ", addr2=" + addr2 + ", reg_dt=" + reg_dt + ", zipcode=" + zipcode + ", filename=" + filename
				+ ", realFilename=" + realFilename + "]";
	}
	

	
}
