<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.peopleDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session login process</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//데이터베이스 연결
	peopleDAO logon = peopleDAO.getInstance(); //클래스명.메소드();
	
	//아이디와 페스워드 체크
	int check= logon.userCheck(id,pw);
	
	//결과가 참이면
		if(check==1){
			session.setAttribute("id", id); //"객체",벨류값
			session.setMaxInactiveInterval(60*60*24*365); //20분간 쿠키 정보 유지 60초가 20번
			
			response.sendRedirect("main.jsp");//쿠키jsp로 가라
			%>
			<script>
			alert("로그인에 성공하였습니다");
			</script>
			<%
		}else if(check==0){
			%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
				/* response.sendRedirect("main.jsp"); */
				history.go(-1); //sessionLogin.jsp로 돌아가라
		</script>
		<%}else{ %>
			<script>
			alert("아이디가 맞지 않습니다.");
				history.go(-1); //sessionLogin.jsp로 돌아가라
		</script>
		<%}%>
	
	
	
<!-- 	
	
	
	session.setAttribute("id", id);
	session.setAttribute("pw", pw);
	
	session.setMaxInactiveInterval(60*60*24*365);
	
	

%> -->
</body>
</html>