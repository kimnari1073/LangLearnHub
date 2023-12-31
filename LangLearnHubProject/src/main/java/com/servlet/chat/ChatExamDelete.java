package com.servlet.chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/examdelete.do")
public class ChatExamDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		String id=(String)session.getAttribute("id");
		String s = request.getParameter("num");
		int n = Integer.parseInt(s);
		System.out.println(n);
		ChatExamDAO eDAO = new ChatExamDAO();
		eDAO.deleteExam(n,id);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/chatExamList.do");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
