<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<%@ page import="java.util.Vector"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글 쓰기(저장)</title>
</head>
<style type="text/css">

table {
   color:white;
   
}
</style>
   <style>

	.poster{
		/* position:relative; */
		border-radius: 7px;
		width:300px;
		height: 400px;
	}
	.poster_div{
		min-width: 1300px;
		width:1500px;
}
	.box1{
		border-radius: 7px;
	}
	.box2{
		position: fixed;
		left:15%;
		top:7%;
		display:none;
		background:rgba(0,0,0,0.7);
		color: white;
		text-align:center;
		width:1500px;
		height: 80%;
		border-radius: 7px;
		z-index: 3;
		overflow:scroll;
 		overflow-x: hidden;
		 -ms-overflow-style: none; 
  		
	}
	.box2::-webkit-scrollbar{
	  display:none;
	} 
    .window{
      display: none;
      position:absolute;  
      left:15%;
      top:10%;
      z-index:10000;
    }
    #movieDetail_a{
    	display: inline-block;
    	width:300px;
    	height: 400px;
    }
    .close{
    	color:white;
    	align-content: right;
    	font-size: 50px;
    	height:50px;
    	width:100px;
    }
</style>
<body>


<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
    String genre = request.getParameter("genre");

	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec = mdao.RandomselectMovie(genre);

	for(int i=0; i < vec.size(); i++){
		movieBean mBean3 = vec.get(i);
%>

      <div style="width:910px;display:inline-block;margin-left:20%;">
        <a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean3.getMno()%>"><img class="poster"src="<%=mBean3.getPoster() %>" style="width:500px; height:700px;"></a>
	<h1><span style="color:yellow;"><%=mBean3.getGenre()%></span>&nbsp; 추천영화 영화 <span style="color:yellow;"><%=mBean3.getTitle()%></span>&nbsp;</h1>
	</div>
<%}%>

</body>
</html>
