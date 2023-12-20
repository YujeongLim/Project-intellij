// 팝업 열기 버튼
var openButton = document.getElementById('button1');
var openButton1 = document.getElementById('button2');
// 팝업 닫기 버튼
var closeButton = document.getElementById('closePopup');
var closeButton1 = document.getElementById('closePopup1');
// 실제 팝업 요소
var popup = document.getElementById('popup');
var popup1 = document.getElementById('popup1');

// 팝업 열기
openButton.onclick = function() {
  popup.style.display = 'block';
  search.style.display = 'none';
};
openButton1.onclick = function() {
  popup1.style.display = 'block';
  search.style.display = 'none';
};

// 팝업 닫기
closeButton.onclick = function() {
  popup.style.display = 'none';
  search.style.display ='block';
};
closeButton1.onclick = function() {
  popup1.style.display = 'none';
  search.style.display ='block';
};


// 배경 클릭 시 팝업 닫기
window.onclick = function(event) {
  if (event.target == popup) {
    popup.style.display = 'none';
  }
};
window.onclick = function(event) {
  if (event.target == popup1) {
    popup1.style.display = 'none';
  }
};
