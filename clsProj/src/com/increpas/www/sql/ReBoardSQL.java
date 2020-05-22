package com.increpas.www.sql;

public class ReBoardSQL {
	public final int SEL_ALL_LIST = 1001;
	public final int SEL_LIST = 1002;
	public final int ADD_REPLY = 1003;
	public final int DEL_REPLY = 1004;
	public final int SER_REPLY = 1005;
	public final int SEL_ALL_CNT = 1006;
	public final int ADD_REPL = 1007;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		
		switch(code) {
		case SEL_ALL_LIST:
			buff.append("SELECT ");
			buff.append("    rno, reno, remno mno, id, savename avatar, rebody body, reupno upno, redate, step ");
			buff.append("FROM ");
			buff.append("	(SELECT  ");
			buff.append("    	ROWNUM RNO, R.* ");
			buff.append("	FROM ");
			buff.append("		(SELECT  ");
			buff.append("    		RENO, REMNO, REBODY, REUPNO, REDATE, (LEVEL -1) step, ");
			buff.append("    		id, savename");
			buff.append("		FROM ");
			buff.append("    		reboard re, member m, avatar a ");
			buff.append("		WHERE ");
			buff.append("   		re.isshow = 'Y' ");
			buff.append("   		AND m.ano = a.ano ");
			buff.append("   		AND remno = mno ");
			buff.append("		START WITH ");
			buff.append("    		REUPNO IS NULL ");
			buff.append("		CONNECT BY ");
			buff.append("    		PRIOR RENO = reupno ");
			buff.append("		ORDER SIBLINGS BY ");
			buff.append("    		redate DESC) R ");
			buff.append("	) ");
			break;
		case SEL_LIST:
			buff.append("SELECT ");
			buff.append("    rno, reno, remno mno, id, savename avatar, rebody body, reupno upno, redate, step ");
			buff.append("FROM ");
			buff.append("	(SELECT  ");
			buff.append("    	ROWNUM RNO, R.* ");
			buff.append("	FROM ");
			buff.append("		(SELECT  ");
			buff.append("    		RENO, REMNO, REBODY, REUPNO, REDATE, (LEVEL -1) step, ");
			buff.append("    		id, savename");
			buff.append("		FROM ");
			buff.append("    		reboard re, member m, avatar a ");
			buff.append("		WHERE ");
			buff.append("   		re.isshow = 'Y' ");
			buff.append("   		AND m.ano = a.ano ");
			buff.append("   		AND remno = mno ");
			buff.append("		START WITH ");
			buff.append("    		REUPNO IS NULL ");
			buff.append("		CONNECT BY ");
			buff.append("    		PRIOR RENO = reupno ");
			buff.append("		ORDER SIBLINGS BY ");
			buff.append("    		redate DESC) R ");
			buff.append("	) ");
			buff.append("	WHERE  ");
			buff.append("    	rno BETWEEN ? AND ? ");
			break;
		case ADD_REPLY:
			buff.append("INSERT INTO ");
			buff.append("    reboard(reno, remno, rebody, reupno) ");
			buff.append("VALUES( ");
			buff.append("	(SELECT	NVL(MAX(reno) +1, 1000) FROM reboard),  ");
			buff.append("    ?,?,?) ");//? : 사용자번호, ? : body, ?: 상위글번호
			break;
		case DEL_REPLY:
			buff.append("UPDATE ");
			buff.append("    reBoard ");
			buff.append("SET ");
			buff.append(" isshow = 'N' ");
			buff.append("WHERE ");
			buff.append("	reno == ? "); //? : isShow 'N' 할 글번호
			break;
		case SER_REPLY:
			buff.append("UPDATE ");
			buff.append("    reboard ");
			buff.append("SET ");
			buff.append("	body = ?  "); //? : 수정할 내용작성
			buff.append("WHERE ");
			buff.append(" reno == ? "); // ? :수정할 글번호
			break;
		case SEL_ALL_CNT:
			buff.append("SELECT ");
			buff.append("    count(*) cnt ");
			buff.append("FROM ");
			buff.append("	reboard ");
			buff.append("WHERE ");
			buff.append("	isshow = 'Y' ");
			break;
		case ADD_REPL:
			buff.append("INSERT INTO ");
			buff.append("	reboard(reno, remno, rebody, reupno) ");
			buff.append("VALUES( ");
			buff.append("   (SELECT NVL(MAX(reno) + 1, 1000) FROM reboard), ");
			buff.append("   (SELECT mno FROM member WHERE id = ?), ?, ? ");
			buff.append(") ");
			break;
		}
		
		return buff.toString();
	}
}
