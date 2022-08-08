package com.bunge.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BlockDao {
	public boolean getBlockAccountList(String account_number) throws SQLException, ClassNotFoundException {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT count(*) FROM BLOCK b, PROFILE p, PROFILE p2 WHERE b.REPORT_NICKNAME_FK = p.NICKNAME_PK AND b.REPORTED_NICKNAME_FK = p2.NICKNAME_PK AND p2.ACCOUNT_NUMBER = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, account_number);
		ResultSet rs = pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()){
			result = rs.getInt("count(*)");
		}
		return result>=1;
	}
	
	public boolean getBlockPhoneList(String phone_number) throws SQLException, ClassNotFoundException {
		
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT count(*) FROM BLOCK b, PROFILE p, PROFILE p2 WHERE b.REPORT_NICKNAME_FK = p.NICKNAME_PK AND b.REPORTED_NICKNAME_FK = p2.NICKNAME_PK AND p2.PHONE_NUMBER = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, phone_number);
		ResultSet rs = pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()) {
			result = rs.getInt("count(*)");
			System.out.println("getBlockList, result = " + result);
		}
		return result>=1;
	}
	
	public boolean getBlockKakaoList(String kakao_id) throws SQLException, ClassNotFoundException {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT count(*) FROM BLOCK b, PROFILE p, PROFILE p2 WHERE b.REPORT_NICKNAME_FK = p.NICKNAME_PK AND b.REPORTED_NICKNAME_FK = p2.NICKNAME_PK AND p2.KAKAOTALK_ID = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, kakao_id);
		ResultSet rs = pstmt.executeQuery();
		
		int result = 0;
		if(rs.next()){
			result = rs.getInt("count(*)");
			System.out.println("getBlockKakaoList, result = " + result);
		}
		return result>=1;
	}
}
