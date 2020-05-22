package com.increpas.www.dao;

/**
 * 이 클래스는 방명록 게시판에 관련된 데이터베이스 작업을 처리할 클래스
 * @author 서동혁 
 * @since 2020.05.12
 * @version v.1.0
 */
import java.sql.*;
import java.util.*;

import com.increpas.www.DB.WebDBCP;
import com.increpas.www.sql.GBoardSQL;
import com.increpas.www.vo.GBoardVO;

public class GBoardDao {
	WebDBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	GBoardSQL gSQL;
	GBoardVO gVO;
	public GBoardDao() {
		db = new WebDBCP();
		gSQL = new GBoardSQL();
	}

	// 방명록 리스트 조회 전담 처리 함수
	public ArrayList<GBoardVO> getGList(){
		ArrayList<GBoardVO> list = new ArrayList<GBoardVO>();
		// 할일
		// 1. 커넥션 가져오고
		con = db.getCon();
		// 2. 질의명령 가져오고
		String sql = gSQL.getSQL(gSQL.SEL_LIST);
		// 3. stmt 가져오고
		stmt = db.getSTMT(con);
		try {
			// 4. 질의명령 stmt에 실어서 보내고 결과 받고
			rs = stmt.executeQuery(sql);
			// 5. 하나씩 꺼내서 VO에 담고
			while(rs.next()) {
				// vo 만들고
				GBoardVO vo = new GBoardVO();
				vo.setGno(rs.getInt("gno"));
				vo.setGmno(rs.getInt("gmno"));
				vo.setId(rs.getString("id"));
				vo.setGbody(rs.getString("body"));
				vo.setAvatar(rs.getString("avatar"));
				vo.setgDate(rs.getDate("gdate"));
				vo.setgTime(rs.getTime("gdate"));
				vo.setsDate();
				// 6. list에 VO담고
				list.add(vo);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		// 7. list 내보내고
		return list;
	}
	// 작성글 카운트 조회 디비작업 전담 처리 함수
	public int getCnt(String id) {
		int cnt = 0 ;
		// 할일
		// 1. 커넥션 가져오고
			con = db.getCon();
		// 2. 질의명령 가져오고
		String sql = gSQL.getSQL(gSQL.SEL_ID_CNT);
		// 3. pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		try {
		// 4. 질의명령을 완성해봅시다.
			pstmt.setString(1, id);
			// 5. 보내기
			rs = pstmt.executeQuery();
			// 6. 꺼내기
			rs.next();
			cnt = rs.getInt("cnt");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		// 7. 내보내기
		return cnt;
	}
	// 아바타 파일이름 조회 전담 처리 함수
	public String getAvt(String id) {
		String avt = "";
		//할일
		// 1. 커넥션 가져오고
		con = db.getCon();
		// 2. 질의명령 가져오고
		String sql = gSQL.getSQL(gSQL.SEL_AVT);
		// 3. pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		try {
		// 4. 질의명령 완성하기
			pstmt.setString(1, id);
			// 5. 보내고 결과얻기
			rs = pstmt.executeQuery();
			// 6. 데이터 꺼내고
			rs.next();
			avt = rs.getString("avatar");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		
		// 7. 내보내고
		return avt;
	}
	// 방명록 작성하면 저장하는 함수
//	public 
}
