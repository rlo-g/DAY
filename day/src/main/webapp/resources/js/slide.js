
document.addEventListener('DOMContentLoaded', function() {
 var currentSlide = 1;

  // 오른쪽 버튼 클릭 시
  document.getElementById('right').addEventListener('click', function() {
    if (currentSlide < 6) {
      document.getElementById('slide' + currentSlide).classList.remove('up1');
      currentSlide++;
      document.getElementById('slide' + currentSlide).classList.add('up1');
    }
  });

  // 왼쪽 버튼 클릭 시
  document.getElementById('left').addEventListener('click', function() {
    if (currentSlide > 1) {
      document.getElementById('slide' + currentSlide).classList.remove('up1');
      currentSlide--;
      document.getElementById('slide' + currentSlide).classList.add('up1');
    }
  });
});
