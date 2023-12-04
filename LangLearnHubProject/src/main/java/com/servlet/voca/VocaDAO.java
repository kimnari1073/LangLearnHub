package com.servlet.voca;

import java.sql.Connection;
import java.sql.PreparedStatement;

import common.JDBCUtil;

public class VocaDAO {
	//단어장 저장
	public boolean vocaSave(VocaDTO vDTO) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		conn = JDBCUtil.getConnection();
		
		String query = "insert into voca values(?,?,?,?,?);";
		pstmt.
		
		
		
		
		
		
		
		
		return true;
	}

}
