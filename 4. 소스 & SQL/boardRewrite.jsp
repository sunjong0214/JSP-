<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>댓글 쓰기</title>

<style type="text/css">
@import url("css/bootstrap.css");
a, a:hover {
		color:inherit;
		text-decoration:none;}
.table {
	border-collapse : collapse;
	border-spacing : 0;
}

</style>
	<script src="jquery-1.12.0.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
	<h2 align="center">댓글 쓰기</h2>
<%
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	String id = (String)session.getAttribute("id");
%>
<div align="center">
	<form action="boardRewritePro.jsp" method="post"> 
		<table style=" text-align: center;" class="table table-striped">
			<tr style="height: 50px;">
				<td style="width: 25%">작성자</td>
				<td><input type="hidden" class="form-control" name="writer" size="77" placeholder="<%=id %>" value="<%=id %>" readonly/>관리자</td>					
			</tr>	
			<tr>
				<td >제목</td>
				<td><input type="text" name="subject" size="90" value=[관리자답변]:></td>		
			</tr>
			<tr style="height: 50px">
				<td>비밀번호</td>
				<td><input type="password" name="password" size="90"></td>			
			</tr>
			<tr style="height: 280px">
				<td>내용</td>
				<td colspan="3" style="height: 270px">
					<textarea rows="10" cols="90" name="content"></textarea></td>						
			</tr>
			<tr style="height: 50px;">
				<td colspan="4">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">
					<input type="submit" value="댓글쓰기" class="btn btn-light">&nbsp;&nbsp;
					<input type="reset" value="댓글취소" class="btn btn-light">&nbsp;&nbsp;
					<input type="button" onclick="location.href='main.jsp?center=boardList.jsp'" value="글목록보기" class="btn btn-light">&nbsp;&nbsp;
				</td>
			</tr>			
		</table>	
	</form>
</div>

</body>
</html>