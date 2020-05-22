package com.increpas.www.controller.gBoard;

import javax.servlet.http.*;
import java.util.*;
import com.increpas.www.controller.*;
import com.increpas.www.vo.*;
import com.increpas.www.dao.*;

public class GBoardList implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/gBoard/gBoardList.jsp";
		// 할일
		String sid = (String)req.getSession().getAttribute("SID");
		// 데이터베이스작업하고 결과 받고
		GBoardDao gDao = new GBoardDao();
		ArrayList<GBoardVO> list = gDao.getGList();
		
		//작성한 방명록 글 수 받기
		int cnt = gDao.getCnt(sid);
		
		String avt = gDao.getAvt(sid);
		// 결과 넘겨주고
		req.setAttribute("LIST", list);
		req.setAttribute("CNT", cnt);
		req.setAttribute("AVT", avt);
		// 뷰 부르고
		return view;
	}
}
