<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>  
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 저장</title>
</head>
<body>
	<jsp:useBean id="bBean" class="movie.boardBean">
		<jsp:setProperty name="bBean" property="*"/>
	</jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");

	boardDAO bdao = new boardDAO();
	bdao.insertBoard(bBean);
	
	response.sendRedirect("main.jsp?center=boardList.jsp");
	
%>
</body>
</html>