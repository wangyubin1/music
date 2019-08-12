package org.sgyy.domain;

public class Admin {
	private Integer aid;
	private String apwd;
	private String aname;
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Admin() {
		super();
	}
	public Admin(Integer aid, String apwd, String aname) {
		super();
		this.aid = aid;
		this.apwd = apwd;
		this.aname = aname;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
}
