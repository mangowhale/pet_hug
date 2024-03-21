<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>편의시설 상세</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>

    <section>
        <div class="jumbotron background-lightgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">반려동물 시설</h2>
            </div>
        </div>
    </section>

    <section>
        <div class="container pt-5 pb-5">
            <div class="d-flex mb-5">
                <div class="col-sm-6 me-3 pe-3">
                    <img src="/img/dog-1850465_1280.jpg" alt="" class="img-fluid">
                </div>
                <div class="col-sm-6 ms-3 ps-3">
                    <div>
                        <h2 class="font mb-3">시설 이름</h2>
                        <p class="mb-5"><i class="fas fa-map-marker-alt"></i> (시군구)</p>
                        <p>시설 종류: fac_category</p>
                        <p>대상 동물: 강아지/고양이/그 외</p>
                        <p class="mb-5">(강아지일 경우) 소형견/중형견/대형견</p>
                        <div>
                            <p><div class="border px-2 py-1 d-inline-block me-2 ">키워드</div> #키워드 #키워드 #키워드</p>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <!-- <div class="d-flex mb-5"> -->
                    <div class="col-sm-6 mb-5">
                        <hr class="hr-green">
                        <h2 class="font">소개</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et semper lorem. Pellentesque lorem leo, rhoncus vitae velit a, semper finibus elit. Sed vehicula a ligula eget tincidunt. Pellentesque sed semper erat, a faucibus lorem. Donec quis mattis nulla, ac maximus dui. In hac habitasse platea dictumst.</p>
                        <p><i class="fas fa-map-marker-alt"></i> 상세주소</p>
                        <p><i class="fas fa-phone"></i> 010-1234-5678</p>
                        <p><i class="far fa-clock"></i> 08:00~20:00</p>
                        <p><i class="fas fa-globe"></i> <a>홈페이지 주소</a></p>
                    </div>
                    <!-- <div class="col-sm-6 ms-3 ps-3">
                        <hr class="hr-green">
                        
                    </div> -->
                <div class="col-sm-6 mb-5">
                    <hr class="hr-green">
                    <h2 class="font mb-4">주요시설</h2>
                    <div class="mb-4">
                        <h5 class="font"><i class="fas fa-paw"></i>반려동물 시설</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                    <div>
                        <h5 class="font"><i class="fas fa-user"></i>반려인 시설</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>
                <div class="col-sm-6 mb-5">
                    <hr class="hr-green">
                    <h2 class="font">이용요금</h2>
                    <p>입장료 등</p>
                </div>
                <div class="mb-5">
                    <hr class="hr-green">
                    <h2 class="font text-justify">이용 안내</h2>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam et semper lorem. Pellentesque lorem leo, rhoncus vitae velit a, semper finibus elit. Sed vehicula a ligula eget tincidunt. Pellentesque sed semper erat, a faucibus lorem. Donec quis mattis nulla, ac maximus dui. In hac habitasse platea dictumst. Aenean viverra sollicitudin eros nec auctor. Vivamus vestibulum in enim non placerat. Donec diam enim, tempor suscipit pretium ac, aliquam tristique mauris. Suspendisse potenti. Duis efficitur quam lorem, ac aliquet ligula volutpat ut. Phasellus magna ex, tincidunt non lacus eget, euismod auctor nisi.</p>
                </div>
                <div class="mb-5">
                    <hr class="hr-green">
                    <h2 class="font">지도</h2>
                    <p>지도</p>
                </div>
                <div class="mb-5">
                    <hr class="hr-green">
                    <h2 class="font">주변 여행지</h2>
                    <p>여행지 사진&링크</p>
                </div>
                <div class="mb-5">
                    <hr class="hr-green">
                    <h2 class="font">리뷰</h2>
                    리뷰
                </div>
            </div>
        </div>
    </section>

	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
</body>
</html>