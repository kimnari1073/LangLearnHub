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
		MemberDAO mDao = new MemberDAO();
		
		rq.setCharacterEncoding("UTF-8");
		String id = rq.getParameter("id");
		String password = rq.getParameter("password");
		String name = rq.getParameter("name");
		String birth = rq.getParameter("birth");
		String email = rq.getParameter("email");
		String gender = rq.getParameter("gender");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setPassword(password);
		mDto.setName(name);
		mDto.setBirth(birth);
		mDto.setEmail(email);
		mDto.setGender(gender);
		
		HttpSession session = rq.getSession();
		session.setAttribute("id", id);
		session.setAttribute("password", password);
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		session.setAttribute("birth", birth);
		session.setAttribute("gender", gender);
		
		RequestDispatcher dispatcher=rq.getRequestDispatcher("mypage.jsp");
		dispatcher.forward(rq, rp);
	}

}
