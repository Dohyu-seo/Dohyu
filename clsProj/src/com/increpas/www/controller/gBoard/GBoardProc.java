package com.increpas.www.controller.gBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.ClsController;

public class GBoardProc implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/gBoard/gBoardProc.cls";
		req.setAttribute("isRedirect", true);
		// 뷰만들고 데이터 가져올 예정
		
		return view;
	}

}
