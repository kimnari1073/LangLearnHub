package com.servlet.voca;

import java.util.ArrayList;
import java.util.HashMap;

public class VocaDTO {
	private String listName;
	private String userId;
	private HashMap<String,String> vocaHash=new HashMap<>();
	
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
