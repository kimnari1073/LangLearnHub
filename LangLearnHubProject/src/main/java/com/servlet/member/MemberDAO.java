package com.servlet.member;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;



public class MemberDAO {
	// 회원 삭제 
	public void memberDelete(MemberDTO mDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = JDBCUtil.getConnection();
		String query = "delete from users where id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mDTO.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt, conn);
			
		}
	}
	// 회원 수정 
	public void memberUpdate(MemberDTO mDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = JDBCUtil.getConnection();
		String query = "update users set password=?, email=?, name=?, phone=?, gender=?, birth=? where id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mDTO.getPassword());
			pstmt.setString(2, mDTO.getEmail());
			pstmt.setString(3, mDTO.getName());
			pstmt.setString(5, mDTO.getGender());
			pstmt.setString(6, mDTO.getBirth());
			pstmt.setString(7, mDTO.getRole());
			pstmt.setString(8, mDTO.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(pstmt, conn);
			
		}
	}
	//회원가입
    public boolean memberInsert(MemberDTO mDTO) {
    	Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean flag = false;

        try {
        	conn = JDBCUtil.getConnection();
            String strQuery = "insert into users(id,password,name,birth,email,gender)"
            		+ " values(?,?,?,?,?,?);";
            pstmt = conn.prepareStatement(strQuery);

            pstmt.setString(1, mDTO.getId());
            pstmt.setString(2, mDTO.getPassword());
            pstmt.setString(3, mDTO.getName());
            pstmt.setString(4, mDTO.getBirth());
            pstmt.setString(5, mDTO.getEmail());
            pstmt.setString(6, mDTO.getGender());
    		
            int count = pstmt.executeUpdate();

            if (count == 1) {
                flag = true;
            }

        } catch (Exception ex) {
            System.out.println("Exception" + ex);
        } finally {
        	JDBCUtil.close(rs, pstmt, conn);
        }
        return flag;
    }		
    
    //로그인
    public boolean loginCheck(String id, String pw) throws SQLException {
    	Connection conn = JDBCUtil.getConnection();
    	String strQuery = "select id, password from users where id = ? and password = ?";
        PreparedStatement pstmt = conn.prepareStatement(strQuery);
        ResultSet rs = null;
        boolean loginCon = false;
       
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        rs = pstmt.executeQuery();
        loginCon = rs.next();
        JDBCUtil.close(rs, pstmt, conn); 
        return loginCon;

        
    }	

    //회원 목록 조회
    public ArrayList<MemberDTO> selectMemberList() throws SQLException {
    	String strQuery = "select * from users;";
    	Connection conn = JDBCUtil.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(strQuery);
        ResultSet rs = pstmt.executeQuery();
        
        ArrayList<MemberDTO> aList = new ArrayList<MemberDTO>();
        while(rs.next()) {
        	MemberDTO rd = new MemberDTO();
        	rd.setId(rs.getString("id"));
        	rd.setPassword(rs.getString("password"));
        	rd.setName(rs.getString("name"));
        	rd.setBirth(rs.getString("birth"));
        	rd.setEmail(rs.getString("email"));
        	rd.setGender(rs.getString("gender"));
        	rd.setRole(rs.getString("role"));
        	aList.add(rd);
        }

    	return aList;
    }

}
