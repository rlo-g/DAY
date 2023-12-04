<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/> 
<c:set var ="awsPath" value ="https://daydayday.s3.ap-northeast-2.amazonaws.com/day"/>


<!DOCTYPE HTML>
<!--
   Read Only by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>${vo.blog_title}.DAY</title>
      
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${cpath}/resources/css/main.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>   
   <link href="${cpath}/resources/css/header.css" rel="stylesheet" />
   
   <link href="${cpath}/resources/css/Font.css" rel="stylesheet">
   
   
  <style type="text/css">
     :root {
        --sidebar-color: ${vo.blog_sidebar};
    }
    
    
    
    
#mainNav {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  z-index: 10003;
  /* 추가 스타일링 */
  background-color: white;
  height: 3.7em;
  padding-bottom: 1em;
}

.navbar-nav {
    flex-direction: row; 
}

div#header-col {
    display: flex;
    align-items: center;
    margin: 0 1em;
}

ul#goWrite {
    text-align: start;
    /* margin-left: 0.2em; */
    padding-left: 1em;
}

#header-col {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%; 
}
.log-cl{      
   border:none;
    padding: 6px 13px 6px 13px;
   text-decoration: none;
}

body {
  padding-top: 3.7em; /* 헤더 높이만큼 패딩을 주어 내용이 헤더에 가려지지 않도록 함 */
}
#blog-nav {
    font-size: 1.5em;
}
    
  </style>
   </head>
   <body class="is-preload" style="background-color:${vo.blog_main};">
   
   
   <!-- 상단 헤더 -->
     <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
        <div class="top-nav" id="header-col">
               <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0" id="nav-head">
                   <li class="nav-item"><a class="navbar-brand" id="blog-nav" href="${cpath}/">D.A.Y</a></li>
                   <c:if test="${not empty mvo}">
                      <li class="nav-item"><a class="nav-link" href="${cpath}/follow">구독</a></li>
                   </c:if>
                   <li class="nav-item rg"><a class="nav-link" href="${cpath}/story">스토리</a></li>                
                  <c:if test="${not empty mvo}">
                        <li class="nav-item dropdown" is="startBtn">
                           <a id="startbtn" class="nav-link dropdown-toggle" href="#about" role="button" data-toggle="dropdown" aria-expanded="false">
                              시작하기
                           </a>
                       <ul class="dropdownBox dropdown-menu" aria-labelledby="dropdownMenuLink" id="goWrite">
                         <li><a class="dropdown-item" href="${cpath}/edit/in">글쓰기</a></li>
                         <li><a class="dropdown-item" href="${cpath}/editphoto">스티커 만들기</a></li>
                       </ul>                        
                        </li>                             
                  </c:if>
					<li class="nav-item">
						<div class="input-group position-relative" id="diary-search">
						<img class="search" src="${awsPath}/img/search.png">
							<input id="searchInput" type="text" class="rounded custom-width"
								placeholder="Search" />
							<div id="searchResults" class="position-absolute"></div>
						</div>
					</li> 
               </ul>
                
                
                
                <div class="log-div">
                   <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0" id="log-ul">
                     <c:if test="${not empty mvo}">
                        <li class="nav-item"><a class="nav-link log-cl" href="${cpath}/login/logoutProcess">LOGOUT</a></li>
                     </c:if>
                     <c:if test="${empty mvo}">
                        <li class="nav-item"><a class="nav-link log-cl" href="${cpath}/login/in">LOGIN</a></li>
                     </c:if>
                   </ul>
                </div>   
        </div>
       <!-- 네비게이션 내용 -->
     </nav>
   
   

      <!-- 사이드바 -->
         <section id="header" class="blog-sidebar" style="background-color:${vo.blog_sidebar};">
            <header>
               <span class="image avatar">
                   <div class="profileDiv">
                     <img id="profileImg" class="img-circle" src="${vo.blog_profile}" alt="" />
                   </div>
               </span>
               <h1 id="logo"><a href="#">${vo.user_nick}</a></h1>
               <p>${vo.blog_greetings}</p>
            </header>
            <nav id="nav">
               <ul>
                  <li><a href="#one" class="section-link active" data-section="diary">다이어리</a></li>
                  <li><a href="#two" class="section-link" data-section="guestBook">방명록</a></li>
               </ul>
            </nav>
            <div id="followdiv" class="Box bg-2">         
                </div>
            
            <footer>
                
               <ul class="icons">
                  <li><span class="label">Copyright ⓒ 2023 D.A.Y Rights Reserved.</span></li>
               </ul>
            </footer>
         </section>


      <!-- Wrapper -->
         <div id="wrapper" style="background-color:${vo.blog_main};">


            <!-- Main -->
               
                  <!-- header 이미지 -->
                     <div id="main-head">
                        <div class="image main" data-position="center">
                           <img src="${vo.blog_header}" alt="" />
                           <p class="imgText">${vo.blog_title}</p>
                        </div>
                        
                     </div>



           <!-- 다이어리 -->
            <div id="main">
               <div class="container" id="diary">
                     <h3>${vo.user_nick }님의 DIARY</h3>
                     <!-- <h6>${vo.user_nick }님의 게시글</h6> -->
                     <hr>      
                        
                  <div id="diaryContainer">
                     <ul class="thumblist">
                        <c:forEach var="vo" items="${diary}">
                           <li class="item">
                              <div class="itemCon">
                                 <div class="area_thumb_with_dropdown">
                                    <div class="area_thumb">
                                       <a class="section-link diaryIdx" onclick="getBoard(${vo.diary_idx});" href="#" data-section="tempStorage">
                                       <img class="thumb" src="${awsPath}/cover/${vo.diary_cover}">
                                       </a>
                                    </div>
                                 </div>
                              </div>
                              <div class="area_text">
                                 <a class="section-link diaryIdx" onclick="getBoard(${vo.diary_idx});" href="#" data-section="tempStorage"><span class="title ell">${vo.diary_name }</span></a>
                              </div>
                           </li>
                        </c:forEach>
                     </ul>
                  </div>
               </div>
               </div>



         <!-- 방명록 -->
         <div class="container" id="guestBook">
            <h3>방명록</h3>
            <hr>
            <c:if test="${mvo.user_id ne vo.user_id and not empty mvo}">
            <h6>${vo.user_nick}님에게 쪽지를 남길 수 있는 공간입니다. 따뜻한 한 마디를 남겨보세요! 😊 </h6>
              <%--  <p>${mvo.user_id }님! 방명록을 남겨보세요!</p> --%>
               <div class="btnClass">
                  <button class="group-3 btn-visit" id="go-guestBook" data-toggle="modal" data-target="#visitTb">
                     <div class="group-4">
                        <div class="text-wrapper-4">글남기기</div>
                     </div>
                  </button>
               </div>

            </c:if>
            <!-- 글쓰기(방명록) 작성 폼 -->
            <div class="modal fade" id="visitTb">
               <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                     <!-- Modal Header -->
                     <div class="modalHeader" id="modal-h">
                        <button type="button" class="close" data-dismiss="modal">
                           <img class="closeModal"
                               src="${awsPath}/images/close.png">
                        </button>
                        <h4 class="modal-title">${mvo.user_nick}님</h4>
                     </div>
                     <!-- Modal body -->
                     <div class="modal-body" id="modal-b">
                        <form action="${cpath}/visit/visit" method="post" id="frm">
                           <!--  로그인한 회원 아이디 정보도 함께 보내주기 for 회원제 게시판 -->
                           <input type="hidden" name="host" value="${vo.user_nick}">
                           <input type="hidden" name="user_id" value="${vo.user_id}">
                           <input type="hidden" name="user_nick" value="${mvo.user_nick}">
                           <input type="hidden" name="guest" value="${mvo.user_id}">
                           <table class="modalContent" id="gbContent">
                              <tr>
                                 <td><textarea style="resize: none;" id="modalContent1"
                                       name="gb_content"></textarea></td>
                              </tr>
                           </table>
                           <div class="modalFooter">
                              <input class="btn btn-sm btn-defalut" type="submit" value="확인">
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         <div id="gbContainer">
               <div id="visitList"></div>
         </div>
         </div>



         <!-- 다이어리 상세페이지 -->
         <div class="container" id="tempStorage">
            <div class="book-header">
               <p id="diaryName"></p>
               <div class="row-header">
                  <p id="boardTitle"></p>
                  <div class="back-btn">
                     <c:if test="${mvo.user_id ne vo.user_id and not empty mvo}">
                       <div class="likewrapper">
                          <a href="javascript:void(0);"  id="likebtn" class="like-button">
                             <i class="material-icons not-liked bouncy"><img class="likeImg" src="${awsPath}/images/love.png"></i>
                             <i class="material-icons is-liked bouncy"><img class="likeImg" src="${awsPath}/images/heart.png"></i>
                             <span class="like-overlay"></span>
                          </a>
                            <!-- <span id="likeNum"></span> -->
                       </div>
                     </c:if>                        
                     <a id="mainbtn" href="${cpath}/blog/${vo.user_id}" class="button">목록</a>
                  </div>
               </div>
            </div>
            
            <div id="book" class="features">
            
            </div>
            
            <div id="pagination">
               <button class="pagebtn" onclick="changePage('prev')"><img id="prev-btn" src="${awsPath}/img/left-dark.png"></button>
               <button class="pagebtn" onclick="changePage('next')"><img id="next-btn" src="${awsPath}/img/right-dark.png"></button>
            </div>
         </div>
         
         </div>
            
            
            




       <!-- Scripts -->
         <script src="${cpath}/resources/js/jquery.min.js"></script>
         <!-- <script src="${cpath}/resources/js/jquery.scrollex.min.js"></script>
         <script src="${cpath}/resources/js/jquery.scrolly.min.js"></script> -->
         <script src="${cpath}/resources/js/browser.min.js"></script>
         <script src="${cpath}/resources/js/breakpoints.min.js"></script>
         <script src="${cpath}/resources/js/util.js"></script>
         <script src="${cpath}/resources/js/blog.js"></script>
          <script src="${cpath}/resources/js/turn_js/turn.min.js"></script>
       <script src="${cpath}/resources/js/turn_js/turn.js"></script>


<script>
var book = $("#book");

   let liked = false;  // 좋아요 버튼
   
    document.addEventListener('DOMContentLoaded', function () {
        const sectionLinks = document.querySelectorAll('.section-link');
        const containers = document.querySelectorAll('.container');

        // 초기에 diary만 보이게 설정
        containers.forEach(container => {
            if (container.id === 'diary') {
                container.style.display = 'block';
            } else {
                container.style.display = 'none';
            }
        });

        sectionLinks.forEach(link => {
            link.addEventListener('click', function (e) {
                e.preventDefault();
                const targetContainerId = link.getAttribute('data-section');

                // 모든 container를 숨김
                containers.forEach(container => {
                    container.style.display = 'none';
                });

                // 클릭한 링크의 data-section 값을 가져와 해당 container를 표시
                const targetContainer = document.getElementById(targetContainerId);

                if (targetContainer) {
                    targetContainer.style.display = 'block';
                }
            });
        });
    });
    
    
    // 구독
    $(document).ready(function(){
      // 페이지가 열릴 때 바로 실행되게 만들어주기
      // HTML이 다 로딩되고나서 아래 코드 실행해라
      loadList();
      
      if(${mvo.user_id ne vo.user_id and not empty mvo}){
         if(${check > 0}){
            //console.log("${check}");
            var btnHtml = "<button onclick='unfollow()' class='btn button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick' data-text='구독 취소'>";
            btnHtml += "<span>UNSUBSCRIBE</span></button>";
            $("#followdiv").html(btnHtml);
            
         }else{
            //console.log("${check}");
            //console.log("여기야 여기");
            var btnHtml = "<button onclick='follow()' class='btn button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick' data-text='구독'>";
            btnHtml += "<span>SUBSCRIBE</span></button>";
            $("#followdiv").html(btnHtml);
         }
          
       }
   });
   
   
    function loadList(){
        // 비동기 방식으로 게시글 리스트 가져오기
        // ajax : 요청URL, 어떻게 데이터 받을지, 요청방식 등 ... -> 객체형태로 : {}(JSON 형식)
        // success 시 함수(makeView)를 실행 : ajax로 요청하고 나서 결과를 받아와서 끝나고(돌아와서) 실행하는 함수 -> 콜백함수
        var id = "${vo.user_id}";
        //console.log(id);
        
        $.ajax({
           url :"${cpath}/myblog/getVisit",
           data : {"id":id},
           type :"get",
           dataType :"json",
           success : makeView,  // 콜백함수
           error : function(e){
              console.log(e);
           }
        });
     }
   
   function makeView(data){
         var   listHtml = "";
         
         $.each(data, function(index, obj){
            listHtml += "<div class='Card img-fluid post' style='width:300px'>";
            listHtml += "<img class='card-img-top imgCard' src='${awsPath}/img/postit.png' alt='Card image' style='width:100%'>";
            listHtml += "<div class='card-img-overlay'>";
             listHtml += "<h4 class='card-title title'>" +obj.user_nick + "</h4>";
             listHtml += "<p class='card-text'>" + obj.gb_content + "</p>";
             listHtml += "<br>";
             listHtml += "<p class='indate'>"+obj.created_at + "</p>";
             listHtml += "<a href='${cpath}/blog/"+obj.guest+"' class='btn btn-sm btn-defalut'>구경가기</a>";
             
             if(obj.visitor == "${mvo.user_nick}"){
                listHtml += "<a href='${cpath}/visit/delete/"+obj.gb_idx+"' class='btn btn-sm btn-defalut'>삭제</a>";
             }
             listHtml += "</div></div>";
            
         });

         $("#visitList").html(listHtml);
         
      }
   

   function follow(){
         // 팔로워 : 나를 팔로우한 사람
         // 팔로이 : 내가 구독한 사람
         var follower = "${mvo.user_id}";
         var followee = "${vo.user_id}";
         //console.log(follower, followee);
         var btnHtml = "<button onclick='unfollow()' class='btn button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick' data-text='구독 취소'>";
               btnHtml += "<span>UNSUBSCRIBE</span></button>";
               
         $.ajax({
            url:"${cpath}/follow/subscribe",
            data:{"follower":follower, "followee":followee},
            type:"post",
            success:function(){
               $("#followdiv").html(btnHtml);
               console.log("구독 완료");
            },
            error:function(e){
               console.log(e);
            }
            
         });
      }
   
   function unfollow(){
         var follower = "${mvo.user_id}";
         var followee = "${vo.user_id}";
         //console.log(follower, followee);
         
         var btnHtml = "<button onclick='follow()' class='btn button--winona button--border-thick button--round-l button--text-upper button--size-s button--text-thick' data-text='구독'>";
               btnHtml += "<span>SUBSCRIBE</span></button>";
               
         $.ajax({
            url:"${cpath}/follow/unSubscribe",
            data:{"follower":follower, "followee":followee},
            type:"post",
            success:function(){
               $("#followdiv").html(btnHtml);
               console.log("구독 취소");
            },
            error:function(e){
               console.log(e);
            }
            
         });
      }
   

   function getBoard(idx) {
       //console.log(idx);
       
       $.ajax({
           url: "${cpath}/board/getBoard",
           data: {"idx": idx},
           type: "get",
           dataType: "json",
           success: makeBoard,
           error: function(e) {
               console.log(e);
           }
       });
   }


    function makeBoard(data) {
        console.log(data);
        var listHtml = "";
         $("#diaryName").text(data[0].bd_diary);
         $("#boardTitle").text(data[0].bd_title);
         $('#likebtn').data('idx', data[0].bd_idx);
        // console.log('첫번째만',data[0].bd_idx);
        // 첫 페이지 (표지)는 비워둡니다.
        listHtml += "<div class='page'></div>";
        // 두 번째 데이터 항목부터 이미지를 표시합니다.
        $.each(data, function(index, obj) {
          
             // 현재 페이지의 제목으로 #boardTitle 엘리먼트를 동적으로 업데이트합니다.
      
            listHtml += "<div class='page' style='background-image: url(" + obj.bd_content + "); background-size: 200% 100%; background-position: left;'>";
            listHtml += "</div>"; // 왼쪽 면

            listHtml += "<div class='page' style='background-image: url(" + obj.bd_content + "); background-size: 200% 100%; background-position: right;'>";
            listHtml += "</div>"; // 오른쪽 면
        });
        
        book.html(listHtml);

     // turn.js를 사용하여 책 넘기기 효과 초기화
        book.turn({
                       width: '100%',
                       height: 600,
                       autoCenter: true,
                       gradients: true,
                       page:2
                   }).on("turning", function(event, page, view) {
                       // 페이지가 넘어갈 때마다 제목, 닉네임, 다이어리 이름 업데이트
                       if (page === 1) {
                           event.preventDefault(); // 첫 페이지로 이동 시 이동을 취소
                       }else if(page >1){
                          var currentPageData = data[Math.floor(page/2)-1]; // 페이지 인덱스를 데이터 인덱스로 변환
                          //console.log(data);
                          //console.log(page, currentPageData);
                         
                          $('#boardTitle').text(currentPageData.bd_title);
                          $('#book').addClass("book-shadow");
                          $('#likebtn').data('idx', currentPageData.bd_idx);
                          $('#likebtn').removeClass('is-active');
                          $('#likebtn, #boardTitle').show();
                      } else {
                          $('#likebtn, #boardTitle').hide();
                      }
                   
                   });
        
        // 현재 페이지 업데이트
        //updateCurrentPage(book.turn('page'));

        // 총 페이지 수 업데이트
        //updateTotalPages(book.turn('pages'));
        
    }


       // 페이지 변경 함수
       function changePage(direction) {
         // 현재 페이지와 총 페이지 수를 가져옴
         var currentPage = book.turn('page');
         //console.log("currentPage",currentPage);
         var totalPages = book.turn('pages');
         //console.log("totalPages",totalPages);
         
         if (direction === 'prev' && currentPage > 1) {
              book.turn('previous');
         } else if (direction === 'next' && currentPage < totalPages) {
           book.turn('next');
         }

         // 페이지 변경 후 현재 페이지 업데이트
         //updateCurrentPage(book.turn('page'));
       }

       // 초기 페이지 설정 (페이지 로딩 시 실행)
       document.addEventListener('DOMContentLoaded', function() {
         // 초기 페이징 정보 업데이트
         if (book.turn('pages')) { // 'book'이 이미 초기화되었다면
           //updateTotalPages(book.turn('pages'));
           //updateCurrentPage(book.turn('page'));
         }
       });

       
       $('#likebtn').on('click', function() {
           var idx = $(this).data('idx');
           //console.log('Data from likebtn:', idx);
           var liked = $(this).hasClass('is-active');
              $.ajax({
                 url:"${cpath}/board/like",
                 data:{"liked":liked,"idx":idx},
                 type:"get",
                 success:function(like){
                    $("#likeNum").show();
                    $("#likeNum").text(like);
                 },
                 error:function(e){
                    console.log(e);
                 }
              });
           
       });    
    

</script>


<!-- 사용자 지정색에 따른 블로그 폰트 색상 변경 -->         
<script type="text/javascript">
/* 배경 */
document.addEventListener('DOMContentLoaded', function() {
    var bgColor = "${vo.blog_main}";
    var color = hexToRgb(bgColor);
    var brightness = (color.r * 299 + color.g * 587 + color.b * 114) / 1000;
    var textColor = brightness < 128 ? 'white' : 'rgb(49 49 49)';
    if(brightness < 128){
       $("hr").css({
          "background-color": "white",
            "height": "0.1px"
       });
    }
    // 모든 .title 요소를 선택하고 스타일 적용
    document.querySelectorAll('#diaryContainer .area_text .title').forEach(function(element) {
        element.style.color = textColor;
    });
    document.querySelectorAll('#tempStorage p').forEach(function(element) {
        element.style.color = textColor;
    });
    
    document.querySelectorAll('#diary h3, #guestBook h3, #guestBook h6, #diary h6, #blogSetting h3').forEach(function(element) {
        element.style.color = textColor;
    });
    

    // 페이지 버튼 변경
    var prevImg = document.getElementById('prev-btn');
    var nextImg = document.getElementById('next-btn');
    if(brightness < 128) {
        prevImg = "${awsPath}/img/left-white.png";
        nextImg = "${awsPath}/img/right-white.png";
     }else{
        prevImg = "${awsPath}/img/left-dark.png";
        nextImg = "${awsPath}/img/right-dark.png";
     }
    
    
});

/* 사이드바 */
document.addEventListener('DOMContentLoaded', function() {
    var bgColor = "${vo.blog_sidebar}";
    var color = hexToRgb(bgColor);
    var brightness = (color.r * 299 + color.g * 587 + color.b * 114) / 1000;
    var textColor = brightness < 220 ? 'white' : 'rgb(95, 95, 95)';

    var navItems = document.querySelectorAll('#header > nav ul li');
    
    if (bgColor === '#ffffff') {
        var activeLinks = document.querySelectorAll('#header > nav ul li a.active');

        activeLinks.forEach(function(link) {
            link.style.backgroundColor = 'rgb(95, 95, 95)';
        });
    }

    document.querySelectorAll('#header h1 a, #header > header p, #header > nav ul li a:not(.active), #header > footer .icons li').forEach(function(element) {
        element.style.color = textColor;
        
    });
    
    // 모든 nav 항목에 대한 클릭 이벤트 리스너 설정
    navItems.forEach(function(item) {
        item.addEventListener('click', function() {
            // 모든 링크를 기본 색상으로 재설정
            navItems.forEach(function(otherItem) {
                var otherLink = otherItem.querySelector('a');
                
                if (bgColor){
                  otherLink.style.backgroundColor = bgColor;                   
                    otherLink.style.color = textColor;
                    otherLink.style.fontWeight = 'normal';
                }

            });

            // 현재 클릭된 항목의 링크 색상을 변경
            var link = item.querySelector('a');
            if (link) {
                link.style.color = bgColor;
                link.style.fontWeight = 'bold';
                
               if (bgColor === '#ffffff'){
                   // 사이드바 색상 white일 경우
                  link.style.backgroundColor = 'rgb(95, 95, 95)';
               }else{
                   link.style.backgroundColor = 'white';
                  
               }
            }
        });
    });
    
});


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

function hexToRgb(hex) {
    var bigint = parseInt(hex.slice(1), 16);
    var r = (bigint >> 16) & 255;
    var g = (bigint >> 8) & 255;
    var b = bigint & 255;

    return { r, g, b };
}


</script>  

<script>

window.addEventListener("load", function() {
    let content = document.querySelector("#header > header");

    // 스크롤 이벤트 감지
    window.addEventListener("scroll", function() {
        if (window.scrollY > 0) {
            // 스크롤을 내린 경우, margin-top을 0으로 설정
            content.style.marginTop = "0";
        } else {
            // 스크롤을 맨 위로 올린 경우, 초기 margin-top 값으로 설정
            content.style.marginTop = "3.7em";
        }
    });
});


</script> 

   </body>
</html>