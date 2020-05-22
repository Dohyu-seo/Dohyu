package com.increpas.www.controller.ajax;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

public class EmpInfo implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("isRedirect", null);
		String str="";
		//String data = ""; //data 라는 애는 json 데이터에 해당하는 문자열이 반환되어야 한다.
		String sno = req.getParameter("eno");
		int eno = 0;
		try {
		eno =Integer.parseInt(sno);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// 데이터베이스에 데이터보내고 결과 받고
		EmpDAO eDAO = new EmpDAO();
		EmpVO eVO = eDAO.getInfo(eno);
		
		
		/*
//		System.out.println("************* cont eVO.eno : " + eVO.getEno());
		
		// 응답객체에 인코딩 해주어야 한다. - 응답 문서 인코딩 설정
		resp.setCharacterEncoding("UTF-8");
		
		// 응답 문서 만들고
		StringBuffer buff = new StringBuffer();
		buff.append("{");
		buff.append("     \"eno\" : " + eVO.getEno() + ",");
		buff.append("     \"ename\" : \"" + eVO.getName() + "\",");
		buff.append("     \"mgr\" : \"" + ((eVO.getMgr() == -1) ? ("상사없음") : (eVO.getMgr() + "")) + "\",");
		buff.append("     \"sdate\" : \"" + eVO.getSdate() + "\",");
		buff.append("     \"sal\" : " + eVO.getSal() + ",");
		buff.append("     \"grade\" : " + eVO.getGrade() + ",");
		buff.append("     \"comm\" : \"" + eVO.getComm() + "\",");
		buff.append("     \"dno\" : " + eVO.getDno() + ",");
		buff.append("     \"dname\" : \"" + eVO.getDname() + "\",");
		buff.append("     \"loc\" : \""+ eVO.getLoc() + "\"");
		buff.append("}");
		System.out.println("************* cont buff : " + buff.toString());
		return buff.toString();
		*/
		
		// 부서번호 조회 디비작업
		str = eDAO.getDname(eno);
		
		return str;
	}

}
