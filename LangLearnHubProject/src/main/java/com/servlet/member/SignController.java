package com.servlet.member;

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

		String action = rq.getParameter("action");
        
        if ("sign".equals(action)) {
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

		MemberDAO mDao = new MemberDAO();
		boolean insertCheck = mDao.memberInsert(mDto);

		if (insertCheck) {
			rq.setAttribute("SignResult", insertCheck);
			HttpSession session = rq.getSession();
			session.setAttribute("user", mDto);
//			session.setAttribute("id", id);
//			session.setAttribute("password", password);
//			session.setAttribute("name", name);
//			session.setAttribute("email", email);
//			session.setAttribute("birth", birth);
//			session.setAttribute("gender", gender);
			RequestDispatcher dispatcher = rq.getRequestDispatcher("index.jsp");
			dispatcher.forward(rq, rp);

		} else {
			rq.setAttribute("joinResult", 0);
			RequestDispatcher dispatcher = rq.getRequestDispatcher("user/signup.jsp");
			dispatcher.forward(rq, rp);
		}
        }else if("idcheck".equals(action)){
        	//값 저장하기
			
			MemberDTO mDto = new MemberDTO();
			mDto.setId(id); 
			
			//DAO
			MemberDAO mDao = new MemberDAO();		
			boolean idcheck = mDao.idcheck(mDto);
	
    if(idcheck){
		rq.setAttribute("idcheck", "warning"); 
		System.out.println("idcheck value set to: warning");
		RequestDispatcher dispatcher = rq.getRequestDispatcher("user/signup.jsp");
        dispatcher.forward(rq, rp);
    }
    else {
    	rq.setAttribute("id", rq.getParameter("id"));
    	rq.setAttribute("idcheck", "success");
    	System.out.println("idcheck value set to: success");
    	RequestDispatcher dispatcher = rq.getRequestDispatcher("user/signup.jsp");
        dispatcher.forward(rq, rp);
    	
    }
        }
	}
}