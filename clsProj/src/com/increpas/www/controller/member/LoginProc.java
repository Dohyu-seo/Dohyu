package com.increpas.www.controller.member;

import java.io.IOException;

import javax.servlet.http.*;
import com.increpas.www.controller.*;
import com.increpas.www.dao.*;

public class LoginProc implements ClsController {
	String id;
	String pw;
	HttpSession session;
	
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/clsProj/main.cls";
		req.setAttribute("isRedirect",true);
		
		this.id = req.getParameter("id");
		this.pw = req.getParameter("pw");
		MemberDao mDao = new MemberDao();
		int cnt = mDao.getLoginCnt(id, pw);
		if (cnt == 0) {
			view = "/clsProj/member/login.cls";
		} else {
			this.session = req.getSession();
			session.setAttribute("SID", id);
		}
		return view;
	}

}