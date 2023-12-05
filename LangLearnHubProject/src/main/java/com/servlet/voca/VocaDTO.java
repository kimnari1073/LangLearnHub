package com.servlet.voca;

import java.util.ArrayList;
import java.util.HashMap;

public class VocaDTO {
	private String listName;
	private String userId;
//	private ArrayList<String> vocaKey;
//	private ArrayList<String> vocaVal;
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
	
//	public ArrayList<String> getVocaKey() {
//		return vocaKey;
//	}
//	public void setVocaKey(String vocaKey) {
//		this.vocaKey.add(vocaKey);
//	}
//	public ArrayList<String> getVocaVal() {
//		return vocaVal;
//	}
//	public void setVocaVal(String vocaVal) {
//		this.vocaVal.add(vocaVal);
//	}
	

}
