package com.servlet.chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class ChatExamDAO {
	public int chatExamInsert(ChatExamDTO eDTO) {
		Connection conn=JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		int result= 0;
		try {
			pstmt = conn.prepareStatement(
					"insert into chatexam(id,title,ques,examparse,examtype,color) values(?,?,?,?,?,?);");
			pstmt.setString(1, eDTO.getId());
			pstmt.setString(2, eDTO.getTitle());
			pstmt.setString(3, eDTO.getQues());
			pstmt.setString(4, eDTO.getExamparse());
			pstmt.setString(5, eDTO.getExamtype());
			pstmt.setString(6, "lightgrey");
			result = pstmt.executeUpdate();
			System.out.println("SQL: "+pstmt.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
		return result;
	}
	public ArrayList<ChatExamDTO> chatSelect(String id) {
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ArrayList<ChatExamDTO> quesList = new ArrayList<>();
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement("select * from chatexam where id=?");
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ChatExamDTO dto = new ChatExamDTO();
				dto.setNum(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setQues(rs.getString(4));
				dto.setExamparse(rs.getString(5));
				dto.setExamtype(rs.getString(6));
				dto.setColor(rs.getString(7));
				quesList.add(dto);
			}
			
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally { 
			JDBCUtil.close(rs,pstmt,conn); 
		}
		
		return quesList;
	}
	public void deleteExam(int num, String id) {
		Connection conn=JDBCUtil.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(
					"delete from chatexam where num = ? AND id = ?;");
			pstmt.setInt(1, num);
			pstmt.setString(2, id);
            pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}
	public void updateColor(int num, String color, String id) {
		Connection conn=JDBCUtil.getConnection();
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(
					"update chatexam set color = ? where num = ? AND id = ?;");
			pstmt.setString(1, color);
			pstmt.setInt(2, num);
			pstmt.setString(3, id);
            pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}
}