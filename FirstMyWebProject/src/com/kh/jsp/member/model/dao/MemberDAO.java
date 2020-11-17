package com.kh.jsp.member.model.dao;

import static com.kh.jsp.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.jsp.common.exception.MemberException;
import com.kh.jsp.member.model.vo.Member;

public class MemberDAO {
	
	// SQL을 별도로 보관하는 Properties 파일 사용하기 
	private Properties prop;
	
	public MemberDAO() {
		prop = new Properties();
		
		String filePath = MemberDAO.class
				                 .getResource("/config/member-sql.properties")
				                 .getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	
	// 회원 조회 (아이디, 비밀번호)
	public Member selectMember(Connection con, Member m) {
		// 1. SQL 실행에 사용할 변수 선언
		Member result = null;         // 결과 담을 객체
		PreparedStatement pstmt = null;       // SQL 정보를 담을 객체
		ResultSet rset = null;         // select한 결과를 받아올 객체
		String sql = prop.getProperty("selectMember");
		
		// 쿼리 확인용
		//System.out.println(sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) { // 데이터베이스에서 머릿글부터 가져오기 때문에
				// 무조건 next()로 비교하고 시작한다.
				result = new Member();
				
				result.setUserId(m.getUserId());
				result.setUserPwd(m.getUserPwd());
				result.setUserName(rset.getString("username")); // 대소문자 상관 X
				result.setGender(rset.getString(4));
				result.setAge(rset.getInt("AGE"));
				result.setPhone(rset.getString("phone"));
				result.setAddress(rset.getString("address"));
				result.setEmail(rset.getString("email"));
				result.setHobby(rset.getString("hobby"));

			}
			
			System.out.println("조회 결과 확인 : " + result);
			
		} catch (SQLException e) {		
			e.printStackTrace();
			
		} finally {
			
			close(rset);
		    close(pstmt);
		}
		
		return result;
	}

	public int insertMember(Connection con, Member joinMember) throws MemberException {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		    
		try {
			pstmt = con.prepareStatement(sql);
			
			// 데이터베이스는 숫자가 1부터 시작
			pstmt.setString(1, joinMember.getUserId());
			pstmt.setString(2, joinMember.getUserPwd());
			pstmt.setString(3, joinMember.getUserName());
			pstmt.setString(4, joinMember.getGender());
			pstmt.setInt(     5, joinMember.getAge());
			pstmt.setString(6, joinMember.getEmail());
			pstmt.setString(7, joinMember.getPhone());
			pstmt.setString(8, joinMember.getAddress());
			pstmt.setString(9, joinMember.getHobby());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			throw new MemberException("[DAO] : " + e.getMessage());
			
		} finally {
			
			close(pstmt);
		}
		
		return result;
	}

	public int updateMember(Connection con, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString( 1, m.getUserPwd() );
			pstmt.setString( 2, m.getGender()   );
			pstmt.setInt(      3, m.getAge()        );
			pstmt.setString( 4, m.getEmail()      );
			pstmt.setString( 5,  m.getPhone()    );
			pstmt.setString( 6,  m.getAddress() );
			pstmt.setString( 7,  m.getHobby()   );
			pstmt.setString( 8,  m.getUserId()   );
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection con, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int idDupCheck(Connection con, String id) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idDupCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			 close(rset);
			 close(pstmt);
		}
		
		return result;
	}

}
