package com.servlet.voca;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;

import common.JDBCUtil;

public class VocaDAO {
	//vocaList(HashMap) 구하기
	public HashMap<String,Integer> getVocaList(VocaDTO vDto) {
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		HashMap<String,Integer> vocaList = new HashMap<>();
		try {
			pstmt = conn.prepareStatement
					("select list_name,count(*) from voca where user_id=? group by list_name;");
			pstmt.setString(1, vDto.getUserId());
			rs = pstmt.executeQuery();
			while(rs.next()) vocaList.put(rs.getString(1), rs.getInt(2));
		} catch (SQLException e) {e.printStackTrace();
		} finally { JDBCUtil.close(rs, pstmt, conn); }
		
		
		return vocaList;
	}
	//revise voca [userid,title]
	public ArrayList<String[]> vocaRevise(VocaDTO vDto){
		ArrayList<String[]> ans= new ArrayList<>();
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt= conn.prepareStatement(
					"select list_name,voca_key,voca_val from voca where user_id=? and list_name=? ORDER BY voca_index;");
			pstmt.setString(1, vDto.getUserId());
			pstmt.setString(2, vDto.getListName());
			rs=pstmt.executeQuery();
			System.out.println("SQL Query: " + pstmt.toString());
			while(rs.next()) {
				String[] arr = {rs.getString(1),rs.getString(2),rs.getString(3)};
				ans.add(arr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, pstmt,conn);
		}
		return ans;
	}
	
	//select vocalist
	public ArrayList<String[]> vocaListSelect(VocaDTO vDto){
		ArrayList<String[]> ans= new ArrayList<>();
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select list_name, count(*) from voca where user_id = ? group by list_name;");
			pstmt.setString(1, vDto.getUserId());
			rs=pstmt.executeQuery();
			int i=0;
			while(rs.next()) {
				String []arr = {Integer.toString(++i),rs.getString(1),Integer.toString(rs.getInt(2))};
				ans.add(arr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, pstmt,conn);
		}
		return ans;
	}
	//save voca
	public boolean vocaSave(VocaDTO vDto) {
		Connection conn=JDBCUtil.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			//delete 단어장 수정 시 필요한 로직, 기존에 있던 단어장 저장내용 삭제
			pstmt = conn.prepareStatement("delete from voca where user_id=? and list_name=?");
			pstmt.setString(1, vDto.getUserId());
			pstmt.setString(2, vDto.getListName());
			pstmt.executeUpdate();
			
			//voca_index 구하기
			pstmt = conn.prepareStatement(
					"SELECT voca_index FROM voca WHERE user_id = ? and list_name = ? ORDER BY voca_index DESC LIMIT 1;");
			pstmt.setString(1, vDto.getUserId());
			pstmt.setString(2, vDto.getListName());
			rs=pstmt.executeQuery();
			int index=1;
			if(rs.next()) {
				index = rs.getInt(1);
			}
			
			//insert 단어 정보 입력
			pstmt = conn.prepareStatement("insert into voca values(?,?,?,?,?);");
			int count;
			for(Entry<String, String> entry: vDto.getVocaHash().entrySet()) {
				pstmt.setString(1, vDto.getListName());
				pstmt.setString(2, vDto.getUserId());
				pstmt.setInt(3, ++index);
				pstmt.setString(4, entry.getKey());
				pstmt.setString(5, entry.getValue());
				count = pstmt.executeUpdate();
				if(count != 0)  flag=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs,pstmt,conn);
		}
		return flag;
	}

}
