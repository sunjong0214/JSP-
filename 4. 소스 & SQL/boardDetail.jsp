<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.boardDAO"%>
<%@ page import="movie.boardBean"%>     
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>

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
<%

String id = (String) session.getAttribute("id");

	int b_no = Integer.parseInt(request.getParameter("b_no"));

	boardDAO bdao = new boardDAO();
	boardBean bBean = bdao.oneselectboard(b_no);
%>

<h2 align="center">게시글 상세 보기</h2>
<div align="center">
	<table class="table table-striped" style="text-align: center; width: 70%;">
		<tr align="center" style="height: 40;">
			<td width="100">번호</td>
			<td ><%=bBean.getb_no() %></td>
			<td width="200">조회수</td>
			<td ><%=bBean.getReadCount() %></td>
		</tr>
		<tr align="center" style="height: 40;">
			<td  width="100">작성자</td>
			<td ><%=bBean.getWriter() %></td>
			<td width="100">작성일자</td>
			<td ><%=bBean.getReg_date() %></td>
		</tr>		
		<tr>
			<td  width="100">제목</td>
			<td colspan="3"  style="padding-right: 230px;"><%=bBean.getSubject() %></td>
		<tr>
			<td colspan="4">내용</td>	
		</tr>
		<tr align="center" style="height: 40;">			
			<td colspan="4"><%=bBean.getContent() %></td>
		</tr>
		
		<tr style="height: 40; ">
			<td colspan="4">
			
			 <%
				   		if (id.equals("admin")){
				   	%>		
							<button onclick="location.href='main.jsp?center=boardRewrite.jsp?b_no=<%=bBean.getb_no()%>&ref=<%=bBean.getRef() %>&re_step=<%=bBean.getRe_step()%>&re_level=<%=bBean.getRe_level()%>'" class="btn btn-light">답변</button>&nbsp;&nbsp;
							<button onclick="location.href='main.jsp?center=boardUpdate.jsp?b_no=<%=bBean.getb_no() %>'" class="btn btn-light">수정하기</button>&nbsp;&nbsp;
								<button onclick="location.href='main.jsp?center=boardDelete.jsp?b_no=<%=bBean.getb_no() %>'" class="btn btn-light">삭제하기</button>&nbsp;&nbsp;
				   <% 	} else if(id.equals(bBean.getWriter())){
					%>  		<button onclick="location.href='main.jsp?center=boardUpdate.jsp?b_no=<%=bBean.getb_no() %>'" class="btn btn-light">수정하기</button>&nbsp;&nbsp;
								<button onclick="location.href='main.jsp?center=boardDelete.jsp?b_no=<%=bBean.getb_no() %>'" class="btn btn-light">삭제하기</button>&nbsp;&nbsp;
					<%}%>

				<button onclick="location.href='main.jsp?center=boardList.jsp'" class="btn btn-light">목록조회</button>&nbsp;&nbsp;
				<button onclick="location.href='main.jsp?center=boardwrite.jsp'" class="btn btn-light">글쓰기</button>
			</td>
		</tr>
	</table>

</div>
</body>
</html>