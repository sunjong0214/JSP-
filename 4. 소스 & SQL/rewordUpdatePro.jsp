<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글 쓰기(저장)</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String mno = request.getParameter("mno");
	String writing = request.getParameter("writing");
	double grade = Integer.parseInt(request.getParameter("grade"));
	int numnum = Integer.parseInt(request.getParameter("numnum"));
%>	
	
	<jsp:useBean id="rBean" class="movie.rewordBean">
		<jsp:setProperty name="rBean" property="*"/></jsp:useBean>
	
<% 

	rewordDAO rdao = new rewordDAO();
	rdao.rewordUpdate(rBean);
	
	response.sendRedirect("main.jsp?center=movieDetail.jsp?mno="+request.getParameter("mno"));
%>		
</body>
</html>