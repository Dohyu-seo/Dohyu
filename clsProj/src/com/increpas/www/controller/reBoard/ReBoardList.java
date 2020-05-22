package com.increpas.www.controller.reBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.increpas.www.controller.*;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;
import com.increpas.www.util.*;

public class ReBoardList implements ClsController {

   @Override
   public String exec(HttpServletRequest req, HttpServletResponse resp) {
      String view = "/reBoard/reBoard.jsp";
      // 받아야할 데이터는 있으므로 꺼내고
      int nowPage = 1;
      String strPage = req.getParameter("nowPage");
     try {
    	 nowPage = Integer.parseInt(strPage);
     }catch(Exception e) {
    	 e.printStackTrace();
     }
      ReBoardDao rDAO = new ReBoardDao();
      int totalCount = rDAO.getTotalCount();
      
      // PageUtil 만들고
      PageUtil page = new PageUtil(nowPage, totalCount);
      
      // 데이터베이스 작업을 한다.
      ArrayList<ReBoardVO> list = rDAO.getAllList(page.getStartCont(), page.getEndCont());
      
      //뷰에 데이터 심고
      req.setAttribute("LIST", list);
      req.setAttribute("PAGE", page);
      
      return view;
   }

}