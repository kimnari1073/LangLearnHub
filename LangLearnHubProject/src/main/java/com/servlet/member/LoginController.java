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
		String id = rq.getParameter("id");
		String pw = rq.getParameter("password");
		

		MemberDAO mDao = new MemberDAO();
		
		boolean loginCheck = false;
		try {
			loginCheck = mDao.loginCheck(id, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	    if(loginCheck){
	    	rq.setAttribute("loginResult", loginCheck);
			HttpSession session = rq.getSession();
			session.setAttribute("idKey", id);
			RequestDispatcher dispatcher = rq.getRequestDispatcher("mainPage2.jsp");
			dispatcher.forward(rq, rp);

		}else{
		      rp.sendRedirect("SignUpFail.jsp");
		}
		   

		  
	}
}
