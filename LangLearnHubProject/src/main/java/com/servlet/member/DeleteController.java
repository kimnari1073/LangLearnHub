package com.servlet.member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/memberDelete")
public class DeleteController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	    MemberDTO memberDTO = new MemberDTO();
            memberDTO.setId(request.getParameter("memberId"));

    	    MemberDAO memberDAO = new MemberDAO();
    	    memberDAO.memberDelete(memberDTO);

    }
}