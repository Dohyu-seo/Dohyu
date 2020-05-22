package com.increpas.www.controller.ajax;

import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

public class EmpList implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/ajax/empList.jsp";
		// 할일
		// 데이터베이스에서 조회해서 데이터 가져온다.
		EmpDAO eDAO = new EmpDAO(); 
		ArrayList<EmpVO> list = eDAO.getList();
		
		ArrayList<String> color = getColorList();
		// 데이터 뷰에 보낸다
		//요청 객체에다가 Attribute 추가해준다. ( 키값, 데이터 );
		req.setAttribute("COLOR", color);
		req.setAttribute("LIST", list);
		// 뷰 부른다
		return view;
	}
	
	// w3.css Color class List return method
	public ArrayList<String> getColorList(){
		ArrayList<String> list = new ArrayList<String>();
		list.add("w3-red");
		list.add("w3-pink");
		list.add("w3-purple");
		list.add("w3-deep-purple");
		list.add("w3-indigo");
		list.add("w3-blue");
		list.add("w3-cyan");
		list.add("w3-aqua");
		list.add("w3-teal");
		list.add("w3-green");
		list.add("w3-light-green");
		list.add("w3-lime");
		list.add("w3-khaki");
		list.add("w3-yellow");
		list.add("w3-amber");
		list.add("w3-orange");
		list.add("w3-deep-orange");
		
		return list;
	}

}
