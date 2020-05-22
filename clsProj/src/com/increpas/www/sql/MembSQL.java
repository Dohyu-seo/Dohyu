package com.increpas.www.sql;

public class MembSQL {
	public final int SEL_MNO_INFO = 1001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_MNO_INFO:
			buff.append("SELECT ");
			buff.append("	* ");
			buff.append("FROM ");
			buff.append("	member ");
			buff.append("WHERE ");
			buff.append("	mno = ? ");
			break;
		}
		return buff.toString();
	}
}