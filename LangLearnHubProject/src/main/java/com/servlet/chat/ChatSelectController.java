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

@WebServlet("/chatselect")
public class ChatSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
//		String bookIdx = rq.getParameter("bookIdx"); =>ChatDeleteController
		//DTO
		ChatDTO cDto = new ChatDTO();
		HttpSession session = rq.getSession();
		cDto.setUserId((String)session.getAttribute("id"));
		
		
		//DAO
		ChatDAO cDao = new ChatDAO();
		ArrayList<String[]> bookList = cDao.chatSelect(cDto);
		
		rq.setAttribute("bookList",bookList);
		System.out.println("bookList: "+bookList.toString());
		RequestDispatcher dispatcher = rq.getRequestDispatcher("chat/bookmark.jsp");
		dispatcher.forward(rq, rp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
