<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="movie.movieDAO" %>  
<%@ page import="movie.movieBean" %>	
<%@ page import="movie.rewordDAO" %>  
<%@ page import="movie.rewordBean" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>게시판</title>

<style>
.rewordform .radio_box{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 별 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
.rewordform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
.rewordform label{
    font-size: 60px; /* 별 크기 */
    color: transparent; /* 기존 별 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
.rewordform label:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}
.rewordform label:hover ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}
.rewordform radio_box legend{
    text-align: center;
}

.rewordform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}
</style>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String mno = request.getParameter("mno");
	String id = (String) session.getAttribute("id");
	
	   rewordDAO rdao = new rewordDAO();   
	   rewordBean rBean = rdao.findnumnum(mno, id);
	   
	   int numnum = rBean.getNumnum();
	
	
	movieDAO mdao = new movieDAO();	
	movieBean mBean = mdao.oneselectMovie(mno);
%>
	<h2 align="center">게시판 수정 화면</h2>
	<div align="center">
		<form action="rewordUpdatePro.jsp" method="post" class="rewordform" id="myform" align="center">
				<div class="radio_box">
                     <input type="radio" name="grade" value="5" id="star1"><label for="star1">★</label> 
                     <input type="radio" name="grade" value="4" id="star2"><label for="star2">★</label> 
                     <input type="radio" name="grade" value="3" id="star3"><label for="star3">★</label>
                     <input type="radio" name="grade" value="2" id="star4"><label for="star4">★</label> 
                     <input type="radio" name="grade" value="1" id="star5"><label for="star5">★</label>
                  </div>
				<div>
                     <textarea name="writing" placeholder="영화는 어떠셨나요?" rows="4" style="width:500px;"></textarea>
                  </div>
				<div>	
					<input type="hidden" name="mno" value="<%=mBean.getMno() %>">
					<input type="hidden" name="id" value="<%=id %>">
					<input type="hidden" name="numnum" value="<%=rBean.getNumnum() %>">
					<input type="submit" value="수정완료" class="btn btn-light">&nbsp;&nbsp; 
					<input type="reset" value="수정취소" class="btn btn-light">&nbsp;&nbsp; 
				</div>		 
		</form>
	</div>

</body>
</html>