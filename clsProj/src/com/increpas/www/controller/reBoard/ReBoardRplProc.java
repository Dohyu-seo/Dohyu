package com.increpas.www.controller.reBoard;

import javax.servlet.http.*;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;

public class ReBoardRplProc implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/reBoard/reBoardRplRedirect.jsp";
		// 할일
		// 1. 데이터받고
		String sid = req.getParameter("id");
		String supno = req.getParameter("upno");
		String body = req.getParameter("body");
		// 2. 데이터 변환하고
		System.out.println(supno+"supno");
		int upno = 0;
		try {
			upno = Integer.parseInt(supno);
		} catch(Exception e) {}
		// 3. 디비 작업 요청하고
		ReBoardDao rDAO = new ReBoardDao();
		int cnt = rDAO.insertReply(sid, body, upno);
		// 4. 결과에 따라 처리하고
		/*
		if(cnt == 1) {
			req.setAttribute("isSuccess", "Y");
		} else {
			req.setAttribute("isSuccess", "N");
		}
		*/
		// 5. 뷰 부르고
		return view;
	}

}