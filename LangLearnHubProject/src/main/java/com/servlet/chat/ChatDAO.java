package com.servlet.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class ChatDAO {
	//select
	public ArrayList<String[]> chatSelect(ChatDTO cDto) {
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ArrayList<String[]> ans = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"select title,q,a from bookmark where user_id=?");
			pstmt.setString(1,cDto.getUserId());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String []arr = {rs.getString(1),rs.getString(2),rs.getString(3)};
				ans.add(arr);
			}
			
		} catch (SQLException e) { e.printStackTrace();
		} finally { JDBCUtil.close(rs,pstmt,conn); }
		
		return ans;
	}
	//save
	public boolean chatSave(ChatDTO cDto) {
		Connection conn=JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		boolean flag = false;
		try {
			pstmt = conn.prepareStatement(
					"insert into bookmark(user_id,title,Q,A) values(?,?,?,?);");
			pstmt.setString(1, cDto.getUserId());
			pstmt.setString(2, cDto.getTitle());
			pstmt.setString(3, cDto.getQ());
			pstmt.setString(4, cDto.getA());
			int tem = pstmt.executeUpdate();
			if(tem != 0) flag = true;
			System.out.println("SQL: "+pstmt.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return flag;
	}

}
