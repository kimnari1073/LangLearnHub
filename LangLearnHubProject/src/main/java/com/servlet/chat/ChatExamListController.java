package com.servlet.chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/chatExamList.do")
public class ChatExamListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		ArrayList<ChatExamDTO> quesList = new ArrayList<>();
		HttpSession session = request.getSession();	
		ChatExamDAO edao = new ChatExamDAO();
		quesList = edao.chatSelect("tester1");
		session.setAttribute("quesList",quesList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("chat/chatExam.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
