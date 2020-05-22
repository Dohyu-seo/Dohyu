package com.increpas.www.dao;

import java.sql.*;
import java.util.*;

import com.increpas.www.DB.*;
import com.increpas.www.sql.*;
import com.increpas.www.vo.*;

public class EmpDAO {
	WebDBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	EmpSQL eSQL;
	public EmpDAO() {
		db = new WebDBCP();
		eSQL = new EmpSQL();
	}
	
	// 회원리스트 가져오기 전담 처리 함수
	public ArrayList<EmpVO> getList(){
		ArrayList<EmpVO> list = new ArrayList<EmpVO>();
		// con
		con = db.getCon();
		// SQL
		String sql = eSQL.getSQL(eSQL.SEL_EMP_LIST);
		
		stmt = db.getSTMT(con);
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				EmpVO eVO = new EmpVO();
				eVO.setEno(rs.getInt("eno"));
				eVO.setName(rs.getString("name"));
				
				list.add(eVO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return list;
	}
	
	// 회원 정보 표시 전담 처리 함수
	public EmpVO getInfo(int eno) {
		EmpVO eVO = new EmpVO();
		con = db.getCon();
		String sql = eSQL.getSQL(eSQL.SEL_EMP_INFO);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setInt(1, eno);
			rs = pstmt.executeQuery();
			rs.next();
			eVO.setEno(rs.getInt("eno"));
			eVO.setName(rs.getString("name"));
			eVO.setMgr(rs.getInt("mgr"));
			eVO.setHdate(rs.getDate("hdate"));
			eVO.setHtime(rs.getTime("hdate"));
			eVO.setSdate();
			eVO.setSal(rs.getInt("sal"));
			eVO.setGrade(rs.getInt("grade"));
			eVO.setComm(rs.getString("comm"));
			eVO.setDno(rs.getInt("dno"));
			eVO.setDname(rs.getString("dname"));
			eVO.setLoc(rs.getString("loc"));
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return eVO;
	}
	
	// 부서이름 조회 전담 처리 함수
	public String getDname(int eno) {
		String str = "";
		con = db.getCon();
		String sql = eSQL.getSQL(eSQL.SEL_EMP_DNAME);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setInt(1, eno);
			rs = pstmt.executeQuery();
			rs.next();
			str = rs.getString("dname");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		
		return str;
	}
}
