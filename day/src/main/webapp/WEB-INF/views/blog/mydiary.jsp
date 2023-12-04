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
      <title>${myblog.blog_title}.DAY</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
       <link href="${cpath}/resources/css/Font.css" rel="stylesheet">
      <link rel="stylesheet" href="${cpath}/resources/css/main.css" />
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>   
   <link href="${cpath}/resources/css/header.css" rel="stylesheet" />
   
  <style type="text/css">
  
  /* 사용자 지정 색 */
     :root {
        --sidebar-color: ${myblog.blog_sidebar};
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
   <body class="is-preload" style="background-color:${myblog.blog_main};">



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





   <div id="allDiv">

   <!-- 사이드바 -->
         <section id="header" style="background-color:${myblog.blog_sidebar};" class="blog-sidebar">
            <header>
               <span class="image avatar">
               <div class="profileDiv"><img id="profileImg" class="img-circle" src="${myblog.blog_profile}" alt="" /></div>

               </span>
               <h1 id="logo"><a href="#">${mvo.user_nick}</a></h1>
                     <p>${myblog.blog_greetings }</p>
            </header>
            <nav id="nav">
               <ul>
                  <li><a href="#one" class="section-link active" data-section="diary">다이어리</a></li>
                  <li><a href="#two" class="section-link" data-section="guestBook">방명록</a></li>
                  <!--  <li><a href="#three" class="section-link" data-section="tempStorage">임시보관함</a></li> -->
                  <!--<c:if test="${not empty mvo}"> </c:if> -->
                     <li><a href="#four" class="section-link" data-section="blogSetting">블로그 관리</a></li>
                  
               </ul>
            </nav>
          
            <footer>
               <ul class="icons">
                  <li><span class="label">Copyright ⓒ 2023 D.A.Y Rights Reserved.</span></li>
               </ul>
            </footer>
         </section>


      <!-- Wrapper -->
         <div id="wrapper" style="background-color:${myblog.blog_main};">


            <!-- Main -->
               
          <!-- header 이미지 -->
            <div id="main-head">
               <div class="image main" data-position="center">
                     <img src="${myblog.blog_header}" alt="" />
                     <p class="imgText">${myblog.blog_title}</p>
               </div>
            </div>
      
      
      
            <div id="main">
                     <!-- 다이어리 -->
                   <div class="container" id="diary">
                     <h3>MY DIARY</h3>
                     <hr>
                       <div class="btnClass">
                    <button class="group-3" id="goEdit" data-toggle="modal" type="button" onclick="location.href='${cpath}/edit/in'" >
                        <div class="group-4">
                          <img class="img" src="${awsPath}/images/goWrite.png" />
                          <div class="text-wrapper-4">WRITE</div>
                        </div>
                    </button>                  
                    <button class="group-3" onclick="makediary();"id="goEdit" data-toggle="modal" data-target="#makeDiary">
                        <div class="group-4">
                          <img class="img" src="${awsPath}/images/diary_add.png" />
                          <div class="text-wrapper-4">MAKE</div>
                        </div>
                    </button>                  
                       </div>


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
                                 <div id="dropdown-div">
                                     <button class="dropdown-toggle morebtn" type="button" data-toggle="dropdown"><img src="${awsPath}/img/more2.png"></button>
                                    <div class="dropFrm dropdown-menu" style="min-width:0;">
                                      <a class="dropItem" onclick="modify(${vo.diary_idx});" data-toggle="modal" data-target="#makeDiary" href="#">수정</a>
                                      <a class="dropItem" href="${cpath}/myblog/diaryDelete?idx=${vo.diary_idx}">삭제</a>
                                    </div>
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
         
            <!-- 글쓰기(방명록) 작성 폼 -->
            <div class="modal fade" id="makeDiary">
               <div class="modal-container modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                     <!-- Modal Header -->
                     <div class="modalHeader">
                        <h4 class="modal-title"></h4>
                        <button type="button" class="btn" data-dismiss="modal"><img class="closeModal" src="${awsPath}/images/close.png"></button>
                     </div>
                     <!-- Modal body -->
                     <div class="modal-body">
                        <form id="diaryModal" action="" method="post">
                           
                              <!--  로그인한 회원 아이디 정보도 함께 보내주기 for 회원제 게시판 -->
                           <input type="hidden" name="user_id" value="${mvo.user_id}">
                           <table class="modalContent">
                                 <tr>
                                    <td colspan="3"><input id="diarytitle" type="text" name="diary_name" placeholder="다이어리 제목을 입력하세요."></td>
                                 </tr>
                                 <tr>
                                    <td><input class="coverPick" id="cover1" type="radio" name="diary_cover" value="cover1.jpg">
                                    <label for="cover1"><img class="cover" src="${awsPath}/cover/cover1.jpg"></label></td>
                                 
                                    <td><input class="coverPick" id="cover2" type="radio" name="diary_cover" value="cover2.jpg">
                                    <label for="cover2"><img class="cover" src="${awsPath}/cover/cover2.jpg"></label></td>
                                 
                                    <td><input class="coverPick" id="cover3" type="radio" name="diary_cover" value="cover3.jpg">
                                    <label for="cover3"><img class="cover" src="${awsPath}/cover/cover3.jpg"></label></td>
                                 
                                    <td><input class="coverPick" id="cover4" type="radio" name="diary_cover" value="cover4.jpg">
                                    <label for="cover4"><img class="cover" src="${awsPath}/cover/cover4.jpg"></label></td>
                                 
                                    <td><input class="coverPick" id="cover5" type="radio" name="diary_cover" value="cover5.jpg">
                                    <label for="cover5"><img class="cover" src="${awsPath}/cover/cover5.jpg"></label></td>
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


            <!-- 방명록 -->
         <div class="container" id="guestBook">
            <h3>방명록</h3>
            <hr>
            <div id="visitList"></div>
         </div>



               <!-- 다이어리 상세페이지 -->
                        <div class="container" id="tempStorage">
                          <div class="book-header">
                              <p id="diaryName"></p>
                             <div class="row-header">
                              <p id="boardTitle"></p>
                              <div class="back-btn"><a id="mainbtn" href="${cpath}/myblog/in" class="button">목록</a></div>
                             </div>
                          </div>
                           <div id="book" class="features">
                               
                           </div>
                              
                           <div id="pagination">
                              <button class="pagebtn" onclick="changePage('prev')"><img id="prev-btn" src="${awsPath}/img/left-dark.png"></button>
                                <!--   <span id="current-page">1</span> / <span id="total-pages"></span> -->
                              <button class="pagebtn" onclick="changePage('next')"><img id="next-btn" src="${awsPath}/img/right-dark.png"></button>
                           </div>
                        </div>




                  <!-- 블로그 관리 -->
                        <div class="container" id="blogSetting">
                          <div class="formDiv">
                           <h3>블로그 관리</h3>
                           <hr>
                           <!-- <p>Integer eu ante ornare amet commetus vestibulum blandit integer in curae ac faucibus integer non. Adipiscing cubilia elementum integer. Integer eu ante ornare amet commetus.</p> -->
                           <div id="form-content">
                              <form action="${cpath}/myblog/blogUpdate" method="post" enctype="multipart/form-data">
                                 <!--  <div class="row gtr-uniform"> -->
                                 <input type="hidden" name="user_id" value="${mvo.user_id}">
                                    <table class="table">
                                       <tr>
                                          <th>프로필 사진</th>
                                          <td id="profile-div">
                                             <div class="imgDiv"><img id ="profile" class="img-circle" src="${myblog.blog_profile}"></div>
                                             <div class="inputDiv">
                                                <label for="blog_profile" class="input-btn">사진변경</label>
                                                <input type="file" accept="image/*" id="blog_profile" name="blog_profile" onchange="readProfile(this)" style="display:none;">
                                                <label for="profileReset" class="input-btn">삭제</label>
                                                <input type="reset" id="profileReset" style="display:none;"/>
                                             </div>                                             
                                          </td>
                                       </tr>
                                     
                                       <tr>
                                          <th>블로그 제목</th>
                                          <td><input type="text" name="blog_title" id="blog_title" value="${myblog.blog_title}"></td>
                                       </tr>
                                       <tr>
                                          <th>소개글</th>
                                          <td><input type="text" name="blog_greetings" id="blog_intro" value="${myblog.blog_greetings}"></td>
                                       </tr>
                                       <tr>
                                          <th>헤더</th>
                                          <td>
                                             <div class="imgDiv"><img id ="blogHeader" src="${myblog.blog_header}"> <br>
                                             <div class="headerDiv">
                                                <label for="blog_header" class="input-btn">사진변경</label>
                                                <input type="file" accept="image/*" id="blog_header" name="blog_header" onchange="readHeader(this)" style="display:none;">
                                                <label for="headerReset" class="input-btn">삭제</label>
                                                <input type="reset" id="headerReset" style="display:none;"/>
                                             </div>
                                             </div>                                                
                                          </td>
                                       </tr>
                                       <tr>
                                          <th>사이드바</th>
                                          <td><div class="color"><input type="color" id="blog_side" name="blog_sidebar" value="${myblog.blog_sidebar}"></div></td>
                                       </tr>
                                       <tr>
                                          <th>배경</th>
                                          <td><div class="color"><input type="color" id="blog_body" name="blog_main" value="${myblog.blog_main}"></div></td>
                                       </tr>
                                    </table>
                                     <div class="btnGroup">
                                          <input class = "blogbtn" type="submit" value="수정">
                                          <input type="reset" value="취소">
                                       </div>
                                    
                                   </form>
                                 </div>            
                           </div>
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
         <script src="${cpath}/resources/js/main.js"></script>
         <script src="${cpath}/resources/js/turn_js/turn.min.js"></script>
       <script src="${cpath}/resources/js/turn_js/turn.js"></script>
       
       
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
       
       
<script>
var book = $("#book");



document.addEventListener('DOMContentLoaded', function () {
    const sectionLinks = document.querySelectorAll('.section-link');
    const containers = document.querySelectorAll('.container');
   
    
    containers.forEach(container => {
        if (container.id === 'diary') {
            container.style.display = 'block';
        } else {
            container.style.display = 'none';
        }
    });
    // 초기에 diary만 보이게 설정하고, 다이어리 초기화
    

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
            
                if (targetContainerId === 'diary') {
                    location.reload();
                }
               
             
            }
        });
    });
});

function makediary(){
   $("#diaryModal").attr("action","${cpath}/myblog/makediary");
    $(".modal-title").text("내 다이어리 만들기");
    $("#diaryidx").remove();
}

function modify(idx){
    
      console.log(idx);
      
      $("#diaryModal").attr("action","${cpath}/myblog/modifydiary");
      $(".modal-title").text("내 다이어리 수정");
      var newInput = $("<input>").attr({
         id:"diaryidx",
           type: "hidden",
           name: "diary_idx",
           value: idx
       });
      $("#diaryModal").append(newInput);
   }

   function getBoard(idx) {
       console.log(idx);
       
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


   function getBoard(idx) {
       console.log(idx);
       
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
       // 첫 페이지 (표지)는 비워둡니다.
       listHtml += "<div class='page'></div>";
       // 두 번째 데이터 항목부터 이미지를 표시합니다.
       $.each(data, function(index, obj) {
     
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
                         $('#boardTitle').show();
                         $('#book').addClass("book-shadow");
                  } else {
                      $('#boardTitle').hide();
                  }
                  /* $(".page").addClass("page-flipping"); */
               
               });
    
    // 현재 페이지 업데이트
    //updateCurrentPage(book.turn('page'));

    // 총 페이지 수 업데이트
    //updateTotalPages(book.turn('pages'));
    
}

/* function updateCurrentPage(pageNumber) {
     document.getElementById('current-page').textContent = pageNumber;
   }

   function updateTotalPages(totalPages) {
     document.getElementById('total-pages').textContent = totalPages;
   }  */

// 페이지 변경 함수
   function changePage(direction) {
     // 현재 페이지와 총 페이지 수를 가져옴
     var currentPage = book.turn('page');
     console.log("currentPage",currentPage);
     var totalPages = book.turn('pages');
     console.log("totalPages",totalPages);
     
     if (direction === 'prev' && currentPage > 3) {
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


    // 방명록 띄우기
    $(document).ready(function(){
      // 페이지가 열릴 때 바로 실행되게 만들어주기
      // HTML이 다 로딩되고나서 아래 코드 실행해라
      loadList();
      
   });
   
   

    function loadList(){
       // 비동기 방식으로 게시글 리스트 가져오기
       // ajax : 요청URL, 어떻게 데이터 받을지, 요청방식 등 ... -> 객체형태로 : {}(JSON 형식)
       // success 시 함수(makeView)를 실행 : ajax로 요청하고 나서 결과를 받아와서 끝나고(돌아와서) 실행하는 함수 -> 콜백함수
       var id = "${mvo.user_id}";
       
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
           listHtml += "<div class='card-img-overlay guestbook-card'>";
            listHtml += "<h4 class='card-title title guestbook-title'>" +obj.user_nick + "</h4>";
            listHtml += "<p class='card-text guestbook-text'>" + obj.gb_content + "</p>";
            listHtml += "<br>";
            listHtml += "<p class='indate'>"+obj.created_at + "</p>";
            listHtml += "<a href='${cpath}/blog/"+obj.guest+"' class='btn btn-sm btn-defalut goGuestBlog-a' style='border:solid 0.5px #dfdfdf;'>구경가기</a>";
            listHtml += "</div></div>";
           
        });
      
      
      

      $("#visitList").html(listHtml);
      
   }
   



</script>


<!-- 사용자 지정색에 따른 블로그 폰트 색상 변경 -->         
<script type="text/javascript">
/* 배경 */
document.addEventListener('DOMContentLoaded', function() {
    var bgColor = "${myblog.blog_main}";
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
    var bgColor = "${myblog.blog_sidebar}";
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



function hexToRgb(hex) {
    var bigint = parseInt(hex.slice(1), 16);
    var r = (bigint >> 16) & 255;
    var g = (bigint >> 8) & 255;
    var b = bigint & 255;

    return { r, g, b };
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
         

   </body>
</html>