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

@WebServlet("/signidcheck.do")
public class SignIdcheck extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		//값 저장하기
				String id=rq.getParameter("id");
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
