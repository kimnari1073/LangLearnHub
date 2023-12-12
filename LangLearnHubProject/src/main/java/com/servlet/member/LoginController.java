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
		String id=rq.getParameter("id");
		MemberDTO mDto = new MemberDTO();
		mDto.setId(id); 
		mDto.setPassword(rq.getParameter("password"));
		mDto.setRole(rq.getParameter("role"));

		//DAO
		MemberDAO mDao = new MemberDAO();		
		boolean loginCheck = mDao.loginCheck(mDto);
		
		 MemberDTO member = mDao.getMemberById(id);
		 
		


	    if(loginCheck){
			HttpSession session = rq.getSession();
			session.setAttribute("user", mDto);
			session.setAttribute("id",mDto.getId());
//			session.setAttribute("id",mDto.getId());
//			session.setAttribute("password", mDto.getPassword());
//			session.setAttribute("name", mDto.getName());
//			session.setAttribute("email", mDto.getEmail());
//			session.setAttribute("birth", mDto.getBirth());
//			session.setAttribute("gender", mDto.getGender());
			
			String role=member.getRole();
			if(role.equals("0")) {
				RequestDispatcher dispatcher = rq.getRequestDispatcher("mainPage.jsp");
				dispatcher.forward(rq, rp);
				
			}else if(role.equals("1")) {
				RequestDispatcher dispatcher = rq.getRequestDispatcher("allSelect.do");
				dispatcher.forward(rq, rp);
			}
		}else{
		      rp.sendRedirect("user/SignUpFail.jsp");
		}
		   

		  
	}
}
