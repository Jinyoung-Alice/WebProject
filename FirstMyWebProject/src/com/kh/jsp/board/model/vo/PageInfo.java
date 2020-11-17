package com.kh.jsp.board.model.vo;

import java.io.Serializable;

public class PageInfo implements Serializable {
	// 페이지 처리 vo
	
	private static final long serialVersionUID = 1L;
		
	private int currentPage;
	private int listCount;
	private int limit;
    private int maxPage;
    private int startPage;
    private int endPdage;
    
	public PageInfo() {
		super();
}

	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPdage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPdage = endPdage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPdage() {
		return endPdage;
	}

	public void setEndPdage(int endPdage) {
		this.endPdage = endPdage;
	}
	
	
}
