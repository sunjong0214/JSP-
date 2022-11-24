<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>
<%@ page import="java.util.Vector"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>

<style type="text/css">
@import url("css/bootstrap.css");
a, a:hover {
		color:inherit;
		text-decoration:none;}
.table {
	border-collapse : collapse;
	border-spacing : 0;
}

</style>
	<script src="jquery-1.12.0.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
<% String id = (String)session.getAttribute("id"); %>


<%
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");

	if(pageNum == null){
		pageNum = "1";
	}

	int count = 0;//전체글의 갯수 저장
	int number = 0;//페이지 넘버링 변수

	int currentPage = Integer.parseInt(pageNum);//현재 페이지 저장
	
	boardDAO bdao = new boardDAO();	
	count = bdao.getAllcount();//전체 게시글의 숫자를 파악하여 저장
	
	//현재 페이지에 보여줄 시작번호 설정과 끝 페이지를 설정합니다.
	//데이터베이스에서 불러올 시작번호 : 1
	int startRow = (currentPage - 1) * pageSize + 1;// (1-1)*10+1 = 0*10 = 0 + 1 = 1
	int endRow = currentPage * pageSize;// 1*10 = 10
	
	Vector<boardBean> vec = bdao.allselectBoard(startRow, endRow);
	
	number = count - (currentPage - 1) * pageSize;//테이블에 표시할 번호 설정, 139 - (1 - 1) * 10 = 139
%>
	<h2 align="center" style="width:150vh">문의사항 게시판</h2>
<div align="center">
	<table class="table table-striped" style="text-align: center; width: 70%;">
	<tr align="center">
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일자</td>
		<td>조회수</td>
	</tr>

	<%
		for(int i=0; i < vec.size(); i++){
			
			boardBean bBean = vec.get(i);		
	%>
	<tr align="center">
		<td><%=number--%></td>
		<td>
			<a href="main.jsp?center=boardDetail.jsp?b_no=<%=bBean.getb_no()%>" style="text-decoration:none">
			<%
			//들여쓰기
			if(bBean.getRe_step() > 1){
				for(int k=0; k < (bBean.getRe_step() - 1) * 3; k++){
					%>&nbsp;
			<%
				}
			}
			%>
			<%=bBean.getSubject() %></a></td>
		<td><%=bBean.getWriter() %></td>
		<td><%=bBean.getReg_date() %></td>
		<td><%=bBean.getReadCount() %></td>
	</tr>
	<%} %>	
</table>
	<!-- <table align="center">
		<tr>
			<td>
				
				<!-- <input type="button" value="글쓰기" onclick="location.href='boardwrite.jsp'"/>&nbsp;&nbsp;	 -->			
				<!-- <input type="button" value="회원목록보기" onclick="location.href='peopleList.jsp'"/>&nbsp;&nbsp;		 -->		
				
			<!-- </td>	
		</tr>
	</table> -->   
	<!-- 글쓰기 버튼 -->

<c:if test="${id eq null}">
	<button onclick="location.href='main.jsp?center=boardwrite.jsp'" class="btn btn-light" style ="float:right;margin-right:15%;" >글쓰기</button>
</c:if>
	<button onclick="location.href='main.jsp'" class="btn btn-light float-right" style ="float:right">main</button>
	<p align="center">
	<!-- 페이지 카운터링 작성 부분 -->
	
	<%
		if(count > 0){
			//               139   /    10    + (139 % 10 )
			int pagecount = count  / pageSize + (count % pageSize == 0 ? 0 : 1);// 139 / 10 + 1 = 13 + 1 = 14
			
			int startPage = 1;
			
			if(currentPage % 10 != 0){
				startPage = (currentPage / 10) * 10 + 1; // (1 / 10) * 10 + 1 = 0 * 10 = 0 + 1 = 1
			}else{
				startPage = (currentPage / 10) * 10 - 1; //
			}
			
			int pageBlock = 10;//[1]......[10]
			
			int endPage = startPage + pageBlock - 1;// 1 + 10 - 1 = 11 - 1 = 10 
					
			//[이전]링크를 만드는 부분
			if(endPage > pagecount){ // 10 > 139
				endPage = pagecount;
			}
			
			if(startPage > 10){
	%>	
		<a href="main.jsp?center=boardList.jsp?pageNum=<%=startPage - 10 %>">[previous]</a>
	<%
		}
			for(int i = startPage; i <= endPage; i++){
	%>
	<div class="container" style="margin-left:15%;">
		<div class="row">
		<div class="col">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="main.jsp?center=boardList.jsp?pageNum=<%=i %>"><%=i %>페이지</a></li>
		</ul>
		</div>
		</div>
	</div>
	<%} 
//[다음]링크를 만드는 부분
if(endPage < pagecount) {
%>		
		<a href="main.jsp?center=boardList.jsp?pageNum=<%=startPage + 10 %>">[next]</a>
	<%
		}
	}
	%>
	 </div>	
</body>
</html>