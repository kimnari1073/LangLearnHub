package com.servlet.voca;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/vocadelete")
public class VocaDeleteController extends HttpServlet {
	protected void doGet(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		rq.setCharacterEncoding("UTF-8");
		HttpSession session = rq.getSession();
		String userId = (String)session.getAttribute("id");
		if(userId == null) {
			System.out.println("userId : null");
			rp.sendRedirect("index.jsp");
		}else {
			VocaDTO vDto = new VocaDTO();
			vDto.setUserId(userId);
			vDto.setListName(rq.getParameter("tableTitle"));
			
			VocaDAO vDao = new VocaDAO();
			boolean checkDelete = vDao.vocaDelete(vDto);
			if(checkDelete) {
				rp.sendRedirect("vocaselect");
			}else {
				System.out.println("checkDelete = "+checkDelete);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
