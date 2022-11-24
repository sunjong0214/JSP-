<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>     
<%@ page import="movie.rewordDAO"%>
<%@ page import="movie.rewordBean"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<script type="text/javascript">

$(document).ready(function(){
	$('.box2').show();

     //닫기 버튼을 눌렀을 때
    $('.box2 .close').click(function (e) {  
        //링크 기본동작은 작동하지 않도록 한다.
        e.preventDefault();  
        $('.box2').hide();  
    });      
 
});

</script>
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
		top:9%;
		display:none;
		background:rgba(0,0,0,0.8);
		color: white;
		text-align:center;
		width:1500px;
		height: 85%;
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
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rBean" class="movie.rewordBean">
		<jsp:setProperty name="rBean" property="*"/></jsp:useBean>

<% 	
	String id = (String) session.getAttribute("id");	
	String mno = request.getParameter("mno");
	
	//댓글정보
	rewordDAO rdao = new rewordDAO();	
	rewordBean rBean2 = rdao.getGrade_avg(mno);
	
	Vector<rewordBean> rVector = rdao.rewordSelectEach(mno);
	rewordBean rBean4 = rdao.findnumnum(mno, id);
	
	int numnum = rBean4.getNumnum();
	
	
	//영화정보
	movieDAO mdao = new movieDAO();
	movieBean mBean1 = mdao.oneselectMovie(mno);
	
	//모든영화정보
	Vector<movieBean> vec = mdao.allselectMovie(); 
%>
<script>
function like(){
    if(confirm("찜하시겠습니까?")){
        location.href = "likePro.jsp?mno=<%=mno%>&id=<%=id%>";
        return true;
    } else {
        return false;
    }
}
</script>
<%   
	for(int i=0; i < vec.size(); i++){
		movieBean mBean = vec.get(i);
   
%>

<!-- movieDAO 랑 rewordDAO 추가가 필요하며, movie테이블의 url칼럼도 필요함. -->
<a href="main.jsp?center=movieDetail.jsp?mno=<%=mBean.getMno()%>" id="movieDetail_a"><img class="poster"src="<%=mBean.getPoster() %>" width="300px" height="400px"></a>
 <div class="box1" style="display: inline-block;" >
</div>
<%} %>
	<div class="box2">
		
			<button class="close">X&nbsp;&nbsp;</button>
			<br><h2 align="center">영화정보 상세 보기</h2>
		
		      
		   <table class="table table-striped" border="1" style="text-align: center;color:white;">
		<tr align="center">
		<td rowspan="5" colspan="2" width="310px" height="410px"><img src= "<%=mBean1.getPoster() %>" width="300px" height="400px"></td>
		<td>영화제목</td>
		<td ><%=mBean1.getTitle() %></td>
		<td>장르</td>
		 <td ><%=mBean1.getGenre() %></td>
		</tr>
		<tr align="center">
		<td>상영시간</td>
		<td ><%=mBean1.getRuntime() %></td>
		<td>개봉일</td>
		<td ><%=mBean1.getOpendate() %></td>
		</tr>      
		<tr>
		   <td>감독 및 출연진</td>
		   <td colspan="3"  style="padding-right: 230px;"><%=mBean1.getDirector() %>,<%=mBean1.getActor() %></td>
		</tr>   
		<tr>
		   <td rowspan="1">줄거리</td>   
		   <td colspan="3"><%=mBean1.getStory() %></td>
		</tr>
		<tr>
                             <td colspan="3"><a href="#" onclick="like()">찜하기</a></td>
                           </tr>
		</table>
	<jsp:include page="rewordinsert.jsp"/>


		<table  class="table table-striped" border="1" style="text-align: center;color:white; width: 100%;">
		<tr>
		   <td colspan="2">아임무비 평점</td>
		   <td colspan="3" align="center"><h3><%=rBean2.getGrade_avg() %></h3></td>
		</tr>   
		<tr align="center" style="height: 40;">
		<td>작성자</td>
		   <td>평점</td>
		   <td colspan="5">한줄평</td>
		</tr>

		<%
		for(int i=0; i < rVector.size(); i++){
		   
		   rewordBean rBean3 = rVector.get(i);      
		%>
		<tr height="40" align="center">
		  	<td>
		      <%=rBean3.getId()%>
			</td>
			<td>
		      <%=rBean3.getGrade() %>
			</td>
			<td colspan="4">
			   		<%=rBean3.getWriting() %>&nbsp;&nbsp;&nbsp;&nbsp;
				   <%
				   		if (id.equals(rBean3.getId())){
				   	%>		
				   			<button onclick="location.href='main.jsp?center=rewordUpdate.jsp?id=<%=id %>&mno=<%=mno %>&numnum=<%=rBean4.getNumnum() %>'" class="btn btn-light" style="align:right">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button onclick="location.href='main.jsp?center=rewordDelete.jsp?id=<%=id %>&mno=<%=mno %>&title=<%=mBean1.getTitle() %>&numnum=<%=rBean4.getNumnum() %>'" class="btn btn-light" style="align:right">삭제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<%  
							%>
				   <% 	} else if(id.equals("admin")){
					%>  	<button onclick="location.href='main.jsp?center=rewordUpdate.jsp?id=<%=id %>&mno=<%=mno %>&numnum=<%=rBean4.getNumnum() %>'" class="btn btn-light" style="align:right">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
							<button onclick="location.href='main.jsp?center=rewordDelete.jsp?id=<%=id %>&mno=<%=mno %>&title=<%=mBean1.getTitle() %>&numnum=<%=rBean4.getNumnum() %>'" class="btn btn-light" style="align:right">삭제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<%}
				   }%></td>	
				</tr>
				</table>														
</div>

</body>
</html>