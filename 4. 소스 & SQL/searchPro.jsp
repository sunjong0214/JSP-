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

<meta charset="UTF-8">
<title>searchPro</title>

</head>
<body>
<div>

<%
   request.setCharacterEncoding("UTF-8");
   String title = request.getParameter("title");


%>
	   <script>
   location.href='main.jsp?center=searchPrint.jsp?title=<%=title%>'   				
	   </script>

</div>
</body>
</html>