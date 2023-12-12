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

@WebServlet("/memselect.do")
public class MemberSelect extends HttpServlet {

	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		 HttpSession session =rq.getSession();
	        MemberDTO loggedInMember = (MemberDTO) session.getAttribute("user");

	        // 만약 로그인이 되어 있지 않다면 로그인 페이지로 리다이렉션
	        if (loggedInMember == null) {
	            rp.sendRedirect("user/login.jsp");
	            return;
	        }

	        // 특정 회원의 ID를 파라미터에서 가져옴
//	        String memberId = rq.getParameter("id");
	        String memberId = (String)session.getAttribute("id");

	        // MemberDAO를 사용하여 해당 회원의 정보를 가져옴
	        MemberDAO memberDAO = new MemberDAO();
	        MemberDTO member = memberDAO.getMemberById(memberId);

	        // 가져온 회원 정보를 JSP 페이지로 전달
	        rq.setAttribute("member", member);

	    
		RequestDispatcher dispatcher=rq.getRequestDispatcher("user/mypage.jsp");
		dispatcher.forward(rq, rp);
	}

}
