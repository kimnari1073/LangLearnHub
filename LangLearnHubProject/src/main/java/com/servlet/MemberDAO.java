package com.servlet;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import common.JDBCUtil;



public class MemberDAO {
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
	

}
