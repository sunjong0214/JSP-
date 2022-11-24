<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 구현</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="pBean" class="movie.peopleBean">
		<jsp:setProperty name="pBean" property="*"/>
	</jsp:useBean>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	peopleDAO pdao = new peopleDAO();
	String pass = pdao.getPassword(id);
	
	if(pass.equals(password)){
		pdao.updatepeople(pBean);
		
		response.getWriter().print("<script>alert('정보수정에 성공했습니다.'); location.href = 'main.jsp?center=peopleList.jsp';</script>");
	}else{
%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다. 확인해 주세요.")
		history.back();//go(-1);
	</script>
<% } %>
</body>
</html>