package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginController() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String passwd= request.getParameter("passwd");
		
		LoginController loginService = new LoginController();
		Member loginMember =loginService.getLoginMember(id,passwd);
		//로그인이 성공 되면 member 객체가 넘어오고 실패하면 null이 넘어옴
		
		if(loginMember != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			response.sendRedirect("mainPage2.jsp");
		}else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	private Member getLoginMember(String id, String passwd) {
		// TODO Auto-generated method stub
		return null;
	}

}