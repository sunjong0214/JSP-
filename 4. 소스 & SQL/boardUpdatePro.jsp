<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>   
<%	request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글 쓰기(저장)</title>
</head>
<body>
<jsp:useBean id="bBean" class="movie.boardBean">
		<jsp:setProperty name="bBean" property="*"/></jsp:useBean>
	
<%
	request.setCharacterEncoding("UTF-8");
	boardDAO bdao = new boardDAO();
	
	String pass = bdao.getPass(bBean.getb_no());

	if(pass.equals(bBean.getPassword())){
		bdao.updateBoard(bBean);
		
		response.sendRedirect("main.jsp?center=boardList.jsp");
	}else{
%>	
	<script type="text/javascript">
			alert("비밀번호가 틀립니다. 확인해 주세요.!!!");
			history.back();
		</script>
<% }	%>		
</body>
</html>