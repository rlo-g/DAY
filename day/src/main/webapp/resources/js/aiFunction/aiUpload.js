/**
 * 
 */
var aiModal_index=1;
function aiImgUpload(){
    // jQuery를 사용하여 AI 이미지 가져오기
    var aiImg = document.getElementsByClassName('modal-noneImg')[aiModal_index-1];
    var sticker_url = aiImg.src;
    // 순수 JavaScript를 사용하여 컨테이너 가져오기
    const aiContainerDiv = document.getElementById('ai-container');

    // 새 이미지 엘리먼트 생성
    var newImg = document.createElement('img');
    newImg.src = sticker_url;
    newImg.className = 'ai-container__img';
    newImg.onclick = function(e) {ai2canvas(e);};
    // 생성된 이미지를 컨테이너에 추가
    aiContainerDiv.appendChild(newImg);
    
    //네임이 prompt, negative_prompt인 textarea, art_style 초기화 하고 올려야함 
    

    // 모달 닫기 함수 호출
    $('.modal-noneImg').attr("src", "https://daydayday.s3.ap-northeast-2.amazonaws.com/EditPage/component/none.jpg");
	$('#imageEdit-modal__closebtn').click();
	$('#tab-4').click();
}


function ai2canvas(e) {
    var imageUrl = e.target.src;

    // 이미지 URL에서 Blob 객체로 변환
    fetch(imageUrl).then(response => {
        return response.blob();
    }).then(blob => {
        // Blob 객체에서 새 URL 생성
        var newUrl = URL.createObjectURL(blob);
        console.log(newUrl);

        // 새 URL을 사용하여 캔버스에 이미지 추가
        fabric.Image.fromURL(newUrl, function(img) {
            img.set({
                left: canvas.width / 2 - img.width / 2,
                top: canvas.height / 2 - img.height / 2,
                scaleX: 0.5,
                scaleY: 0.5,
            });

            canvas.add(img);
            // 사용 후 URL 해제
            URL.revokeObjectURL(newUrl);
        });
    });
}

	
	
    