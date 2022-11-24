<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("css/bootstrap.css");
a, a:hover {
		color:inherit;
		text-decoration:none;}

</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="jquery-1.12.0.min.js"></script>
	<script src="js/bootstrap.js"></script>
<meta charset="UTF-8">
<title>작성 글 삭제</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	int b_no = Integer.parseInt(request.getParameter("b_no"));
	
	boardDAO bdao = new boardDAO();
	boardBean bBean = bdao.oneselectboard(b_no);
%>

	<h2 align="center" style="width:150vh">게시글 삭제</h2>
	<div align="center">
		<form action="boardDeletePro.jsp" method="post">
			<table  class="table table-striped" style="width:50%; text-align: center;">
				<tr style="height: 50px;">
					<td width="100">번호</td>
					<td><b><%=bBean.getb_no()%></b></td>
					<td width="100">작성자</td>
					<td><b><%=bBean.getWriter() %></b></td>
				</tr>
				<tr style="height: 50px;">
					<td width="120">비밀번호</td>
					<td colspan="4"><input type="password" name="password" size="50"></td>
				</tr>
				<tr style="height: 50px;">
					<td colspan="4">
						<input type="hidden" name="b_no" value="<%=bBean.getb_no() %>">
						<input type="submit" class="btn btn-light" value="삭제완료">&nbsp;&nbsp;
						<input type="reset"  class="btn btn-light" value="삭제취소">&nbsp;&nbsp;
						<input type="button" class="btn btn-light" onclick="location.href='main.jsp?center=boardList.jsp'"value="글목록보기">&nbsp;&nbsp; 
					</td>
				</tr>
			</table>
		</form>
		</div>
</body>
</html>