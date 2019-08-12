package org.sgyy.domain;

import java.util.Date;

public class Song {
	private Integer sid;
	private String sname;
	private String sauthor;
	private String snum;
	private String stime;
	private String surl;
	private String ltime;
	
	public Song(Integer sid, String sname, String sauthor, String snum, String stime, String surl, String ltime) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.sauthor = sauthor;
		this.snum = snum;
		this.stime = stime;
		this.surl = surl;
		this.ltime = ltime;
	}
	public String getLtime() {
		return ltime;
	}
	public void setLtime(String ltime) {
		this.ltime = ltime;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSauthor() {
		return sauthor;
	}
	public void setSauthor(String sauthor) {
		this.sauthor = sauthor;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getSurl() {
		return surl;
	}
	public void setSurl(String surl) {
		this.surl = surl;
	}
	public Song() {
		super();
	}
	public Song(Integer sid, String sname, String sauthor, String snum, String stime, String surl) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.sauthor = sauthor;
		this.snum = snum;
		this.stime = stime;
		this.surl = surl;
	}
}
