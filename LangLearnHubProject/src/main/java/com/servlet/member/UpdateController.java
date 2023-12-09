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
  
        
//    	HttpSession session = request.getSession();
//        String loggedInMemberId = (String) session.getAttribute("id");
//
//        // MemberDAO를 사용하여 로그인한 회원의 정보를 가져옴
//        MemberDAO memberDAO = new MemberDAO();
//        MemberDTO loggedInMember = memberDAO.getMemberById(loggedInMemberId);
//
//        // 만약 로그인이 되어 있지 않다면 로그인 페이지로 리다이렉션
//        if (loggedInMember == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
//
//        // JSP에서 폼을 통해 전달받은 수정된 회원 정보
//        String newPassword = request.getParameter("password");
//        String newEmail = request.getParameter("email");
//        String newName = request.getParameter("name");
//        String newGender = request.getParameter("gender");
//        String newBirth = request.getParameter("birth");
//
//        // MemberDTO 객체에 수정된 정보 저장
//        loggedInMember.setPassword(newPassword);
//        loggedInMember.setEmail(newEmail);
//        loggedInMember.setName(newName);
//        loggedInMember.setGender(newGender);
//        loggedInMember.setBirth(newBirth);
//
//        // MemberDAO를 사용하여 회원 정보 업데이트
//        memberDAO.memberUpdate(loggedInMember);
//
//        // 수정된 회원 정보를 세션에 업데이트
//        session.setAttribute("user", loggedInMember);
        
        
        
//    	 HttpSession session =rq.getSession();
//	     MemberDTO loggedInMember = (MemberDTO) session.getAttribute("user");
//
//	        // 만약 로그인이 되어 있지 않다면 로그인 페이지로 리다이렉션
//	        if (loggedInMember == null) {
//	            rp.sendRedirect("login.jsp");
//	            return;
//	        }
//
//	        // 특정 회원의 ID를 파라미터에서 가져옴
////	        String memberId = rq.getParameter("id");
//	        String memberId = (String)session.getAttribute("id");
//
//	        // MemberDAO를 사용하여 해당 회원의 정보를 가져옴
//	        MemberDAO memberDAO = new MemberDAO();
//	        
//	        MemberDTO member = memberDAO.getMemberById(memberId);
//
//	        // 가져온 회원 정보를 JSP 페이지로 전달
//	        rq.setAttribute("member", member);

    	
    	MemberDTO memberDTO = new MemberDTO();
//        HttpSession session = request.getSession();
//    	String memberId = (String) session.getAttribute("id");
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
    	RequestDispatcher dispatcher = request.getRequestDispatcher("mypage.jsp");
//    	RequestDispatcher dispatcher = request.getRequestDispatcher("select.do");
    	dispatcher.forward(request, response);

    	  //response.sendRedirect("memberDelete.jsp");
    	    

    }
}
