package com.increpas.www.controller.add;

import java.io.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

@WebServlet("/add/getInfo.ck")
public class GetInfo extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse resp) {
		// 파라미터 받고
		String sno = req.getParameter("mno");
		int mno = Integer.parseInt(sno);
		
		AddDAO aDAO = new AddDAO();
		MemberVO mVO = aDAO.getInfo(mno);
		resp.setCharacterEncoding("UTF-8");
		try {
			PrintWriter pw = resp.getWriter();
			pw.println("{");
			pw.println("	\"id\": \"" + mVO.getId() + "\"," );
			pw.println("	\"name\": \"" + mVO.getName() + "\"," );
			pw.println("	\"mail\": \"" + mVO.getMail() + "\"" );
			pw.println("}");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

}