<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>joinForm</title>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap"
	rel="stylesheet">
<!--Stylesheet-->
<style media="screen">

.mainJoinForm {
	margin-top: 120px;
}


*, *:before, *:after {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	background-color: #080710;
}

.background {
	width: 430px;
	height: 520px;
	position: absolute;
	transform: translate(-50%, -50%);
	left: 50%;
	top: 50%;
}

.background .shape {
	height: 200px;
	width: 200px;
	position: absolute;
	border-radius: 50%;
}

.shape:first-child {
	background: linear-gradient(#1845ad, #23a2f6);
	left: -80px;
	top: -80px;
}

.shape:last-child {
	background: linear-gradient(to right, #ff512f, #f09819);
	right: -30px;
	bottom: -80px;
}

form {
	height: 1100px;
	width: 400px;
	background-color: rgba(255, 255, 255, 0.13);
	position: absolute;
	transform: translate(-50%, -50%);
	top: 50%;
	left: 50%;
	border-radius: 10px;
	backdrop-filter: blur(10px);
	border: 2px solid rgba(255, 255, 255, 0.1);
	box-shadow: 0 0 40px rgba(8, 7, 16, 0.6);
	padding: 50px 35px;
}

form * {
	font-family: 'Poppins', sans-serif;
	color: #ffffff;
	letter-spacing: 0.5px;
	outline: none;
	border: none;
}

form h3 {
	font-size: 32px;
	font-weight: 500;
	line-height: 42px;
	text-align: center;
}

label {
	display: block;
	margin-top: 30px;
	font-size: 16px;
	font-weight: 500;
}

input {
	display: block;
	height: 50px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 3px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 14px;
	font-weight: 300;
}
#tr {
	display: block;
	height: 50px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 3px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 14px;
	font-weight: 300;
}
#table {
	display: block;
	height: 110px;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.07);
	border-radius: 3px;
	padding: 0 10px;
	margin-top: 8px;
	font-size: 12px;
	font-weight: 300;
}

::placeholder {
	color: #e5e5e5;
}

button {
	margin-top: 50px;
	width: 100%;
	background-color: #ffffff;
	color: #080710;
	padding: 15px 0;
	font-size: 18px;
	font-weight: 600;
	border-radius: 5px;
	cursor: pointer;
}

.social {
	margin-top: 30px;
	display: flex;
}

.social div {
	background: red;
	width: 150px;
	border-radius: 3px;
	padding: 5px 10px 10px 5px;
	background-color: rgba(255, 255, 255, 0.27);
	color: #eaf0fb;
	text-align: center;
}

.social div:hover {
	background-color: rgba(255, 255, 255, 0.47);
}

.social .fb {
	margin-left: 25px;
}

.social i {
	margin-right: 4px;
}

.genre{
	display:inline-block;
	width:20px;
	height:20px;
}
#checkbox{
	vertical-align: -3px;
}

</style>

</head>
<body>
<script>
document.querySelector('.mainJoinForm').addEventListener('click', function(e){
    //ID가 7글자 미만이면 메시지 표시
    if(document.querySelector('.peopleID').value.length < 7){
        rating.showMessage('글자가 너무 적습니다');
        return false;
        alert("아이디는 최소 5글자 이상 적어주세요")
    }
    //폼 서밋
});
</script>
	<div class="background">
		<div class="shape"></div>
		<div class="shape"></div>
	</div>
	<form height="1200px" action="joinPro.jsp" method="post" class="mainJoinForm">
		<h3>Join us!</h3>

		<label for="username">아이디</label> <input type="text" placeholder="id" name="id" minlength = "5"  class="peopleID">
		<label for="password">비밀번호</label> <input type="password" placeholder="Password" name="pw">
		<label for="password">비밀번호 확인</label> <input type="password" placeholder="Confirm Password!" name="pw1">
		<label for="name">이름</label> <input type="text" name="name">
		<table>
			<tr>
				<td>
					<label>성별</label>
				</td>
			</tr>
			<tr id=tr>
				<td width="165" align="center">
					<input type="radio" id="gender" name="gender" value="남자" checked="checked" style="width:15px; height:15px"/><span>남성</span>
   				</td>
   				<td width="165" align="center">
			    	<input type="radio" id="gender" name="gender" value="여자" style="width:15px; height:15px"/><span>여성</span>
    			</td>
    		</tr>
    	</table>	
		<label for="age">나이</label> <input type="text" name="age">
		<label for="genre">선호 장르 </label>
		<table align="center" id=table>
			<tr>
				<td>
					<input type="checkbox" value="코미디" name="genre" class="genre"/><span style="vertical-align:+3px; font-size: 12px">  코미디</span>&nbsp;&nbsp;
				</td>
				<td>
					<input type="checkbox" value="멜로" name="genre" class="genre"/><span style="vertical-align:+3px">  멜로</span>&nbsp;&nbsp;
				</td>
				<td>
					<input type="checkbox" value="액션" name="genre" class="genre"/><span style="vertical-align:+3px">  액션</span>&nbsp;&nbsp;
				</td>
				<td>
					<input type="checkbox" value="공포" name="genre" class="genre"/><span style="vertical-align:+3px">  공포</span><br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" value="뮤지컬" name="genre" class="genre"/><span style="vertical-align:+3px; ">  뮤지컬</span>&nbsp;&nbsp;
				</td>
				<td>
					<input type="checkbox" value="드라마" name="genre" class="genre"/><span style="vertical-align:+3px">  드라마</span>&nbsp;&nbsp;
				</td>
				<td>
					<input type="checkbox" value="애니메이션" name="genre" class="genre"/><span style="vertical-align:+3px">  애니메이션</span>&nbsp;&nbsp;
				</td>
				<td>
					<input type="checkbox" value="SF" name="genre" class="genre"/><span style="vertical-align:+3px">  SF</span>&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="checkbox" value="ALL" checked name="genre" class="genre"/><span style="vertical-align:+3px">  모든장르</span>&nbsp;&nbsp;
				</td>
			</tr>
		</table>
		<button type="submit">가입</button>
	</form>	
</body>
</html>