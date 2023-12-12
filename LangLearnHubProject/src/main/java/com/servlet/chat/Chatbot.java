package com.servlet.chat;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/chat.do")
public class Chatbot extends HttpServlet {
	
	ArrayList<String> chatList;
	private static final String API_URL = "https://api.openai.com/v1/chat/completions";
	//키 발급 -> 커밋 시 초기화
	private static final String API_KEY = "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";

	public void init(ServletConfig config) throws ServletException {
		chatList = new ArrayList<String>();
		System.out.println("init()호출");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();	
		if(session.getAttribute("res") == null) 
			session.setAttribute("res", "");

		String req = request.getParameter("req");
//		System.out.println("req: "+req);
//		System.out.println("res: "+session.getAttribute("res"));
//		chatList.add(req);
		
	    URL url = new URL(API_URL);
	    HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
	    urlConn.setRequestMethod("POST");
	    urlConn.setRequestProperty("Authorization", "Bearer " + API_KEY);
	    urlConn.setRequestProperty("Content-Type", "application/json");
	    urlConn.setDoOutput(true);

	    JSONObject body = new JSONObject();
	    body.put("model", "gpt-3.5-turbo");

	    JSONArray messages = new JSONArray();

	    JSONObject systemMessage = new JSONObject();
	    systemMessage.put("role", "system");
//	    systemMessage.put("content","한 마디 단어로 대답해");
	    systemMessage.put("content", "답변을 할 때는 큰 따옴표를 쓰지 마. 너는 영어 선생님이고, 사용자는 영어와 관련된 질문을 할 거야.");
	    messages.add(systemMessage);

	    JSONObject userMessage = new JSONObject();
	    userMessage.put("role", "user");
	    userMessage.put("content", req);
	    messages.add(userMessage);

	    JSONObject assistantMessage = new JSONObject();
	    assistantMessage.put("role", "assistant");
	    assistantMessage.put("content",(String)session.getAttribute("res"));
	    messages.add(assistantMessage);


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
	            chatList.add(res);
	            session.setAttribute("res", res);   
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	        
	    }
	    urlConn.disconnect();
	    session.setAttribute("chatList", chatList);
//	    System.out.println(chatList);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("chatBot2.jsp");
//		dispatcher.forward(request, response);
		response.sendRedirect("chat/chatBot.jsp");
		
	    
	    
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request,response);
	}

    
}
