<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/> 
<c:set var ="awsPath" value ="https://daydayday.s3.ap-northeast-2.amazonaws.com/day"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${cpath}/resources/css/modify/main.css" />
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- font -->
<link href="${cpath}/resources/css/Font.css" rel="stylesheet"/>





</head>
<body>
 
 <jsp:include page="../common/header.jsp"></jsp:include>
   <!-- Wrapper -->
<div id="Wrapper">
            
         <div id="wrapper">
            <!-- Main -->
               <div id="main">
               <div id="updateCon">
            <form action="${cpath}/login/modify" method="post">
            <input type="hidden" name="user_id" value="${mvo.user_id}">
                  <!-- Introduction -->
                     <section id="intro" class="main">
                        <div class="spotlight">
                           <div class="content">
                              <header class="major">
                                 <h2>아이디</h2>
                              </header>
                              <p>${mvo.user_id }</p>
                              <header class="major">
                                 <h2>비밀번호</h2>
                              </header>
                              <p><input type="password" id="pw" name="user_pw" placeholder="변경할 비밀번호를 입력하세요"></p>
                              <header class="major">
                                 <h2>비밀번호 확인</h2>
                              </header>
                              <p><input type="password" id="confirmPw" placeholder="변경할 비밀번호를 한번 더 입력하세요"></p>
                              <p id="pwCheck"></p>
                              <!-- 
                              <ul class="actions">
                                 <li><a href="generic.html" class="button">Learn More</a></li>
                              </ul>
                           <span class="image"><img src="images/pic01.jpg" alt="" /></span>
                               -->
                           </div>
                        </div>

                        <header class="major">
                                 <h2>닉네임</h2>
                              </header>
                              <p><input type="text"  id="nick" name="user_nick" value="${mvo.user_nick }"></p>
                              <p id="nickCheck"></p>

                        <header class="major">
                                 <h2>이메일</h2>
                              </header>
                              <p><input type="text" name="user_email" value="${mvo.user_email }"></p>
                              <ul class="actions special">
                              <li><button type="submit" class="button primary">적용</button></li>
                              <li><button type="reset" class="button">취소</button></li>
                           </ul>
                     </section>

                  </form>
                  </div>
               </div>
</div>
                 <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">                  
                    <div class="col-lg-4 my-3 my-lg-0">
                       Copyright ⓒ 2023 D.A.Y Rights Reserved.
                    </div>
                </div>
            </div>
        </footer>

         </div>

      <!-- Scripts -->
         <script src="${cpath}/resources/js/jquery.min.js"></script>
         <script src="${cpath}/resources/js/jquery.scrollex.min.js"></script>
         <script src="${cpath}/resources/js/jquery.scrolly.min.js"></script>
         <script src="${cpath}/resources/js/browser.min.js"></script>
         <script src="${cpath}/resources/js/breakpoints.min.js"></script>
         <script src="${cpath}/resources/js/util.js"></script>
         <script src="${cpath}/resources/js/main.js"></script>
         
         
<script type="text/javascript">
$(document).ready(function(){
    
    $("#nick").keyup(function(){
       const nickCheck = document.getElementById("nickCheck");
       let inputNick = $('#nick').val();
       
       $.ajax({
          url : "${cpath}/login/nickCheck",
          data : {"user_nick" : inputNick},
          success : function(text){
             //console.log(text)
             if(text == true){
                nickCheck.innerText = "중복된 닉네임입니다.";
             }else{
                nickCheck.innerText = "사용 가능한 닉네임입니다.";
             }
          },
          error : function(e){
             console.log(e);
          }
       });
       
       
    });
 });

$("#confirmPw").keyup(function(){
   const pwCheck = document.getElementById("pwCheck");
   let pw = $("#pw").val();
   let confirmPw = $("#confirmPw").val();
   
   if(pw == confirmPw){
      $("#pwCheck").text("비밀번호 확인 완료!");
   }else{
      $("#pwCheck").text("비밀번호를 다시 입력해주세요.");
   }
   
});
</script>
</body>
</html>