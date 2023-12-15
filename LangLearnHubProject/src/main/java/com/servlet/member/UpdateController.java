package com.servlet.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/update.do")
public class UpdateController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
    	
    	MemberDTO memberDTO = new MemberDTO();
    	
    	String password = request.getParameter("password");
    	String email = request.getParameter("email");
    	String name = request.getParameter("name");
      	String gender = request.getParameter("gender");
      	String birth = request.getParameter("birth");
      	String id = request.getParameter("id");
      

  		memberDTO.setPassword(password);
  		memberDTO.setName(name);
		memberDTO.setBirth(birth);
		memberDTO.setEmail(email);
		memberDTO.setGender(gender);
		memberDTO.setId(id);
		System.out.println(gender);
		MemberDAO memberDAO = new MemberDAO();
  	  
  	    
		 HttpSession session =request.getSession();
		 
		 String memberId = (String)session.getAttribute("id");
    	
	   memberDAO.memberUpdate(memberDTO);	

    	// Get the updated member from the database
    	MemberDTO member = memberDAO.getMemberById(memberId);

    	// Set the updated member in the session
//    	session.setAttribute("user", member);
    	request.setAttribute("member", member);

    	// Forward to the JSP page with the updated member
    	RequestDispatcher dispatcher = request.getRequestDispatcher("user/mypage.jsp");
//    	RequestDispatcher dispatcher = request.getRequestDispatcher("select.do");
    	dispatcher.forward(request, response);

    	  //response.sendRedirect("memberDelete.jsp");
    	    

    }
}
