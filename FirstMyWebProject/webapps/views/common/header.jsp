<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.*"%>
<%
	Member m =(Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/myWeb/resources/js/jquery-3.5.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<style>

    h1 {font-family: 'Staatliches', cursive;
          font-size: 70px;
          } 

	body {
		background: url("/myWeb/resources/images/colorful.jpg") repeat;
		background-size: 100%;
	}
	.wrap {
		background: black;
		width: 100%;
		height: 50px;
	}
	.menu {
		background:black;
		color:white;
		text-align:center;
		vertical-align:middle;
		width:150px;
		height:50px;
		display:table-cell;
		font-family: 'Do Hyeon', sans-serif;
		font-size: 20px;
	}
	.nav {
		width: 600px;
		margin-left: auto;
		margin-right: auto;
	}
	.menu:hover {
		background: lightgoldenrodyellow;
		color: orangered;
		font-weight: bold;
		cursor: pointer;
	}
	
	.btns {
		align: center;
	}
	
	#loginBtn, #memberJoinBtn, #logoutBtn, #changeInfo {
		display: inline-block;
		vertical-align: middle;
		text-align: center;
		background: darkred;
		color: white;
		height: 25px;
		width: 100px;
		border-radius: 5px;
	}
	
	#memberJoinBtn {
		background:navy;
	}
	
	#loginBtn:hover, #changeInfo:hover, #logoutBtn:hover, #memberJoinBtn:hover{
		cursor:pointer;
		font-family: NanumDothic-Bold;
	}
	.loginArea > form, #userInfo {
		float:right;
		font-family: NanumDothic-Bold;
	}
	#logout, #changeInfo {
		background:darkred;
		color:white;
		text-decoration:none;
		border-radius:5px;
	}
	#changeInfo {
		background:navy;
	}
	
	#logo {
	    width: 70px;
	    height: 70px;
	    float: left;
	    border-radius: 3px;
	    border: 3px dashed pink;	        
	}
	
	#wel {
	      font-family: 'Balsamiq Sans', cursive;
	      font-size: 30px;
	      text-align: right;
	      margin-right: 35px;
	      margin-top: 0px;
	      text-shadow: 2px 2px lightpink;	      	      
	}
	
	
</style>

</head>
<body>

    <img src="/myWeb/resources/images/alice.gif" id= "logo">
	                 
	<h1 align="center">Welcome JSP World</h1>
	
	<div class="loginArea">
	<%if ( m == null ) { %>
		<form id="loginForm" action="/myWeb/login.me" method="post">
			<table>
				<tr>
					<td>
						<label class="text">ID : </label>
					</td>
					<td>
						<input type="text" name="userId">
					</td>
				</tr>
					<tr>
					<td>
						<label class="text">PWD : </label>
					</td>
					<td>
						<input type="password" name="userPwd">
					</td>
				</tr>
			</table>
			<div class="btns" align="center">
				<div id="memberJoinBtn" onclick="memberJoin()">회원가입</div>
				<div id="loginBtn" onclick='login()'>로그인</div> 
			</div>
			
		</form>
		<% } else { %>
		<div id="userInfo">
		    <p id=wel>WELCOME</p>
			<label id="la"><%= m.getUserName() %>님의 방문을 환영합니다.</label>
			<div class="btns" align="right">
				<div id="changeInfo" onclick="changeInfo()">정보수정</div>
				<div id="logoutBtn" onclick='logout()'>로그아웃</div> 
			</div>
			
		</div>
	<% } %>
	</div>
	<script>
		function login(){
			$('#loginForm').submit();
		}
		
		function logout(){
			location.href="/myWeb/logout.me";
		}
		
		function memberJoin(){
			location.href="/myWeb/views/member/memberJoinForm.jsp";
		}
		
		function changeInfo(){
			location.href="/myWeb/views/member/memberUpdateForm.jsp";
		}
	</script>
	
	<br clear="both">
	<br>
	
	<div class="wrap">
		<div class="nav">
			<div class="menu" onclick="goHome()">HOME</div>
			<div class="menu" onclick="goNotice()">공지사항</div>
			<div class="menu" onclick="goBoard()">게시판</div>
			<div class="menu" onclick="goThumbnail()">사진 게시판</div>
		</div>
	</div>
	<script>
		function goHome(){
			location.href="/myWeb/index.jsp";
		}
		function goNotice(){
			location.href="/myWeb/selectList.no";
		}
		function goBoard(){
			location.href="/myWeb/selectList.bo";
		}
		function goThumbnail(){
			location.href="/myWeb/selectList.tn";
		}
	</script>
</body>
</html>