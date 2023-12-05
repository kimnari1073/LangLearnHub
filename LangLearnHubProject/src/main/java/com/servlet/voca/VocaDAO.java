package com.servlet.voca;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map.Entry;

import common.JDBCUtil;

public class VocaDAO {
	//단어장 저장
	public boolean vocaSave(VocaDTO vDto) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		conn = JDBCUtil.getConnection();
		boolean flag = false;
		try {
			pstmt = conn.prepareStatement("insert into voca values(?,?,?,?,?);");
			int i =0; int count;
			for(Entry<String, String> entry: vDto.getVocaHash().entrySet()) {
				pstmt.setString(1, vDto.getListName());
				pstmt.setString(2, vDto.getUserId());
				pstmt.setInt(3, i); i++;
				pstmt.setString(4, entry.getKey());
				pstmt.setString(5, entry.getValue());
				count = pstmt.executeUpdate();
				if(count != 0)  flag=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt,conn);
		}
		return flag;
	}

}
