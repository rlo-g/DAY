<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/> 
<c:set var ="awsPath" value ="https://daydayday.s3.ap-northeast-2.amazonaws.com"/>

<!DOCTYPE HTML>
<!--
   Read Only by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>Read Only by HTML5 UP</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="${cpath}/resources/css/make.css" rel="stylesheet" />
 <link href="${cpath}/resourecs/css/Font.css" rel="stylesheet">
 
   </head>
   <body>

 <div class='parent'>
  <div class='slider'>
   <button type="button" id='right' class='right' name="button">

       <svg version="1.1" id="Capa_1" width='40px' height='40px ' xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         viewBox="0 0 477.175 477.175" style="enable-background:new 0 0 477.175 477.175;" xml:space="preserve">
       <g>
        <path style='fill: #9d9d9d;' d="M360.731,229.075l-225.1-225.1c-5.3-5.3-13.8-5.3-19.1,0s-5.3,13.8,0,19.1l215.5,215.5l-215.5,215.5
          c-5.3,5.3-5.3,13.8,0,19.1c2.6,2.6,6.1,4,9.5,4c3.4,0,6.9-1.3,9.5-4l225.1-225.1C365.931,242.875,365.931,234.275,360.731,229.075z
          "/>
       </g>

       </svg>

       </button>
   <button type="button" id='left' class='left' name="button">
       <svg version="1.1" id="Capa_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
         viewBox="0 0 477.175 477.175" style="enable-background:new 0 0 477.175 477.175;" xml:space="preserve">
       <g>
        <path style='fill: #9d9d9d;' d="M145.188,238.575l215.5-215.5c5.3-5.3,5.3-13.8,0-19.1s-13.8-5.3-19.1,0l-225.1,225.1c-5.3,5.3-5.3,13.8,0,19.1l225.1,225
          c2.6,2.6,6.1,4,9.5,4s6.9-1.3,9.5-4c5.3-5.3,5.3-13.8,0-19.1L145.188,238.575z"/>
       </g>
       </svg>
       </button>
       

<form action="${cpath}/myblog/makemyblog" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_id" value="${mvo.user_id }">
<input type="hidden" name="user_nick" value="${mvo.user_nick }">
   <div id='slide1' class='slide1 up1'>
   		<div class="figure"><h4 id="profile-img">프로필 사진을 등록해주세요.</h4></div>
		<div class="imgDiv">
				<img id="profile" class="img-circle" src="${awsPath}/day/images/default.png">
		</div> <br>
		<div class="inputDiv">
				<label for="blog_profile" class="input-btn">업로드</label> 
				<input type="file" accept="image/*" id="blog_profile"	name="blog_profile" onchange="readProfile(this)"
					style="display: none;"> <label for="profileReset"
					class="input-btn">삭제</label> <input type="reset"
					id="profileReset" style="display: none;" />
		</div>
   </div>
   <div id='slide2' class='slide2'>
   		<div class="figure"><h4>블로그 이름을 입력해주세요.</h4>
			<input class="input-text" type="text" name="blog_title" id="blog_title" ></div>
   		<div class="figure"><h4 class="intro">블로그 소개글을 작성해주세요.</h4>
			<input class="input-text" type="text" name="blog_greetings" id="blog_intro" ></div>
   </div>
   <div id='slide3' class='slide3'>
   		<div class="figure"><h4>블로그 헤더 이미지를 등록해주세요.</h4></div>
 <div class="imgDiv"><img id ="blogHeader" src="${awsPath}/day/images/header.png"> <br>
                                             <div class="headerDiv">
                                                <label for="blog_header" class="input-btn">업로드</label>
                                                <input type="file" accept="image/*" id="blog_header" name="blog_header" onchange="readHeader(this)" style="display:none;">
                                                <label for="headerReset" class="input-btn">삭제</label>
                                                <input type="reset" id="headerReset" style="display:none;"/>
                                             </div>
                                             </div>

</div>
   <div id='slide4' class='slide4'>
   <div class="figure"><h4 id="blog-color">블로그 색상을 선택해주세요.</h4></div>
<div id="swatch">
  <input type="color" class="color" id="sidecolor" name="blog_sidebar" value="#00315C">
  <div class="info">
    <h1>D.A.Y</h1>
    <h2>SideBar</h2>
  </div>
</div>
</div>
   <div id='slide5' class='slide5'>
      <div class="figure"><h4 id="blog-color">블로그 배경색상을 선택해주세요.</h4></div>
<div id="swatch">
  <input type="color" class="color"  id="bodycolor" name="blog_main" value="#00315C">
  <div class="info">
    <h1>D.A.Y</h1>
    <h2>Background</h2>
  </div>
</div>
</div>
	<div id='slide6' class='slide6'>
      <div class="figure"><h4 id="create">내 다이어리 만들기</h4></div>
		  <div class="button-container-2">
    <span class="mas">CREATE</span>
  <button id="makebtn" type="submit" name="Hover">MY DIARY</button>
</div>
	</div>
</form>
  </div>
</div>


	



         <script src="${cpath}/resources/js/slide.js"></script>
         
<script type="text/javascript">
// 블로그 관리 - 프로필 사진 미리보기
function readProfile(input) {
     if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function(e) {
         document.getElementById('profile').src = e.target.result;
       };
       reader.readAsDataURL(input.files[0]);
               
     } else {
       document.getElementById('profile').src = "";
     }       
   }

   // 삭제 버튼을 눌렀을 때 미리보기 이미지를 지우고 파일 입력 필드를 초기화합니다.
     document.getElementById('profileReset').addEventListener('click', function() {
       document.getElementById('profile').src = "";
       document.getElementById('blog_profile').value = ""; // 파일 입력 필드 초기화
     });         


   
   
function readHeader(input) {
     if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.onload = function(e) {
         document.getElementById('blogHeader').src = e.target.result;
       };
       reader.readAsDataURL(input.files[0]);
     } else {
       document.getElementById('blogHeader').src = "";
     }
   }

   // 삭제 버튼을 눌렀을 때 미리보기 헤더 이미지를 지우고 파일 입력 필드를 초기화합니다.
     document.getElementById('headerReset').addEventListener('click', function() {
       document.getElementById('blogHeader').src = "";
       document.getElementById('blog_header').value = ""; // 파일 입력 필드 초기화
     });    

   
   
    	  $('#sidecolor').on('input', function() {
    	    var selectedColor = $(this).val();
    	    $('#slide4').css('background-color', selectedColor);
    	  });
    	  $('#bodycolor').on('input', function() {
    	    var selectedColor = $(this).val();
    	    $('#slide5').css('background-color', selectedColor);
    	  });

var test = "${mvo.user_id }";
console.log(test);

</script>
   </body>
</html>