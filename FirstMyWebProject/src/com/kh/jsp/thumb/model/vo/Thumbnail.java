package com.kh.jsp.thumb.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.jsp.board.model.vo.Board;

public class Thumbnail extends Board implements Serializable{

	private static final long serialVersionUID = 827L; // 파이팅!
	
	private ArrayList<Attachment> attachments;

	public Thumbnail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Thumbnail(int bno, int btype, String btitle, String bcontent, String bwriter, String userId, int bcount,
			String boardfile, Date bdate, String status) {
		super(bno, btype, btitle, bcontent, bwriter, userId, bcount, boardfile, bdate, status);
		// TODO Auto-generated constructor stub
	}

	public Thumbnail(String btitle, String bcontent, String bwriter, String boardfile) {
		super(btitle, bcontent, bwriter, boardfile);
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Thumbnail [attachments=" + attachments + ", toString()=" + super.toString() + ", getBno()=" + getBno()
				+ ", getBtype()=" + getBtype() + ", getBtitle()=" + getBtitle() + ", getBcontent()=" + getBcontent()
				+ ", getBwriter()=" + getBwriter() + ", getUserId()=" + getUserId() + ", getBcount()=" + getBcount()
				+ ", getBoardfile()=" + getBoardfile() + ", getBdate()=" + getBdate() + ", getStatus()=" + getStatus()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}

	public ArrayList<Attachment> getAttachments() {
		return attachments;
	}

	public void setAttachments(ArrayList<Attachment> attachments) {
		this.attachments = attachments;
	}
	
}

