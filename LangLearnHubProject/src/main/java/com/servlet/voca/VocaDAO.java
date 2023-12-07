package com.servlet.voca;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map.Entry;

import common.JDBCUtil;

public class VocaDAO {
	//vocaList(Json) 구하기
	public HashMap<String,Integer> getVocaList(VocaDTO vDto) {
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id=vDto.getUserId();
		HashMap<String,Integer> vocaList = new HashMap<>();
		try {
			pstmt = conn.prepareStatement
					("select list_name,count(*) from voca where user_id=? group by list_name;");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) vocaList.put(rs.getString(1), rs.getInt(2));
		} catch (SQLException e) {e.printStackTrace();
		} finally { JDBCUtil.close(rs, pstmt, conn); }
		
		
		return vocaList;
	}
	
	
	//단어장 저장
	public boolean vocaSave(VocaDTO vDto) {
		Connection conn=JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		boolean flag = false;
		
		try {
			//delete 단어장 수정 시 필요한 로직, 기존에 있던 단어장 저장내용 삭제
			pstmt = conn.prepareStatement("delete from voca where user_id=? and list_name=?");
			pstmt.setString(1, vDto.getUserId());
			pstmt.setString(2, vDto.getListName());
			pstmt.executeUpdate();
			
			//insert 단어 정보 입력
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
