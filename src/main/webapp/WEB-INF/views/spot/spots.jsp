<%@page import="com.springmvc.domain.Content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?=ver3" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/radio_tab.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css?ver=1" rel="stylesheet">
<title>관광지</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>

        <section>
            <div class="jumbotron background-lightgreen pt-5 pb-5">
                <div class="container">
                    <h2 class="display-3 font text-center">관광지</h2>
                </div>    
            </div>
        </section>

   	<div class="tap_bar">
	    <a href="/pet_hug/hotels" class="w-btn-outline w-btn-green2-outline">숙　소</a>
	    <a href="/pet_hug/spots" class="w-btn-outline mypage-select">관광지</a>
	    <a href="/pet_hug/cafes" class="w-btn-outline w-btn-green2-outline">식음료</a>
	    <a href="/pet_hug/exps" class="w-btn-outline w-btn-green2-outline">체　험</a>      
    </div>

        <section class="pt-5">
            <div class="container">
                <div class="label-w10">
                    <label for="all" class="border py-2" onclick="navigateToAll()">전체</label>
					
					<script>
                    function navigateToAll() {
                        window.location.href = '/pet_hug/spots';
                        updateLabelStyle('all');
                    }

                    function updateLabelStyle(areaName) {
                        var labels = document.querySelectorAll('.label-w10 label');
                        labels.forEach(function(label) {
                            label.classList.remove('selected'); // 모든 라벨에서 'selected' 클래스 제거
                        });

                        var selectedLabel = document.querySelector('label[for="' + areaName + '"]');
                        if (selectedLabel) {
                            selectedLabel.classList.add('selected'); // 선택된 라벨에 'selected' 클래스 추가
                        }
                    }      
					</script>
					
					<label for="강릉시" class="border py-2" onclick="navigateToArea('강릉시')">강릉시</label>
					<label for="고성군" class="border py-2" onclick="navigateToArea('고성군')">고성군</label>
					<label for="동해시" class="border py-2" onclick="navigateToArea('동해시')">동해시</label>
					<label for="삼척시" class="border py-2" onclick="navigateToArea('삼척시')">삼척시</label>
					<label for="속초시" class="border py-2" onclick="navigateToArea('속초시')">속초시</label>
					<label for="양구군" class="border py-2" onclick="navigateToArea('양구군')">양구군</label>
					<label for="양양군" class="border py-2" onclick="navigateToArea('양양군')">양양군</label>
					<label for="영월군" class="border py-2" onclick="navigateToArea('영월군')">영월군</label>
					<label for="원주시" class="border py-2" onclick="navigateToArea('원주시')">원주시</label>
					<label for="인제군" class="border py-2" onclick="navigateToArea('인제군')">인제군</label>
					<label for="정선군" class="border py-2" onclick="navigateToArea('정선군')">정선군</label>
					<label for="철원군" class="border py-2" onclick="navigateToArea('철원군')">철원군</label>
					<label for="춘천시" class="border py-2" onclick="navigateToArea('춘천시')">춘천시</label>
					<label for="태백시" class="border py-2" onclick="navigateToArea('태백시')">태백시</label>
					<label for="평창군" class="border py-2" onclick="navigateToArea('평창군')">평창군</label>
					<label for="홍천군" class="border py-2" onclick="navigateToArea('홍천군')">홍천군</label>
					<label for="화천군" class="border py-2" onclick="navigateToArea('화천군')">화천군</label>
					<label for="횡성군" class="border py-2" onclick="navigateToArea('횡성군')">횡성군</label>
					
					
					<script>
					document.addEventListener('DOMContentLoaded', function() {
				        // 페이지 로드될 때 이전에 선택한 라벨의 스타일을 설정합니다.
				        var selectedLabelId = localStorage.getItem('selectedLabelId');
				        if (selectedLabelId) {
				            var selectedLabel = document.querySelector('label[for="' + selectedLabelId + '"]');
				            if (selectedLabel) {
				                selectedLabel.classList.add('selected');
				            }
				        }
				    });

				    function navigateToArea(areaName) {
				        updateURL(areaName);
				        updateLabelStyle(areaName);
				    }

				    function updateURL(areaName) {
				        var url = "/pet_hug/spots/areaName/" + encodeURIComponent(areaName);
				        window.location.href = url;
				    }

				    function updateLabelStyle(areaName) {
				        var labels = document.querySelectorAll('.label-w10 label');
				        labels.forEach(function(label) {
				            label.classList.remove('selected'); // 모든 라벨에서 'selected' 클래스 제거
				        });

				        var selectedLabel = document.querySelector('label[for="' + areaName + '"]');
				        if (selectedLabel) {
				            selectedLabel.classList.add('selected'); // 선택된 라벨에 'selected' 클래스 추가

				            // 선택한 라벨의 ID를 로컬 스토리지에 저장합니다.
				            localStorage.setItem('selectedLabelId', areaName);
				        }
				    }
					</script>
					<script>
						// 페이지 이동 시 스타일 초기화 /pet_hug/spots~~~~ 외 페이지로
						window.addEventListener('beforeunload', function() 
						{
					    	localStorage.removeItem('selectedLabelId'); // 저장된 라벨 정보 삭제
						});
					</script>
					
                </div>
            </div>
        </section>

        <section class="py-5 my-3" style="min-height: 900px;">
            <div class="container">
                <!-- 검색창 -->          
                <div class="w-100 mb-5">
			        <form id="searchForm" class="text-center" action="/pet_hug/spots/" method="GET" onsubmit="updateAction(event)">
			            <select id="searchType" class="py-1" name="type"> 
			                <option value="title">이름</option>      <!-- 옵션 선택별로 위 액션 주소 뒤에 붙는 url이 바뀜 -->
			                <option value="keyword">키워드</option>
			            </select>
			            <input type="text" class="input" name="value">
			            <button class="border px-2 py-1" type="submit"><i class="fas fa-search"></i></button>
			        </form>
			    </div>
			
			    <script>
			        function updateAction(event) //폼에 onsubmit="updateAction(event) 넣어주고 사용 원하는 url 임의 발생 + 뒤로가기 시 이전 검색주소 제거
			        {
			            event.preventDefault(); // 폼의 기본 동작을 막습니다.
			            var form = event.target;
			            var searchType = form.querySelector('#searchType').value;
			            var inputValue = form.querySelector('input[name="value"]').value;
			            
			           // 입력값이 없는 경우에는 폼을 서브밋하지 않음
			            if (!inputValue.trim()) 
			            {
			                return false;
			            }
			         
			            var url = form.action + searchType + '/' + encodeURIComponent(inputValue);
			            
			            // 이전에 추가된 쿼리 매개변수를 제거합니다.
			            if (window.location.search) {
			                var cleanUrl = window.location.href.split('?')[0];
			                window.history.replaceState({}, document.title, cleanUrl);
			            }
			
			            // 새로운 URL로 이동합니다.
			            window.location.href = url;
			        }
			    </script>
 				<div style="float: right; transform:translate(0px,-85px);">
					<c:if test="${sessionScope.sessionId == 'admin'}"> <!-- 특정 ID로 로그인 한 경우에만 아래 버튼 표시 -->
						<a href="/pet_hug/spots/add_api" class="w-btn-outline w-btn-green2-outline" >api업데이트</a>
						<a href="/pet_hug/hotels/add" class="w-btn-outline w-btn-green2-outline" >추가하기</a>
					</c:if>
				</div>
                <!-- 상품들 -->
                <!-- 게시판 출력 메커니즘으로 출력합시다 -->
                
				<c:choose>
					<c:when test="${empty spotList}">
						<hr>
						<h3 style="text-align: center; padding: 100px 0;">검색 결과가 없습니다.</h3>
						<hr style="margin-bottom: 120px;">
					</c:when>
					<c:otherwise>
						<div class="d-flex flex-4 flex-wrap w-100">
			                <c:forEach items="${spotList}" var="spot">
			                
			                    <!-- 개별 숙소 -->
			                    <div class="border p-3 mb-3 mr-3" style="height: 350px">
			                        <a href="<c:url value="/spots/spot?num=${spot.contentSeq}"/>" role="button"><!--개별 페이지 이동 주소 링크-->
			                            <div class="mb-3">
			                                <!-- 사진 -->
			                                <img src="${spot.p1}" alt="" class="img-fluid">
			                            </div>              
			                            <div>
			                                <h4 class="fw-bold color-black" style="font-size: 1rem; height: 2rem">${spot.title}</h4>
			                                <div class="mb-3">
			<%-- 							    	<div class="star_rating mb-4">
										        	<c:forEach begin="1" end="5" var="i">
										            	<span class="star ${i <= spot.star_avg ? 'on' : ''}" value="${i}"></span>
										            </c:forEach>
										            <span style="color:black; margin-left: 10px; color: gray">(${spot.review_num})</span>
										         </div> --%>
			                                <p class="mb-1 color-black"><i class="fa-solid fa-phone col-sm-1"></i> ${spot.tel}</p>
			                                <p class="color-black"><i class="fas fa-map-marker-alt col-sm-1"></i> ${spot.address}</p>
			                                </div>
			                            </div>
			                        </a>                     
			                    </div> 
		                    </c:forEach>                   
                		</div>
					</c:otherwise>
				</c:choose>  
                          
                            
                <!-- 페이지 번호 -->                
                <div class="text-center mt-4" id="paginationButtons">
				    <button id="firstPageButton" class="background-white p-1"><i class="fa-solid fa-angles-left"></i></button>
				    <button id="prevPageButton" class="background-white p-1"><i class="fa-solid fa-angle-left"></i></button>
				    <span id="pageNumber" class="p-1"></span>				
				    <button id="nextPageButton" class="background-white p-1"><i class="fa-solid fa-angle-right"></i></button>
				    <button id="lastPageButton" class="background-white p-1"><i class="fa-solid fa-angles-right"></i></button>
				</div>
				
                <script>
				    document.addEventListener('DOMContentLoaded', function() {
				        var spotContainer = document.getElementById('spotContainer');
				        var spots = document.querySelectorAll('.border.p-3.mb-3');
				
				        // 페이지당 표시할 자료의 수
				        var itemsPerPage = 8;
				
				        // 페이지 인덱스 및 현재 페이지에 보이는 요소의 인덱스 설정
				        var currentPage = 1;
				        var startIndex = 0;
				        var endIndex = itemsPerPage;
				
				        // 페이지를 업데이트하는 함수
				        function updatePage() {
				            // 현재 페이지에 표시할 요소 선택
				            var currentPageSpots = Array.from(spots).slice(startIndex, endIndex);
				
				            // 이전에 보이던 요소 숨기기
				            spots.forEach(function(spot) {
				                spot.style.display = 'none';
				            });
				
				            // 현재 페이지에 해당하는 요소 보이기
				            currentPageSpots.forEach(function(spot) {
				                spot.style.display = 'block';
				            });
				            
				         	// 총 페이지 수 계산
				            var totalPages = Math.ceil(spots.length / itemsPerPage);
				
				            // 페이지 번호 업데이트
				            document.getElementById('pageNumber').innerText = currentPage + '/' + totalPages;
				
				            
				            // 페이지 버튼 활성/비활성 설정
				            document.getElementById('firstPageButton').disabled = currentPage === 1;
				            document.getElementById('prevPageButton').disabled = currentPage === 1;
				            document.getElementById('nextPageButton').disabled = endIndex >= spots.length;
				            document.getElementById('lastPageButton').disabled = endIndex >= spots.length;
				        }
				
				        // 페이지 업데이트 함수 호출
				        updatePage();
				
				        // 이전 페이지로 이동하는 함수
				        function prevPage() {
				            if (currentPage > 1) {
				                currentPage--;
				                startIndex = (currentPage - 1) * itemsPerPage;
				                endIndex = Math.min(currentPage * itemsPerPage, spots.length);
				                updatePage();
				            }
				        }
				
				        // 다음 페이지로 이동하는 함수
				        function nextPage() {
				            if (endIndex < spots.length) {
				                currentPage++;
				                startIndex = (currentPage - 1) * itemsPerPage;
				                endIndex = Math.min(currentPage * itemsPerPage, spots.length);
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
				            currentPage = Math.ceil(spots.length / itemsPerPage);
				            startIndex = (currentPage - 1) * itemsPerPage;
				            endIndex = spots.length;
				            updatePage();
				        });
				    });
				</script>
                

            </div>
        </section>

    <jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
<script src="<c:url value="/resources/js/tab.js"/>"></script>
</body>
</html>