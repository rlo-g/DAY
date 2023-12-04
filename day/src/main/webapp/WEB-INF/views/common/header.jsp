<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="awsPath"
	value="https://daydayday.s3.ap-northeast-2.amazonaws.com/day" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link href="${cpath}/resources/css/header.css" rel="stylesheet" />
<!--  font -->
<link href="${cpath}/resources/css/Font.css" rel="stylesheet"/>
<title>Insert title here</title>

<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container" id="nav-wd">
			<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
				<li class="nav-item"><a class="navbar-brand" href="${cpath}/">D.A.Y</a></li> 
				<c:if test="${not empty mvo}">
				<!-- href 수정 follow->${cpath}/follow -->
					<li class="nav-item"><a class="nav-link" href="${cpath}/follow">구독</a></li>
				</c:if>
				<li class="nav-item rg"><a class="nav-link" href="${cpath}/story">스토리</a></li>
			</ul>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">

					<li class="nav-item">
						<div class="input-group position-relative">
						<img class="search" src="${awsPath}/img/search.png">
							<input id="searchInput" type="text" class="rounded custom-width"
								placeholder="Search" />
							<div id="searchResults" class="position-absolute"></div>
						</div>
					</li>



					<c:if test="${not empty mvo}">
						<li class="nav-item dropdown" id="startBtn"><a id="startbtn"
							class="nav-link dropdown-toggle" href="#about" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 시작하기 </a>
							<ul class="dropdownBox dropdown-menu dropdown-menu-end"
								aria-labelledby="dropdownMenuLink" id="goWrite">
								<li><a class="dropdown-item" href="${cpath}/edit/in" id="goWrite-1" >글쓰기</a></li>
								<li><a class="dropdown-item" href="${cpath}/editphoto" id="goSticker-1">스티커
										만들기</a></li>
							</ul></li>


						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							id="profileDropdown" data-bs-toggle="dropdown"
							aria-expanded="false"> ${mvo.user_nick}님 </a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="profileDropdown">
								<li>
									<div class="screen">
										<a id="logout" href="${cpath}/login/logoutProcess">로그아웃</a>
										<div class="frame">
											<c:if test="${not empty profile}">
												<img class="ellipse" src="${profile}" />
											</c:if>
											<c:if test="${empty profile}">
												<img class="ellipse"
													src="${awsPath}/main/defaultProfile.png" />
											</c:if>
											<div class="text-wrapper">${mvo.user_id }</div>
											<div class="div">
												<div id="makebtn">
													<!-- 마이블로그 버튼 들어올 자리 -->
												</div>
											</div>
											<div class="frame-2">
												<div class="frame-wrapper">
													<a class="dropdownbtn text-wrapper-4"
														href='${cpath}/login/modifyForm'>
														<div class="frame-3">ACCOUNT</div>
													</a>

													<!-- <img class="img" src="img/image.svg" /> -->
													<a id="myblogbtn" class="dropdownbtn text-wrapper-4"
														href='${cpath}/myblog/in'><div class="frame-4">MYDIARY</div></a>
												</div>
											</div>

										</div>
									</div>
								</li>
							</ul></li>
					</c:if>
					<c:if test="${empty mvo}">
						<li class="nav-item"><a class="nav-link"
							href="${cpath}/login/in">LOGIN</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</nav>
</body>
<script>
var id = "${mvo.user_id}";
    $(document).ready(function(){
      if(${not empty mvo}){
         blogCheck();
         diaryCheck();
         console.log(id);
         
      }
   });
   
   
   function blogCheck(){
     
      
      $.ajax({
         url :"${cpath}/blogCheck",
         data : {"id":id},
         success : function(text){
            //console.log(text);
            if(text == false){
               /* $('#myblogbtn').text("CREATE DIARY"); */
               $("#myblogbtn").html('<div class="frame-4">CREATE DIARY</div>');
               $("a#myblogbtn").attr("href", "${cpath}/myblog/makeForm");
               $("a#startbtn").removeClass("dropdown-toggle");
               $("a#startbtn").attr("href", "${cpath}/myblog/makeForm");
               $("a#startbtn").attr("data-bs-toggle","");
            }
         },  // 콜백함수
         error : function(e){
            console.log(e);
         }
      });
   }
   // 다이어리가 없으면 스티커 제작만 나오게
   
   
   function diaryCheck(){
		$.ajax({
			url: "${cpath}/myblog/mydiaryCheck",
			data: {"id": id},
			success: function(text){
					console.log(text);
				if(text==false){
					// a태그 작동안되게
					$("#goWrite-1").hide();
					}
			},
			error: console.error()
			});
			
		
		
		}
	   

   
   $(document).ready(function() {
       $('#searchInput').on('keyup', function() {
           var searchTerm = $(this).val();
           if (searchTerm.length > 0) {
               $.ajax({
                   url: '${cpath}/findId',
                   data: { term: searchTerm },
                   success: function(data) {
                       $('#searchResults').empty();
                       $.each(data, function(index, dayBlog) {
                           var blogLink = '${cpath}/blog/' + dayBlog.user_id;
                           var displayDiv = '<div class="search-result"><a href="' + blogLink + '"><img src="' + dayBlog.blog_profile + '" alt="Profile Image"> ' + dayBlog.user_id + '</a></div>';
                           $('#searchResults').append(displayDiv);
                       });
                   },
                   error: function(xhr, status, error) {
                       console.error("An error occurred: " + error);
                       $('#searchResults').empty();
                   }
               });
           } else {
               $('#searchResults').empty();
           }
       });
   });
   
   </script>
</html>