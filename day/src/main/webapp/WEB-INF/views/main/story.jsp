<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/> 
<c:set var ="cimage" value ="${pageContext.request.contextPath}/resources/content/"/> 
<c:set var ="awsPath" value ="https://daydayday.s3.ap-northeast-2.amazonaws.com/day"/>


<!DOCTYPE html>
<html lang="en">
    <head>
    
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>D.A.Y 스토리</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${cpath}/resources/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${cpath}/resources/css/story_styles.css" rel="stylesheet" />
        
        <!-- font -->
        <link href="${cpath}/resources/css/Font.css" rel="stylesheet" />
        
        
<style>



#book {
    margin: 2em auto;
    width: 800px;
    height: 600px; /* 높이가 이전에 400px로 되어 있었으나, 페이지 높이와 일치시키기 위해 600px로 수정 */
     overflow: hidden;
}

#book .page {
    width: 400px; /* 책의 한 페이지 너비 */
    height: 600px; /* 책의 한 페이지 높이 */
    background-color: white;
    border: 1px solid #cccccc;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    background-size: cover; /* 추가된 스타일 */
    background-position: center center; /* 추가된 스타일 */
}
.nav-item.dropdown {
  position: relative; /* 드롭다운 버튼을 상대 위치로 설정합니다. */
}

.dropdown-menu {
  position: absolute; /* 드롭다운 메뉴를 절대 위치로 설정합니다. */
  right: 0; /* 드롭다운 메뉴를 상위 요소의 오른쪽 끝에 맞춥니다. */
  left: auto; /* 기본적으로 왼쪽 정렬을 취소합니다. */
}

#portfolio > div > div.text-center > p > strong {
   font-size: 1.5em;
}


span.span-interval {
    margin: 0 1em;
    color: #4141413d;
}

span.category_span {
   font-size: 1.1em;
}



#portfolio > div > div.text-center  a {
   text-decoration: none;
}

/* /* 클릭한 링크 색상 */
/* #portfolio > div > div.text-center a.clicked {
   color: tomato;
} */ */



.total-div {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    padding: 30px;
    gap: 40px;
}

.list-div {
    width: 100%;
    max-width: 420px;
    height: auto;
    box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.25);
    border-radius: 8px;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    align-items: center;
}

.list-div2 {
    width: 100%;
    position: relative;
}

#portfolio > img {
    width: 100%;
    height: auto;
    position: absolute;
    top: 0;
    left: 0;
}

.content-div {
    width: 100%;
    height: auto;
    padding: 16px;
    position: absolute;
    bottom: 0;
    left: 0;
    background: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.title-div {
    text-align: center;
    color: #242424;
    font-size: 24px;
    font-family: AppleSDGothicNeoB00;
    font-weight: 400;
    letter-spacing: 0.20px;
    word-wrap: break-word;
}

.etc-div {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 16px;
}

.writer-div {
    text-align: center;
    color: #363636;
    font-size: 16px;
    font-family: AppleSDGothicNeoB00;
    font-weight: 400;
    letter-spacing: 0.20px;
    word-wrap: break-word;
}

.list-div2 img {
    max-width: 100%;
    height: auto;
}


.scroll-to-top-button {
  position: fixed;
  bottom: 2em;
  right: 4em;
  display: none;
  background-color: #a9a9a9;
  color: #fff;
  border: none;
  border-radius: 50%;
  width: 50px;
  height: 50px;
  font-size: 16px;
  cursor: pointer;
  z-index: 999; /* 다른 요소 위에 표시 */
  
  /* 호버 효과 스타일 */
  transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
}

.scroll-to-top-button:hover {
  background-color: #00315c; 
}

#top-div{
	display:flex;
	justify-content: center;
}
#top-img{
	vertical-align: middle;
    width: 2.2em;
}
</style>        
        
    </head>
    <body id="page-top">
        <jsp:include page="../common/header.jsp"></jsp:include>
        
        
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
           <button id="scrollToTopBtn" class="scroll-to-top-button">
	           <span id="top-div">
	           	<img alt="" src="${awsPath}/main/arrowup.png" id="top-img">
	           </span>
           </button>
            <div class="container">
                <div class="text-center story-category">
                    <p>다양한 일상, 색다른 DAY를 만나보세요!</p>
                    <span class="category_span"><a class="link_tab" id = "tag-1" href="javascript:golife()" onclick="changeColor('tag-1')">라이프</a></span>
                    <span class="span-interval"><strong>|</strong></span>
                    <span class="category_span"><a class="link_tab" id = "tag-2" href="javascript:travel()" onclick="changeColor('tag-2')">여행</a></span>
                    <span class="span-interval"><strong>|</strong></span>
                    <span class="category_span"><a class="link_tab" id = "tag-3" href="javascript:culture()" onclick="changeColor('tag-3')">문화</a></span>
                    <span class="span-interval"><strong>|</strong></span>
                    <span class="category_span"><a class="link_tab" id = "tag-4" href="javascript:it()" onclick="changeColor('tag-4')">IT</a></span>
                    <span class="span-interval"><strong>|</strong></span>
                    <span class="category_span"><a class="link_tab" id = "tag-5" href="javascript:sport()" onclick="changeColor('tag-5')">스포츠</a></span>
                    <span class="span-interval"><strong>|</strong></span>
                    <span class="category_span"><a class="link_tab" id = "tag-6" href="javascript:issue()" onclick="changeColor('tag-6')">시사</a></span>      
                </div>
                       
</div>     
                 </section>
                  <section class="bg-light sec-story" id="portfolio">
                <div class="container">
               <!-- 태그에 따른 글목록 -->
                <div class="scroll-container" id="scroll-container">
                   <div class="row" id="view">
   
                   </div>
                </div>
                
                
            </div>
            </div>
        </section>
        
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
        
        
        
        <!-- 게시글 상세 모달 -->
        <!-- Portfolio item 1 modal popup-->
        <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content modal-sm"">
                    <div class="close-modal" data-bs-dismiss="modal"><img src="${awsPath}/img/close-icon.svg" alt="Close modal" /></div>
                    <div id="modal-container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="modal-body">
                                    <!-- Project details-->
                                    <div class="txt-div">
                                    <ul class="txt-1">
	                                    <li id="stTitle" class="text-uppercase"></li>
	                                    <li id="stDiary"></li>
                                    </ul>
<!--                                     <ul class="txt-2">
	                                    <li id="stNick" class="item-intro text-muted"></li>
                                    </ul>  -->                            
                                    </div>
                                    <div class="detail_story">
	                                    <img id="stImg" class="img-fluid d-block mx-auto" src="" alt="..." />
                                    </div>
                                    <div class="modal-btn">
	                                    <a id="goblog"><button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
	                                       Go Blog
	                                    </button></a>
	                                    <button class="btn btn-primary btn-xl text-uppercase" data-bs-dismiss="modal" type="button">
	                                        <i class="fas fa-xmark me-1"></i>
	                                        Close
	                                    </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${cpath}/resources/js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
        <script src="${cpath}/resources/js/turn_js/turn.min.js"></script>
      <script src="${cpath}/resources/js/turn_js/turn.js"></script>
        
    </body>
    
    
    <script type="text/javascript">
    $(document).ready(function(){
        // HTML이 다 로딩되고나서 아래 코드실행
        golife();
     });
    
    function golife(){
        // 비동기방식으로 게시글 리스트 가져오기 기능
        // ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
        $.ajax({
           url : "board/golife",
           type : "get",
           dataType : "json",
           success : makeView, // 콜백함수
           error : function() { alert("error"); }
        });
     }
    function travel(){
        // 비동기방식으로 게시글 리스트 가져오기 기능
        // ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
        $.ajax({
           url : "board/travel",
           type : "get",
           dataType : "json",
           success : makeView, // 콜백함수
           error : function() { alert("error"); }
        });
     }
    function culture(){
        // 비동기방식으로 게시글 리스트 가져오기 기능
        // ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
        $.ajax({
           url : "board/culture",
           type : "get",
           dataType : "json",
           success : makeView, // 콜백함수
           error : function() { alert("error"); }
        });
     }
    function it(){
        // 비동기방식으로 게시글 리스트 가져오기 기능
        // ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
        $.ajax({
           url : "board/it",
           type : "get",
           dataType : "json",
           success : makeView, // 콜백함수
           error : function() { alert("error"); }
        });
     }
    function sport(){
        // 비동기방식으로 게시글 리스트 가져오기 기능
        // ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
        $.ajax({
           url : "board/sport",
           type : "get",
           dataType : "json",
           success : makeView, // 콜백함수
           error : function() { alert("error"); }
        });
     }
    function issue(){
        // 비동기방식으로 게시글 리스트 가져오기 기능
        // ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
        $.ajax({
           url : "board/issue",
           type : "get",
           dataType : "json",
           success : makeView, // 콜백함수
           error : function() { alert("error"); }
        });
     }
    
    
     function makeView(data) {

        var listHtml = "";
        data.forEach(function (obj) {
            listHtml += `
                <div class="col-lg-4 col-sm-6 mb-4">
                    <div class="portfolio-item">
                        <a class="portfolio-link" id="story" data-idx="\${obj.bd_idx}" data-bs-toggle="modal" href="#portfolioModal1" style="background-image:url('\${obj.bd_content}')">
                            <div class="portfolio-hover">
                                <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
                            </div>
                        </a>
                        <div class="portfolio-caption">
                            <div class="portfolio-caption-heading">\${obj.bd_title}</div>
                            <div class="portfolio-caption-subheading text-muted">\${obj.user_nick}</div>
                            <div class="portfolio-caption-subheading text-muted">\${new Date(obj.created_at).getFullYear() + '.' + ('0' + (new Date(obj.created_at).getMonth() + 1)).slice(-2) + '.' + ('0' + new Date(obj.created_at).getDate()).slice(-2)}</div>
                        </div>
                    </div>
                </div>   
            `; 
            
        });
        

        $("#view").html(listHtml);
    }  
    </script>
    


    <!-- /* 상단 스크롤 버튼 */ -->
    <script type="text/javascript">    
     const scrollToTopButton = document.getElementById('scrollToTopBtn');
   
     // 스크롤 위치가 일정 값 이상일 때 버튼을 표시
     window.addEventListener('scroll', () => {
       if (window.scrollY > 200) { // 스크롤 위치 조건을 원하는 위치로 조정
         scrollToTopButton.style.display = 'block';
       } else {
         scrollToTopButton.style.display = 'none';
       }
     });
   
     // 버튼 클릭 시 페이지 맨 위로 스크롤
     scrollToTopButton.addEventListener('click', () => {
       window.scrollTo({
         top: 0,
         behavior: 'smooth' // 부드러운 스크롤 효과
       });
     });
    </script>
    
    
    <!-- a 태그 색상 변경 -->
    <script type="text/javascript">   
       function changeColor(category) {
           // 모든 링크의 색상을 초기화
           resetColors();
   
           // 클릭된 링크의 색상을 변경
			document.getElementById(category).style.color = '#00315c';
			document.getElementById(category).style.fontWeight = 'bolder';

         }
   
         function resetColors() {
           // 모든 링크의 색상을 원래대로 되돌립니다.
           const categories = ['tag-1', 'tag-2', 'tag-3', 'tag-4', 'tag-5', 'tag-6'];
           categories.forEach(function (category) {
             document.getElementById(category).style.color = '';
             document.getElementById(category).style.fontWeight = 'normal';
           });
         }
         changeColor('tag-1');
         
         $(document).ready(function() {
               $('#portfolioModal1').on('show.bs.modal', function(event) {
                   var button = $(event.relatedTarget); // 클릭한 a 태그의 정보를 가져옴
                   var idx = button.data('idx'); // data-idx 속성 값을 가져옴
                   

                   $.ajax({
                       url: "${cpath}/board/getmodal",
                       data: {"idx": idx},
                       type: "get",
                       dataType: "json",
                       success: function(data) {
                           makeBoard(data, idx); // 여기서 makeBoard 호출
                       },
                       error: function(e) {
                           console.log(e);
                       }
                   });
               });
           });

         function makeBoard(data, clickedIdx) {
               var bookContent = "<div id='book'>";
               bookContent += "<div class='page'></div>"; // 첫 페이지 추가
				$('#goblog').attr("href", "${cpath}/blog/"+data[0].user_id);
               var startingPage = 1; // 시작 페이지 초기화
               var startingData;
               
               console.log(clickedIdx);
               data.forEach(function (item, index) {
                   // 각 페이지에 해당하는 이미지 추가
                   bookContent += `
                       <div class='page' style='background-image: url(\${item.bd_content}); background-size: 200% 100%; background-position: left;'></div>
                       <div class='page' style='background-image: url(\${item.bd_content}); background-size: 200% 100%; background-position: right;'></div>
                   `;
                   if (item.bd_idx === clickedIdx) {
                       startingPage = index * 2 + 2;
                       //console.log(index, startingPage);// 클릭한 게시글의 페이지 번호 계산
                       startingData = item;
                   }
               });
               bookContent += "</div>";

               $('.detail_story').html(bookContent);

               // turn.js 초기화 및 페이지 설정
               $('#book').turn({
                   width: 920,
                   height: 500,
                   autoCenter: true,
                   page: startingPage // 클릭한 게시글의 페이지로 시작
               });

               // 시작 페이지에 해당하는 데이터로 제목, 닉네임, 다이어리 이름 업데이트
               if (startingData) {
                   $('#stTitle').text(startingData.bd_title);
                   $('#stNick').text(startingData.user_nick);
                   $('#stDiary').text(startingData.bd_diary);
               }

               // 페이지가 넘어갈 때마다 업데이트
               $('#book').on("turning", function(event, page, view) {
                   if (page === 1) {
                          event.preventDefault(); // 첫 페이지로 이동 시 이동을 취소
                      } else {
                          // 페이지가 넘어갈 때마다 업데이트
                          var currentPageData = data[Math.floor(page / 2) - 1];
                          $('#stTitle').text(currentPageData.bd_title);
                          $('#stNick').text(currentPageData.user_nick);
                          $('#stDiary').text(currentPageData.bd_diary);
                      }
                   
                   
               });
           }
         $(window).resize(function() {
             var width = $('#book').parent().width();
             var height = width * 0.75; // 가로세로 비율 유지
             $('#book').turn('size', width, height);
         });
         
        
    </script>


    
    
</html>

