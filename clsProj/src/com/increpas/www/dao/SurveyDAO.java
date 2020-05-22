package com.increpas.www.dao;

/**
 * 이 클래스는 설문조사 데이터 베이스 작업을 처리할 클래스
 * @author 서동혁
 * @since	2020.05.15
 * @version v.0.9.0
 */
import java.sql.*;
import java.util.*;

import com.increpas.www.DB.*;
import com.increpas.www.vo.*;
import com.increpas.www.sql.*;

public class SurveyDAO {
	WebDBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	SurveySQL sSQL;
	
	public SurveyDAO() {
		db = new WebDBCP();
		sSQL = new SurveySQL();
	}
	
	// 설문조사 문항 정볼르 가져오는 전담 처리함수
	public ArrayList<SurveyVO> getPaper(){
		ArrayList<SurveyVO> list = new ArrayList<SurveyVO>();
		// 할일
		// 1. 커넥션 가져오기
		con = db.getCon();
		// 2. 질의명령 가져오기
		String sql = sSQL.getSQL(sSQL.SEL_SRV);
		// 3. stmt가져오기
		stmt = db.getSTMT(con);
		try {
			// 4. 질의명령 보내고 결과받기
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				// 5.0 vo만들기
				SurveyVO sVO = new SurveyVO();
				// 5. 데이터 꺼내기 VO에 담기
				sVO.setSino(rs.getInt("sino"));
				sVO.setTitle(rs.getString("title"));
				sVO.setSno(rs.getInt("sno"));
				sVO.setSq(rs.getString("sq"));
				sVO.setSa1(rs.getString("sa1"));
				sVO.setSa2(rs.getString("sa2"));
				sVO.setSa3(rs.getString("sa3"));
				sVO.setSa4(rs.getString("sa4"));
				// 6. 데이터 list담기
				list.add(sVO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		
		// 7. list내보내기
		return list;
	}
	
	// 설문 처리 데이터베이스 작업 전담 처리함수
	public int updateCount(HashMap<Integer, String> map) {
		int cnt = 0 ;
		//할일
		//1.커넥션 얻어오고
		con = db.getCon();
		// 2. 질의명령 가져오고
		String sql = sSQL.getSQL(sSQL.EDIT_SRV);
		// 2.1 질의명령 수정하고
		Set keys = map.keySet();
		ArrayList<Integer> kList = new ArrayList<Integer>(keys);
		
		for(int no : kList) {
			/*
			String tmp = sql;
			tmp.replaceAll("###", map.get(no));
			// 3. pstmt 가져오고
			*/
			pstmt = db.getPSTMT(con, sql.replaceAll("#", map.get(no)));
			try {
				// 4. 질의명령 완성하고
				pstmt.setInt(1, no);
				// 5. 질의명령 보내고 결과받고
				cnt += pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				db.close(pstmt);
			}
		}
		db.close(con);
		// 6.결과내보내고
		return cnt;
	}
	
	// 설문참여기록 데이터베이스 작업 전담 처리 함수
	public int addRecord(int sino, String id) {
		int cnt = 0;
		// 1. 커넥션
		con = db.getCon();
		// 2. 질의명령
		String sql = sSQL.getSQL(sSQL.ADD_SRV_ID);
		// 3. pstmt
		pstmt = db.getPSTMT(con, sql);
		try {
			// 4. 질의명령 완성하고
				pstmt.setInt(1, sino);
				pstmt.setString(2, id);
			// 5. 질의명령 보내고 결과받고
				cnt = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(pstmt);
			db.close(con);
		}
		// 6. 결과보내고
		return cnt;
	}
	
	// 설문 결과 페이지 디비작업 전담 처리함수
	public ArrayList<SurveyVO> getResult(int sino){
		ArrayList<SurveyVO> list = new ArrayList<SurveyVO>();
			//할일
		// 1. 커넥션
		con=db.getCon();
		// 2. 질의명령 가져오기
		String sql = sSQL.getSQL(sSQL.SEL_RESULT);
		// 3. pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		try {
		// 4. 질의명령 완성하기
			pstmt.setInt(1, sino);	
			// 5. 질의명령 보내고 결과받고
			rs= pstmt.executeQuery();
			while(rs.next()) {
				// 6. 데이터 꺼내서 VO에 담고
				SurveyVO sVO = new SurveyVO();
				sVO.setSno(rs.getInt("sno"));
				sVO.setSino(rs.getInt("sino"));
				sVO.setTitle(rs.getString("title"));
				sVO.setSq(rs.getString("sq"));
				sVO.setSa1(rs.getString("sa1"));
				sVO.setSa2(rs.getString("sa2"));
				sVO.setSa3(rs.getString("sa3"));
				sVO.setSa4(rs.getString("sa4"));
				sVO.setSack1(rs.getInt("sack1"));
				sVO.setSack2(rs.getInt("sack2"));
				sVO.setSack3(rs.getInt("sack3"));
				sVO.setSack4(rs.getInt("sack4"));
				// 7. VOList에 담고
				list.add(sVO);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
					
		}
		
		// 8. list반환하고
		return list;
	}
	
	// 설문 정보 데이터베이스 입력 전담 처리 함수
	public int addSurveyInfo(String title, String start, String end) {
		int cnt = 0;
		int sino = 0;
		// 1. 커넥션 얻어오고
		con = db.getCon();
		// 2. 질의명령 가져오고
		String sql = sSQL.getSQL(sSQL.ADD_SINFO);
		// 3. 미리스테이트먼트 가져오고
			pstmt = db.getPSTMT(con, sql);
			try{
				// 4. 질의명령 완성하고
				pstmt.setString(1, title);
				pstmt.setString(2, start);
				pstmt.setString(3, end);
				// 5. 질의명령 내보내고 받고
				cnt = pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				db.close(pstmt);
				
		}
			System.out.println(cnt);
		// 6. 결과 따라서 처리해주는
		if(cnt == 1) {
			// 6.1 스테이트먼트 가져오고
			stmt = db.getSTMT(con);
			// 6.2 질의명령 가져오고
			sql = sSQL.getSQL(sSQL.SEL_SINO);
			System.out.println("넹 SEL_SINO");
			
			try {
				// 6.3 질의명령 보내고 결과받고
				rs = stmt.executeQuery(sql);
				// 6.4 결과에서 데이터 꺼내고
				rs.next();
				
				sino = rs.getInt("sino");
			} catch (SQLException e) {
				System.out.println("의으이ㅡ시ㅡㅍㄹ");
				e.printStackTrace();
			} finally {
				db.close(rs);
				db.close(stmt);
				db.close(con);
			}
		}	 else {
			System.out.println("else 란다");
			db.close(con);
		}		
		// 7. 결과반환하고
		return sino;
	};
}