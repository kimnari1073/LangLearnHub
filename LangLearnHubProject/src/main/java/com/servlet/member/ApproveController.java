package com.servlet.member;

import javax.servlet.RequestDispatcher;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/approve.do")
public class ApproveController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session =request.getSession();
		 
	String memberId = (String)session.getAttribute("id");
    // Implement member approval logic here
	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(memberId);
	
    MemberDAO memberDAO = new MemberDAO();
    memberDAO.approveUpdate(memberDTO);
    
    RequestDispatcher dispatcher = request.getRequestDispatcher("user/mypage.jsp");
    dispatcher.forward(request, response); 
    
    }
}
