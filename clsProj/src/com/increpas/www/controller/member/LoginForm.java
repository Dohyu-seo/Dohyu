package com.increpas.www.controller.member;

import javax.servlet.http.*;

import com.increpas.www.controller.ClsController;

public class LoginForm implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/member/Login.jsp";
		return view;
	}

}