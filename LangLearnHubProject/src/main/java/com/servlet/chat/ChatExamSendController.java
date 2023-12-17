package com.servlet.chat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/chatexamsend.do")
public class ChatExamSendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String API_URL = "https://api.openai.com/v1/chat/completions";
	private static final String API_KEY = "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";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String req = request.getParameter("ans");
		
		
		URL url = new URL(API_URL);
		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		urlConn.setRequestMethod("POST");
		urlConn.setRequestProperty("Authorization", "Bearer " + API_KEY);
		urlConn.setRequestProperty("Content-Type", "application/json");
		urlConn.setDoOutput(true);

		JSONObject body = new JSONObject();
		body.put("model", "gpt-3.5-turbo");

		JSONArray messages = new JSONArray();

		// 사용자 입력 메시지
		JSONObject userMessage = new JSONObject();
		userMessage.put("role", "user");
		userMessage.put("content", req);
		messages.add(userMessage);

		body.put("messages", messages);

		try (OutputStream os = urlConn.getOutputStream()) {
		    byte[] input = body.toString().getBytes("utf-8");
		    os.write(input, 0, input.length);
		}

		try (BufferedReader br = new BufferedReader(
		        new InputStreamReader(urlConn.getInputStream(), "utf-8"))) {
		    StringBuilder responseLine = new StringBuilder();
		    String responseLineOne;
		    while ((responseLineOne = br.readLine()) != null) {
		        responseLine.append(responseLineOne.trim());
		    }
		    try {
		        JSONParser parser = new JSONParser();
		        JSONObject jsonObject = (JSONObject) parser.parse(responseLine.toString());

		        JSONArray choicesArray = (JSONArray) jsonObject.get("choices");
		        JSONObject firstChoice = (JSONObject) choicesArray.get(0);
		        JSONObject messageObject = (JSONObject) firstChoice.get("message");
		        

		        String res = (String) messageObject.get("content");
		        request.setAttribute("chatExamRes", res);
				RequestDispatcher dispatcher = request.getRequestDispatcher("chat/chatExamList.do");
				dispatcher.forward(request, response);

		    } catch (ParseException e) {
		        e.printStackTrace();
		    }

		}

		urlConn.disconnect();

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
