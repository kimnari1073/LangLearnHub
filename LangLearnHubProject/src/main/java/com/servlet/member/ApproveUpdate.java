package com.servlet.member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/approveUpdate.do")
public class ApproveUpdate extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
        String action = request.getParameter("action");
        
        if ("delete".equals(action)) {
            String memberId = (String)request.getParameter("id");
            // Implement member deletion logic here
            MemberDTO memberDTO = new MemberDTO();
    		memberDTO.setId(memberId);


    	    MemberDAO memberDAO = new MemberDAO();
    	    memberDAO.memberDelete(memberDTO);
    	    
    	    
        } else if ("approve".equals(action)) {
        	String memberId = (String)request.getParameter("id");
            // Implement member approval logic here
        	MemberDTO memberDTO = new MemberDTO();
    		memberDTO.setId(memberId);
    		
    	    MemberDAO memberDAO = new MemberDAO();
    	    memberDAO.adminUpdate(memberDTO);
        }

        // Redirect back to admin page
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("approvelist.do");
    	    dispatcher.forward(request, response); 
    	    

    }
}


