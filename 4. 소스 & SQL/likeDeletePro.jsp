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
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("id");	
	String mno = request.getParameter("mno");

	movieLikeDAO modao = new movieLikeDAO();
	modao.deletemovieLike(mno,id);
	
	System.out.println("로그인 여부 :" + id);
	System.out.println("영화번호 :" + mno);
%>
<script>
	alert("찜목록에서 삭제했습니다.");
</script>
<%
//메인 이동
	response.sendRedirect("main.jsp");
%>

</body>
</html>