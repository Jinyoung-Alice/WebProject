<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.jsp.thumb.model.vo.*" %>
<%
	ArrayList<Thumbnail> list = (ArrayList<Thumbnail>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 게시판 목록</title>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

<style>

	.outer{
		width : 1000px;
		height : auto;
		background : black;
		color : white;
		margin-left : auto;
		margin-right : auto;
		margin-top : 50px;
	}
	.thumbnailArea {
		width:760px;
		height:auto;
		margin-left:auto;
		margin-right:auto;
	}
	.thumb-list {
		width:220px;
		border:1px solid white;
		display:inline-block;
		margin:10px;
		align:center;
	}
	.thumb-list:hover {
		opacity:0.8;
		cursor:pointer;
	}
	
	h2 {font-family: 'Gothic A1', sans-serif;}
	
	p {font-family: 'Do Hyeon', sans-serif;}

</style>

</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div class="outer">
		<br>
		<h2 align="center">사진 게시판</h2>
		<div class="thumbnailArea">
			<% for(Thumbnail thumb : list) { %>
				<div class="thumb-list" align="center">
					<div>
						<input type="hidden" name="bno" value="<%= thumb.getBno() %>" />
						<img src="<%=request.getContextPath() %>/resources/thumbnailUploadFiles/<%= thumb.getBoardfile() %>"
						     width="200px" height="150px"/>					
					</div>
					
					<p>
						No. <%= thumb.getBno() + " " + thumb.getBtitle() %>
						<br>
						조회수 : <%= thumb.getBcount() %>
					</p>
				</div>			
			<% } %>
			<br><br>
			<% if(m != null) { %>
			       <button onclick= "location.href= 'views/thumbnail/thumbnailInsertForm.jsp'">작성하기</button>
			<% } %>
		</div>
	</div>
	<script>
	      $(function() {
	    	  $('.thumb-list').click(function() {
	    		   // var bno = $(this).children().children().eq(0).val();
	    		   var bno = $(this).find('input').val();
	    		   //console.log(bno);
	    		   
	    		   location.href = '<%= request.getContextPath()%>/selectOne.tn?bno=' + bno;
	    	  });
	      });
	</script>
	
	

	<%@ include file="../common/footer.jsp" %>

</body>
</html>








