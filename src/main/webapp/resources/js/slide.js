var slides = document.querySelectorAll(".slide");
var nextBtn = document.querySelector(".nextBtn");
var prevBtn = document.querySelector(".prevBtn");

slides.forEach(function(slide,index){
    slide.style.left = `${index * 100}%`;
    // slide.style.left = '${index*100}%'; $(el구문)에는 ''x, ``o
})
//슬라이드를 왼쪽으로 100% 단위로 배치
// css에 absolute로 지정되어있음
// slide: 임의로 지정한 변수명. slides 배열 안의 요소 하나
// ${}: 변수 표시 ${index*100}

let counter = 0;
nextBtn.addEventListener("click",function(){
    counter++;
    carousel();
    // counter를 1씩 더하고 carousel() 호출하는 이벤트리스너 설정
});
prevBtn.addEventListener("click",function(){
    counter--;
    carousel();
});

function carousel(){
    if(counter>0){
        prevBtn.style.display="block";
    }else{
        prevBtn.style.display="none";
    }
    //counter가 1보다 크면 이전 버튼을 보이게 함
    if(counter>=4){
        counter = 0;
    }
    else if(counter<0)
    {
        counter = 3;
    }
    slides.forEach(function(slide){
        slide.style.transform = `translateX(-${counter * 100}%)`;
    });
}