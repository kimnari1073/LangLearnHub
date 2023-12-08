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
	       
	       try {
	    	   conn = JDBCUtil.getConnection();
		       conn.setAutoCommit(true); // Auto-commit mode로 설정
		       String query = "update users set password=?, email=?, name=?, gender=?, birth=? where id = ?";
		       
	           pstmt = conn.prepareStatement(query);
	           pstmt.setString(1, mDTO.getPassword());
	           pstmt.setString(2, mDTO.getEmail());
	           pstmt.setString(3, mDTO.getName());
	           pstmt.setString(4, mDTO.getGender());
	           pstmt.setString(5, mDTO.getBirth());
	           pstmt.setString(6, mDTO.getId());
	           pstmt.executeUpdate();
	           System.out.println("SQL Query: " + pstmt.toString());
	       } catch (SQLException e) {
	           e.printStackTrace();
	       } finally {
	           JDBCUtil.close(pstmt, conn);
	       }
	   }
	// 회원 수정 <c:set>으로 한 마이페이지 
	    public MemberDTO memberUpdate1(String memberId) {
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
    		
            int count = pstmt.executeUpdate();
            if (count == 1) flag = true;
        } catch (Exception ex) {System.out.println("Exception" + ex);
        } finally { JDBCUtil.close(pstmt, conn);}
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


    //회원 목록 조회
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
        	aList.add(rd);
        }

    	return aList;
    }

}
