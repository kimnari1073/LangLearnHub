package com.servlet.voca;

import java.util.ArrayList;
import java.util.HashMap;

public class VocaDTO {
	private int listIndex; // 단어장 번호
	private String listName; // 단어장 이름
	private String userId; // 유저 아이디
	private HashMap<String,String> vocaHash=new HashMap<>(); //영어 단어, 뜻
	
	
	public int getListIndex() {
		return listIndex;
	}
	public void setListIndex(int listIndex) {
		this.listIndex = listIndex;
	}
	public String getListName() {
		return listName;
	}
	public void setListName(String listName) {
		this.listName = listName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public HashMap<String, String> getVocaHash() {
		return vocaHash;
	}
	public void setVocaHash(String key, String val) {
		this.vocaHash.put(key,val);
	}
}
