<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="movie.peopleDAO"%>
<%@ page import="movie.peopleBean"%>
<%@ page import="movie.movieLikeDAO"%>
<%-- <%@ page import="movie.movieLikeBean"%> --%>
<%@ page import="java.util.Vector" %>  


<!DOCTYPE html>
<html>
<head>
<style>
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

<meta charset="UTF-8">
<title>찜목록</title>
</head>
<body>
		<%
		
		request.setCharacterEncoding("UTF-8");
		movieLikeDAO moDAO = new movieLikeDAO();
		String id = (String) session.getAttribute("id");
		
		Vector<movieBean> vec = moDAO.allselectlike(id);

	%>

		<h2><span style="color:yellow;"><Strong><%=id %></Strong></span>님이 찜하신 목록입니다.</h2>


					
						<%

							for(int i=0; i<vec.size(); i++){	
								movieBean mBean = vec.get(i);
								
						%>
        <div style="width:310px;display:inline-block;margin:1%;">
        <a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean.getMno()%>"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a>
        <a href="likeDeletePro.jsp?mno=<%=mBean.getMno()%>&id=<%=id%>">찜 삭제</a>
	</div>
						<%}%>
							

						
							


</body>
</html>