<%@page import="org.springframework.jdbc.core.JdbcTemplate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import = "javax.sql.DataSource" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js?=ver2"></script>
<script src="<c:url value="/resources/js/tab.js?=ver1"/>"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?=ver1" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>숙소</title>
</head>
<body>
   <jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>
      
   <section>
      <div class="jumbotron background-lightgreen pt-5 pb-5">
         <div class="container">
            <h2 class="display-3 font text-center">상세 보기</h2>
         </div>
      </div>
   </section>
	<div class="container">
		<h2 class="fw-bold pt-5 pb-4 contentTitle">${cafe.title}</h2>
    	<div>
        	<div class="d-flex">
	            <img src="${cafe.p1}" class="slide"/>
	            <c:if test="${cafe.p2 ne null}">
	            	<img src="${cafe.p2}" class="slide"/>
	            </c:if>
	            <c:if test="${cafe.p3 ne null}">
	            	<img src="${cafe.p3}" class="slide"/>
	            </c:if>
	            <c:if test="${cafe.p4 ne null}">
	            	<img src="${cafe.p4}" class="slide"/>
	            </c:if>
        	</div>
         <hr>
        <div class="py-3">
			<div class="infoContainer d-flex">
				<p><i class="fa-solid fa-location-dot p-2"></i><b>주소</b> : ${cafe.address}</p>
                <p><i class="fa-solid fa-phone p-2"></i><b>연락처</b> : ${cafe.tel}</p>
			</div>	
			<div class="infoContainer d-flex">
				<p><i class="far fa-clock p-2"></i><b>이용시간</b> : ${cafe.usedTime}</p>
                <p><i class="fa-solid fa-hashtag p-2"></i><b>키워드</b> : ${cafe.keyword}</p>
			</div>
			
			<div class="pt-3 pb-5 d-flex">
				<c:if test="${cafe.bathFlag eq 'Y'}">
					<div class="miniTag">
						<i class="fas fa-bath"></i>
						<p>반려견 목욕</p>
					</div>
				</c:if>
				<c:if test="${cafe.provisionFlag eq 'Y'}">
					<div class="miniTag">
						<i class="fas fa-soap"></i>
						<p>비품 제공</p>
					</div>
				</c:if>
				<c:if test="${cafe.petFlag eq 'Y'}">
					<div class="miniTag">
						<i class="fas fa-bone"></i>
						<p>펫 동반식당</p>
					</div>
				</c:if>
				<c:if test="${cafe.petWeight ne null && not empty cafe.petWeight}">
					<div class="miniTag weightConstraint">
						<h6><span>${cafe.petWeight}</span>kg</h6>
						<p>몸무게 제한</p>
					</div>
				</c:if>
				<c:if test="${empty cafe.petWeight}">
					<div class="miniTag weightConstraint">
						<i class="fas fa-times"></i>
						<p>몸무게 제한</p>
					</div>
				</c:if>
				<c:if test="${cafe.emergencyFlag eq 'Y'}">
					<div class="miniTag">
						<i class="fas fa-hand-holding-medical"></i>
						<p>응급 수칙</p>
					</div>
				</c:if>
				<c:if test="${cafe.entranceFlag eq 'Y'}">
					<div class="miniTag">
						<i class="fas fa-coins"></i>
						<p>입장료 있음</p>
					</div>
				</c:if>
				<c:if test="${cafe.parkingFlag eq 'Y'}">
					<div class="miniTag">
						<i class="fas fa-car"></i>
						<p>주차장</p>
					</div>
				</c:if>
				<c:if test="${cafe.inOutFlag eq 'OUT'}">
					<div class="miniTag">
						<i class="fas fa-tree"></i>
						<p>야외</p>
					</div>
				</c:if>
				<c:if test="${cafe.inOutFlag eq 'IN'}">
					<div class="miniTag">
						<i class="fas fa-house-user"></i>
						<p>실내</p>
					</div>
				</c:if>
				
			</div>   
               <div class="col-md-12">
                   <form:form name="addForm" method="PUT">
                   <c:if test="${cafe.homePage ne null }">
               			<a href="${cafe.homePage}" target="_blank" class="homepageLink w-btn-outline1"><i class="fas fa-globe"></i> 홈페이지 이동</a>
                	</c:if>            	                                 
                  	<a href="/pet_hug/cafes" class="w-btn-outline1 w-btn-gray-outline">목록으로</a> 
                  	<c:if test="${sessionScope.sessionId == 'admin'}"> <!-- 특정 ID로 로그인 한 경우에만 아래 두 버튼들 표시 -->
						<a href="<c:url value="/hotels/update?num=${cafe.contentSeq}"/>" class="btn btn-success">수정</a>
						<a href="<c:url value="javascript:deleteConfirm('${cafe.contentSeq}')"/>" class="btn btn-danger"><i class="far fa-trash-alt me-1"></i>삭제</a>
					</c:if>        	
                	 <script>		
	                 	 function deleteConfirm(num) //삭제 버튼
	                	  {
	                 	    if(confirm("삭제합니다") == true)location.href="/pet_hug/cafes/delete?num="+num;
	                   	  else return;
	                 	 }
                 	 </script>
                 </form:form>            
               </div>  
               <br>
         </div>
      </div>
      <div id="소개" class="py-3">
         <hr class="hr-green">
         <h4 class="font"><i class="fa-solid fa-dog"></i>&nbsp;소개</h4>
         <p>${cafe.content}
      </div>
      <div id="주요시설" class="py-3">
         <hr class="hr-green">
         <h4 class="font"><i class="fa-solid fa-cat"></i>&nbsp;주요시설</h4>
         <p>${cafe.mainFacility}
      </div>
      <div id="이용요금" class="py-3">
         <hr class="hr-green">   
         <h4 class="font"><i class="fa-solid fa-dog"></i>&nbsp;이용요금</h4>
         <p>${cafe.usedCost}
      </div>
      <div id="반려견정책 및 주의사항" class="py-3">
         <hr class="hr-green">
         <h4 class="font"><i class="fa-solid fa-cat"></i>&nbsp;반려동물정책 및 주의사항</h4>
         <p>${cafe.policyCautions}
      </div>
      <div id="지도넣을곳" class="py-3">
         <hr class="hr-green">
         <h4 class="font"><i class="fa-solid fa-dog"></i>&nbsp;위치보기</h4>
         
         <div id="map" style="width:100%;height:350px;"></div>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a4ab729c1aae3934d705ceb879a263a&libraries=services"></script>
         <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = {
                 center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };  
         
         // 지도를 생성합니다    
         var map = new kakao.maps.Map(mapContainer, mapOption); 
         
         // 주소-좌표 변환 객체를 생성합니다
         var geocoder = new kakao.maps.services.Geocoder();
         
         // 주소로 좌표를 검색합니다
         geocoder.addressSearch('${cafe.address}', function(result, status) {
         
             // 정상적으로 검색이 완료됐으면 
              if (status === kakao.maps.services.Status.OK) {
         
                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
         
                 // 결과값으로 받은 위치를 마커로 표시합니다
                 var marker = new kakao.maps.Marker({
                     map: map,
                     position: coords
                 });
         
                 // 인포윈도우로 장소에 대한 설명을 표시합니다
                 var infowindow = new kakao.maps.InfoWindow({
                     content: '<div style="width:150px;text-align:center;padding:6px 0;">${cafe.title}</div>'
                 });
                 infowindow.open(map, marker);
         
                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                 map.setCenter(coords);
             } 
         });    
         </script>   
      </div>
      
    <hr class="hr-green" style="height: 1px; width: 100%">
    <h4 class="font"><i class="fa-solid fa-comment"></i>&nbsp;리뷰</h4>	
	<div class="d-flex">
	<c:choose>
		<c:when test="${empty sessionScope.sessionId}">
			<div id="리뷰" class="p-5" style="width: 32%; margin-right: 1%; border-radius: 10px; height: 350px; padding-top: 5px !important;">		
				<p style="margin-bottom: 5px">리뷰 작성</p>
				<form:form modelAttribute="NewReview" class="form-horizontal">
					<form:textarea path="text" class="star_box" placeholder="로그인 후에 이용 가능합니다." maxlength="200" readonly="readonly"/>
				</form:form>				
			</div>
		</c:when>
		<c:when test="${not empty sessionScope.sessionId}">
			<c:choose>
				<c:when test="${verify == 1}">
					<div id="리뷰" class="p-5" style="width: 32%; margin-right: 1%; border-radius: 10px; height: 350px; padding-top: 5px !important;">		
						<p style="margin-bottom: 5px">나의 리뷰</p>
						<form action="review/update" method="POST" class="form-horizontal">
							<textarea name="text" class="star_box" placeholder="리뷰 내용을 작성해주세요. (최대 200자)" maxlength="200">${myReview.text}</textarea>
							<input type="hidden" name="mem_id" value="${myReview.mem_id}"/>
							<input type="hidden" name="contentSeq" value="${myReview.contentSeq}"/>
							<input type="submit" class="submit-green" value="리뷰 수정"/>
							<a href="review/delete?num=${myReview.num}&contentSeq=${myReview.contentSeq}" class="submit-red" onclick="return confirm('리뷰를 삭제하시겠습니까?');">리뷰 삭제</a>
						</form>				
					</div>
				</c:when>
				<c:otherwise>
					<div id="리뷰" class="p-5" style="width: 32%; margin-right: 1%; border-radius: 10px; height: 350px; padding-top: 5px !important;">		
						<p style="margin-bottom: 5px">리뷰 작성</p>
						<form:form modelAttribute="NewReview" class="form-horizontal">
							<form:textarea path="text" class="star_box" placeholder="리뷰 내용을 작성해주세요. (최대 200자)" maxlength="200" />
							<input type="submit" class="btn02" value="리뷰 등록"/>	
						</form:form>				
					</div>
				</c:otherwise>
			</c:choose>
		</c:when>
	</c:choose>		
	    <div class="d-flex" style="width: 67%">
			<c:forEach items="${reviewList}" var="review">
			<c:if test="${review.mem_id != sessionScope.sessionId}">
			<div id="printReview" class="p-5" style="padding: 5px 50px 50px!important; height: 400px; width: 49%; ">
				<p style="margin-bottom: 5px">${review.mem_nickname} (${review.rev_date})</p>
	            <div class="star_box">
	            	<p>${review.text}</p>
	            </div>
	            <div style="margin-bottom: 100px">
	            </div>
			</div>
			</c:if>
	        </c:forEach>   
	    </div>
	  </div>
	<div class="text-center mt-4" id="paginationButtons" style="padding-bottom: 50px">
		    <button id="firstPageButton" class="background-white p-1"><i class="fa-solid fa-angles-left"></i></button>
		    <button id="prevPageButton" class="background-white p-1"><i class="fa-solid fa-angle-left"></i></button>
		    <span id="pageNumber" class="p-1"></span>				
		    <button id="nextPageButton" class="background-white p-1"><i class="fa-solid fa-angle-right"></i></button>
		    <button id="lastPageButton" class="background-white p-1"><i class="fa-solid fa-angles-right"></i></button>
		</div>
				
        <script>
	    	document.addEventListener('DOMContentLoaded', function() {
	        var printReview = document.getElementById('printReview');
	        var reviews = document.querySelectorAll('#printReview');
	
	        // 페이지당 표시할 자료의 수
	        var itemsPerPage = 2;
	
	        // 페이지 인덱스 및 현재 페이지에 보이는 요소의 인덱스 설정
	        var currentPage = 1;
	        var startIndex = 0;
	        var endIndex = itemsPerPage;
	
	        // 페이지를 업데이트하는 함수
	        function updatePage() {
	            // 현재 페이지에 표시할 요소 선택
	            var currentPageReviews = Array.from(reviews).slice(startIndex, endIndex);
	
	            // 이전에 보이던 요소 숨기기
	            reviews.forEach(function(review) {
	                review.style.display = 'none';
	            });
	
	            // 현재 페이지에 해당하는 요소 보이기
	            currentPageReviews.forEach(function(review) {
	                review.style.display = 'block';
	            });
	
	            // 페이지 번호 업데이트
	            document.getElementById('pageNumber').innerText = currentPage;
	
	            // 페이지 버튼 활성/비활성 설정
	            document.getElementById('firstPageButton').disabled = currentPage === 1;
	            document.getElementById('prevPageButton').disabled = currentPage === 1;
	            document.getElementById('nextPageButton').disabled = endIndex >= reviews.length;
	            document.getElementById('lastPageButton').disabled = endIndex >= reviews.length;
	        }
	
	        // 페이지 업데이트 함수 호출
	        updatePage();
	
	        // 이전 페이지로 이동하는 함수
	        function prevPage() {
	            if (currentPage > 1) {
	                currentPage--;
	                startIndex = (currentPage - 1) * itemsPerPage;
	                endIndex = Math.min(currentPage * itemsPerPage, reviews.length);
	                updatePage();
	            }
	        }
	
	        // 다음 페이지로 이동하는 함수
	        function nextPage() {
	            if (endIndex < reviews.length) {
	                currentPage++;
	                startIndex = (currentPage - 1) * itemsPerPage;
	                endIndex = Math.min(currentPage * itemsPerPage, reviews.length);
	                updatePage();
	            }
	        }
	
	        // 페이지 버튼에 이벤트 리스너 추가
	        document.getElementById('firstPageButton').addEventListener('click', function() {
	            currentPage = 1;
	            startIndex = 0;
	            endIndex = itemsPerPage;
	            updatePage();
	        });
	
	        document.getElementById('prevPageButton').addEventListener('click', prevPage);
	
	        document.getElementById('nextPageButton').addEventListener('click', nextPage);
	
	        document.getElementById('lastPageButton').addEventListener('click', function() {
	            currentPage = Math.ceil(reviews.length / itemsPerPage);
	            startIndex = (currentPage - 1) * itemsPerPage;
	            endIndex = reviews.length;
	            updatePage();
	        });
	    });
	</script>

   </div>

   <script>
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
   </script>


   <jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>

   </body>
</html>
