﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.notice.model.vo.*"%>

<% ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록표</title> 
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.5.1.min.js"></script>
             <!--  /myWeb : 나중에 JSP가 서블릿으로 바뀌면, 얘도 자동으로 바뀜 -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">           
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
          
<style>
	.outer{
		width:800px;
		height: auto;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
		padding : 40px 5px;
	}
	table {
		border:1px solid white;
		text-align:center;
	}
	.tableArea {
		width:650px;
		height: auto;
		margin-left:auto;
		margin-right:auto;
		padding : 20px 0px;
	}
	.searchArea {
		width:650px;
		margin-left:auto;
		margin-right:auto;
	}
	
	h2 {font-family: 'Gothic A1', sans-serif;}
	
    td, th {font-family: 'Do Hyeon', sans-serif;}
	
	th {font-size: 15px;
	      font-family: NanumDothic-Bold;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">공지사항</h2>
		<div class="tableArea">
			<table align="center" id="listArea">
			<tr>
				<th>글번호</th>
				<th width="300px">글제목</th>
				<th width="100px">작성자</th>
				<th>조회수</th>
				<th width="100px">작성일</th>
			</tr>
			<% for(Notice n : list){ %>
			<tr>
				<td><%= n.getNno() %></td>
				<td><%= n.getNtitle() %></td>
				<td><%= n.getNwriter() %></td>
				<td><%= n.getNcount() %></td>
				<td><%= n.getNdate() %></td>
			</tr>
			<% } %>
		</table>
		</div>
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option value="">---</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" id="keyword" placeholder="키워드를 입력하세요!"> 
			<button type="button" onclick="search();">검색하기</button>
			<% if(m != null && m.getUserId().equals("admin")){ %>
				<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
			<% } %>
		</div>
	</div>
	<script>  
		$(function(){
			
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"black"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				var nno = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/selectOne.no?nno=" + nno;
			});
		});
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchNotice.no?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
		
	</script>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>