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
					"insert into chatexam(id,title,ques) values(?,?,?);");
			pstmt.setString(1, eDTO.getId());
			pstmt.setString(2, eDTO.getTitle());
			pstmt.setString(3, eDTO.getQues());
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
				quesList.add(dto);
			}
			
		} catch (SQLException e) { 
			e.printStackTrace();
		} finally { 
			JDBCUtil.close(rs,pstmt,conn); 
		}
		
		return quesList;
	}
}
