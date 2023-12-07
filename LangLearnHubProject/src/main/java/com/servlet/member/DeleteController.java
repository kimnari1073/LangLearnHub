package com.servlet.member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/deleteMember.do")
public class DeleteController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
        
    	 	HttpSession session = request.getSession();
    	 	String memberId = (String) session.getAttribute("id");
    	 	
    	 	MemberDTO memberDTO = new MemberDTO();
    		memberDTO.setId(memberId);


    	    MemberDAO memberDAO = new MemberDAO();
    	    memberDAO.memberDelete(memberDTO);
    	    
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("memberDelete.jsp");
    	    dispatcher.forward(request, response); 
    	  //response.sendRedirect("memberDelete.jsp");
    	    

    }
}

