<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="java.util.Vector"%>  
<%	request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="jquery-1.12.0.min.js"></script>
<script src="js/bootstrap.js"></script>	
<head>

<meta charset="UTF-8">
<title>게시판 댓글 쓰기(저장)</title>
</head>
<style type="text/css">

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
    String genre = request.getParameter("genre");
   

	movieDAO mdao = new movieDAO();

	Vector<movieBean> vec3 = mdao.GenreselectMovie(genre);

	for(int i=0; i < vec3.size(); i++){
		
		movieBean gBean = vec3.get(i);
%> 

        <div style="width:310px;display:inline-block;margin:1%;">
        <a href="main.jsp?center=movieDetail.jsp?mno=<%=gBean.getMno()%>"><img class="poster"src="<%=gBean.getPoster() %>" width="300px" height="400px"></a>
	</div>
        <%} %>




</body>
</html>
