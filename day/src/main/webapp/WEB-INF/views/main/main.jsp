<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var ="cpath" value ="${pageContext.request.contextPath}"/> 
<c:set var ="awsPath" value ="https://daydayday.s3.ap-northeast-2.amazonaws.com/day"/>



<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>D.A.Y 다이어리 블로그</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${cpath}/resources/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${cpath}/resources/css/styles.css" rel="stylesheet" />
       <!--   <link href="${cpath}/resources/css/slide.css" rel="stylesheet" />-->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"> 
       <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
       <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> 
        
        
    </head>
    
    
    
    <body id="page-top">
     <jsp:include page="../common/header.jsp"></jsp:include>
     
        <script> 
            AOS.init(); 
        </script>
        
        

      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${awsPath}/banner/banner.png" class="d-block w-100" alt="...">
          </div>
           <div class="carousel-item">
            <c:if test="${not empty mvo}">
                <a href="${cpath}/editphoto">
                     <img src="${awsPath}/banner/banner2.png" class="d-block w-100" alt="...">
                </a>
             </c:if>
             <c:if test="${empty mvo}">
                  <img src="${awsPath}/banner/banner2.png" class="d-block w-100" alt="...">
               </c:if>
          </div> 
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
 

   <!-- Services-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">이 달의 인기글</h2>
                    <h3 class="section-subheading text-muted">한 달 동안 가장 인기 있었던 게시글을 확인해 보세요!</h3>
                </div>
                
                <div class="row text-center" id="view">
                
                    
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
       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${cpath}/resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>


      <script type="text/javascript">
      $(document).ready(function(){
           // HTML이 다 로딩되고나서 아래 코드실행
           best_board();
           
        });
      function best_board(){
           // 비동기방식으로 게시글 리스트 가져오기 기능
           // ajax - 요청 url, 어떻게 데이터 받을지, 요청방식 등... -> 객체
           $.ajax({
              url : "board/best_board",
              type : "get",
              dataType : "json",
              success : makeView, // 콜백함수
              error : function() { alert("error에러임"); }
           });
        }
       
       
        function makeView(data) {
           var listHtml = "";
           
           data.forEach(function (obj,index) {
              var uniqueId = "post-" + index;
              listHtml += `
            	  <!-- 인기글 1 -->
                  <div id="\${uniqueId}" class="col-lg-4 col-sm-6 mb-4">
                      <!-- Portfolio item 1-->
                      <div class="portfolio-item">
                      <a href="${cpath}/blog/\${obj.user_id}"> 
                          <div class="item-img">
                              <img class="img-fluid" src="\${obj.bd_content}" alt="..." />
                         </div>
                          <div class="portfolio-caption">
                              <div class="portfolio-caption-tag">
                              <span>#\${obj.bd_category}</span>
                              <span><img class="likeimg" src="${awsPath}/images/likee.png">\${obj.bd_views}</span>
                              </div>
                              <div class="portfolio-caption-heading">\${obj.bd_title}</div>
                              
                              <div class="portfolio-caption-subheading text-muted">
                             
                             by \${obj.user_nick}
                              </div>
                          </div>
                      </div>
                      </a>
                  </div>
               `; 
               
           });
      
           $("#view").html(listHtml);
           
           document.getElementById("post-0").setAttribute("data-aos", "fade-up");
           document.getElementById("post-0").setAttribute("data-aos-duration", "1000");
           document.getElementById("post-1").setAttribute("data-aos", "fade-left");
           document.getElementById("post-1").setAttribute("data-aos-duration", "1000");
           document.getElementById("post-2").setAttribute("data-aos", "fade-up");
           document.getElementById("post-2").setAttribute("data-aos-duration", "1000");
           document.getElementById("post-3").setAttribute("data-aos", "fade-down");
           document.getElementById("post-3").setAttribute("data-aos-duration", "1000");
           document.getElementById("post-4").setAttribute("data-aos", "fade-up");
           document.getElementById("post-4").setAttribute("data-aos-duration", "1000");
           document.getElementById("post-5").setAttribute("data-aos", "fade-down");
           document.getElementById("post-5").setAttribute("data-aos-duration", "1000");
           
           
           
        }
      
      
        function bestboard(){
        	
        }
      
      
      
      </script>

    </body>
</html>