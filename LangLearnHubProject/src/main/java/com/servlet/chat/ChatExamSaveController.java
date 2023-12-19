package com.servlet.chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/chatExamSave.do")
public class ChatExamSaveController extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session =request.getSession();
		String id=(String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
		ChatExamDTO eDTO = new ChatExamDTO();
		ChatExamDAO eDAO = new ChatExamDAO();
		int res = 0;
		String title = request.getParameter("title");
		String ques = request.getParameter("ques");
		String examparse = request.getParameter("examparse");
		String examtype = request.getParameter("examtype");
		String afterques = "";
		
		eDTO.setId(id);
		eDTO.setTitle(title);
		eDTO.setQues(ques);
		eDTO.setExamparse(examparse);
		eDTO.setExamtype(examtype);
		eDTO.setColor("lightgrey");
		if(examparse.equals("chat")) {
			if(examtype.equals("multi")) { examtype = "5지선다형";}
			else if(examtype.equals("short")) { examtype = "단답형";}
			else{ examtype = "주관식";}
			afterques = ChatConnect.chatConnect("너는 TOEIC 시험 출제자야", 
					 "문제 출력 이외의 내용은 언급하지 말고, 문제의 답도 알려주지 말고, 한 문제를 생성해주십시오. 문제의 내용은 "+ques+"를 기반으로 만들어주시고, 문제 형식은 "+examtype+"으로, 답변은 영어로 해주십시오. ");
			eDTO.setQues(afterques);
			res = eDAO.chatExamInsert(eDTO);
		}else {
			res = eDAO.chatExamInsert(eDTO);
		}
		
		
		if(res != 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/chatExamList.do");
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
