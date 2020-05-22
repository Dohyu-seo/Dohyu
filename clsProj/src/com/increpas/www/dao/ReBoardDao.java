package com.increpas.www.dao;

/**
 * 이 클래스는 댓글게시판 관련 데이터베이스 작업을 처리할 클래스
 * @author 서동혁
 * @since 2020.05.13
 * @version v.1.0.0
 */
import java.sql.*;
import java.util.*;

import com.increpas.www.DB.*;
import com.increpas.www.vo.*;
import com.increpas.www.sql.*;

public class ReBoardDao {
   WebDBCP db;
   Connection con;
   Statement stmt;
   PreparedStatement pstmt;
   ResultSet rs;
   ReBoardSQL rSQL;
   
   public ReBoardDao() {
      // 할일
      // 1. 데이터베이스 준비
         db = new WebDBCP();
      // 2. 질의명령 가져오고
         rSQL = new ReBoardSQL();
   }
   // 리스트 조회 전담 처리함수
   public ArrayList<ReBoardVO> getAllList(){
      ArrayList<ReBoardVO> list = new ArrayList<ReBoardVO>();
      // 할일
      // 1. 커넥션 가져오고
      con = db.getCon();
      // 2. 질의명령 가져오고
      String sql = rSQL.getSQL(rSQL.SEL_ALL_LIST);
      // 3. 스테이트먼트 가져오고
      stmt = db.getSTMT(con);
      try{
	      // 4. 질의명령 보내고 결과받고
	         rs = stmt.executeQuery(sql);
	      // 5. 결과에서 데이터 꺼내서 VO에 담고
	      // 몇개를 꺼내야할지 모른다. 반복해서 꺼내자
	         while(rs.next()) {
	            ReBoardVO rVO = new ReBoardVO();
	            rVO.setReno(rs.getInt("reno"));
	            rVO.setMno(rs.getInt("mno"));
	            rVO.setId(rs.getString("id"));
	            rVO.setAvatar(rs.getString("avatar"));
	            rVO.setBody(rs.getString("body"));
	            rVO.setBody(); // 줄바꿈 기호 처리
	            rVO.setReDate(rs.getDate("redate"));
	            rVO.setReTime(rs.getTime("redate"));
	            rVO.setsDate(); // 원하는 형식의 date변환
	            rVO.setStep(rs.getInt("step"));
	            // 6. VO리스트에 담기
	            // 한줄씩 데이터 채우기
	            list.add(rVO);
	         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         db.close(rs);
         db.close(stmt);
         db.close(con);
      }
      // 7. 리스트 내보내기
      return list;
   }
   // 리스트 조회 전담 처리함수
   public ArrayList<ReBoardVO> getAllList(int startCont, int endCont){
	   ArrayList<ReBoardVO> list = new ArrayList<ReBoardVO>();
	   // 할일
	   // 1. 커넥션 가져오고
	   con = db.getCon();
	   // 2. 질의명령 가져오고
	   String sql = rSQL.getSQL(rSQL.SEL_LIST);
	   // 3. 스테이트먼트 가져오고
	   pstmt = db.getPSTMT(con, sql);
	   try{
		   // 4.0 질의명령 완성하고
		   pstmt.setInt(1, startCont);
		   pstmt.setInt(2, endCont);
		   // 4. 질의명령 보내고 결과받고
		   rs = pstmt.executeQuery();
		   // 5. 결과에서 데이터 꺼내서 VO에 담고
		   // 몇개를 꺼내야할지 모른다. 반복해서 꺼내자
		   while(rs.next()) {
			   ReBoardVO rVO = new ReBoardVO();
			   rVO.setReno(rs.getInt("reno"));
			   rVO.setMno(rs.getInt("mno"));
			   rVO.setId(rs.getString("id"));
			   rVO.setAvatar(rs.getString("avatar"));
			   rVO.setBody(rs.getString("body"));
			   rVO.setBody(); // 줄바꿈 기호 처리
			   rVO.setReDate(rs.getDate("redate"));
			   rVO.setReTime(rs.getTime("redate"));
			   rVO.setsDate(); // 원하는 형식의 date변환
			   rVO.setStep(rs.getInt("step"));
			   // 6. VO리스트에 담기
			   // 한줄씩 데이터 채우기
			   list.add(rVO);
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally {
		   db.close(rs);
		   db.close(pstmt);
		   db.close(con);
	   }
	   // 7. 리스트 내보내기
	   return list;
   }
   // 총 게시물 수 조회 전담 처리 함수
   public int getTotalCount() {
	   int cnt = 0;
	   // 할일 
	   // 1. 커넥션 얻어옥
	   con = db.getCon();
	   // 2. 질의명령 가져오고
	   String sql = rSQL.getSQL(rSQL.SEL_ALL_CNT);
	   // 3. 스테이트먼트 얻어오고
	   stmt = db.getSTMT(con);
	   try {
		   // 4. 질의명령 실어서보내고 결과받고
		   rs = stmt.executeQuery(sql);
		   // 5. 데이터 꺼내고
		   rs.next();
		   cnt = rs.getInt("cnt");
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally {
		   db.close(rs);
		   db.close(stmt);
		   db.close(con);
	   }
	   
	   // 6. 데이터 내보내고
	   return cnt;
   }
   
	// 댓글 입력 데이터베이스작업 전담 처리함수
	public int insertReply(String sid, String body, int upno) {
		// 반환값 변수 만들고
		int cnt = 0 ;
		// 할일
		// 1. 커넥션 가져오고
		con = db.getCon();
		// 2. 질의명령가져오고
		String sql = rSQL.getSQL(rSQL.ADD_REPL);
		// 3. pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		try{
			// 4. 질의명령 완성하고
			pstmt.setString(1, sid);
			pstmt.setString(2, body);
			pstmt.setInt(3, upno);
			// 5. 질의명령 보내고 결과받고
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
		} finally {
			db.close(pstmt);
			db.close(con);
		}
		// 6. 데이터 내보내고
		return cnt;
	}
   
   // 댓글 삭제할 함수
   
   // 댓글 수정할 함수
}