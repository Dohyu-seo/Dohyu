package com.increpas.www.controller.board;

import javax.servlet.http.*;
import java.util.*;

import com.increpas.www.controller.*;
import com.increpas.www.vo.*;
import com.increpas.www.dao.*;

public class BoardDetail implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/board/boardDetail.jsp";
		// 파라미터
		System.out.println("여기왔노라");
		BoardVO bVO = new BoardVO();
		// 데이터 심고
		bVO.setBno(Integer.parseInt(req.getParameter("bno")));
		System.out.println("######## bDetail.bno : " + bVO.getBno());
		bVO.setClick(Integer.parseInt(req.getParameter("click")));
		System.out.println("######## bDetail.bclick : " + bVO.getClick());
		bVO.setTitle(req.getParameter("title"));
		bVO.setBody(req.getParameter("body"));
		bVO.setName(req.getParameter("name"));
		bVO.setSdate(req.getParameter("sdate"));
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		String[] sbino = req.getParameterValues("bino");
		int len = 0;
		try {
			len = sbino.length;
		} catch (Exception e) {
		}
		String[] oriname;
		String[] savename;
		if (len != 0) {
			System.out.println("sbino를 봤노라");
			oriname = req.getParameterValues("oriname");
			savename = req.getParameterValues("savename");
			for (int i = 0; i < sbino.length; i++) {
				FileVO fVO = new FileVO();
				fVO.setBino(Integer.parseInt(sbino[i]));
				fVO.setOriname(oriname[i]);
				fVO.setSavename(savename[i]);
				list.add(fVO);
			}

			bVO.setFile(list);
		}
		req.setAttribute("nowPage", req.getAttribute("nowPage"));
		req.setAttribute("DATA", bVO);
		return view;
	}

}