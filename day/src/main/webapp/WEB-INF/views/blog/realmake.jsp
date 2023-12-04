<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/> 


<!DOCTYPE HTML>
<!--
   Read Only by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>Read Only by HTML5 UP</title>
        <link href="${cpath}/resources/css/styles.css" rel="stylesheet" /> 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>  
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 <link href="${cpath}/resourecs/css/Font.css" rel="stylesheet">
  <style type="text/css">
  .rwd-table {
    margin: auto;
    width: 95%;
    border-collapse: collapse;
}

.rwd-table th:first-child {
    background: #fad7ef80;
    color: #555555d9;
}

.rwd-table tr {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    background-color: white;
}

/*.rwd-table tr:nth-child(odd):not(:first-child) {*/
/*    background-color: #ebf3f9;*/
/*}*/

.rwd-table th {
    display: none;
}

.rwd-table td {
    display: block;
}

.rwd-table td:first-child {
    margin-top: .5em;
}

.rwd-table td:last-child {
    margin-bottom: .5em;
}

.rwd-table td:before {
    /*content: attr(data-th) ": ";*/
    font-weight: bold;
    width: 120px;
    display: inline-block;
    color: #000;
}

.rwd-table th,
.rwd-table td {
    text-align: left;
}

.rwd-table {
    color: #333;
    border-radius: .4em;
    overflow: hidden;
}

.rwd-table tr {
    border-color: #f2b4de85;
}

.rwd-table th,
.rwd-table td {
    padding: .5em 1em;
}
@media screen and (max-width: 601px) {
    .rwd-table tr:nth-child(2) {
        border-top: none;
    }
    .rwd-table th:first-child,
    .rwd-table td:first-child {
        font-weight : bold;
        color: black;
    }
    .rwd-table td a {
        text-decoration: none;
        color: black;
    }
}
@media screen and (min-width: 600px) {
    .rwd-table tr:hover:not(:first-child) {
        background-color: rgba(131, 244, 180, 0.3);
        /*background-color: #83F4B4;과 동일 opacity*/
    }
    .rwd-table td:before {
        display: none;
    }
    .rwd-table td a {
        text-decoration: none;
        color: black;
    }
    .rwd-table th,
    .rwd-table td {
        display: table-cell;
        padding: .25em .5em;
    }
    .rwd-table th:first-child,
    .rwd-table td:first-child {
        font-weight : bold;
        padding-left: 0;
    }
    .rwd-table th:last-child,
    .rwd-table td:last-child {
        padding-right: 0;
    }
    .rwd-table th,
    .rwd-table td {
        padding: 1em !important;
    }
}
.btngroup{
	text-align:right;
	margin-top:30px;
	margin-right:50px;
}
#subT{
	margin-left:50px;
	margin-bottom:20px;
	color: #555555d9;
}
  </style>
  
   </head>
   <body class="page-top">
     <jsp:include page="../common/header.jsp"></jsp:include>
	<section id="page-section">
		<div id="subT">
			<h3>블로그 만들기</h3>
			</div>
		<!-- Wrapper -->
		<div id="container">
		<form action="${cpath}/myblog//makeDiary" method="post">
			<table class="rwd-table">
				<tbody>
					<tr>
						<th>프로필 사진</th>
						<td>
							<div class="imgDiv">
								<img id="profile" class="img-circle"
									src="${cpath}/resources/images/default.png">
							</div> <br>
							<div class="inputDiv">
								<label for="blog_profile" class="input-btn">사진변경</label> <input
									type="file" accept="image/*" id="blog_profile"
									name="blog_profile" onchange="readProfile(this)"
									style="display: none;"> <label for="profileReset"
									class="input-btn">삭제</label> <input type="reset"
									id="profileReset" style="display: none;" />
							</div>
						</td>
					</tr>

					<tr>
						<th>블로그 제목</th>
                         <td><input type="text" name="blog_title" id="blog_title"></td>
                    </tr>

 					<tr>
                        <th>소개글</th>
                        <td><input type="text" name="blog_intro" id="blog_intro"></td>
                   </tr>

					<tr>
                       <th>헤더</th>
                        <td>
                          <div class="imgDiv"><img id ="blogHeader" src="${cpath}/resources/images/header.png"> <br>
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
                           <td><div class="color"><input type="color" id="blog_side" name="blog_side"></div></td>
                        </tr>
                        <tr>
                           <th>배경</th>
                           <td><div class="color"><input type="color" id="blog_body" name="blog_body"></div></td>
                        </tr>
                        </tbody>
                     </table>
                        <div class="btngroup">
                           <input class="btn btn-sm btn-light" type="submit" value="수정">
                           <input class="btn btn-sm btn-light" type="reset" value="취소">
                        </div>
				</form>
		</div>
	</section>
	<!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2023</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>
      <!-- Scripts -->
         <script src="${cpath}/resources/js/jquery.min.js"></script>
         <script src="${cpath}/resources/js/browser.min.js"></script>
         <script src="${cpath}/resources/js/breakpoints.min.js"></script>
         <script src="${cpath}/resources/js/util.js"></script>
         
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
</script>
   </body>
</html>