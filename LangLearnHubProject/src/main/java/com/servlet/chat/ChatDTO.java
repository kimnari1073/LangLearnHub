package com.servlet.chat;

public class ChatDTO {
	private String userId;
	private String title;
	private String Q;
	private String A;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQ() {
		return Q;
	}
	public void setQ(String q) {
		Q = q;
	}
	public String getA() {
		return A;
	}
	public void setA(String a) {
		A = a;
	}
	
	
}
