package com.servlet.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import common.JDBCUtil;

public class ChatDAO {
	//select
	public ArrayList<String[]> chatSelect(ChatDTO cDto) {
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ArrayList<String[]> ans= new ArrayList<>();
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(
					"select bookmark_index,title,q,a from bookmark where user_id=? order by bookmark_index");
			pstmt.setString(1,cDto.getUserId());
			rs=pstmt.executeQuery();
			while(rs.next()) {
				String []arr = {rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4)};
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
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select bookmark_index from bookmark where user_id=?;");
			pstmt.setString(1, cDto.getUserId());
			rs=pstmt.executeQuery();
			//DB에 넣을 bookmark_index 계산
			int index = 1;
			while(rs.next()) {index++;}
			
			pstmt = conn.prepareStatement(
					"insert into bookmark(user_id,bookmark_index,title,Q,A) values(?,?,?,?,?);");
			pstmt.setString(1, cDto.getUserId());
			pstmt.setInt(2, index);
			pstmt.setString(3, cDto.getTitle());
			pstmt.setString(4, cDto.getQ());
			pstmt.setString(5, cDto.getA());
			int tem = pstmt.executeUpdate();
			if(tem != 0) flag = true;
			System.out.println("SQL: "+pstmt.toString());
		}catch(SQLIntegrityConstraintViolationException e) { 
			if (e.getMessage().contains("Duplicate entry")) {
		        System.out.println("중복된 값이 이미 존재합니다. return flag=false;");
		        return flag;
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return flag;
	}
	//delete
	public boolean chatDelete(ChatDTO cDto) {
		boolean flag=false;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      conn = JDBCUtil.getConnection();
	      try {
	         pstmt = conn.prepareStatement("delete from bookmark where user_id = ? and bookmark_index = ?;");
	         pstmt.setString(1, cDto.getUserId());
	         pstmt.setInt(2, cDto.getBookmarkIndex());
	         pstmt.executeUpdate();
	         flag=true;
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         JDBCUtil.close(pstmt, conn);
	      }
		return flag;
	}
}