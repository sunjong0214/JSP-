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
<meta charset="UTF-8">
<title>글쓰기</title>
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
    font-size: 30px; /* 별 크기 */
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
</head>
<body>

<%

	request.setCharacterEncoding("UTF-8");

	String mno = request.getParameter("mno");
	String title = request.getParameter("title");
	String id = (String)session.getAttribute("id");
	
	
	movieDAO mdao = new movieDAO();	
	movieBean mBean = mdao.oneselectMovie(mno);
%>
	<form action="rewordinsertPro.jsp" method="post" class="rewordform" id="myform">
               <div>

                  <h4>영화에 대한 코멘트를 남겨주세요!</h4>
                  <div>
                     <input type="hidden" name="mno" value="<%=mBean.getMno() %>">
                     <input type="hidden" name="title" value="<%=mBean.getTitle() %>">
                     <input type="hidden" name="id" value="<%=id %>">
                  </div>
                  
                   <div class="radio_box">
                     <input type="radio" name="grade" value="5" id="star1"><label for="star1">★</label> 
                     <input type="radio" name="grade" value="4" id="star2"><label for="star2">★</label> 
                     <input type="radio" name="grade" value="3" id="star3"><label for="star3">★</label>
                     <input type="radio" name="grade" value="2" id="star4"><label for="star4">★</label> 
                     <input type="radio" name="grade" value="1" id="star5"><label for="star5">★</label>
                  </div>
                      
                  
                  <br>
                  
                  <div style="vertical-align: center;">
                     <textarea name="writing" placeholder="영화는 어떠셨나요?" rows="2" style="width:500px;"></textarea>
                     <button type="submit" class="btn btn-light" style="vertical-align: center;margin-bottom: 3%;padding:1%;">입력</button><br><br>
                  </div>
               </div>
   </form>
</body>
</html>