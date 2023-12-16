package com.servlet.chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatExamSave.do")
public class ChatExamSaveController extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		ChatExamDTO eDTO = new ChatExamDTO();
		ChatExamDAO eDAO = new ChatExamDAO();
		int res;
		String title = request.getParameter("title");
		String ques = request.getParameter("ques");
		String examparse = request.getParameter("examparse");
		String examtype = request.getParameter("examtype");
		
		eDTO.setId("tester1");
		eDTO.setTitle(title);
		eDTO.setQues(ques);
		eDTO.setExamparse(examparse);
		eDTO.setExamtype(examtype);
		eDTO.setColor("lightgrey");
		
		res = eDAO.chatExamInsert(eDTO);
		
		if(res != 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("chat/chatExamTest.jsp");
			dispatcher.forward(request, response);
		}else {
			System.out.println("Error");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
