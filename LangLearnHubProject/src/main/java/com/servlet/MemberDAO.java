package com.servlet;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCUtil;



public class MemberDAO {
	// 회원 삭제 
	public void memberDelete(MemberDTO mDTO) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		conn = JDBCUtil.getConnection();
		String query = "delete from useres where id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mDTO.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
			//pstmt.setString(4, mDTO.getPhone());
			pstmt.setString(5, mDTO.getGender());
			pstmt.setString(6, mDTO.getBirth());
			pstmt.setString(7, mDTO.getRole());
			pstmt.setString(8, mDTO.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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
            String strQuery = "insert into users values(?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(strQuery);
            pstmt.setString(1, mDTO.getId());
            pstmt.setString(2, mDTO.getPassword());
            pstmt.setString(3, mDTO.getName());
            pstmt.setString(4, mDTO.getBirth());
            pstmt.setString(5, mDTO.getEmail());
            pstmt.setString(6, mDTO.getGender());
            pstmt.setString(7, mDTO.getRole());

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
public boolean loginCheck(String id, String password) {
	Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    boolean loginCon = false;
    try {
		conn = JDBCUtil.getConnection();
        String strQuery = "select id, password from users where id = ? and password = ?";

        pstmt = conn.prepareStatement(strQuery);
        pstmt.setString(1, id);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();
        loginCon = rs.next();
    } catch (Exception ex) {
        System.out.println("Exception" + ex);
    } finally {
    	JDBCUtil.close(rs, pstmt, conn);
    }
    return loginCon;
}	
	

}
