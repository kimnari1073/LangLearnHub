package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sign.do")
public class SignController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		String id = rq.getParameter("id");
		String pw = rq.getParameter("password");
		String name = rq.getParameter("name");
		String birth = rq.getParameter("birth");
		String email = rq.getParameter("email");
		String gender = rq.getParameter("gender");

		MemberDTO mDto = new MemberDTO();
		mDto.setId(id);
		mDto.setPassword(pw);
		mDto.setName(name);
		mDto.setBirth(birth);
		mDto.setEmail(email);
		mDto.setGender(gender);

		MemberDAO mDao = new MemberDAO();
		boolean insertCheck = mDao.memberInsert(mDto);

		if (insertCheck) {
			rq.setAttribute("SignResult", insertCheck);
//			HttpSession session = rq.getSession();s
//			session.setAttribute("idKey", id);
			RequestDispatcher dispatcher = rq.getRequestDispatcher("index.jsp");
			dispatcher.forward(rq, rp);

		} else {
			rq.setAttribute("joinResult", 0);
			RequestDispatcher dispatcher = rq.getRequestDispatcher("SignUpFail.jsp");
			dispatcher.forward(rq, rp);
		}
	}
}