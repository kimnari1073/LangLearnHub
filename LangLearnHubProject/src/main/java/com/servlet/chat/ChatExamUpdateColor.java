package com.servlet.chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/examupdate.do")
public class ChatExamUpdateColor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		String id=(String)session.getAttribute("id");
		
		ChatExamDAO eDAO = new ChatExamDAO();
		request.setCharacterEncoding("utf-8");
		String s = request.getParameter("num");
		String a = request.getParameter("ans");
		String q = request.getParameter("ques");
		System.out.println(q);
		int n = Integer.parseInt(s);
		String res = ChatConnect.chatConnect("너는 영어 선생님이야.", 
				"문제가 "+q+"이고, 답이 "+a+"일 때, 해당 답이 맞으면 O라고 대답해줘, 틀렸으면 X 라고 대답해줘 ");
		
		if(res.equals("O")) { eDAO.updateColor(n, "aqua",id);}
		else {eDAO.updateColor(n, "tomato",id);}
		request.setAttribute("answer", res);
		System.out.println(res);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/chatExamList.do");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
