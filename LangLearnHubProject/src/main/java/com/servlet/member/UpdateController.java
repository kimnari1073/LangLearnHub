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
    		
        
    	HttpSession session = request.getSession();
        MemberDTO loggedInMember = (MemberDTO) session.getAttribute("user");

        // 만약 로그인이 되어 있지 않다면 로그인 페이지로 리다이렉션
        if (loggedInMember == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // JSP에서 폼을 통해 전달받은 수정된 회원 정보
        String newPassword = request.getParameter("newPassword");
        String newEmail = request.getParameter("newEmail");
        String newName = request.getParameter("newName");
        String newGender = request.getParameter("newGender");
        String newBirth = request.getParameter("newBirth");

        // MemberDTO 객체에 수정된 정보 저장
        MemberDTO updatedMember = new MemberDTO();
        updatedMember.setId(loggedInMember.getId()); // 현재 로그인한 회원의 ID는 변경되지 않음
        updatedMember.setPassword(newPassword);
        updatedMember.setEmail(newEmail);
        updatedMember.setName(newName);
        updatedMember.setGender(newGender);
        updatedMember.setBirth(newBirth);

        // MemberDAO를 사용하여 회원 정보 업데이트
        MemberDAO memberDAO = new MemberDAO();
        memberDAO.memberUpdate(updatedMember);

        // 수정된 회원 정보를 세션에 업데이트
        session.setAttribute("user", updatedMember);

    	    
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("mypage.jsp");
    	    dispatcher.forward(request, response); 
    	  //response.sendRedirect("memberDelete.jsp");
    	    

    }
}
