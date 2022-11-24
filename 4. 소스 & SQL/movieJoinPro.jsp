<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="movie.movieDAO" %>  
<%@ page import="movie.movieBean" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리 구현</title>
</head>
<body>
<!-- 예외처리로 아이디중복 처리 경고창 만들기 -->
<%
	request.setCharacterEncoding("UTF-8");

	String genre[] = request.getParameterValues("genre");
	String textgenre  = "";
	
	for(int i=0; i < genre.length; i++){
		textgenre += genre[i] + ", ";
	}
	
%>
	<jsp:useBean id="mBean" class="movie.movieBean">
		<jsp:setProperty name="mBean" property="*"/></jsp:useBean>

<%	
	try{
	mBean.setGenre(textgenre);

	//데이터베이스 클래스에 대한 객체 생성
	movieDAO mdao = new movieDAO();	
	mdao.insertmovie(mBean);
	//메인화면으로 이동
	response.getWriter().print("<script>alert('영화추가 성공'); location.href = 'main.jsp';</script>");
	}catch (Exception e) {
	response.getWriter().print("<script>alert('영화추가 실패 mno를 확인하세요'); location.href = 'main.jsp';</script>");
	}
%>	

	
</body>
</html>