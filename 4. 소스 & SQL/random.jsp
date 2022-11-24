<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="movie.movieDAO"%>
<%@ page import="movie.movieBean"%>
<%@ page import="java.util.Vector"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			  $(".box2").hide();
		$(".box1").hover(function() {
			  $(".box2").toggle();
			});
	});
</script>
<meta charset="UTF-8">
<title>body</title>
<style type="text/css">

	
	
	  

	import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

* {
    margin: 0;
    padding: 0;
}



.w-btn {
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline {
    border: 3px solid aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
    color: #1e6b7b;
    background: aliceblue;
}

.w-btn-green {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn-green2 {
    background-color: #519d9e;
    color: #9dc8c8;
}

.w-btn-green-outline {
    border: 3px solid #77af9c;
    color: darkgray;
}

.w-btn-green2-outline {
    border: 3px solid #519d9e;
    color: darkgray;
}

.w-btn-green-outline:hover {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn-green2-outline:hover {
    background-color: #519d9e;
    color: #9dc8c8;
}

.w-btn-brown {
    background-color: #ce6d39;
    color: #ffeee4;
}

.w-btn-brown-outline {
    border: 3px solid #ce6d39;
    color: #b8b8b8;
}

.w-btn-brown-outline:hover {
    background-color: #ce6d39;
    color: #ffeee4;
}

.w-btn-blue {
    background-color: #6aafe6;
    color: #d4dfe6;
}

.w-btn-pink {
    background-color: #f199bc;
    color: #d4dfe6;
}

.w-btn-gray {
    background-color: #a3a1a1;
    color: #e3dede;
}

.w-btn-red {
    background-color: #ff5f2e;
    color: #e1eef6;
}

.w-btn-skin {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow {
    background-color: #fce205;
    color: #6e6e6e;
}

.w-btn-blue-outline {
    border: 3px solid #6aafe6;
    color: #6e6e6e;
}

.w-btn-pink-outline {
    border: 3px solid #f199bc;
    color: #6e6e6e;
}

.w-btn-gray-outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}

.w-btn-red-outline {
    border: 3px solid #ff5f2e;
    color: #6e6e6e;
}

.w-btn-skin-outline {
    border: 3px solid #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow-outline {
    border: 3px solid #fce205;
    color: #6e6e6e;
}

.w-btn-blue-outline:hover {
    background-color: #6aafe6;
    color: #d4dfe6;
}

.w-btn-pink-outline:hover {
    background-color: #f199bc;
    color: #d4dfe6;
}

.w-btn-gray-outline:hover {
    background-color: #a3a1a1;
    color: #e3dede;
}

.w-btn-red-outline:hover {
    background-color: #ff5f2e;
    color: #e1eef6;
}

.w-btn-skin-outline:hover {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow-outline:hover {
    background-color: #fce205;
    color: #6e6e6e;
}

.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
}

.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}

.w-btn-gra2 {
    background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
    color: white;
}

.w-btn-gra3 {
    background: linear-gradient(
        45deg,
        #ff0000,
        #ff7300,
        #fffb00,
        #48ff00,
        #00ffd5,
        #002bff,
        #7a00ff,
        #ff00c8,
        #ff0000
    );
    color: white;
}

.w-btn-gra-anim {
    background-size: 400% 400%;
    animation: gradient1 5s ease infinite;
}

@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}

@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity: 1;
    }
    100% {
        width: 300px;
        height: 300px;
        opacity: 0;
    }
}

.w-btn-neon2 {
    position: relative;
    border: none;
    min-width: 200px;
    min-height: 50px;
    background: linear-gradient(
        90deg,
        rgba(129, 230, 217, 1) 0%,
        rgba(79, 209, 197, 1) 100%
    );
    border-radius: 1000px;
    color: darkslategray;
    cursor: pointer;
    box-shadow: 12px 12px 24px rgba(79, 209, 197, 0.64);
    font-weight: 700;
    transition: 0.3s;
}

.w-btn-neon2:hover {
    transform: scale(1.2);
}

.w-btn-neon2:hover::after {
    content: "";
    width: 30px;
    height: 30px;
    border-radius: 100%;
    border: 6px solid #00ffcb;
    position: absolute;
    z-index: -1;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: ring 1.5s infinite;
}
	
	#table {
	display: block;
	height: 110px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 3px;
	padding: 0 10px;
	margin-top: 8px;
}

</style>
</head>
<body>
	 <form action="randomPro.jsp" name="genre">
	 
	 
  <table style="margin-bottom:50px;margin-left:15%;">  
  		<tr>
  	 <!-- 드라마 -->
  	 <td align="center" style="width: 282px;" >    	
      	<button class="w-btn w-btn-gray" name="genre" value="드라마"style="
		margin-bottom: 20px;padding-left:35%;padding-right:35%;
">드&nbsp;라&nbsp;마</button>
<img src="https://upload.wikimedia.org/wikipedia/ko/2/22/%EC%9A%B0%EB%A6%AC%EC%83%9D%EC%95%A0%EC%B5%9C%EA%B3%A0%EC%9D%98%EC%88%9C%EA%B0%84_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg"style="
  width: 250px;
    height: 300px;"/>
	  </td>
	  
	  <!-- 멜로 -->
	  	<td align="center">
	  	<button class="w-btn w-btn-gray" name="genre" value="멜로"style="
		margin-bottom: 20px;padding-left:38%;padding-right:38%;
">멜&nbsp;로</button>
<img src="http://cdn.joongboo.com/news/photo/201606/1080688_995504_0801.jpg"style="
  width: 250px;
    height: 300px;"/>
	  	</td>
	  
  	<!-- 코미디 -->
	  <td align="center">
	  	<button class="w-btn w-btn-gray" name="genre" value="코미디"style="
		margin-bottom: 20px;padding-left:30%;padding-right:30%;
">코&nbsp;미&nbsp;디</button>
<img src="https://www.rfa.org/korean/weekly_program/culture_talk/openculture-01292019140941.html/extreme_job_movie_b.jpg/@@images/image"style="
  width: 250px;
    height: 300px;"/>
	  	</td>
	  	
<!-- 공포 -->
	  	<td align="center">
	  	<button class="w-btn w-btn-gray" name="genre" value="공포"style="
		margin-bottom: 20px;padding-left:38%;padding-right:38%;
">공&nbsp;포</button>
<img src="https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/1Y7L/image/ikJ10IPiN57-Z8z3cPi5lNofhjI"style="
  width: 250px;
    height: 300px;"/>
	  	</td>

 
	</tr>


		</table>

		
		<table style="margin-bottom:50px;margin-left:15%;">
		<tr >
		<!-- 액션 -->
  		<td align="center"><button class="w-btn w-btn-gray" name="genre" value="액션"style="
			    margin-bottom: 20px;padding-left:35%;padding-right:35%; 
			">액&nbsp;션</button>
				<img src="http://joyposter.cafe24.com/MoF/step/NEW-01/FJB-084.jpg"style="
				    width: 250px;
				    height: 300px;
		"/>
		</td>
	<!-- SF -->
	  	<td align="center" style="width: 294px;">
	  	<button class="w-btn w-btn-gray" name="genre" value="SF"style="
		margin-bottom: 20px;padding-left:38%;padding-right:38%;
">S&nbsp;F</button>
<img src="https://blog.kakaocdn.net/dn/Cm6OI/btqEm2kwFua/lbHekaUcUPSbbFQJH8iSe0/img.jpg"style="
  width: 250px;
    height: 300px;"/>
	  	</td>
	  	
	  	<!-- 뮤지컬 -->
	  	<td align="center" style="width: 315px;">
	  	<button class="w-btn w-btn-gray" name="genre" value="뮤지컬"style="
		margin-bottom: 20px;padding-left:32%;padding-right:32%;
">뮤&nbsp;지&nbsp;컬</button>
<img src="http://t1.daumcdn.net/cfile/211A4E4750EFE4AC0F"style="
  width: 250px;
    height: 300px;"/>
</td>
<!-- 애니메이션 -->
    <td align="center" style="width: 294px;">	
    <button class="w-btn w-btn-gray" name="genre" value="애니메이션"style="
		margin-bottom: 20px;padding-left:25%;padding-right:25%;
">애&nbsp;니&nbsp;메&nbsp;이&nbsp;션</button>
<img src="https://w.namu.la/s/2b55f1cfc10f0819ff6bc2fc3c788bfb27af63dd39d48a183f8b136680a4ad645f0fbbd378095606e8faf58ce4e1cd6ed09763b4023d6cb9a4ade062be081086790fd83b8ab7e540078d6ebc8e0c76d27f1ee0bd9f69671a33f416097c1b48f03109d0f60eef3e2f5100f063e45533fe"style="
   width: 250px;
    height: 300px;
       "/>
</td>
	</tr>						
		</table>	
</form>

<script>
function test(varRow){
	
	document.forms[0].test.options[varRow].selected = ture;
}
$(document).on('click','#test', function () {

    alert("테스트 : "+$(this).attr("value"));	
});

</script>
</body>
</html>
