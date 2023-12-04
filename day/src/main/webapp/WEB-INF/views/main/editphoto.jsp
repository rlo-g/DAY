<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/>
<c:set var ="awsPath" value ="https://daydayday.s3.ap-northeast-2.amazonaws.com"/>
<c:set var ="address" value ="${address}"/>

<!DOCTYPE html>
<html>
<head>
    <title>스케치 패드</title>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.5.1/fabric.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="${cpath}/resources/css/edit.css" rel="stylesheet" />
<!-- Cropper.js CSS 파일 -->
<link  href="https://cdn.jsdelivr.net/npm/cropperjs/dist/cropper.min.css" rel="stylesheet">
<!-- Cropper.js JavaScript 파일 -->
<script src="https://cdn.jsdelivr.net/npm/cropperjs/dist/cropper.min.js"></script>
<link href="${cpath}/resources/css/header.css" rel="stylesheet" />
 
 <link href="${cpath}/resources/css/Font.css" rel="stylesheet"> 
    
 <style>
body {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    max-height: 911px;
    flex-direction: column;
    background-color: #f8f8f8;
}
li.nav-item.rg {
    margin-left: 0.5em;
}
#canvas-container {
    /* border: 1px solid #ccc; */
    margin-bottom: 20px;
    margin-top: 150px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.25); 
    border-radius: 5px
}
#image-container {
    display: flex;
    overflow-x: auto;
    white-space: nowrap;  /* 자식 요소들이 한 줄에 나열되도록 설정 */
    padding-bottom: 1rem;
}

#sticker-container{
    display: flex;
    overflow-x: auto;
    white-space: nowrap;  /* 자식 요소들이 한 줄에 나열되도록 설정 */
    padding-bottom: 1rem;
    
}
.sticker-img {
    width: 70px; /* 또는 원하는 크기 */
    height: auto; /* 이미지 비율 유지 */
    margin-right: 10px
}

#bg-container {
    display: flex;
    overflow-x: auto;
     white-space: nowrap;  /* 자식 요소들이 한 줄에 나열되도록 설정 */
    padding-bottom: 1rem;
    
}
#start-drawing-button img, #prev-button img , #next-button img , #reset-button img,
#photo-upload-button img, #bg-upload-button img, #text-button img, #eraser-button img,
#delete-button img, #bring-to-front-button img, #send-to-back-button img, #paint-btn img, 
#fill-btn img, #crop-button img
{
    max-width: 1.9rem; /* 원하는 크기로 조절 */
    /* max-height: 30px; */
}


#save-jpg-button img, #temp-box img {
	max-width: 1.5rem;
}
















/* 편집 툴 css */
button#start-drawing-button,
button#prev-button,
button#next-button,
button#reset-button,
button#text-button,
button#eraser-button,
button#delete-button,
button#send-to-back-button,
button#bring-to-front-button,
button#paint-btn,
button#fill-btn,
button#crop-button,
button#save-jpg-button,
div.group-5{
   border: 0px;
   background-color: white;
   margin: 0 1em;
}
div#edit-tool {
   text-align: center;
}

.drawing-tool {
   display: flex;
   flex-direction: row;
   justify-content: center;
   margin-top: 1.5em;
}
.txt-tool {
   display: flex;
   flex-direction: row;
   justify-content: center;
   margin-top: 1.5em;
}
.eraser-tool {
   display: flex;
   flex-direction: row;
   justify-content: center;
   margin-top: 1.5em;
}

.paint-tool {
   margin-top: 1.5em;
}


.text-color-div {
   margin-right: 1em;
}


#text-color-picker, #font-family-selector{
   margin-left: 0.4em;
} 

input#eraser-size-slider, input#line-width {
   margin-left: 0.5em;
}

.line-color-div{
   margin-right: 1em;
}

.line-width-div{
   margin-left: 1em;
}

.tab-content {
   margin-bottom: 1.2em;
}




.frame {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 16px;
  background-color: #f0f0f0;
  border-radius: 5px;
  overflow: hidden;
  border: 1px solid #898989;
  text-align: center;
  font-size: 14px;
  width: 6.5em;
  height: 6.5em;
  cursor:pointer;
}

.frame .add-undefined-glyph {
  width: 24px;
  height: 24px;
}



/* 편집 기본틀 (맨아래)  */
#image-edit-tools {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: #fff;
  padding-bottom: 10px;
  text-align: center;
  z-index: 1000; /* 다른 요소 위에 나타나도록 z-index 설정 */
  /* box-shadow: 0px 2px 12px #0000001a; */
}

#image-edit-tools button {
  margin: 0 10px;
}


/* 이미지 편집틀 (위) */
#img-tools {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  background-color: #fff;
  padding: 15px;
  text-align: center;
  z-index: 1000; /* 다른 요소 위에 나타나도록 z-index 설정 */
  /* box-shadow: 0px 2px 12px #0000001a; */
  margin-bottom: 3.25em;
  display:flex;
  align-items: center;
  justify-content: center;
  border-top : 1px solid #f3f3f3;
  border-bottom : 1px solid #f3f3f3;
  flex-direction: column;
}

div#photo-col {
   width: 100%;
} 

/* #photo-col::-webkit-scrollbar {
  width: 5rem;
}
#photo-col::-webkit-scrollbar-thumb {
  background-color: tomato; 
  border-radius: 5em; 
}
#photo-col::-webkit-scrollbar-track {
  border-radius: 5em;
}
 */
div#bg-col {
   width: 100%;
} 

div#sticker-col {
	width: 100%;
}
#img-edit-tool {
  text-align: center; /* 가운데 정렬 */
  display: flex;
  align-items: center;

}


#img-edit-tool ul {
  list-style: none; /* 리스트 점 제거 */
  display: flex; /* 가로로 정렬 */
  margin: 0;
  padding: 0; /* 기본 패딩 제거 */
  justify-content: center; /* 가운데 정렬 */
}

#img-edit-tool li {
  margin: 0 3em;
  font-family:'SUITE-Regular';
}



#img-edit-tool a {
  text-decoration: none; /* 링크 밑줄 제거 */
  color: inherit; /* 링크 색상을 부모 요소 상속값으로 설정 */
}

div#img-tools{
   position: relative;
   margin-bottom: 1em;
}



/* 자르기 모달 */
#crop-body img {
   max-width: 100%;   
}

#crop-body{
    display: flex;          /* Flexbox 사용 */
    justify-content: center; /* 수평 중앙 정렬 */
    align-items: center;     /* 수직 중앙 정렬 */
    height: 100%;           /* 전체 높이 사용 */
}


.cropper-container.cropper-bg {
    width: 100%;
    height: 400px;
}

#crop-modal {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 85vh;
}

/* .modal-content {
    margin-top: auto;
    margin-bottom: auto;
} */

button.temp-btn {
    margin-left: 0.7em;
    font-size: 9pt;
    border: solid 1px #d7d7d7;
    background-color: white;
    border-radius: 7px;
    color: #a7a7a7;
}


input[type="radio"] {
    margin-right: 0.5rem;
    width: 0.6rem;
}
li.temp-list-li {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 0.7rem;
}
ul#temp-list {
	list-style-type: none;
	padding: 0 1.5rem;
	margin: 1em 0;
}
.name-div {
	font-size: 13.5pt;
}
h4#modal-title {
    font-size: 11pt;
    color: #757575;
}
button#temp_load, button#upload-button, button#confirmCrop, button#aiImgUpload_btn{
    background-color: #e7e7e7;
    border: none;
    border-radius: 7px;
    font-size: 10pt;
    padding: 0.5rem;
    color: #494949;
    width: 5em;
    border: 0.5px solid #ededed;
}
button#upload-button{
	margin-left: 2em;
}
button#close-btn {
    background-color: white;
    border: none;
    border-radius: 7px;
    font-size: 10pt;
    padding: 0.5rem;
    color: #494949;
    width: 5em;
    border: 0.5px solid #ededed;
}

.modal-footer {
    height: 3.5em;
    margin: 0;
    padding-right: 1.5em;
    margin-bottom: 0.95rem;
}

select#diaryname-selector {
    margin-right: 1em;
}

.active-button{
    background-color: #f8f8f8;
    margin: 0 10px;
    box-shadow: 1px 1px 1px 1px #dcdcdc;
    border-radius: 3px;	
}

div#editable-div:focus {
  outline: 0.5px solid #e8e8e8;
  border-radius: 8px;
  }

/* 그림판 header*/

#mainNav{
	padding-top: 1.1em;
	padding-bottom: 1.1em;
}

#download-li, #temp-li, #save-li {
  background-color: #ffffff;
  border-radius: 12px;
  box-shadow: 0px 0px 8px #0000001a;
  width: 140px;
  height: 3em;
  display: flex;
  justify-content: center;
  align-items: center;
  font-weight: 700;
  font-size: 14px;
  text-align: center;
  letter-spacing: 0;
  line-height: normal;
  letter-spacing: 0.1em; /* 글자간격 */   
  cursor: pointer;
}

.text-wrapper-4, .text-wrapper-3{
  align-items: center;
  font-weight: 700;
  font-size: 14px;
  text-align: center;
  letter-spacing: 0;
  line-height: normal;
  letter-spacing: 0.1em; /* 글자간격 */ 
  font-family:'SUITE-Regular';
}

#save-li {
  background-color: #00315c;
  color: white;
  cursor: pointer;

}


.group-4, .group-5 {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

#centered-button {
  text-align: center; /* 내부 요소를 중앙에 정렬합니다 */
}

#centered-button *{
   font-family:'SUITE-Regular';
   font-weight: 500;
}


.centered-button {
   margin-top: 10px;
   margin-bottom: 10px;
   background-color: #00315c; /* 버튼 배경색을 설정합니다 */
   color: white; /* 버튼 텍스트 색을 흰색으로 설정합니다 */
   border: none; /* 버튼 테두리를 제거합니다 */
   padding: 10px 20px; /* 버튼 내부 여백을 설정합니다 */
   cursor: pointer; /* 마우스 오버 시 커서를 포인터로 변경합니다 */
   border-radius: 5px;
   transition: background-color 0.3s;
   font-size:larger; /* 버튼이 너무 작아서 안보여서 바꿈 */
   /* 추가적인 스타일링이 필요할 수 있습니다 */
}
.centered-button:hover {
  background-color: #143858e8; /* 호버 상태에서 배경색을 더 연한 색으로 변경 */
}

.checkbox-container {
  margin-top: 10px; /* 버튼과의 공간을 주기 위해 margin-top 추가 */
  display: block; /* 체크박스를 블록 요소로 만듭니다 */
}
 .no_more {
  margin-top: 10px; /* 버튼과의 공간을 주기 위해 margin-top 추가 */
  text-align: center; /* 텍스트 중앙 정렬 */
}

#guide-body {
  position: relative; /* 부모 요소에 상대적 포지셔닝 적용 */
}
#img-edit-tool ul li:hover {
	color: #00315c;
}

#centered-button {
  position: absolute; /* 버튼에 절대 포지셔닝 적용 */
  top: 50%; /* 상단에서 50% 떨어진 위치 */
  left: 50%; /* 좌측에서 50% 떨어진 위치 */
  transform: translate(-50%, -50%); /* 버튼을 정확히 중앙에 배치 */
  /* 버튼 스타일 */
  padding: 10px 20px;
  color: white;
  border: none;
  cursor: pointer;
}
/* 이미지 크기 조정 */

#guide_img {
  max-width: 100%;  /* 너비를 모달에 맞게 조정 */
  max-height: 100%; /* 높이를 모달에 맞게 조정 */
  width: auto;      /* 너비 자동 조정 */
  height: auto;     /* 높이 자동 조정 */
  display: block;
  margin: auto;     /* 중앙 정렬 */
}

/* 버튼 안에 글자*/
.frame{
	font-family:"SUITE-Regular";
}

#upload-button{
	font-family:"SUITE-Regular";
}

div#editable-div {
padding: 0.25rem;
  outline: none;
  width: 20rem;
  font-family:"SUITE-Regular";
  }


</style>

</head>
<body>

<!-- 가이드 모달  -->
<div class="modal" id="guide_Modal">
  <div class="modal-dialog modal-fullscreen">
    <div class="modal-content">

      <!-- Modal body -->
      <div id="guide-body" class="modal-body">
        <img id="guide_img" alt="" src="https://daydayday.s3.ap-northeast-2.amazonaws.com/EditPage/component/tuto.png">
         
         <div id="centered-button">
         <button class="centered-button">편집 시작하기</button>
            <div class="no_more">
               <label>
               <input type="checkbox" id="noShowAgain"> 더 이상 보지 않기
             </label>
            </div>
         </div>
         
      </div>

    </div>
  </div>
</div>





   <input type="hidden" id="user_id" name="user_id" value="${mvo.user_id}">
  
	 <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
               <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                   <li class="nav-item"><a class="navbar-brand" href="${cpath}/">D.A.Y</a></li>
                   <li class="nav-item rg">
                   	<div class="editable-div div" id="editable-div" contenteditable="true">제목을 입력하세요</div>
                   </li>
               </ul>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                    
                    <li class="nav-item" id="download-li">
		             <button class="group-3" id="save-jpg-button">
		               <div class="group-4">
		                 <div class="text-wrapper-4">내보내기</div>
		                 <img class="img" src="${awsPath}/day/editor/download.png" />
		               </div>
		             </button>                                       
                    </li>
                    
                    <li class="nav-item" id="temp-li">
		             <div class="group-5" id="temp-box">
		               <div class="group-6">
		                 <div id="sticker_temp_upload" type="button">
		                    <div class="text-wrapper-4">임시저장</div>
		                 </div>
		               </div>
		               <div class="group-7">
		                 <div data-bs-toggle="modal" data-bs-target="#temp_Modal">
		                    <img class="img" src="${awsPath}/day/editor/temp.png" />		
		                 </div>
		               </div>
		             </div>                  
                    </li>
                    
                               
                    <li class="nav-item" id="save-li">
		             <div class="group-wrapper" data-bs-toggle="modal" data-bs-target="#myModal">
		               <div class="group-2">
		                 <div>
		                    <div class="text-wrapper-3">등록</div>
		                 </div>
		               </div>
		             </div>                    
                    </li>
             
            </ul>
                </div>
            </div>
        </nav>
  
  
  
   

      






<div id="canvas-container">
  <canvas id="main-canvas" width="1000" height="600"></canvas>
</div>




<div class="container" id="tool-container">
  
   <div id="image-edit-tools">
   
      <div id="img-tools">
         <div id="img-edit-tool">
            <ul>
               <li id="photo-col-btn"><a href="#home" id="tab-1" onclick="changeColor('tab-1')">사진</a></li>
               <li id="bg-col-btn"><a href="#menu1" id="tab-2" onclick="changeColor('tab-2')" >배경</a></li>
               <li id="ai-col-btn"><a href="#menu4"  id="tab-4" onclick="changeColor('tab-4')">A.I</a></li>
            </ul>            
         </div>      

          <div id="photo-col" class="collapse">  
            <div id="image-container">
               <div id="photo-upload-button" class="frame" style="min-width: 6.5em;">
                 <img class="add-undefined-glyph" src="${awsPath}/day/editor/upload.png" alt="업로드">
                 사진<br/>가져오기
                <input type="file" id="image-upload" multiple="multiple" accept="image/*" style= "display: none;">           
               </div>
               
            </div>      
          </div>


          <div id="bg-col" class="collapse"><br>     
            <div id="bg-container">
               <div id="bg-upload-button" class="frame" style="min-width: 6.5em;">
                 <img class="add-undefined-glyph" src="${awsPath}/day/editor/upload.png" alt="업로드">
                 사진<br/>가져오기
                <input type="file" id="background-upload" multiple="multiple" accept="image/*" style= "display: none;">         
               </div>
           </div>
          </div>



          
		  <div id="ai-col" class="collapse"><br>
            <div id="ai-container">
               <button type="button" class="frame" id="aimodal-button" data-bs-toggle="modal" data-bs-target="#imageEdit-modal">
                  <img class="add-undefined-glyph" src="${awsPath}/day/editor/upload.png" alt="업로드">
                  AI<br/>사용하기
               </button>
            </div>
          </div>           
                       
      </div> <!-- img-tools 끝 -->
      
      
      
      
        <div id="edit-tool">
           <button id="prev-button">
             <img src="${awsPath}/day/editor/prev.png" alt="이전으로">
           </button>
           <button id="next-button">
             <img src="${awsPath}/day/editor/next.png" alt="다음으로">
           </button>
           <button id="reset-button">
             <img src="${awsPath}/day/editor/reset.png" alt="초기화">
           </button>
           <button id="delete-button">
             <img src="${awsPath}/day/editor/delete.png" alt="이미지 삭제">
           </button>
           <button id="crop-button">
             <img src="${awsPath}/day/editor/crop.png" alt="자르기">              
           </button>
           <button id="bring-to-front-button">
             <img src="${awsPath}/day/editor/stack-forward.png" alt="이미지 맨앞으로">
           </button>
           <button id="send-to-back-button">
             <img src="${awsPath}/day/editor/stack-backward.png" alt="이미지 맨뒤로">
           </button>
            <button id="start-drawing-button">
             <img src="${awsPath}/day/editor/pencil.png" alt="그리기 모드 시작">
           </button>
           <button id="paint-btn">
              <img src="${awsPath}/day/editor/fill.png" alt="페인트">
           </button>
           <button id="eraser-button">
              <img src="${awsPath}/day/editor/eraser.png" alt="지우개">
           </button>
           <button id="text-button">
             <img src="${awsPath}/day/editor/txt.png" alt="텍스트">
           </button>
           
                      
        
           	
               
           <div class="collapse" id="drawing-options1">
              <div class="drawing-tool">
                 <div class="line-color-div"><input type="color" id="line-color" value="#000000"></div>
                 <div class="line-width-div">두께<input type="range" id="line-width" min="1" max="10" value="2"></div>
              </div>
            </div>
           
           
            <div class="collapse" id="drawing-options2">
              <div class="txt-tool">
                 <div class="text-color-div">텍스트 색상<input type="color" id="text-color-picker" value="#000000"></div>
                 <label for="font-family-selector" class="font-selector">글씨체</label>
                   <select id="font-family-selector">
                       <option value="굴림">굴림</option>
							<option value="궁서">궁서</option>
							<option value="돋움">돋움</option>
							<option value="바탕">바탕</option>
							<option value="'EF_jejudoldam'">제주돌담체</option>
							<option value="'EF_AONE'">A1</option>
							<option value="'GoryeongStrawberry'">고령딸기</option>
							<option value="'EarlyFontDiary'">다이어리체</option>
							<option value="'HSYuji-Regular'">HS유지체</option>
                      
                   </select> 
                 <input type="file" id="font-upload" accept=".ttf,.otf" style="margin-left:2em; display:none;"/>
              </div>
           </div>
           
           <div class="collapse" id="drawing-options3">
              <div class="eraser-tool">
                 <div class="eraser-width-div">지우개 두께<input type="range" id="eraser-size-slider" min="1" max="50" value="10"></div>
              </div>
           </div>
           
           <div class="collapse" id="drawing-options4">
              <div class="paint-tool">
                    <div class="fill-color-div"><input type="color" id="paint-color" value="#000000"></div>
              </div>
           </div>
         </div> <!-- edit-tool 끝 -->
     
   </div> <!-- image-edit-tools 끝 -->

</div> <!-- container 끝 -->



<!-- 업로드  Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-centered modal-dialog modal-m">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" id="modal-title">미리보기</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <img id="canvas-image" src="" alt="Canvas Image" style="width:100%;"/>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
					<button id="upload-button" type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">업로드</button>
					<button id="close-btn" type="button" data-bs-dismiss="modal">취소</button>      
      </div>

    </div>
  </div>
</div>
<!--  -->
<!-- 임시저장  Modal -->
<div class="modal" id="temp_Modal">
  <div class="modal-dialog modal-dialog-centered modal-dialog modal-l">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" id="modal-title">임시저장</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <ul id="temp-stickers-list"></ul>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
         <button id="temp_load" type="button" data-bs-dismiss="modal">확인</button>
        <button id="close-btn" type="button" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>



<!-- 자르기 Modal -->
<div class="modal fade" id="cropModal" tabindex="-1" aria-labelledby="cropModalLabel" aria-hidden="true">
    <div class="modal-dialog" id="crop-modal">
        <div class="modal-content">
            <div class="modal-body" id="crop-body"style="width: 100%; height: 450px;">
                <img id="modalImage">
            </div>
            <div class="modal-footer">
		         <button id="confirmCrop" type="button" data-bs-dismiss="modal">확인</button>
		         <button id="close-btn" type="button" data-bs-dismiss="modal">취소</button>            
            </div>
        </div>
    </div>
</div>


<!--  AI기능 모달 -->
	<div class="modal fade" id="imageEdit-modal">
		<div class="modal-dialog modal-dialog-centered imageEdit-modal__wrap">
			<div class="modal-content">

				<div class="modal-header" id="ai-modal-head">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close" id="imageEdit-modal__closebtn"></button>
					<!-- <h4 class="modal-title" id="AImodal-title">AI 기능을 사용해보세요</h4> -->
					<div class="ai-imgEdit__menu">
						<ul>
							<li id="removeBg-menu"><a href="#Ai-menu1" id="tab-ai-1"
								class="Ai-menu__a" onclick="changeColor('tab-ai-1')">배경 지우기</a></li>
							<li id="imageGenerator-menu"><a href="#Ai-menu2"
								id="tab-ai-2" class="Ai-menu__a"
								onclick="changeColor('tab-ai-2')">이미지 생성</a></li>
							<li id="aieraser-menu"><a href="#Ai-menu3" id="tab-ai-3"
								class="Ai-menu__a" onclick="changeColor('tab-ai-3')">객체 변경</a></li>
							<li id="changeBg-menu"><a href="#Ai-menu4" id="tab-ai-4"
								class="Ai-menu__a" onclick="changeColor('tab-ai-4')">배경 바꾸기</a></li>
						</ul>
					</div>
				</div>

				<div class="ai-imgEdit modal-body">

					<!-- 이미지 편집 플라스크 -->
					<!-- removeBg -->
					<div class="imageEdit-removeBg" id="Ai-menu1">
						<div class="imageEdit-header">
							<h4 class="imageEdit-header__h4">이미지를 업로드하여 본인만의 스티커를 만들어보세요</h4>
						</div>
						<div class="imageEdit-split">
							<div class="imageEdit-split6">
								<form id="imageEdit-removeBg__form" method="post"
									enctype="multipart/form-data">
									<input type="file" name="image" class="imageUpload_1"
										id="for-RemoveBG__file" multiple="multiple" accept="image/*"
										style="display: none;" required> <img
										class="modal-noneImg" id="none_RB"
										src="${awsPath}/EditPage/component/none.jpg" alt="No-uploaded">
									<div class="erdiv">
										<div class="imageEdit-split4">
											<div id="for-RemoveBG" class="frame"
												style="min-width: 6.5em;"
												onclick="aiUserUpload('for-RemoveBG')">사진 가져오기</div>
										</div>
										<input class="Aimodal-btn split6__btn frame" type="submit"
											id="imageEdit-removeBg__sub" value="배경 지우기">

										<!-- <input class="Aimodal-btn split6__btn" type="submit" id="imageEdit-removeBg__sub" value="배경 지우기"> -->
									</div>
								</form>
							</div>
						</div>
					</div>

					<!-- imageGenerator 생성(Kalo)-->
					<div class="imageEdit-makeImg" id="Ai-menu2">
						<div class="imageEdit-header">
							<h4 class="imageEdit-header__h4">생성할 이미지의 텍스트를 영어 또는 한국어로
								입력해주세요</h4>
						</div>
						<div class="imageEdit-split" id="ie-s2">
							<div class="imageEdit-split4">
								<form id="imageEdit-makeImg__form" method="post">
									<h4 id="makeImg-style">텍스트를 입력해주세요</h4>
									<textarea class="imgaeEdit-makeImg__textarea txt-area"
										id="makeImg-textarea__pos" name="prompt"></textarea>
									<h4 id="makeImg-style">원하는 스타일</h4>
									<select name="art_style" id="art_style">
										<option value="">선택 안함</option>
										<option value="by Renoir">Artist Renoir</option>
										<option value="by Picasso">Artist Picasso</option>
										<option value="by Gogh">Artist Gogh</option>
										<option value="by Monet">Artist Monet</option>
										<option value="Anime">Anime</option>
										<option value="cartoon">Cartoon</option>
										<option value="Oriental Painting">Oriental</option>
										<option value="Neon">Neon</option>
									</select>
									<h4 id="makeImg-style">제외하고 싶은 요소</h4>
									<textarea class="imgaeEdit-makeImg__textarea"
										id="makeImg-textarea__neg" name="negative_prompt"></textarea>
									<!-- 이미지에서 생성하고 싶지 않은 요소 -->

									<input class="Aimodal-btn split4__btn" type="submit"
										id="imageEdit-makeImg__sub" value="이미지 생성하기">
								</form>
							</div>
							<div class="imageEdit-split6">
								<img class="modal-noneImg" id="none_GI"
									src="${awsPath}/EditPage/component/none.jpg" alt="No-uploaded">
							</div>
						</div>
					</div>

					
            <!--ai 지우개-->
            <div class="imageEdit-changeObject" id ="Ai-menu3">
               <div class="imageEdit-header">
                 <h4 class="imageEdit-header__h4">이미지의 요소를 클릭해서 객체 변경 기능을 사용해보세요</h4>
               </div>
               
               <div class="imageEdit-split-container">
                 <form id="imageEdit-changeObject__form" method="post" enctype="multipart/form-data">
                   <div class="imageEdit-split-img">
                     <div id="CO-img">
                         <img class="modal-noneImg" id="none_CO" src="${awsPath}/EditPage/component/none.jpg" alt="No-uploaded">
                     </div>
                   </div>
                     
                     <div id="CO-change">
		                <div class="imageEdit-split-txt bg-btn">
		                  <div id="for-changeObject" class="frame" style="min-width: 6.5em;" onclick="aiUserUpload('for-changeObject')">
		                    사진 가져오기
		                  </div>
                         
                       <input type="file" name="image" class="imageUpload_3" accept="image/*" id="for-changeObject__file" style="display:none;" required> 
                       <input class="Aimodal-btn split6__btn frame" type="submit" id="imageEdit-changeObject_sub" value="객체 변경">
		                </div>                     
                       <div id="bg-txt1">
	                       <h4 id="bg-style1">텍스트를 입력해주세요</h4>
	                       <textarea name="prompt" id="ChnageObject__prompt"></textarea>
                       </div>
                    </div>
                 </form>
              </div>              
              </div>
					<!--배경 바꾸기-->
					<div class="imageEdit-ChangeBg" id="Ai-menu4">
						<div class="imageEdit-header">
							<h4 class="imageEdit-header__h4">이미지의 요소를 클릭하고 이미지의 배경을
								바꿔보세요</h4>
						</div>
						<div class="imageEdit-split-container">
							<form method="post" id="imageEdit-bgChange__form"
								enctype="multipart/form-data">
								<div class="imageEdit-split-img">
									<div id="CB-img">
										<img class="modal-noneImg" id="none_CB"
											src="${awsPath}/EditPage/component/none.jpg"
											alt="No-uploaded" id="for-changeBG__file">
									</div>
								</div>

								<div id="BG-change">
									<div class="imageEdit-split-txt bg-btn">
										<div id="for-changeBG" class="frame" style="min-width: 6.5em;"
											onclick="aiUserUpload('for-changeBG')">사진 가져오기</div>

										<input type="file" name="image" class="imageUpload_4"
											id="for-changeBG__file" multiple="multiple" accept="image/*"
											style="display: none;" required> <input
											class="Aimodal-btn split6__btn frame" type="submit"
											id="imageEdit-bgChange_sub" value="배경 바꾸기">
									</div>
									<div id="bg-txt2">
										<h4 id="bg-style2">배경 텍스트를 입력해주세요</h4>
										<textarea name="prompt" id="ChangeBg__prompt"></textarea>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>


				<!--modal-body 끝-->
				<div class="modal-footer">
					<button id="aiImgUpload_btn" class="Aimodal-footer__btn"
						onclick="aiImgUpload()" type="button" data-bs-dismiss="modal">확인</button>
					<button id="close-btn" type="button" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
		<!--modal content 끝-->
	</div>
	<!--  aiModal 끝 -->

					
            





	
<!-- js -->
<script>
//튜토리얼 모달창
$(document).ready(function(){
	   if (localStorage.getItem('noShowModal') !== 'true') {
	       $("#guide_Modal").show();
	   }
});
	//"편집 시작하기" 버튼에 클릭 이벤트 리스너를 추가합니다.
	document.querySelector('.centered-button').addEventListener('click', function() {
	  // "더 이상 보지 않고 숨기기" 체크박스의 상태를 확인합니다.
	  var noShowChecked = document.getElementById("noShowAgain").checked;
	  if (noShowChecked) {
	    // 체크박스가 선택되어 있으면 로컬 스토리지에 상태를 저장합니다.
	    localStorage.setItem('noShowModal', 'true');
	  }
	  // 모달을 숨깁니다.
	  $("#guide_Modal").hide();
	});

	// 페이지 로드 시 로컬 스토리지를 확인하여 모달을 표시할지 결정하는 함수
	$(document).ready(function() {
	  if (localStorage.getItem('noShowModal') !== 'true') {
	    $("#guide_Modal").show();
	  }
	});








  document.addEventListener('DOMContentLoaded', function() {
    // 각 <a> 태그에 클릭 이벤트 리스너 추가
    document.querySelectorAll('#img-edit-tool a').forEach(function(link) {
      link.addEventListener('click', function(event) {
        event.preventDefault(); // 기본 이벤트 방지

        // 클릭된 <a> 태그의 href 속성값을 가져옴
        var targetId = this.getAttribute('href').substr(1);

        // 모든 탭을 숨김
        document.querySelectorAll('.tab-content > div').forEach(function(tab) {
          tab.classList.remove('active', 'show');
        });

        // 클릭된 탭만 보이도록 설정
        document.getElementById(targetId).classList.add('active', 'show');
      });
    });
  });
</script>

<!-- 그림판 기능 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/fabric.js/4.5.0/fabric.min.js"></script>
<script>


// canvas 정의
var canvas = new fabric.Canvas('main-canvas');

//반응형 캔버스
function resizeCanvas() {
    var width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
    var height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;

    // CSS 미디어 쿼리에 따라 적절한 캔버스 크기를 결정합니다.
    if (width <= 320) {
        // 스마트폰 세로
        canvas.setWidth(width * 0.5);
        canvas.setHeight(height * 0.55);
    } else if (width <= 767) {
        // 태블릿 세로
        canvas.setWidth(width * 0.5);
        canvas.setHeight(height * 0.55);
    }  // 스마트폰 가로 모드
    if (width <= 767 && height < width) {
        canvas.setWidth(height * 0.5);
        canvas.setHeight(height * 0.55);
    }
    // 태블릿 가로 모드
    else if (width >= 768 && width <= 1365 && height < width) {
        canvas.setWidth(width * 0.5);
        canvas.setHeight(height * 0.55);
    }
    // iPad Pro 가로, 데스크탑
    else if (width >= 1366 && width <= 1599) {
        canvas.setWidth(width * 0.5);
        canvas.setHeight(height * 0.55);
    }
    // 큰 모니터 16:9
    else if (width >= 1600) {
        canvas.setWidth(width * 0.6);
        canvas.setHeight(height * 0.65);
    }
    // 객체들의 스케일을 조정할 수 있습니다.
    // 예를 들어, 캔버스 크기가 변경되었을 때 모든 객체들의 스케일을 조정하려면
    // 여기에 캔버스 객체들을 반복하면서 스케일을 조정하는 로직을 추가합니다.

    canvas.renderAll();
}


// 특정 링크의 색상을 변경하는 함수
function changeColor(category) {
    // 모든 링크의 색상을 초기화
    resetColors();

    // 클릭된 링크의 색상을 변경
    document.getElementById(category).style.color = '#00315c';
    document.getElementById(category).style.fontWeight = 'bolder';
    }

//모든 링크의 색상을 초기화하는 함수
function resetColors() {
    var categories = ['tab-1', 'tab-2', 'tab-4', 'tab-ai-1', 'tab-ai-2', 'tab-ai-3', 'tab-ai-4'];
    categories.forEach(function (category) {
        document.getElementById(category).style.color = '#000000';
        document.getElementById(category).style.fontWeight = '200';
        });
    }


  
  
  // 콜랩스 버튼 active  
  function removeActive() {
    document.querySelectorAll('button').forEach(function(btn) {
        btn.classList.remove('active-button');
    });
}
  
  document.querySelectorAll('button').forEach(function(button) {
	    button.addEventListener('click', function() {
	        // 모든 버튼에서 active-button 클래스 제거
			removeActive();

	        // 현재 클릭된 버튼에 active-button 클래스 추가
	        this.classList.add('active-button');
	    });
	}); 
  

 
  
  
  
  
// 그림판 기능
document.addEventListener('DOMContentLoaded', function () {
	
     const ctx = canvas.getContext('2d');
     var imageContainer = document.getElementById('image-container');
     var uploadInput = document.getElementById('image-upload');
     var propertiesPanel = document.getElementById('properties-panel'); // 편집 옵션을 담은 패널의 ID
     var photoButton = document.getElementById('photo-button');
     var backgroundButton = document.getElementById('background-button');
     var bgContainer = document.getElementById('bg-container');
     var bgUploadInput = document.getElementById('background-upload');
     var isDrawingMode = false;
     var undoStack = [];
     var redoStack = [];
     var prevButton = document.getElementById('prev-button');
     var nextButton = document.getElementById('next-button'); // 다음 버튼 요소 가져오기
     var textButton = document.getElementById('text-button'); // 텍스트 버튼 요소 가져오기
     var isTextMode = false; // 텍스트 모드 상태 변수
     var activeText = null;

     

   

/*      // 캔버스 기본 배경색 설정 
     canvas.backgroundColor = 'white';
     canvas.renderAll();  // 변경사항 저장 */

     
     
     
     // 페인트
     var fillColorPicker = document.getElementById('paint-color');
     var changeFillColorButton = document.getElementById('paint-btn');
     var isPaintMode = false;  // 페인트 기능(비활성화)
     
     // 페인트 - 배경
     function fillBackground(options){        
         if (!options.target) { 
            // 아무 객체도 선택되지 않은 경우     
            if(isPaintMode){
               // 페인트 활성화
                var selectedColor = fillColorPicker.value;
                canvas.backgroundColor = selectedColor;
                canvas.renderAll();             
            }
         } 
     }     
     
     // 페인트 기능 수행
     changeFillColorButton.addEventListener('click', function() {
        
         var selectedColor = fillColorPicker.value;
         var activeObject = canvas.getActiveObject();
        isPaintMode = !isPaintMode; // 페인트 모드 상태 토글
      
         if(isPaintMode){
            // 페인트 활성화
            canvas.on('mouse:down', fillBackground); // 배경채우기 함수
            activeObject.set('fill', selectedColor);
            canvas.renderAll();       
            
         }else{
            canvas.off('mouse:down', fillBackground);
         }
         
     });  
     
     
     
 
  
  
   // 텍스트 및 폰트
     document.getElementById('font-upload').addEventListener('change', function(e) {
          var file = e.target.files[0];
          if (file) {
              var reader = new FileReader();
              reader.onload = function(event) {
                  var fontData = event.target.result;
                  applyFont(file.name, fontData);
              };
              reader.readAsDataURL(file);
          }
      });

      function applyFont(fontName, fontData) {
          // 폰트 스타일 적용
          var styleNode = document.createElement('style');
          styleNode.type = 'text/css';
          var fontFaceRule = `
              @font-face {
                  font-family: '${fontName}';
                  src: url('${fontData}') format('truetype');
              }
          `;
          styleNode.textContent = fontFaceRule;
          document.head.appendChild(styleNode);

          // 현재 선택된 텍스트 박스에 폰트 적용
          updateSelectedTextboxFont(fontName);
      }

      function updateSelectedTextboxFont(fontName) {
          var activeObject = canvas.getActiveObject();
          if (activeObject && activeObject.type === 'textbox') {
              activeObject.set('fontFamily', fontName);
              canvas.renderAll();
          }
      }
     
      
     document.getElementById('font-family-selector').addEventListener('change', function(e) {
          var selectedFontFamily = e.target.value;
          var activeObject = canvas.getActiveObject();

          // 활성화된 객체가 텍스트 박스인 경우에만 글씨체 변경
          if (activeObject && (activeObject.type === 'text' || activeObject.type === 'i-text' || activeObject.type === 'textbox')) {
              activeObject.set('fontFamily', selectedFontFamily);
              canvas.renderAll();
          }
      });
        
     document.getElementById('text-color-picker').addEventListener('input', function(e) {
          var selectedColor = e.target.value;
          var activeObject = canvas.getActiveObject();

          // 활성화된 객체가 텍스트 관련 객체인 경우에만 색상 변경
          if (activeObject && (activeObject.type === 'text' || activeObject.type === 'i-text' || activeObject.type === 'textbox')) {
              activeObject.set('fill', selectedColor);
              canvas.renderAll();
          }
      });

      // 텍스트 도구 활성화 함수
     function enableTextMode() {
         isTextMode = true;
         canvas.discardActiveObject(); // 선택된 객체 취소
         canvas.requestRenderAll();
         activeText = null; // 새로운 텍스트 상자 생성을 위해 activeText 초기화
     }

     // 텍스트 버튼 클릭 이벤트 핸들러
     textButton.addEventListener('click', function () {
         enableTextMode();
     });

     // 캔버스 클릭 이벤트 핸들러
     canvas.on('mouse:down', function (options) {
    if (isTextMode) {
        var pointer = canvas.getPointer(options.e);
        if (!activeText) {
            // 활성화된 텍스트 상자가 없을 때만 새로운 텍스트 상자 생성
            activeText = new fabric.Textbox('텍스트 입력', {
                left: pointer.x,
                top: pointer.y,
                fontFamily: 'Arial',
                fill: 'black',
            });
            canvas.add(activeText);
            canvas.setActiveObject(activeText);
            canvas.requestRenderAll();
        }
    } else {
        // 텍스트 모드가 아닐 때, 다른 작업 수행
    }
    
    // 텍스트 모드 비활성화
    disableTextMode();
});

    // 텍스트 입력 모드 비활성화 함수
    function disableTextMode() {
        isTextMode = false;
        activeText = null; // 활성화된 텍스트 상자 초기화
    }
   
    // 캔버스 클릭 이벤트 핸들러: 텍스트 모드 비활성화
    canvas.on('mouse:down', function () {
        disableTextMode();
    });     
       
     ///// 텍스트 끝 /////
     
     
     
     // 앞으로 가져오기
     document.getElementById('bring-to-front-button').addEventListener('click', function() {
        event.preventDefault();  // 기본 이벤트를 방지합니다.
        event.stopPropagation(); // 이벤트 버블링을 막습니다.  
        
        var activeObject = canvas.getActiveObject();
        if (activeObject) {
             canvas.bringForward(activeObject);
             
         }
      });

     // 뒤로 보내기
      document.getElementById('send-to-back-button').addEventListener('click', function() {
         event.preventDefault();  // 기본 이벤트를 방지합니다.
          event.stopPropagation(); // 이벤트 버블링을 막습니다.
          
          var activeObject = canvas.getActiveObject();
          if (activeObject) {
              canvas.sendBackwards(activeObject);
              
          }
      });
     
     
     
     
     // 지우개
     document.getElementById('eraser-button').addEventListener('click', function() {
          // 그리기 모드 활성화
          canvas.isDrawingMode = true;

          // 지우개와 같은 효과를 내기 위해 선의 색상을 캔버스의 배경 색상으로 설정
        canvas.freeDrawingBrush.color = canvas.backgroundColor || 'white';
          canvas.freeDrawingBrush.width = 10; // 지우개의 두께 설정
          
      });
     
     // 지우개 두께
     document.getElementById('eraser-size-slider').addEventListener('input', function(e) {
          var eraserSize = parseInt(e.target.value, 10);
          // 지우개 모드가 활성화된 경우에만 두께 업데이트
          if (canvas.isDrawingMode && canvas.freeDrawingBrush.color === (canvas.backgroundColor || 'white')) {
              canvas.freeDrawingBrush.width = eraserSize;
          }
      });
     
     
     
     
     
      // 삭제 버튼 이벤트 핸들러 (버튼 클릭)
      document.getElementById('delete-button').addEventListener('click', function(event) {
       event.preventDefault();  // 기본 이벤트를 방지합니다.
       event.stopPropagation(); // 이벤트 버블링을 막습니다.
   
       var activeObject = canvas.getActiveObject();
       if (activeObject) {
           canvas.remove(activeObject);
       }
   });
   
   
      document.addEventListener('keydown', function(event) {
          // 키보드 이벤트 중에서 'Delete' 키를 눌렀을 때만 처리
          if (event.key === 'Delete') {
              event.preventDefault();  // 기본 이벤트를 방지합니다.
              event.stopPropagation(); // 이벤트 버블링을 막습니다.
      
              var activeObject = canvas.getActiveObject();
              if (activeObject) {
                  // 선택된 객체가 여러 개인지 확인합니다.
                  if (activeObject.type === 'activeSelection') {
                      // activeSelection 내의 모든 객체를 반복하여 삭제합니다.
                      activeObject.forEachObject(function(obj) {
                          canvas.remove(obj);
                      });
                      // 그룹을 해체합니다.
                      canvas.discardActiveObject();
                  } else {
                      // 단일 객체를 삭제합니다.
                      canvas.remove(activeObject);
                  }
                  canvas.requestRenderAll(); // 캔버스를 다시 렌더링합니다.
              }
          }
      });
     
     
   
      
     
   // 사진 추가
     document.getElementById('photo-upload-button').addEventListener('click', function () {
    	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
    	 canvas.requestRenderAll();
    	 
         // 파일 업로드 버튼 클릭
         document.getElementById('image-upload').click();
     });
          
     // 이미지를 Canvas에 추가하는 함수
     function addImageToCanvas(imgElement) {
       fabric.Image.fromURL(imgElement.src, function (oImg) {
         canvas.add(oImg).renderAll();
         // 이미지를 선택하면 편집 옵션 패널을 표시
         propertiesPanel.style.display = 'block';
         // 선택된 객체의 속성을 패널에 표시할 수 있습니다.
         // 예: propertiesPanel.querySelector('.width').textContent = oImg.getScaledWidth();
       });
     }
        
     uploadInput.addEventListener('change', function (e) {
         var files = e.target.files;
        

         for (var i = 0; i < files.length; i++) {
           (function (file) {
             var reader = new FileReader();
             reader.onload = function (e) {
               var img = new Image();
               img.src = e.target.result;
               img.style.maxHeight = '5.7em';
               img.style.marginLeft = '2em';
               img.style.cursor='pointer';
               img.onclick = function () {
                 // 이미지 클릭 시 Canvas에 추가
                 addImageToCanvas(img);
               };
               imageContainer.appendChild(img);
             };
             reader.readAsDataURL(file);
           })(files[i]);
         }
       });     
 
     // 이미지 추가 끝 ---------------
     
     
     
     
     // 자르기 

   let selectedImage = null;
   let cropper;
   
   canvas.on('selection:created', function(e) {
       if (e.target.type === 'image') {
           selectedImage = e.target;
       }
   });
   
   document.getElementById('crop-button').addEventListener('click', function() {
       if (!selectedImage) {
           alert('이미지를 선택해주세요!');
           removeActive();
           return;
       }
   
       // Cropper 초기화
       if (cropper) {
           cropper.destroy();
       }
       
       // 모달에 이미지 표시
       var imgElement = selectedImage.getElement();
       var modalImage = document.getElementById('modalImage');
       modalImage.src = imgElement.src;
   
       // 부트스트랩 모달 표시
       var cropModal = new bootstrap.Modal(document.getElementById('cropModal'));
       cropModal.show();
          
       
       cropper = new Cropper(modalImage, {
           // cropper 세부 기능 설정
           aspectRatio: NaN,
           viewMode: 1,
           data: {
               width: 400,
               height: 300
           },
           minContainerWidth: 400,   // 컨테이너 최소 너비
           minContainerHeight: 400,  // 컨테이너 최소 높이
       });
   });
   
   
   document.getElementById('confirmCrop').addEventListener('click', function() {
       if (cropper) {
           // Cropped 이미지를 캔버스로 가져오기
           var croppedCanvas = cropper.getCroppedCanvas();
           var croppedImg = new Image();
           croppedImg.src = croppedCanvas.toDataURL();
   
           croppedImg.onload = function() {
               // 새로운 fabric.Image 객체 생성 및 캔버스에 추가
               var fabricImage = new fabric.Image(croppedImg, {
                   left: selectedImage.left,
                   top: selectedImage.top
               });
               canvas.remove(selectedImage);
               canvas.add(fabricImage);
   
               // Cropper 인스턴스 제거
               cropper.destroy();
               cropper = null;
   
               // 모달 숨기기
               var cropModal = bootstrap.Modal.getInstance(document.getElementById('cropModal'));
               cropModal.hide();
           };
       }
  	  canvas.discardActiveObject(); // 선택된 객체 초기화
	  canvas.requestRenderAll();
   });
   


   
        
       
     //배경이미지 추가
     document.getElementById('bg-upload-button').addEventListener('click', function () {
    	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
    	 canvas.requestRenderAll();
         // 파일 업로드 버튼 클릭
         document.getElementById('background-upload').click();
     });
     
      function setCanvasBackground(imgElement) {
         // 이미지의 src 속성이 "upload.png"가 아닌 경우에만 동작
         var img = new Image();
         img.src = imgElement.src;
         
        if (imgElement.src.includes("upload.png")) {
          return;
        }

          img.onload = function () {
              canvas.setBackgroundImage(imgElement.src, canvas.renderAll.bind(canvas), {
                  scaleX: canvas.width / img.width,
                  scaleY: canvas.height / img.height,
                  top: 0,
                  left: 0
              });
          };
      }
      
      bgContainer.addEventListener('click', function (e) {
          var clickedImage = e.target;
          // 클릭한 이미지를 canvas의 배경으로 설정
          setCanvasBackground(clickedImage);
      });

      // 배경이미지를 Canvas에 추가하는 함수 (이미지 추가와 배경 설정을 분리)
      function addImageToCanvas(imgElement) {
          fabric.Image.fromURL(imgElement.src, function (oImg) {
              canvas.add(oImg).renderAll();
              // 이미지를 선택하면 편집 옵션 패널을 표시
              propertiesPanel.style.display = 'block';
              // 선택된 객체의 속성을 패널에 표시할 수 있습니다.
              // 예: propertiesPanel.querySelector('.width').textContent = oImg.getScaledWidth();
          });
      }
     
     
     bgUploadInput.addEventListener('change', function (e) {
          var files = e.target.files;
          
          for (var i = 0; i < files.length; i++) {
            (function (file) {
              var reader = new FileReader();
              reader.onload = function (e) {
                var img = new Image();
                img.src = e.target.result;
                img.style.height = '5.7em';
                img.style.marginLeft = '2em';
                img.style.cursor='pointer';
                img.onclick = function () {
                  // 이미지 클릭 시 Canvas에 추가 (배경)
                  setCanvasBackground(img);
                };
                bgContainer.appendChild(img);
              };
              reader.readAsDataURL(file);
            })(files[i]);
          }
        });
     

     
     
     
     // 이전으로 돌아가는 함수
     function undo() {
         if (undoStack.length > 0) {
             var previousState = undoStack.pop(); // 스택에서 이전 상태를 팝
             redoStack.push(JSON.stringify(canvas.toDatalessJSON())); // 현재 상태를 다음 행동 스택에 저장
             canvas.loadFromJSON(previousState); // 이전 상태로 canvas 복원
             canvas.renderAll(); // canvas 다시 그리기
         }
         // 버튼 상태 업데이트
         updateButtonState();
     }
     
     // 다음으로 이동하는 함수
     function redo() {
         if (redoStack.length > 0) {
             var nextState = redoStack.pop(); // 스택에서 다음 상태를 팝
             undoStack.push(JSON.stringify(canvas.toDatalessJSON())); // 현재 상태를 이전 행동 스택에 저장
             canvas.loadFromJSON(nextState); // 다음 상태로 canvas 복원
             canvas.renderAll(); // canvas 다시 그리기
         }
         // 버튼 상태 업데이트
         updateButtonState();
     }     
     
     
  
     
     
     // 그리기 모드
     function toggleDrawingMode() {
        isDrawingMode = !isDrawingMode;
        if (isDrawingMode) {
          // 그리기 모드가 활성화되면 마우스로 그림을 그릴 수 있도록 설정
          canvas.isDrawingMode = true;
        } else {
          // 그리기 모드가 비활성화되면 그리기 모드를 해제
          canvas.isDrawingMode = false;
        }
      }

     
      // 그리기 버튼 클릭 이벤트 핸들러
      document.getElementById('start-drawing-button').addEventListener('click', function () {
     	canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
    	canvas.requestRenderAll();
        toggleDrawingMode();
        
        // 지우개 -> 그리기 펜 변경 (색상, 두께)
        if (canvas.freeDrawingBrush.color === canvas.backgroundColor){
           canvas.freeDrawingBrush.color = document.getElementById('line-color').value;  // 펜 컬러 불러오기               
           /* canvas.freeDrawingBrush.width = document.getElementById('line-width').value; */                    
        }
      });
      
  
   // 키보드 esc 감지 시 그리기/텍스트 모드 취소  
      document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape') {
          // 'Esc' 키를 누르면 그리기 모드 비활성화
          isDrawingMode = false;
          canvas.isDrawingMode = false;

          disableTextMode();  // 텍스트 모드 비활성화
          
     	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
    	 canvas.requestRenderAll();
          
          $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
          resetColors();  // 콜랩스 색상 초기화
          removeActive(); // 콜랩스 active 초기화
        }
      });

   
   // canvas 밖 클릭시 그리기 모드 취소 
      document.addEventListener('click', function (event) {
        // 클릭된 요소가 #canvas-container인지 확인
        const canvasContainer = document.getElementById('canvas-container');
        const toolContainer = document.getElementById('tool-container');
        
        if (!canvasContainer.contains(event.target) && !toolContainer.contains(event.target)) {
          // #canvas-container, #toolContainer 외의 부분 클릭하면 그리기 모드 비활성화
          isDrawingMode = false;
          canvas.isDrawingMode = false;
          
          // 텍스트 모드 비활성화
          disableTextMode();
          
     	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
    	 canvas.requestRenderAll();
     	 
          $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
          resetColors();  // 콜랩스 색상 초기화
          removeActive(); // 콜랩스 active 초기화
        }
      });
      
      
      
      
     // 초기화 버튼
      document.getElementById('reset-button').addEventListener('click', function () {
          // 사용자에게 확인 메시지 표시
          var confirmReset = confirm("초기화하시겠습니까? 이 작업은 현재까지의 그림을 모두 지우고 새로 시작합니다.");

          // 사용자가 "예"를 선택한 경우에만 초기화 실행
          if (confirmReset) {
              // canvas를 완전히 비우기
              canvas.clear();
              // 캔버스 기본 배경색 설정 
              canvas.backgroundColor = 'white';
              canvas.renderAll();  // 변경사항 저장
          }
              removeActive(); // 콜랩스 active 초기화
      });
     
      
      
      // 이전 버튼 클릭 이벤트 핸들러
      prevButton.addEventListener('click', function () {
          undo();
      });
      // 다음 버튼 클릭 이벤트 핸들러
      nextButton.addEventListener('click', function () {
          redo();
      });
      

      // canvas 상태를 스택에 저장하는 함수 (이전 상태 기록)
      function saveCanvasState() {
          var currentState = JSON.stringify(canvas.toDatalessJSON()); // 현재 canvas 상태를 문자열로 저장
          undoStack.push(currentState); // 스택에 현재 상태 저장
          // 다음 행동 스택 비우기
          redoStack.length = 0;
          // 버튼 상태 업데이트
          updateButtonState();
      }

      // canvas에 변화가 있을 때마다 상태를 스택에 저장
      canvas.on('object:modified', saveCanvasState);
      canvas.on('object:removed', saveCanvasState);

      // 초기 상태에서는 이전 버튼과 다음 버튼 비활성화
      updateButtonState();

      // 버튼 상태 업데이트 함수
      function updateButtonState() {
          // 이전 버튼 비활성화 조건: undoStack이 비어 있을 때
          prevButton.disabled = undoStack.length === 0;
          // 다음 버튼 비활성화 조건: redoStack이 비어 있을 때
          nextButton.disabled = redoStack.length === 0;
      }
     

      
      
     // 이미지 저장
     document.getElementById('save-jpg-button').onclick = function() {
          var dataURL = canvas.toDataURL({
            format: 'jpeg',
            quality: 0.9
          });
          var link = document.createElement('a');
          link.download = 'canvas-image.jpg';
          link.href = dataURL;
          link.click();
      };
      
      
      
      
      // 그리기 선 색상
      document.getElementById('line-color').addEventListener('input', function (e) {
          lineColor = e.target.value;
          if (isDrawingMode) {
              canvas.freeDrawingBrush.color = lineColor; // 현재 선 색상 업데이트
          }
      });

      // 선 두께 변경 이벤트 핸들러
      document.getElementById('line-width').addEventListener('input', function (e) {
          lineWidth = parseInt(e.target.value, 10);
          if (isDrawingMode) {
              canvas.freeDrawingBrush.width = lineWidth; // 현재 선 두께 업데이트
          }
      });
   
      
      
      
      
      // 그리기 버튼 클릭 시 세부 버튼 생성 (색상, 두께)
        document.getElementById('start-drawing-button').addEventListener('click', function() {
             var drawingOptions = new bootstrap.Collapse(document.getElementById('drawing-options1'));
             drawingOptions.toggle();
             
        	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
        	 canvas.requestRenderAll();
             
             // 그리기모드 활성화
             isDrawingMode = true;
             canvas.isDrawingMode = true;
             
             // 텍스트 모드 비활성화
             disableTextMode();
             
             // 페인트 비활성화
             isPaintMode=false;
             canvas.off('mouse:down', fillBackground);
             
             $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
             resetColors();  // 콜랩스 색상 초기화
           });
      
      
      
      
      // 텍스트 버튼 클릭 시 세부 버튼 생성
        document.getElementById('text-button').addEventListener('click', function() {
             var drawingOptions = new bootstrap.Collapse(document.getElementById('drawing-options2'));
             drawingOptions.toggle();
             
        	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
        	 canvas.requestRenderAll();
             
             // 그리기모드 비활성화
             isDrawingMode = false;
             canvas.isDrawingMode = false;
             
             // 페인트 비활성화
             isPaintMode=false;
             canvas.off('mouse:down', fillBackground);
             
             $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
             resetColors();  // 콜랩스 색상 초기화
           });  
      
      
      
      // 지우개 버튼 클릭 시 세부 버튼 생성 (색상, 두께)
        document.getElementById('eraser-button').addEventListener('click', function() {
             var drawingOptions = new bootstrap.Collapse(document.getElementById('drawing-options3'));
             drawingOptions.toggle();
             
        	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
        	 canvas.requestRenderAll();
             
             // 텍스트 모드 비활성화
             disableTextMode();
             
             // 페인트 비활성화
             isPaintMode=false;
             canvas.off('mouse:down', fillBackground);
             
             $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
             resetColors();  // 콜랩스 색상 초기화
           });   
         
      
      // 페인트 버튼 클릭 시 세부 버튼 생성
        document.getElementById('paint-btn').addEventListener('click', function() {
             var drawingOptions = new bootstrap.Collapse(document.getElementById('drawing-options4'));
             drawingOptions.toggle();
             
        	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
        	 canvas.requestRenderAll();
             
             // 그리기모드 비활성화
             isDrawingMode = false;
             canvas.isDrawingMode = false;
             
             // 텍스트 모드 비활성화
             disableTextMode();
             
             $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
             resetColors();  // 콜랩스 색상 초기화
           });  
      
      
      
       // 사진 버튼 클릭 시
       $("#photo-col-btn").click(function() {
         $("#photo-col").collapse('toggle');
         $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
         removeActive(); // 콜랩스 active 초기화
         
    	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
    	 canvas.requestRenderAll();
    	 
          // 그리기 모드 비활성화
          isDrawingMode = false;
          canvas.isDrawingMode = false;
          
          // 텍스트 모드 비활성화
          disableTextMode();
          
          // 페인트 비활성화
          isPaintMode=false;
          canvas.off('mouse:down', fillBackground);
          
       });
   
       
       // 배경 버튼 클릭 시
       $("#bg-col-btn").click(function() {
         $("#bg-col").collapse('toggle');
         $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
         removeActive(); // 콜랩스 active 초기화
         
    	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
    	 canvas.requestRenderAll();
         
          // 그리기 모드 비활성화
          isDrawingMode = false;
          canvas.isDrawingMode = false;
          // 텍스트 모드 비활성화
          disableTextMode();
          // 페인트 비활성화
          isPaintMode=false;
          canvas.off('mouse:down', fillBackground);
       });
   
       
   
       // A.I 버튼 클릭 시
       $("#ai-col-btn").click(function() {
         $("#ai-col").collapse('toggle');
         $(".collapse").collapse('hide'); // 모든 콜랩스를 닫음
         removeActive(); // 콜랩스 active 초기화
         
    	 canvas.discardActiveObject(); // 선택된 객체 있을 시 초기화
    	 canvas.requestRenderAll();
         
          // 그리기 모드 비활성화
          isDrawingMode = false;
          canvas.isDrawingMode = false;
          // 텍스트 모드 비활성화
          disableTextMode();
          // 페인트 비활성화
          isPaintMode=false;
          canvas.off('mouse:down', fillBackground);
       });
   });
   
   
function addStickerToCanvas(url) {
    fabric.Image.fromURL(url, function(img) {
        // 이미지 객체 생성
        img.set({
            left: canvas.width / 2 - img.width / 2,
            top: canvas.height / 2 - img.height / 2,
            scaleX: 0.5, // 필요에 따라 스케일 조정
            scaleY: 0.5, // 필요에 따라 스케일 조정
        });

        // 캔버스에 이미지 추가
        canvas.add(img);
    });
}

var isCtrlDown = false;

//Ctrl 키 상태 추적
document.addEventListener('keydown', function(e) {
 if (e.key === 'Control') {
     isCtrlDown = true;
 }
});

document.addEventListener('keyup', function(e) {
 if (e.key === 'Control') {
     isCtrlDown = false;
 }
});

canvas.on('mouse:wheel', function(opt) {
 var delta = opt.e.deltaY;
 var zoom = canvas.getZoom();
 zoom *= 0.999 ** delta;
 if (isCtrlDown && canvas.getActiveObject()) {
     // 마우스 휠을 사용하여 이미지 크기 조정
     var activeObject = canvas.getActiveObject();
     if (delta > 0) {
         activeObject.scaleX *= 1.1;
         activeObject.scaleY *= 1.1;
     } else {
         activeObject.scaleX /= 1.1;
         activeObject.scaleY /= 1.1;
     }
     activeObject.setCoords(); // 좌표 업데이트
     canvas.renderAll();
 }
 // Prevent the whole page from scrolling
 opt.e.preventDefault();
 opt.e.stopPropagation();
});
  
</script>


  
  
 
  
<!-- 등록 -->    
<script>
    var jq3_7_1 = jQuery.noConflict(true);
</script>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
const editableDiv = document.getElementById('editable-div');
const modalTitle = document.getElementById('modal-title');
const defaultText = "제목을 입력하세요!";

editableDiv.addEventListener('click', function() {
  if (this.textContent === defaultText) {
    this.textContent = '';
    this.style.color = 'black'; // 텍스트 입력 시 색상 변경
  }
});

editableDiv.addEventListener('blur', function() {
  if (this.textContent.trim() === '') {
    this.textContent = defaultText;
    this.style.color = 'grey'; // 플레이스홀더 색상으로 다시 변경
  }else {
      modalTitle.textContent = this.textContent; // 모달 헤더의 텍스트를 업데이트합니다.
    }
});

$('#myModal').on('show.bs.modal', function (e) {
    console.log('Modal is about to show');
    var canvas = document.getElementById('main-canvas');
    var imageDataURL = canvas.toDataURL('image/png');
    document.getElementById('canvas-image').src = imageDataURL;
   
   });
</script>
   
<script>   
   
document.getElementById('upload-button').addEventListener('click', function() {
    let canvas = document.getElementById('main-canvas');
    let userIdValue = document.getElementById('user_id').value;
    let stickerTitleValue = document.getElementById('editable-div').innerText;

    // Canvas 데이터를 Blob 객체로 변환
    canvas.toBlob(function(blob) {
        let formData = new FormData();
        formData.append('file', blob, 'sticker.png'); // 'file'은 서버 측에서 기대하는 필드 이름입니다
        formData.append('user_id', userIdValue);
        formData.append('sticker_title', stickerTitleValue);
   
        // Ajax 요청 수정
        $.ajax({
            type: "POST",
            url: "${cpath}/sticker/sticker_upload", // Spring Controller의 URL 주소
            processData: false,  // FormData 처리를 위해 필요
            contentType: false,  // FormData 처리를 위해 필요
            data: formData,
            success: function(response) {
                alert("저장 성공");
                window.location.href = "${cpath}/";
            },
            error: function(error) {
                console.error("Error sending data to the server", error);
                // 에러 처리 로직
            }
        });
    }, 'image/png');
});
</script>    

<script>


document.getElementById('sticker_temp_upload').addEventListener('click', function() {

	   // 나중에: Canvas의 상태를 JSON으로 변환
	   var canvasJson = JSON.stringify(canvas.toJSON());
	    var userIdValue = document.getElementById('user_id').value; // 사용자 ID 가져오기
	    var editableDivValue = document.getElementById('editable-div').innerText;
	    // AJAX 요청을 통해 서버로 데이터 전송
	    let data = {
	         user_id: userIdValue,
	         sticker_temp_content: canvasJson,
	         sticker_temp_title: editableDivValue
	       };
	    
	    
	    
	    $.ajax({
	        url: '${cpath}/sticker/sticker_temp_upload', // 데이터를 보낼 서버의 URL
	        type: 'POST',
	        contentType: 'application/json; charset=utf-8',
	        data: JSON.stringify(data),
	        success: function(response) {
	            alert("임시저장성공!")
	        },
	        error: function(xhr, status, error) {
	            // 오류 발생 시 처리
	            console.error('Data could not be sent');
	        }
	    });
	    
	});


//모달이 열릴 때 임시저장 목록을 불러오는 함수
function loadTempStickers() {
    $.ajax({
        url: '${cpath}/sticker/get_sticker_temp_title', // 서버에서 임시저장 목록을 가져오는 URL
        type: 'GET',
        dataType :'json',
        success: function(stickers) {
            const list = document.getElementById('temp-stickers-list');
            list.innerHTML = ''; // 리스트 초기화

            stickers.forEach(function(sticker, index) {
                const item = document.createElement('li');
                const div1 = document.createElement('div');
                const div2 = document.createElement('div');
                const radioButton = document.createElement('input');
                
                item.className = "temp-list-li";
                div1.className = "name-div";
                div2.className = "del-div";
                radioButton.type = 'radio';
                radioButton.name = 'tempSticker'; // 같은 name으로 그룹화하여 한 번에 하나만 선택 가능하게 함
                radioButton.value = sticker.sticker_temp_idx; // 라디오 버튼 값으로 스티커 ID 설정
                
                const deleteButton = document.createElement('button');
                deleteButton.textContent = '삭제';
                deleteButton.className = 'temp-btn';
                
                deleteButton.onclick = function() { delete_temp_Sticker(sticker.sticker_temp_idx, item); };
                
                div1.appendChild(radioButton);
                div1.appendChild(document.createTextNode(sticker.sticker_temp_title)); // 스티커 제목 추가
                item.appendChild(div1);
                
                div2.appendChild(deleteButton);
                item.appendChild(div2);
                list.appendChild(item);
                
            });
        },
        error: function(xhr, status, error) {
            console.error('Error loading stickers:', error);
        }
    });
}

function delete_temp_Sticker(sticker_temp_idx, listItem) {
    $.ajax({
        url: '${cpath}/sticker/delete_temp_Sticker/' + sticker_temp_idx,
        type: 'POST',
        success: function(response) {
            // 서버에서 삭제 성공 시, 리스트에서 항목 제거
            
            listItem.remove();
        },
        error: function(xhr, status, error) {
            console.error('Error deleting sticker:', error);
        }
    });
}







//모달이 열릴 때마다 임시저장 목록을 불러옵니다
$('#temp_Modal').on('show.bs.modal', loadTempStickers);


document.getElementById('temp_load').addEventListener('click', function() {
    // 선택된 라디오 버튼의 값을 가져오기
    var sticker_temp_idx = document.querySelector('input[name="tempSticker"]:checked').value;

    if (sticker_temp_idx) {
        // 스티커 데이터를 가져오기 위한 AJAX 요청
        $.ajax({
            url: '${cpath}/sticker/get_sticker_temp_content/' + sticker_temp_idx,
            type: 'GET',
            dataType: 'json',
            success: function(stickerData) {
                // 캔버스에 스티커 데이터 렌더링
                renderStickerOnCanvas(stickerData);
                
            },
            error: function(xhr, status, error) {
                console.error('스티커 데이터 로딩 오류:', error);
            }
        });
    } else {
        alert('로드할 스티커를 선택해주세요.');
    }
});


function renderStickerOnCanvas(stickerData) {
    
    canvas.loadFromJSON(stickerData, function() {
        canvas.renderAll(); // 데이터 로드 후 캔버스 렌더링
        
    });
}

</script>

<script>
//AI 기능 모달 함수




$("#aimodal-button").click(function(){
    var menu_list = ['Ai-menu1', 'Ai-menu2', 'Ai-menu3', 'Ai-menu4'];
    menu_list.forEach(function(menu) {    
        $("#"+menu).hide(); // 모든 div 숨김
    });
    $("#Ai-menu1").show(); // '배경 지우기' 컨텐츠 기본적으로 표시
});

$(".Ai-menu__a").click(function(){
    var menu_list = ['Ai-menu1', 'Ai-menu2', 'Ai-menu3', 'Ai-menu4'];
    menu_list.forEach(function(menu) {
        $("#"+menu).hide(); // 모든 div 숨김
    });

    var selectedMenu = $(this).attr('href'); // 선택된 요소의 href 값 가져오기
    $(selectedMenu).show(); // 선택된 요소만 표시

    var index = selectedMenu.replace(/[^0-9]/g, ''); // 숫자가 아닌 모든 문자 제거
    aiModal_index = parseInt(index); // 문자열을 숫자로 변환
});
</script>



<!-- AI에서 ajax를 쓰는 코드 이미지 플라스크 -->
<script src="${cpath}/resources/js/aiFunction/aiAjax.js"></script>

<!-- MODAL에서 AI DIV로 보내는 이미지 플라스크 -->
<script src="${cpath}/resources/js/aiFunction/aiUpload.js"></script>








</body>
</html>