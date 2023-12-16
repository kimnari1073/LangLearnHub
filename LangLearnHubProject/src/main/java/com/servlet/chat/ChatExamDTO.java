package com.servlet.chat;

public class ChatExamDTO {
	private String id;
	private int num;
	private String title; 
	private String ques;
	private String examparse; 
	private String examtype;
	private String color; 
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	 
	public String getExamparse() {
		return examparse;
	}
	public void setExamparse(String examparse) {
		this.examparse = examparse;
	}
	public String getExamtype() {
		return examtype;
	}
	public void setExamtype(String examtype) {
		this.examtype = examtype;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
