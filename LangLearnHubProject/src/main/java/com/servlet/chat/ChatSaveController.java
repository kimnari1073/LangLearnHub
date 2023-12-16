package com.servlet.chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/chatsave")
public class ChatSaveController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		
		HttpSession session = rq.getSession();
		String userId = (String)session.getAttribute("id");
//		String title = rq.getParameter("bookMarkTitle");
//		String q = rq.getParameter("Q");
//		String a = rq.getParameter("A");
		
		ChatDTO cDto = new ChatDTO();
		cDto.setUserId(userId);
		cDto.setTitle(rq.getParameter("bookMarkTitle"));
		cDto.setQ(rq.getParameter("Q"));
		cDto.setA(rq.getParameter("A"));
		
		//DAO
		ChatDAO cDao = new ChatDAO();
		boolean saveCheck=cDao.chatSave(cDto);
		
		//
		if(saveCheck) {
			rp.sendRedirect("chatselect");
			//RequestDispatcher dispatcher = rq.getRequestDispatcher("chatselect");
			//dispatcher.forward(rq, rp);
		}else {
			RequestDispatcher dispatcher = rq.getRequestDispatcher("user/SignUpFail.jsp");
			dispatcher.forward(rq, rp);
		}
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
