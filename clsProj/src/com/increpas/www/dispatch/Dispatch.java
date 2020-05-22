package com.increpas.www.dispatch;
/**
 * 	이 클래스는 확장자가 cls로 요청이 되는 경우 Dispatch시킬 서블릿 클래스이다.
 * @author	서동혁
 * @since	2020.05.11
 * @see
 * 			com.increpas.www.controller.ClsController
 */
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import com.increpas.www.controller.*;
import java.io.*;
import java.util.*;

@WebServlet("*.cls")	// URL 패턴지정
public class Dispatch extends HttpServlet {
	/*
		할일
			1. 요청내용과 클래스의 인스턴스를 매핑할 맵이 필요하다.
				우리는 해당 요청내용과 요청내용에 맞는 클래스의 경로를 Properties 파일로 관리할 예정이다.
				Properties는 맵의 일종이므로
				요청내용을 안다면
				키값으로 사용하는 요청내용을 안다면 클래스의 경로도 알 수 있게 된다.
	*/
	public HashMap<String, ClsController> map;
	
	public void init(ServletConfig config) throws ServletException{
		// 이 함수는 서버가 기동된 이후
		// 요청내용이 .cls로 끝나는 요청이 왔을 경우 처음 딱 한번만 실행되는 함수이다.
		// 최초로 이 서블릿이 시작되면 준비된 properties 파일을 읽어서
		// 이것을 이용해서 실제 실행가능한 클래스로 요청내용과 클래스객체를 맵핑을 해놓아야 한다.
		
		// 파일에서 직접 읽어서 Map으로 만들어야 하므로
		// properties라는 클래스를 이용해서 작업하자.
		Properties prop = new Properties();
		FileInputStream fin = null;
		try {
			String path = this.getClass().getResource("").getPath();
			// 파일을 스트림으로 만들고
			fin = new FileInputStream(path + "../resource/cls.properties");
			prop.load(fin);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fin.close();
			} catch (Exception e1) {}
		}
		
		map = new HashMap<String, ClsController>();
		
		// 먼저 키값만 뽑아온다.
		Set keys = prop.keySet();
		// 키값을 알아냈으니 이제 실제 실행해야할 클래스의 경로를 알아낼 수 있다.
		// 해당 클래스의 경로를 실제 실행가능한 클래스로 변경해준다.
		
		ArrayList<String> list = new ArrayList<String>(keys);
		
		for (int i = 0; i < list.size(); i++) {
			String key = list.get(i);
			String sclass = (String)prop.get(key);
			// 이제 실행가능한 클래스로 변환한다.
			try {
				Class tmp = Class.forName(sclass);
				ClsController cls = (ClsController)tmp.newInstance();
				
				map.put(key, cls);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 실제 요청 내용에 맞는 처리를 담당하는 함수
	public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		// 할일
		// 1. 요청내용을 알아낸다.
		String full = req.getRequestURI();
		// 2. http://localhost/clsProj/member/login.cls 에서 도메인을 알아낸다.
		String domain = req.getContextPath();
		// 3. 실제 요청내용을 알아낸다.
		String realPath = full.substring(domain.length());
		System.out.println("### realPath : " + realPath);
		
		// 4. 요청내용을 알아냈으니 실제 실행할 클래스를 가져온다.
		ClsController cls = map.get(realPath);
		req.setAttribute("isRedirect", false);
		String view = cls.exec(req, resp);
		
		// null 데이터가 채워지지 않기 때문에 예외가 발생해서 try로 처리 해주어야 한다.
		Boolean bool ;
		try {
			bool = (boolean)req.getAttribute("isRedirect");
		}catch(Exception e) {
			bool = null;
		}
		
		if(bool == null) {
			/*
			  boolean bool = false; bool = (boolean)req.getAttribute("isRedirect");
			  if(bool) {
			 
			String last = view.substring(view.lastIndexOf(".") + 1);
			System.out.println("aaaaaa " + last);
			if(last.equals("cls")) {
			// 페이지 다시 돌아오기
			resp.sendRedirect(view);*/
			PrintWriter pw = resp.getWriter();
			try {
				pw.println(view);
			}catch(Exception e) {}
		} else if(bool == true){
				resp.sendRedirect(view);
		} else {
			try {
				RequestDispatcher rd = req.getRequestDispatcher(view);
				// 다음단계
				rd.forward(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}