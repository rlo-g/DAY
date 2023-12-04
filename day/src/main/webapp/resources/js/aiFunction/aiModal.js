/**
 * 
 */

//AI기능 모달 function
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