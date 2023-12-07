package com.servlet.member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/select.do")
public class MemberSelect extends HttpServlet {

	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		HttpSession session = rq.getSession();
	 	String memberId = (String) session.getAttribute("id");
	 	
	 	MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(memberId);


	    MemberDAO memberDAO = new MemberDAO();
	    try {
			memberDAO.memberSelect(memberDTO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		RequestDispatcher dispatcher=rq.getRequestDispatcher("mypage.jsp");
		dispatcher.forward(rq, rp);
	}

}
