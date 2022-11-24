<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="java.util.Vector"%>  
<%	request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글 쓰기(저장)</title>
</head>
<style type="text/css">

	.poster{
		margin-top:10%;
		margin-left:20%
		/* position:relative; */
	}
	.box2{
		position: absolute;
		display:inline-block;
		maring-right:200px;
		background:rgba(0,0,0,0.5);
		color: white;
		width:300px;
		height: 400px;
		border-radius: 7px;
	/* 	padding-left:10%;
		padding-top:19%; */
	}
	.box1{
		border-radius: 7px;
		width:300px;
		height: 400px;
	}
	
	.select{
	 position: absolute;
		display:inline-block;
	
	
	
	
	}

	
	
	
</style>
<body>
<jsp:useBean id="mBean" class="movie.movieBean">
		<jsp:setProperty name="mBean" property="*"/></jsp:useBean>

<%

   request.setCharacterEncoding("UTF-8");
   String genre = request.getParameter("genre");



	
		
		
%>
	     <script>
   location.href='main.jsp?center=randomShow.jsp?genre=<%=genre%>'   				
	   </script>

</body>
</html>
