package com.servlet.voca;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/vocasave.do")
public class VocaSaveController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		String[] paramVoca1 = rq.getParameterValues("voca1");
		String[] paramVoca2 = rq.getParameterValues("voca2");
		
		
	}

}
