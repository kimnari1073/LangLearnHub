package com.servlet.voca;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//단어장 - 저장하기
@WebServlet("/vocasave.do")
public class VocaSaveController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		//값 가져오기
		String paramTitle = rq.getParameter("title");
		String[] paramVoca1 = rq.getParameterValues("voca1");
		String[] paramVoca2 = rq.getParameterValues("voca2");
		HttpSession session = rq.getSession();
		String userId = (String)session.getAttribute("idKey");

		//값 저장하기
		VocaDTO vDto = new VocaDTO();
		vDto.setListName(paramTitle);
		vDto.setUserId(userId);
		for(int i=0;i<paramVoca1.length;i++) vDto.setVocaHash(paramVoca1[i], paramVoca2[i]);
		
		//voca_index 구하기
		
		//DAO
		VocaDAO vDao = new VocaDAO();
		boolean saveCheck = vDao.vocaSave(vDto);
		if(saveCheck) {
			RequestDispatcher dispatcher = rq.getRequestDispatcher("index.jsp");
			dispatcher.forward(rq, rp);
			
		}else {
			RequestDispatcher dispatcher = rq.getRequestDispatcher("SignUpFail.jsp");
			dispatcher.forward(rq, rp);
		}
		
		//response
		
	}

}
