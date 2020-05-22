package com.increpas.www.controller.reBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;

public class ReBoardEdit implements ClsController {
	
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/reBoard/reBoardReply.jsp";
		return view;
	}

}
