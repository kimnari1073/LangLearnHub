package com.servlet;

import java.sql.Connection;

import common.JDBCUtil;

public class LoginService{
	public Member getLoginMember(String id,String passwd){
		LoginDAO loginDAO =LoginDAO.getInstance();
		Connection con = JDBCUtil.getConnection();
		loginDAO.setConnection(con);
		Member loginMember = loginDAO.selectLoginMember(id,passwd);
		
		return loginMember;
}

}