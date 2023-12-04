/**
 * 
 */
 var address = "${address}";		
 console.log(address);
 var clickX, clickY, clickX1, clickY1, clickX2, clickY2;
 var actualWidth1, actualHeight1, actualWidth2, actualHeight2
	$(".imageUpload_1").change(function(){
	    var reader = new FileReader();
	    reader.onload = function(e){
	        // 이미지 로드가 완료되면 src를 설정하고 클릭 이벤트 핸들러를 추가합니다.
			$("#none_RB").attr('src', e.target.result);
	        // 새로운 클릭 이벤트 핸들러를 등록합니다.
	       $("#none_RB").click(function(event){
	            // 클릭 이벤트 핸들러 함수에서 클릭한 위치를 찾기
		            clickX = event.offsetX;
		            clickY = event.offsetY;
	            console.log(clickX, clickY);
	        });
	    }
	    reader.readAsDataURL(this.files[0]);
	});

	$(".imageUpload_3").change(function(){
    var reader = new FileReader();
    reader.onload = function(e){
        var image = new Image();
        image.onload = function(){
             actualWidth1 = image.naturalWidth;
             actualHeight1 = image.naturalHeight;

            var displayedWidth1 = $("#none_CO").width();
            var displayedHeight1 = $("#none_CO").height();

            widthRatio1 = actualWidth1 / displayedWidth1;
            heightRatio1 = actualHeight1 / displayedHeight1;

            $("#none_CO").click(function(event){
                 clickX1 = Math.floor(event.offsetX * widthRatio1);
				  clickY1 = Math.floor(event.offsetY * heightRatio1);
                console.log("변환된 좌표: ", clickX1, clickY1);
            });
        };
        image.src = e.target.result;
        $("#none_CO").attr('src', image.src);
    }
    reader.readAsDataURL(this.files[0]);    
});

	
	$(".imageUpload_4").change(function(){
    var reader = new FileReader();
    reader.onload = function(e){
        var image = new Image();
        image.onload = function(){
            actualWidth2 = image.naturalWidth;
            actualHeight2 = image.naturalHeight;

            var displayedWidth2 = $("#none_CB").width();
            var displayedHeight2 = $("#none_CB").height();

            widthRatio2 = actualWidth2 / displayedWidth2;
            heightRatio2 = actualHeight2 / displayedHeight2;

            $("#none_CB").click(function(event){
                  clickX2 = Math.floor(event.offsetX * widthRatio2);
				  clickY2 = Math.floor(event.offsetY * heightRatio2);

                console.log("변환된 좌표: ", clickX2, clickY2);
            });
        };
        image.src = e.target.result;
        $("#none_CB").attr('src', image.src);
    }
    reader.readAsDataURL(this.files[0]);
});


	// 이미지 배경 제거 기능 처리
    $("#imageEdit-removeBg__form").on('submit',function(e){	
        e.preventDefault(); // 폼 제출 기본 이벤트 방지
        $(".spinner-border").show(); // 로딩 인디케이터 표시
        var removeBg_fData = new FormData(this); // 폼 데이터 생성	       
        // AJAX 요청 설정 및 전송
        $.ajax({
            url:'http://118.40.99.195:5000/rembg', // 요청 URL
            type: "post", // HTTP 요청 방식
            enctype: "multipart/form-data",
            cache:false,
            data: removeBg_fData, // 전송할 데이터
            contentType: false, // 컨텐트 타입 설정 방지
            processData: false, // 데이터를 쿼리 문자열로 변환 방지
            success: function(data) { // 요청 성공 시 처리할 함수
                uploadRemovedImg(data);// 배경이 제거된 이미지 업로드 함수 호출
                $(".spinner-border").hide();
            },
            error: function(xhr, status, error){ // 요청 실패 시 처리할 함수
                alert("작업이 완료되지 않았습니다.");
            }
        });
    });
    // 텍스트 기반 이미지 생성 기능 처리
    $("#imageEdit-makeImg__form").on('submit',function(e){
        e.preventDefault(); // 폼 제출 기본 이벤트 방지
        $(".spinner-border").show(); // 로딩 인디케이터 표시
        var promptValue = $("#makeImg-textarea__pos").val(); // name이 prompt인 input
        var styleValue = $("#art_style option:selected").val(); //art스타일에서 선택된 것의 밸류
        //삼항연산자로 처리
        var combinedPrompt = promptValue + (styleValue ? ", " + styleValue : "");
        var makeImg_fData = new FormData(this);
        makeImg_fData.set("prompt", combinedPrompt); // 보낼 객체를 저 결합한 데이터를 바탕으로 처리
        // AJAX 요청 설정 및 전송
        $.ajax({
            url:'http://118.40.99.195:5000/makeImg', // 요청 URL
            type: "post", // HTTP 요청 방식
            data: makeImg_fData, // 전송할 데이터
            contentType: false, // 컨텐트 타입 설정 방지
            processData: false, // 데이터를 쿼리 문자열로 변환 방지
            success: function(data){ 
            	uploadMakedImg(data)
            	$(".spinner-border").hide();
            },
            error: function(xhr, status, error){ // 요청 실패 시 처리할 함수
                alert("작업이 완료되지 않았습니다.");
            }
        });
    });
   		// 이미지 변경
      // 이미지와 위치 데이터를 서버에 전송	
	      $("#imageEdit-changeObject__form").on("submit",function(e){
	    	  e.preventDefault(); // 폼 제출 기본 이벤트 방지
	    	  $(".spinner-border").show(); // 로딩 인디케이터 표시
	      	var EraseformData = new FormData(this);
			  EraseformData.append('x', clickX1);
			  EraseformData.append('y', clickY1);
              EraseformData.append('originalX', actualWidth1 );
              EraseformData.append('originalY', actualHeight1 );
	        $.ajax({   
	            url:"http://118.40.99.195:5000/changeObject", //요청 url changeObject으로 보내고
	            type: "post",
	            enctype: "multipart/form-data",
	            data: EraseformData,
	            processData: false,
	            contentType: false,	
	            success: function(data){
	           	 uploadErasedImg(data);
	           	 $(".spinner-border").hide();
	            },
	            error: function(){
					alert("작업이 완료되지 않았습니다.");
	         	}	
	      });
		});	
   	//배경 바꾸기
   		 $("#imageEdit-bgChange__form").on("submit", function(e){
   			e.preventDefault(); // 폼 제출 기본 이벤트 방지
   			$(".spinner-border").show(); // 로딩 인디케이터 표시
   			var BgChangeformData = new FormData(this);
   			BgChangeformData.append('x', clickX2);
   			BgChangeformData.append('y', clickY2);
            BgChangeformData.append('originalX', actualWidth2 );
            BgChangeformData.append('originalY', actualHeight2 );
   			$.ajax({   
	            url:"http://118.40.99.195:5000/changeBackground", //요청 url remove_object으로 보내고
	            type: "post",
	            enctype: "multipart/form-data",
	            data: BgChangeformData,
	            processData: false,
	            contentType: false,	
	            success: function(data){
	           	 uploadChangeBg(data);
	           	 $(".spinner-border").hide();
	            },
	            error: function(){
					alert("작업이 완료되지 않았습니다.");
	         	}	
	      });
   			 
   			 
   			 
   	});

   	function aiUserUpload(btn){
   		var file_btn = "#"+btn + "__file";
   		$(file_btn).click();
   	}
   	

// 배경이 제거된 이미지를 모달에 표시하는 함수
function uploadRemovedImg(data){
   console.log(data)
   var imageUrl = data.image_url;
    $("#none_RB").attr('src', imageUrl);
}

// 생성된 이미지를 모달에 표시하는 함수 -> 기본 이미지의 href를 바꿔주기
function uploadMakedImg(data){
   	console.log(data);   
    var makedImg = data.image_url; //image_url로 할것
    console.log(makedImg); //이미지 url 확인
    $('#none_GI').attr('src', makedImg); //src 변경하기
}
function uploadErasedImg(data){		
	var erasedImg = data.image_url;
	console.log(erasedImg); // 이미지 url보낼것 여기선 자바 절대 경로;
	$('#none_CO').attr('src', erasedImg); 
}
function uploadChangeBg(data){
    var changeBgImg = data.image_url;
    console.log(changeBgImg);
    $('#none_CB').attr('src', changeBgImg);
}