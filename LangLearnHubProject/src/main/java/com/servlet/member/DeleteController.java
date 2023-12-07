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

@WebServlet("/deleteMember.do")
public class DeleteController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	 MemberDTO memberDTO = new MemberDTO();
//       memberDTO.setId(request.getParameter("memberId"));
    	 HttpSession session = request.getSession();
         String memberId = (String) session.getAttribute("loggedInUserId");

    	 MemberDAO memberDAO = new MemberDAO();
         memberDAO.memberDelete(memberId);
         	
//    	    memberDAO.memberDelete(memberDTO);
    	    
    	 RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
    	 dispatcher.forward(request, response); 
    	  //response.sendRedirect("memberDelete.jsp");
    	    

    }
}

