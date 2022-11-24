<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %> 

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원정보 삭제 화면 구현</title>
<style>
@import url("css/bootstrap.css");
table{
	margin-top:5%;
}

a, a:hover {
		color:inherit;
		text-decoration:none;}
</style>
<script src="jquery-1.12.0.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
<h2 align="center" align="center" >회원정보 삭제 화면</h2>
	<div align="center"> 
	<form action="deleteProMypage.jsp" method="post">
	<table align="center" class="table table-bordered" border="1" style="width:30%;">
		<tr align="center" style="height: 40;">
			<td width="100">아이디</td>
			<td><%=request.getParameter("id") %></td> 
		</tr>				
		<tr align="center" style="height: 40;">
			<td width="120">비밀번호</td>
			<td>
				<input type="password" name="pw">
			</td>
		</tr>		
		<tr style="height: 60;">
			<td colspan="2" align="center"> 
				<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
				<input type="submit" value="회원정보삭제">&nbsp;&nbsp;		
				<input type="button" value="메인페이지" onclick="location.href='main.jsp?center=body.jsp?'"/>
			</td>	
		</tr>		
	</table>	
	</form>
</div>
</body>
</html>