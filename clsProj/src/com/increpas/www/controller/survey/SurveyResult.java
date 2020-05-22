package com.increpas.www.controller.survey;

import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

public class SurveyResult implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/survey/surveyResult.jsp";
		// 할일
		// 0. 먼저 요청 회원이 설문조사에 참여했는지 여부를 확인한다.
		// 1. 파라미터 받고
		String strsino = req.getParameter("sino");
		int sino = 0;
		try {
			sino = Integer.parseInt(strsino);
		} catch(Exception e) {}
		
		SurveyDAO sDAO = new SurveyDAO();
		// 데이터베이스 작업하고 결과받고
		ArrayList<SurveyVO> list = sDAO.getResult(sino);
		// 만든데이터 뷰에 심어주고
		req.setAttribute("LIST", list);
		req.setAttribute("TITLE", list.get(0).getTitle());
		
		return view;
	}

}