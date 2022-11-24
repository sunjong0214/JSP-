<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="java.util.Vector"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			  $(".box2").hide();
		$(".box1").hover(function() {
			  $(".box2").toggle();
			});
	});
</script>
<meta charset="UTF-8">
<title>body</title>
<style type="text/css">

	.poster{
		/* position:relative; */
		border-radius: 7px;
		width:300px;
		height: 400px;
	}
	.box1{
		border-radius: 7px;
		display:inline-block;
		width:300px;
		height: 400px;
	}
	.box2{
		position: absolute;
		display:inline-block;
		background:rgba(0,0,0,0.5);
		color: white;
		width:300px;
		height: 400px;
		border-radius: 7px;
	}
</style>
</head>
<body>
<div style="width:150vh">

<%
      request.setCharacterEncoding("UTF-8");   
      String title = request.getParameter("title");

	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec2 = mdao.searchselectMovie(title);
	
	for(int i=0; i < vec2.size(); i++){
		
		movieBean bean = vec2.get(i);
		
%>
	    			
        <div style="width:310px;display:inline-block;">
        <a href="main.jsp?center=movieDetail.jsp?mno=<%=bean.getMno()%>"><img class="poster"src="<%=bean.getPoster() %>" width="300px" height="400px"></a>
	</div>
	
<% 	
}%>
</div>
</body>
</html>