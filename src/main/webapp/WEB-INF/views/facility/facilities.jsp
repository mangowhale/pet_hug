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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/radio_tab.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>편의시설</title>
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

            <section class="pt-5">
            <div class="container">
                <input type="radio" name="gangwon" id="all">
                <input type="radio" name="gangwon" id="gangreung">
                <input type="radio" name="gangwon" id="goseong">
                <input type="radio" name="gangwon" id="donghae">
                <input type="radio" name="gangwon" id="samcheuk">
                <input type="radio" name="gangwon" id="sokcho">
                <input type="radio" name="gangwon" id="yanggu">
                <input type="radio" name="gangwon" id="yangyang">
                <input type="radio" name="gangwon" id="yeongwol">
                <input type="radio" name="gangwon" id="wonju">
                <input type="radio" name="gangwon" id="inje">
                <input type="radio" name="gangwon" id="jeongseon">
                <input type="radio" name="gangwon" id="cheolwon">
                <input type="radio" name="gangwon" id="chuncheon">
                <input type="radio" name="gangwon" id="taebaek">
                <input type="radio" name="gangwon" id="pyeongchang">
                <input type="radio" name="gangwon" id="hongcheon">
                <input type="radio" name="gangwon" id="hwacheon">
                <input type="radio" name="gangwon" id="hoilgseung">
                <div class="label-w10">
                    <label for="all" class="border py-2">전체</label>
                    <label for="gangreung" class="border py-2">강릉시</label>
                    <label for="goseong" class="border py-2">고성군</label>
                    <label for="donghae" class="border py-2">동해시</label>
                    <label for="samcheuk" class="border py-2">삼척시</label>
                    <label for="sokcho" class="border py-2">속초시</label>
                    <label for="yanggu" class="border py-2">양구군</label>
                    <label for="yangyang" class="border py-2">양양군</label>
                    <label for="yeongwol" class="border py-2">영월군</label>
                    <label for="wonju" class="border py-2">원주시</label>
                    <label for="inje" class="border py-2">인제군</label>
                    <label for="jeongseon" class="border py-2">정선군</label>
                    <label for="cheolwon" class="border py-2">철원군</label>
                    <label for="chuncheon" class="border py-2">춘천시</label>
                    <label for="taebaek" class="border py-2">태백시</label>
                    <label for="pyeongchang" class="border py-2">평창군</label>
                    <label for="hongcheon" class="border py-2">홍천군</label>
                    <label for="hwacheon" class="border py-2">화천군</label>
                    <label for="hoilgseung" class="border py-2">횡성군</label>
                </div>
            </div>
        </section>

        <section class="py-5 my-3">
            <div class="container">
                <!-- 검색창 -->
                <div class="w-100 mb-5">
                    <form class="text-center">
                        <select class="py-1">
                            <option>이름</option>
                            <option>키워드</option>
                        </select>
                        <input type="text" class="input">
                        <button class="border px-2 py-1"><i class="fas fa-search"></i></button>
                    </form>
                </div>
                
                <!-- 상품들 -->
                <!-- 게시판 출력 메커니즘으로 출력합시다 -->
                <div class="d-flex flex-4 flex-wrap w-100">
                    <!-- 개별 숙소 -->
                    <div class="border p-3">
                        <a href=""><!--개별 페이지 이동 주소 링크-->
                            <div class="mb-3">
                                <!-- 사진 -->
                                <img src="/img/dog-6527479_1280.jpg" alt="" class="img-fluid">
                            </div>
                            <div>
                                <h4 class="fw-bold color-black">이름</h4>
                                <div class="mb-3">
                                    <div class="color-yellow mb-2 d-flex">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><p class="color-black">(0)</p>
                                    </div>
                                <p class="mb-1 color-black"><i class="fas fa-check col-sm-1"></i>카테고리</p>
                                <p class="color-black"><i class="fas fa-map-marker-alt col-sm-1"></i>상세주소</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <!-- 개별 숙소 -->
                    <div class="border p-3">
                        <a href=""><!--개별 페이지 이동 주소 링크-->
                            <div class="mb-3">
                                <!-- 사진 -->
                                <img src="/img/dog-6527479_1280.jpg" alt="" class="img-fluid">
                            </div>
                            <div>
                                <h4 class="fw-bold color-black">이름</h4>
                                <div class="mb-3">
                                    <div class="color-yellow mb-2 d-flex">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><p class="color-black">(0)</p>
                                    </div>
                                <p class="mb-1 color-black"><i class="fas fa-check col-sm-1"></i>카테고리</p>
                                <p class="color-black"><i class="fas fa-map-marker-alt col-sm-1"></i>상세주소</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <!-- 개별 숙소 -->
                    <div class="border p-3">
                        <a href=""><!--개별 페이지 이동 주소 링크-->
                            <div class="mb-3">
                                <!-- 사진 -->
                                <img src="/img/dog-6527479_1280.jpg" alt="" class="img-fluid">
                            </div>
                            <div>
                                <h4 class="fw-bold color-black">이름</h4>
                                <div class="mb-3">
                                    <div class="color-yellow mb-2 d-flex">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><p class="color-black">(0)</p>
                                    </div>
                                <p class="mb-1 color-black"><i class="fas fa-check col-sm-1"></i>카테고리</p>
                                <p class="color-black"><i class="fas fa-map-marker-alt col-sm-1"></i>상세주소</p>
                                </div>
                            </div>
                        </a>
                    </div>
                    <!-- 개별 숙소 -->
                    <div class="border p-3">
                        <a href=""><!--개별 페이지 이동 주소 링크-->
                            <div class="mb-3">
                                <!-- 사진 -->
                                <img src="/img/dog-6527479_1280.jpg" alt="" class="img-fluid">
                            </div>
                            <div>
                                <h4 class="fw-bold color-black">이름</h4>
                                <div class="mb-3">
                                    <div class="color-yellow mb-2 d-flex">
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><p class="color-black">(0)</p>
                                    </div>
                                <p class="mb-1 color-black"><i class="fas fa-check col-sm-1"></i>카테고리</p>
                                <p class="color-black"><i class="fas fa-map-marker-alt col-sm-1"></i>상세주소</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
                <!-- 페이지 번호 -->
                <div class="text-center mt-4">
                    <a href="" class="background-white p-1">1</a>
                    <a href="" class="background-white p-1">2</a>
                    <a href="" class="background-white p-1">3</a>
                </div>
            </div>
        </section>

	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>

</body>
</html>