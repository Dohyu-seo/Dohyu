package com.increpas.www.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

//@WebServlet("/")
public class Main extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse resp){
		String view="/main.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(view);
		try {
			rd.forward(req, resp);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
