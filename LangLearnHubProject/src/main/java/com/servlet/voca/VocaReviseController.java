package com.servlet.voca;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/vocarevise")
public class VocaReviseController extends HttpServlet {
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		//user session 확인
		HttpSession session = rq.getSession();
		String userId = (String)session.getAttribute("id");
		if(userId == null) {
			System.out.println("userId : null");
			rp.sendRedirect("index.jsp");
		}

		//DTO
		VocaDTO vDto = new VocaDTO();
		vDto.setUserId(userId);
		vDto.setListName(rq.getParameter("tableTitle"));
		
		//DAO
		VocaDAO vDao = new VocaDAO();
		ArrayList<String[]>reviseList = vDao.vocaRevise(vDto);
		rq.setAttribute("reviseList", reviseList);
		rq.setAttribute("clickRevise", true);
		RequestDispatcher dispatcher = rq.getRequestDispatcher("voca/VocaPage.jsp");
		dispatcher.forward(rq, rp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
