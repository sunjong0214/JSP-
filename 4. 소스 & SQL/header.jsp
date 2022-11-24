<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>header.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
   
  <!-- Required meta tags -->
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

  <!-- cdnjs.com / libraries / fontawesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" charset="utf-8"></script>

  <!-- css ekternal -->
  <link rel="stylesheet" href="css/style.css">
  
  
  <link rel="stylesheet" href="css/header.css">
  
  <title>Collapsible Bootstrap Sidebar Navigation Example</title>
  <style>
  body {
      background: gray;
   }
   div.wrap {
       max-width: 1000px;
       margin-left: 300px;
       margin-top: 80px;
       margin-bottom: 80px;
       display: flex;
       justify-content: space-between;
   }   
   
   div.box {
        flex: 1;

    }
    
   .container{
      
   }
   
   
  </style>
</head>
<body>
   <!-- session을 이용한 로그인 처리 -->
   <%
   String id = (String) session.getAttribute("id");

/*    if (id == null) {
      id = "GUEST";
      } */
      %>   
<!--       <div class="wrapper" >
    <nav id="sidebar" >
    <div className="sidebar-skeleton"></div>
      <div class="sidebar-header">
        <img src="./images/mmovie2.png"  width="200" height="100vh"/>
      </div>
      <ul class="lisst-unstyled components">
        <p>추천</p>
        <li class="active">
          <a href="#foodSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">장르별</a>
          <ul class="collapse lisst-unstyled" id="foodSubmenu">
            <li><a href="#">코믹</a></li>
            <li><a href="#">멜로</a></li>
            <li><a href="#">액션</a></li>
            <li><a href="#">호러</a></li>
            <li><a href="#">스릴러</a></li>
            <li><a href="#">드라마</a></li>
            <li><a href="#">스포츠</a></li>
            <li><a href="#">SF</a></li>
          </ul>
        </li>
        <li>
          <a href="#">찜목록</a>
        </li>
        <li>
          <a href="#">고객센터</a>
        </li>
      </ul>
    </nav> -->
    
   <header>
      <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
          <button type="button" id="sidebarCollapse" class="btn btn-dark">
            <i class="fas fa-bars"></i><span> MENU</span>
          </button>
        </div>
      </nav>
      
         <!-- 검색바 -->
       <div class="container">


                      <div class="col-md-8" >

                        <div class="search" >
                          <i class="fa fa-search"></i>
                          <input type="text" class="form-control" placeholder="Have a question? Ask Now">
                          <button class="btn btn-primary"style="border-color:rgb(51,51,51)">Search</button>
                        </div>
                        
                      </div>
                      
                </div>   
         
      <nav>
         <div align="right">
         
         <%
         if(id==null){
            id = "GUEST";
            %>
             <a href="Login.jsp"> <img alt="logo"
               src="./images/procutcut.png" height="35px" width="35px"
               style="align: -1px"></a>&nbsp;&nbsp; <span
               style="vertical-align: center">로 그 인</span>&nbsp;&nbsp; <a
               href="join.jsp"> <img alt="logo" src="./images/procutcut.png"
               height="35px" width="35px"></a>&nbsp;&nbsp;<span>회원가입</span>&nbsp;&nbsp;

         <%
         }else if(id.equals("admin")){
            %>
               <a href="main.jsp?center=peopleList.jsp">관리자모드 접속(회원 목록 보기)</a>
               <form action="Logout.jsp" method="post">
              <input type="submit" value="로그아웃">
              </form>
         <%
         }else if(id != null){%>
            <a href="Login.jsp"> <img alt="logo"
               src="./images/procutcut.png" height="35px" width="35px"
               style="align: -1px"></a>&nbsp;&nbsp; <span
               style="vertical-align: center"><%=id %></span>&nbsp;&nbsp; 
              <form action="Logout.jsp" method="post">
              <input type="submit" value="로그아웃">
              </form>
         
         <%} %>

         </div>
      </nav>
   </header>

    <div id="content">

     

      
      
      
<script type="text/javascript"
src="https://pagead2.googlesyndication.com/pagead/show_ads.js">
</script></div>
  <!-- wrapper and -->


  <!-- Option 2: jQuery, Popper.js, and Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
  <script>
    $(document).ready(function() {
      $("#sidebarCollapse").on('click',function() {
        $("#sidebar").toggleClass('active');
      });
    });
  </script>
  <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<script>
try {
  fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
    return true;
  }).catch(function(e) {
    var carbonScript = document.createElement("script");
    carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
    carbonScript.id = "_carbonads_js";
    document.getElementById("carbon-block").appendChild(carbonScript);
  });
} catch (error) {
  console.log(error);
}
</script>
</body>
</html>