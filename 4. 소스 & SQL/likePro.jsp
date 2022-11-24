<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="movie.peopleDAO"%>
<%@ page import="movie.peopleBean"%>
<%@ page import="movie.movieLikeDAO"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>찜하기</title>
</head>
<body>
		
<!-- 찜하기 구현 -->
<%
	request.setCharacterEncoding("UTF-8");
	//등록할 정보 값 받아오기
	String mno = request.getParameter("mno");
	//String mno = (String) session.getAttribute("mno");
	String id = (String) session.getAttribute("id");

	
	movieLikeDAO modao = new movieLikeDAO();
	modao.insertmovieLike(id,mno);
	
	System.out.println("로그인 여부 :" + id);
	System.out.println("영화번호 :" + mno);
%>
<script>
	alert("찜하셨습니다.");
</script>
<%
//메인 이동
	response.sendRedirect("main.jsp");
%>
</body>
</html>