 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url("css/bootstrap.css");

a, a:hover {
		color:inherit;
		text-decoration:none;}
.block {
  display: block;
  width: 100%;
  border: none;
  background-color: #04AA6D;
  padding: 14px 28px;
  font-size: 16px;
  cursor: pointer;
  text-align: center;
}
</style>
<meta charset="UTF-8">

<title>리뷰 삭제</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String mno = request.getParameter("mno");
	
	rewordDAO rdao = new rewordDAO();	
	rewordBean rBean = rdao.findnumnum(mno, id);
	
	int numnum = rBean.getNumnum();
%>

	<div align="center">
		<form action="rewordDeletePro.jsp" method="post" Id="auto">
			<input type="hidden" name="numnum" value="<%=numnum %>">
			<input type="hidden" name="mno" value="<%=mno %>">
			<input type="hidden" name="title" value="<%=title %>">
			<input type="hidden" name="id" value="<%=id %>">
			<button type="submit" class="block">삭제</button>
		</form>
		</div>
</body>
</html>