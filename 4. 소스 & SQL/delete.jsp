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


a, a:hover {
		color:inherit;
		text-decoration:none;}
</style>
<script src="jquery-1.12.0.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
<h2 align="center">회원정보 삭제 화면</h2>
	<div align="center"> 
	<form action="deletePro.jsp" method="post">
	<table align="center" class="table table-bordered" border="1" style="width:60%;">
		<tr align="center" style="height: 40;">
			<td>아이디</td>
			<td><%=request.getParameter("id") %></td> 
		</tr>				
		<tr align="center" style="height: 40;">
			<td>비밀번호</td>
			<td>
				<input type="password" name="pw">
			</td>
		</tr>		
		<tr  align="center" style="height: 40;">
			<td colspan="2"> 
				<input type="hidden" name="id" value="<%=request.getParameter("id") %>">
				<input type="submit" value="회원정보삭제">&nbsp;&nbsp;		
				<input type="button" value="회원목록보기" onclick="location.href='main.jsp?center=peopleList.jsp?'"/>&nbsp;&nbsp;
			</td>	
		</tr>		
	</table>	
	</form>
</div>
</body>
</html>