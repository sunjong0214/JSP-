<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>글쓰기</title>

<style type="text/css">
@import url("css/bootstrap.css");

a, a:hover {
		color:inherit;
		text-decoration:none;}

</style>
	<script src="jquery-1.12.0.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
<% 
String id = (String)session.getAttribute("id"); 
%>
	<h2 align="center">글쓰기</h2>
<form action="boardwritePro.jsp" method="post">
	<table class="table table-striped" align="center" style="width:60%" >
		<tr height="40" align="center">
			<td width="300">작성자</td>
			<td width="600"><input type="hidden" class="form-control" name="writer" size="77" placeholder="<%=id %>" value="<%=id %>" readonly/><%=id %></td>
		</tr>
		<tr height="40" align="center">
			<td width="200">주제</td>
			<td width="400"><input type="text" class="form-control" name="subject" size="77" placeholder="자유주제를 입력"/></td>
		</tr>
		<tr height="40" align="center">
			<td width="200">비밀번호</td>
			<td width="400"><input type="password" class="form-control" name="password" size="77" 
				placeholder="비밀번호는 영문자, 숫자, 특수문자 8자리 이상 15자리 이하로 입력"/></td>
		</tr>
		<tr height="40" align="center">
			<td width="200">글 내용</td>
			<td width="400" colspan="3">
				<textarea rows="10" cols="77" name="content" class="form-control"></textarea></td>
		</tr>		
		<tr height="40" align="center">
			<td colspan="2"> 				
				<input type="submit" value="글쓰기" class="btn btn-light"/>&nbsp;&nbsp;
				<input type="reset" value="취소" class="btn btn-light"/>&nbsp;&nbsp;
				<input type="button" value="글목록보기" onclick="location.href='main.jsp?center=boardList.jsp'" class="btn btn-light"/>&nbsp;&nbsp;
		</tr>
	</table>
</form>	
</body>
</html>