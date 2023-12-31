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
		HttpSession session = rq.getSession();
		String userId = (String)session.getAttribute("id");
		if(userId == null) {
			System.out.println("userId : null");
			rp.sendRedirect("index.jsp");
		}else {
			//값 get, Dto
			String[] paramVoca1 = rq.getParameterValues("voca1");
			String[] paramVoca2 = rq.getParameterValues("voca2");
			
			VocaDTO vDto = new VocaDTO();
			vDto.setListName(rq.getParameter("title"));
			vDto.setUserId(userId);
			
			
			for(int i=0;i<paramVoca1.length;i++) {
				if(paramVoca1[i]!="") {
					vDto.setVocaHash(paramVoca1[i], paramVoca2[i]);	
				}
							
			}

			
		
			
			//DAO
			VocaDAO vDao = new VocaDAO();
			boolean saveCheck = vDao.vocaSave(vDto);
			if(saveCheck) {
				//rq.setAttribute("vocaList", vDao.getVocaList(vDto));
				rp.sendRedirect("voca/VocaPage.jsp");
				
			}else {
				System.out.println("VocaSave : false");
				rp.sendRedirect("mainPage.jsp");
			
			}
		}
		

		
		//response
		
	}

}
