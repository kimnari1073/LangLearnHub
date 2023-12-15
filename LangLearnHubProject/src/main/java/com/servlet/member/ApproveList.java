package com.servlet.member;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/approvelist.do")
public class ApproveList extends HttpServlet {

	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		MemberDAO mDao = new MemberDAO();
		

		try{
			ArrayList<MemberDTO> mList = mDao.approverList();
			HttpSession session = rq.getSession();
			session.setAttribute("alist", mList);
			RequestDispatcher dispatcher=rq.getRequestDispatcher("user/approvelist.jsp");
			dispatcher.forward(rq, rp);
		
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
