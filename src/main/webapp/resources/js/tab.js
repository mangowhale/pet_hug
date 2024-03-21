var radioButtons = document.querySelectorAll('input[type="radio"][name="gangwon"]');
var labels = document.querySelectorAll('.label-w10 label');

radioButtons.forEach(function(radioButton, index) {
    radioButton.addEventListener('change', function() {
        // 모든 라벨의 스타일 초기화
        labels.forEach(function(label) {
            label.style.backgroundColor = 'white';
            label.style.color = 'black';
        });
        
        // 선택된 라디오 버튼의 라벨에 배경색과 폰트 색상 변경
        if (radioButton.checked) {
            labels[index].style.backgroundColor = '#076e43';
            labels[index].style.color = 'white';
        }
    });
});

$(document).ready(function() {
    // "리뷰 작성" 부분의 별은 클릭할 수 있도록 유지
    $('.p-5 .star_rating > .star').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
        var value = $(this).attr('value');
        $('#starValue').val(value); // 선택된 별의 값을 hidden 입력 필드에 설정
    });

    // "reviewList"에서 가져온 별은 클릭할 수 없도록 함
    $('.reviewList .star_rating > .star').click(function() {
        // 클릭 이벤트 무시
        return false;
    });
});

// 별을 클릭할 때 해당하는 값을 가져와서 hidden input에 설정하는 함수
function setStarValue(value) {
    document.getElementById('starValue').value = value;
}

// 각 별을 클릭할 때 setStarValue 함수를 호출하여 hidden input에 값을 설정
document.querySelectorAll('.star').forEach(function(star) {
    star.addEventListener('click', function() {
        var value = parseInt(this.getAttribute('value'));
        setStarValue(value);
    });
});