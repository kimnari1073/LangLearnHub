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
		Connection conn = JDBCUtil.getConnection();
	    PreparedStatement pstmt = null;
	    String query = "delete from users where id = ?";
	    try {
	    	pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, mDTO.getId());
	        pstmt.executeUpdate();
	     } catch (SQLException e) {
	    	 e.printStackTrace();
	     } finally {
	         JDBCUtil.close(pstmt, conn);
	     }
	}
	// 회원 수정 
	public void memberUpdate(MemberDTO mDTO) {
		Connection conn = JDBCUtil.getConnection();
		PreparedStatement pstmt = null; 
		String query = 
				"update users set password=?, email=?, name=?, gender=?, birth=? where id = ?"; 
	    try {
		    conn.setAutoCommit(true); // Auto-commit mode로 설정
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, mDTO.getPassword());
	        pstmt.setString(2, mDTO.getEmail());
	        pstmt.setString(3, mDTO.getName());
	        String temGender="";
	        if(mDTO.getGender().equals("여")) temGender="1";
	        else if(mDTO.getGender().equals("남")) temGender="0";
	        pstmt.setString(4, temGender);
	        pstmt.setString(5, mDTO.getBirth());
	        pstmt.setString(6, mDTO.getId());
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    } finally {
	        JDBCUtil.close(pstmt, conn);
	    }
	}
	// 관리자 부여 
	public void adminUpdate(MemberDTO mDTO) {
		Connection conn = JDBCUtil.getConnection();
	    PreparedStatement pstmt = null;  
	    try {
		    conn.setAutoCommit(true); // Auto-commit mode로 설정
		    String query = "update users set role='1' where id = ?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, mDTO.getId());
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(pstmt, conn);
	    }
	}
	   //관리자 신청 
	public void approveUpdate(MemberDTO mDTO) {
	    Connection conn = JDBCUtil.getConnection();
	    PreparedStatement pstmt = null;
	    String query = "update users set approve='1' where id = ?";
	    try {
		    conn.setAutoCommit(true); // Auto-commit mode로 설정
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, mDTO.getId());
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCUtil.close(pstmt, conn);
	    }
	}

	//회원가입
    public boolean memberInsert(MemberDTO mDTO) {
    	Connection conn = JDBCUtil.getConnection();
        PreparedStatement pstmt = null;
        boolean flag = false;
        try {
            pstmt = conn.prepareStatement("insert into users(id,password,name,birth,email,gender)"
            		+ " values(?,?,?,?,?,?);");
            pstmt.setString(1, mDTO.getId());
            pstmt.setString(2, mDTO.getPassword());
            pstmt.setString(3, mDTO.getName());
            pstmt.setString(4, mDTO.getBirth());
            pstmt.setString(5, mDTO.getEmail());
            pstmt.setString(6, mDTO.getGender());
    		System.out.println(pstmt);
            int count = pstmt.executeUpdate();
            if (count == 1) flag = true;
        } catch (Exception ex) {System.out.println("Exception" + ex);
        } finally { JDBCUtil.close(pstmt, conn);}
        return flag;
    }
    //회원가입 아이디 중복 확인 
    public boolean idcheck(MemberDTO mDto) {
    	Connection conn = JDBCUtil.getConnection();
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        boolean flag = false;
		try {
			pstmt = conn.prepareStatement("select id from users where id = ?");
			pstmt.setString(1, mDto.getId());
	        rs = pstmt.executeQuery();
	        flag = rs.next();
	        System.out.println("SQL Query: " + pstmt.toString());
	        System.out.println("flag: " + flag);
		} catch (SQLException e) { e.printStackTrace();
		} finally { JDBCUtil.close(rs, pstmt, conn); }
        return flag;
    }
    
    //로그인
    public boolean loginCheck(MemberDTO mDto) {
    	Connection conn = JDBCUtil.getConnection();
        PreparedStatement pstmt =null;
        ResultSet rs = null;
        boolean flag = false;
		try {
			pstmt = conn.prepareStatement("select id, password from users where id = ? and password = ?");
			pstmt.setString(1, mDto.getId());
	        pstmt.setString(2, mDto.getPassword());
	        rs = pstmt.executeQuery();
	        flag = rs.next();
	        System.out.println("SQL Query: " + pstmt.toString());
	        System.out.println("flag: " + flag);
		} catch (SQLException e) { e.printStackTrace();
		} finally { JDBCUtil.close(rs, pstmt, conn); }
        return flag;
    }
    
 // 회원 조회
    public MemberDTO getMemberById(String memberId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MemberDTO member = null;
        try {
            conn = JDBCUtil.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
            pstmt.setString(1, memberId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                member = new MemberDTO();
                member.setId(rs.getString("id"));
                member.setPassword(rs.getString("password"));
                member.setName(rs.getString("name"));
                member.setBirth(rs.getString("birth"));
                member.setEmail(rs.getString("email"));
                member.setGender(rs.getString("gender"));
                member.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.close(rs, pstmt, conn);
        }
        return member;
    }

    //회원 전체 목록 조회
    public ArrayList<MemberDTO> selectMemberList() throws SQLException {
    	String strQuery = "select * from users";
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
        	rd.setApprove(rs.getString("approve"));
        	aList.add(rd);
        }
    	return aList;
    }
    
    //관리자 신청 목록 조회
    public ArrayList<MemberDTO> approverList() throws SQLException {
    	String strQuery = "select * from users where approve='1' AND NOT role='1'";
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
        	rd.setApprove(rs.getString("approve"));
        	aList.add(rd);
        }
    	return aList;
    }
}
