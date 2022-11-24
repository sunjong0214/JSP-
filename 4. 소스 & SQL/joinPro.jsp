<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="movie.peopleDAO" %>  
<%@ page import="movie.peopleBean" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 처리 구현</title>
</head>
<body>
<!-- 예외처리로 아이디중복 처리 경고창 만들기 -->
<%
	request.setCharacterEncoding("UTF-8");

	String genre[] = request.getParameterValues("genre");
	String id2 = request.getParameter("id"); // id 입력값
	String name2= request.getParameter("name"); // 이름 입력값
	String pwd1 = request.getParameter("pw"); // pw 입력값
	String pwd2 = request.getParameter("pw1"); // pw 확인 입력값
	String gender = request.getParameter("input[name=gender]"); // pw 확인 입력값
	String textgenre  = "";
	
	for(int i=0; i < genre.length; i++){
		textgenre += genre[i] + " ";
	}
	
%>
	<jsp:useBean id="pBean" class="movie.peopleBean">
		<jsp:setProperty name="pBean" property="*"/>
	</jsp:useBean>
	
		<%
		/* 아이디 입력값과 빈칸 비교 */
		if(id2.equals("")){
		%>
		<script>
		/* 빈칸일시 출력 */
			alert("아이디를 입력해주세요");
			history.go(-1);
		</script>	
		
	<%
	/* 이름 입력값과 빈칸 비교 빈칸일시 알터 출력*/
		}else if(name2.equals("")){ 
	%>
				<script>
					alert("이름을 입력해주세요");
					history.go(-1);
				</script>
		<%
		/* pw 입력값과 pw 확인 입력값을 빈칸과 비교 */
		}else if(pwd1.equals("")&&pwd2.equals("")){
		%>		<script>
					/* pw입력값이 빈칸일 경우 */
					alert("비밀번호를 입력해주세요");
					history.go(-1);
				</script>
	<%
	/* pw값과 pw 확인 입력값을 서로 비교  */
	}else if(!pwd1.equals(pwd2)){
	%>		<script>
				/* 입력값이 서로 다를경우 */
					alert("비밀번호가 다릅니다");
					history.go(-1);
				</script>
	<%
	}else{				//정상 입력일 경우 여기서부터
	
	pBean.setGenre(textgenre);

	
	//데이터베이스 클래스에 대한 객체 생성
	peopleDAO pdao = new peopleDAO();	
	pdao.insertpeople(pBean);
%>
	<script type="text/javascript">
		alert("축하합니다! 로그인해주세요.");
	</script>
	
<%	
	//메인화면으로 이동
	response.getWriter().print("<script>alert('회원가입성공 로그인해주세요.'); location.href = 'main.jsp';</script>");
	/* response.sendRedirect("main.jsp"); */
	}
%>	

	
</body>
</html>