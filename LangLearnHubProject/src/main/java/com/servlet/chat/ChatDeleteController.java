package com.servlet.chat;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deletechat")
public class ChatDeleteController extends HttpServlet {
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		HttpSession session = rq.getSession();
		String userId = (String)session.getAttribute("id");
		ChatDTO cDto = new ChatDTO();
		cDto.setUserId(userId);
		cDto.setBookmarkIndex(Integer.parseInt(rq.getParameter("bookmark_index")));
		
		//DAO
		ChatDAO cDao = new ChatDAO();
		boolean checkDelete = cDao.chatDelete(cDto);
		if(checkDelete) {
			rp.sendRedirect("chatselect");
		}else {
			System.out.println("checkDelete is false");
			rp.sendRedirect("mainPage.jsp");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}