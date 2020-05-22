package com.increpas.www.controller.survey;

import java.util.*;
import javax.servlet.http.*;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;

public class SurveyProc implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/clsProj/survey/surveyResult.cls";
		req.setAttribute("isRedirect", true);
		
		String id = (String) req.getSession().getAttribute("SID");
		if(id == null || id.length() == 0) {
			view = "/clsProj/survey/survey.cls";
			return view;
		}
		
		String strsino = req.getParameter("sino");
		int sino = 0;
		try {
			sino = Integer.parseInt(strsino);
		} catch(Exception e) {
			view = "/clsProj/survey/survey.cls";
			return view;
		}
		
		// 설문문항번호를 키값을 하고 선택보기를 데이터로 가지는 맵을 만든다.
		// 일단 키들만 뽑아온다.
		String[] arrsno = req.getParameterValues("sno");
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		
		for(String tno : arrsno) {
			int no = Integer.parseInt(tno);
			map.put(no, req.getParameter(tno));
		}
		
//		System.out.println("********* strsino : " + strsino);
		// 첫문항 번호
//		System.out.println("********* sno[0] : " + arrsno[0]);
		// 첫문항 선택데이터
//		String strval1 = req.getParameter(arrsno[0]);
//		System.out.println("##### 첫문항 선택값 : " + strval1);
		
		// 데이터가 준비됬으니 데이터베이스 작업을 한다.
		SurveyDAO sDAO = new SurveyDAO();
		// 먼저 문항테이블 업데이트작업
		int cnt = sDAO.updateCount(map);
		if(cnt != arrsno.length) {
			view = "/clsProj/survey/survey.cls";
			return view;
		}
		
		cnt = sDAO.addRecord(sino, id);
		
		view = view + "?sino=" + strsino;
		return view;
	}

}