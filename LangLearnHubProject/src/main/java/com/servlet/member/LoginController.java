package com.servlet.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		//값 저장하기
		MemberDTO mDto = new MemberDTO();
		mDto.setId(rq.getParameter("id")); 
		mDto.setPassword(rq.getParameter("password"));

		//DAO
		MemberDAO mDao = new MemberDAO();		
		boolean loginCheck = mDao.loginCheck(mDto);


	    if(loginCheck){
			HttpSession session = rq.getSession();
			session.setAttribute("id",mDto.getId());
			RequestDispatcher dispatcher = rq.getRequestDispatcher("mainPage2.jsp");
			dispatcher.forward(rq, rp);

		}else{
		      rp.sendRedirect("SignUpFail.jsp");
		}
		   

		  
	}
}
