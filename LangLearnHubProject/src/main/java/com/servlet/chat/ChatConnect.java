package com.servlet.chat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ChatConnect {
	// 요청 보낼 URL/API KEY 
	private static final String URL = "https://api.openai.com/v1/chat/completions";
	private static final String KEY = "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";
	public static String chatConnect(String examtype, String ques) throws IOException {
		// HTTP 연결 설정
		String res = "";
	    URL url = new URL(URL);
	    HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
	    urlConn.setRequestMethod("POST");
	    urlConn.setRequestProperty("Authorization", "Bearer " + KEY);
	    urlConn.setRequestProperty("Content-Type", "application/json");
	    urlConn.setDoOutput(true);

	    // 요청 본문 생성 
	    JSONObject body = new JSONObject();
	    body.put("model", "gpt-4");

	    JSONArray messages = new JSONArray();

	    JSONObject systemMessage = new JSONObject();
	    systemMessage.put("role", "system");
	    systemMessage.put("content",examtype);
	    messages.add(systemMessage);

	    JSONObject userMessage = new JSONObject();
	    userMessage.put("role", "user");
	    userMessage.put("content", ques);
	    messages.add(userMessage);
	    
	    body.put("messages", messages);
	    System.out.println(messages);

	    // 본문 내용으로 요청 보내기 
	    try (OutputStream os = urlConn.getOutputStream()) {
	        byte[] input = body.toString().getBytes("utf-8");
	        os.write(input, 0, input.length);  
	    }

	    // 응답 읽기 
	    try (BufferedReader br = new BufferedReader(
	            new InputStreamReader(urlConn.getInputStream(), "utf-8"))) {
	        StringBuilder responseLine = new StringBuilder();
	        String responseLineOne;
	        while ((responseLineOne = br.readLine()) != null) {
	            responseLine.append(responseLineOne.trim());
	        }
	        try {
	        	// JSON 응답 파싱 
	        	JSONParser parser = new JSONParser();
	            JSONObject jsonObject = (JSONObject) parser.parse(responseLine.toString());

	            JSONArray choicesArray = (JSONArray) jsonObject.get("choices");

	            JSONObject firstChoice = (JSONObject) choicesArray.get(0);

	            JSONObject messageObject = (JSONObject) firstChoice.get("message");

	            res = (String) messageObject.get("content");
	            
	            // 문자열 처리 
		        if (res.startsWith("<br><br>")) res = res.replaceFirst("<br><br>", "");
	            res=res.replace("<br><br>", "<br>");
	            res=res.replace("\n", "<br>");
	            res=res.replace("X ", "");
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	    }
	    urlConn.disconnect();
	    return res;
	}
}
