package com.kh.jsp.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.jsp.common.JDBCTemplate.*;

import com.kh.jsp.common.exception.NoticeException;
import com.kh.jsp.notice.model.dao.NoticeDAO;
import com.kh.jsp.notice.model.vo.Notice;

    public class NoticeService {
       private Connection con;
       private NoticeDAO nDAO = new NoticeDAO();
       
	   public ArrayList<Notice> selectList() throws NoticeException  {
		
		   con = getConnection();
		   
		   ArrayList<Notice> list = nDAO.selectList(con);
		   
		   close(con);
		   
		return list;
	}

	public int insertNotice(Notice n) throws NoticeException {
		 con = getConnection();
		 
		 int result = nDAO.insertNotice(con, n);
		 
		 if(result > 0) commit(con);
		 else rollback(con);
		 
		 close(con);
		 
		 return result;
		
	}

	public Notice selectOne(int nno) throws NoticeException {
		con = getConnection();
		
		Notice n = nDAO.selectOne(con, nno);
		
		if(n != null) {
			 // 조회수 1 증가 
			int result = nDAO.updateReadCount(con, nno);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return n;
	}

	public Notice updateView(int nno) throws NoticeException {
		
		con = getConnection();
		
		//수저아는 페이지에 해당 공지사항의 내용 
		// 보여주기 위한 화면이라, 상세 조회하던 SQL을 
		// 그대로 재사용 가능하다.
		
		Notice n = nDAO.selectOne(con, nno);
		
		close(con);

		return n;
	}

	public int updateNotice(Notice n) throws NoticeException {
		
		con = getConnection();
		
		int result = nDAO.updateNotice(con, n);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int deleteNotice(int nno) throws NoticeException {
		
		con = getConnection();
		
		int result = nDAO.deleteNotice(con, nno);
		
		if( result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Notice> searchNotice(String condition, String keyword) throws NoticeException {
		
		con = getConnection();
		
		ArrayList<Notice> list = null;
		
		// 만약 검색 옵션에 제목, 작성자 등 그 어떤 것이라도 
		// 조건을 달았다면 조건부 검색을 실시
		if ( condition.length() > 0 ) {
			
			   list = nDAO.searchList(con, condition, keyword); 
			   
			   
		} else {
			// 검색 옵션을 선택하지 않았다면 전체 검색
			list = nDAO.searchAll(con, keyword);
		}

		close(con);
		
		return list;
	}
}
