package com.increpas.www.dao;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.increpas.www.DB.*;
import com.increpas.www.sql.*;
import com.increpas.www.vo.*;
import com.oreilly.servlet.*;

public class MemberDao {
	WebDBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	MemberSQL mSQL;
	public MemberDao() {
		db = new WebDBCP();
		mSQL = new MemberSQL();
	}
	
	// 로그인 데이터베이스 처리 전담 함수
	public int getLoginCnt(String id, String pw) {
		int cnt = 0 ;
		con = db.getCon();
		// sql
		String sql = mSQL.getSQL(mSQL.SEL_LOGIN_CNT);
		
		// pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		
		try{
			// 질의 명령 완성
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			// 질의명령보내고 결과 받고
			rs = pstmt.executeQuery();
			// 데이터꺼내서 변수에 담고
			rs.next();
			cnt = rs.getInt("cnt");
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return cnt;
	}
	
	// 회원 아이디 카운트 데이터베이스작업 전담 처리 함수
	public int getIdCnt(String id) {
		// 할일
		// 반환값 변수 만들고
		int cnt = 0;
		
		// 1. 커넥션 얻어오고
		con = db.getCon();
		// 2. 질의명령 가져오고
		String sql = mSQL.getSQL(mSQL.SEL_ID_CNT);
		// 3. PreparedStatement 가져오고
		pstmt = db.getPSTMT(con, sql);
		try {
			// 4. 질의명령 완성하고
			pstmt.setString(1, id);
			// 5. 질의명령 보내고 결과 받고
			rs = pstmt.executeQuery();
			// 6. 결과에서 데이터 꺼내고
			rs.next();
			cnt = rs.getInt("cnt");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		// 7. 꺼낸데이터 반환해주고
		return cnt;
	}
	
	// 회원정보 데이터베이스 입력 전담 처리 함수
	public int addMemb(MemberVO mVO) {
		int cnt = 0 ; 
		// 할일
		// 1. 커넥션 얻어오고
		con = db.getCon();
		// 2. 질의명령 가져오고
		String sql = mSQL.getSQL(mSQL.ADD_MEMB);
		// 3. pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		try {
			// 4. 질의명령 완성
			pstmt.setString(1, mVO.getName());
			pstmt.setString(2, mVO.getId());
			pstmt.setString(3, mVO.getPw());
			pstmt.setString(4, mVO.getMail());
			pstmt.setString(5, mVO.getGen());
			pstmt.setString(6, mVO.getTel());
			pstmt.setInt(7, mVO.getAno());
			// 5. 질의명령 보내고 결과 받고
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(pstmt);
			db.close(con);
		}
		// 6. 결과 반환하고
		return cnt;
	}
	
	// 회원 프로필 데이터베이스 입력 전담 처리 함수
	public int addProf(ProfileVO pVO, MultipartRequest multi) {
		int cnt = 0 ; 
		// 먼저 전달 받은 데이터 완성하고
		setPVO(pVO, multi);
		// 할일
		// 1. 커넥션
		con = db.getCon();
		// 2. 질의명령 가져오고
		String sql = mSQL.getSQL(mSQL.ADD_PROF);
		// 3. pstmt 가져오고
		pstmt = db.getPSTMT(con, sql);
		try {
			// 4. 질의명령 완성하고
			pstmt.setString(1, pVO.getId());
			pstmt.setString(2, pVO.getOriname());
			pstmt.setString(3, pVO.getSavename());
			pstmt.setLong(4, pVO.getLen());
			// 5. 질의명령 보내고 결과 받고
			cnt = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(pstmt);
			db.close(con);
		}
		// 6. 결과 반환하고
		return cnt;
	}
	
	// 업로드하는 파일에 대한 정보를 처리해주는 함수
	public void setPVO(ProfileVO pVO, MultipartRequest multi) {
		
		/*
			이미 파일은 업로드가 되었지만
			이것은 단순히 서버의 특정 폴더에 파일을 저장한 것이다.
			이 파일이 누구의 것인지 저장이름은 어떻게 되는지 등등의 정보는 전혀 알지 못한다.
			따라서 업로드된 파일의 정보는 데이터베이스에 기록해 놓아야
			그 파일의 실제 소유자를 찾을 수 있게 된다.
			
			참고 ]
				multi 가 가진 주요 함수
				==> 자신이 업로드한 파일의 정보를 알려주는 함수
				
				1. getFile("키값")				-	업로드된 파일의 정보를 알려준다.
				2. getFilesystemName("키값")		- 	업로드된 파일의 실제 저장된 이름을 알려준다.
				3. getOriginalFileName("키값")	- 	업로드된 파일의 원래 이름을 알려준다.
				4. getFileNames()				- 	업로드된 파일의 모든 키값을 알려준다.
		 */
		String oriname = multi.getOriginalFileName("file");
		String savename = multi.getFilesystemName("file");
		
		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/profile";
		String repath = path.substring(0, path.indexOf("/source/.metadata")) + "/git/clsProj/clsProj/WebContent/profile/";
		
		File file = multi.getFile("file");
		long len = file.length();
		
		FileInputStream fin = null;
		FileOutputStream fout = null;
		try {
			fin = new FileInputStream(path + "/" + savename);
			fout = new FileOutputStream(repath + savename);
			
			byte[] buff = new byte[1024];
			while(true) {
				int cnt = fin.read(buff);
				if(cnt == -1) {
					break;
				}
				fout.write(buff);
				fout.flush();
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fout.close();
				fin.close();
			} catch(Exception e) {}
		}
		
		pVO.setOriname(oriname);
		pVO.setSavename(savename);
		pVO.setLen(len);
		
		return;
	}
	
	
	public MemberVO getInfo(int mno) {
		MemberVO mVO = new MemberVO();
		con = db.getCon();
		String sql = mSQL.getSQL(mSQL.SEL_MNO_INFO);
		pstmt = db.getPSTMT(con, sql);
		
		try {
			pstmt.setInt(1, mno);
			rs = pstmt.executeQuery();
			rs.next();
			mVO.setMno(rs.getInt("mno"));
			mVO.setId(rs.getString("id"));
			mVO.setName(rs.getString("name"));
			mVO.setMail(rs.getString("mail"));
			mVO.setTel(rs.getString("tel"));
			mVO.setGen(rs.getString("gen"));
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return mVO;
	}
}