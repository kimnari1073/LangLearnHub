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
    		
        
    	String memberId = request.getParameter("id");
        String newPassword = request.getParameter("newPassword");
        String newEmail = request.getParameter("newEmail");
        String newName = request.getParameter("newName");
        String newGender = request.getParameter("newGender");
        String newBirth = request.getParameter("newBirth");
        String newRole = request.getParameter("newRole");

        MemberDTO mDto = new MemberDTO();
        mDto.setId(memberId);
        mDto.setPassword(newPassword);
        mDto.setEmail(newEmail);
        mDto.setName(newName);
        mDto.setGender(newGender);
        mDto.setBirth(newBirth);
        mDto.setRole(newRole);

        MemberDAO mDao = new MemberDAO();
        mDao.memberUpdate(mDto);

    	    
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("mypage.jsp");
    	    dispatcher.forward(request, response); 
    	  //response.sendRedirect("memberDelete.jsp");
    	    

    }
}
