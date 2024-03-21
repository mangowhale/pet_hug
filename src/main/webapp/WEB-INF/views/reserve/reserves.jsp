<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/f70c884d31.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/radio_tab.css" type="text/css">    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css?ver=1" rel="stylesheet">
    <title>예약목록</title>
</head>

<body>
    <jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false" />

    <section>
        <div class="jumbotron background-darkgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">예약목록</h2>
            </div>
        </div>
    </section>
    
	<div class="tap_bar">	
		<c:choose>
			<c:when test="${sessionScope.sessionId == 'admin'}"> <!--특정 ID로 로그인 한 경우에만 여기로 이동 -->
				<a href="/pet_hug/staff/members" class="w-btn-outline w-btn-green2-outline2">회원관리</a>
			</c:when>
			<c:otherwise>
				<a href="/pet_hug/member/info" class="w-btn-outline w-btn-green2-outline2">회원정보</a>
			</c:otherwise>
		</c:choose>	
		<c:choose>
			<c:when test="${sessionScope.sessionId == 'admin'}"> <!--특정 ID로 로그인 한 경우에만 여기로 이동 -->
				<a href="/pet_hug/reserves" class="w-btn-outline mypage-select2">예약목록</a>
			</c:when>
			<c:otherwise>
				<a href="/pet_hug/reserves/mem_id/${sessionScope.sessionId}" class="w-btn-outline mypage-select2">예약목록</a>
			</c:otherwise>
		</c:choose>
		<a href="/pet_hug/hotelcart" class="w-btn-outline w-btn-green2-outline2">관심목록</a>
		<a href="/pet_hug/courses/myCourses" class="w-btn-outline w-btn-green2-outline2">여행코스</a>
	</div> 
    
    <br>

	<!-- 검색창 -->
  		
	<c:if test="${sessionScope.sessionId == 'admin'}"> <!--특정 ID로 로그인 한 경우에만 검색 버튼들 표시 -->
		<div class="w-100 mb-5">
			<form id="searchForm" class="text-center" action="/pet_hug/reserves/" method="GET" onsubmit="updateAction(event)">
				<select id="searchType" class="py-1" name="type"> 
	   				<option value="mem_id">아이디</option>      <!-- 옵션 선택별로 위 액션 주소 뒤에 붙는 url이 바뀜 -->			                
	   				<option value="tel">연락처</option>
					<option value="name">이름</option>
				</select>
				<input type="text" class="input" name="value">
				<button class="border px-2 py-1" type="submit"><i class="fas fa-search"></i></button>
			</form>
		</div>
	</c:if>	

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
	<!-- 검색창 끝 -->




    <div class="container ">
        <div style="padding-top: 50px">
        <div style="height: 396px;">
            <table class="table table-hover" id="reserveTable" >
                <thead>
                    <tr style="text-align: center;">
                        <th>예약번호</th>
                        <th>숙소명</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>연락처</th>
                        <th>날짜</th>
                        <th>수정하기</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty sessionScope.sessionId}">
                        <c:forEach items="${reserveList}" var="reserve" varStatus="loop">
                         	<tr class="align-middle page-${(loop.index / 10) + 1}" style="display: none; text-align: center;">                          	
                                <td style="width:82.89px">${reserve.num}</td>
                                <td style="width:180.55px">
									<c:choose>
										<c:when test="${fn:length(reserve.title) <= 10}"> <!-- 10글자 미만은 그냥 내보내기 -->
											<a href="/pet_hug/hotels/hotel?num=${reserve.contentSeq}">${reserve.title}</a>
										</c:when>
										<c:otherwise>
											<a href="/pet_hug/hotels/hotel?num=${reserve.contentSeq}">${fn:substring(reserve.title, 0, 10)}...</a> <!-- 10글자 이상은 ...으로 줄여서 내보내기 -->
										</c:otherwise>
									</c:choose>                               
                                </td>
                                <td style="width:139px">
                                	<c:choose>
									<c:when test="${fn:length(reserve.mem_id) <= 10}"> <!-- 10글자 미만은 그냥 내보내기 -->
										${reserve.mem_id}
									</c:when>
									<c:otherwise>
										${fn:substring(reserve.mem_id, 0, 10)}... <!-- 10글자 이상은 ...으로 줄여서 내보내기 -->
									</c:otherwise>
									</c:choose>
                                </td>
                                <td style="width:109.86px">
                                <c:choose>
									<c:when test="${fn:length(reserve.name) <= 5}"> <!-- 5글자 미만은 그냥 내보내기 -->
										${reserve.name}
									</c:when>
									<c:otherwise>
										${fn:substring(reserve.name, 0, 5)}... <!-- 5글자 이상은 ...으로 줄여서 내보내기 -->
									</c:otherwise>
								</c:choose>
                                </td>
                                <td style="width:149.3px">${reserve.tel}</td>
                                <td style="width:114.91px">${reserve.date}</td>
                                <td style="width:82.83px"><a href="/pet_hug/reserves/update?num=${reserve.num}" class="btn btn-success">수정</a></td>
                                <td style="width:76.66px"><a href="javascript:deleteConfirm('${reserve.num}')" class="btn btn-warning">삭제</a></td>									
                            	<script>
                            	function deleteConfirm(num) //삭제 버튼
                				{
                				   if(confirm("예약을 취소 합니다") == true)location.href="/pet_hug/reserves/delete?num="+num;
                				   else return;
                				}
								</script>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
            </table>
            </div>
            <!-- 페이지네이션 버튼 -->
            <div class="text-center mt-4" id="paginationButtons">
                <button id="firstPageButton" class="background-white p-1"><i class="fa-solid fa-angles-left"></i></button>
                <button id="prevPageButton" class="background-white p-1"><i class="fa-solid fa-angle-left"></i></button>
                <span id="pageNumber" class="p-1"></span>              
                <button id="nextPageButton" class="background-white p-1"><i class="fa-solid fa-angle-right"></i></button>
                <button id="lastPageButton" class="background-white p-1"><i class="fa-solid fa-angles-right"></i></button>
            </div>
             <!-- 페이지네이션 자바스크립트 -->
		    <script>
		        document.addEventListener('DOMContentLoaded', function() {
		            var currentPage = 1; // 현재 페이지 초기화
		            var itemsPerPage = 5; // 페이지당 항목 수
		            
		            // 페이지 버튼 클릭 시 이벤트 처리
		            document.getElementById('firstPageButton').addEventListener('click', function() {
		                showPage(1);
		            });
		            
		            document.getElementById('prevPageButton').addEventListener('click', function() {
		                showPage(currentPage - 1);
		            });
		            
		            document.getElementById('nextPageButton').addEventListener('click', function() {
		                showPage(currentPage + 1);
		            });
		            
		            document.getElementById('lastPageButton').addEventListener('click', function() {
		                showPage(Math.ceil(document.querySelectorAll('.align-middle').length / itemsPerPage));
		            });
		            
		            // 페이지 표시 함수
		            function showPage(page) {
		                var totalItems = document.querySelectorAll('.align-middle').length; // 총 항목 수
		                var totalPages = Math.ceil(totalItems / itemsPerPage); // 총 페이지 수
		                
		                // 페이지가 범위 내에 있는지 확인
		                if (page < 1) {
		                    page = 1;
		                }
		                if (page > totalPages) {
		                    page = totalPages;
		                }
		                
		                // 페이지 갱신
		                currentPage = page;
		                document.getElementById('pageNumber').innerText = currentPage + '/' + totalPages;
		                
		                // 항목 표시 여부 설정
		                var startIndex = (currentPage - 1) * itemsPerPage;
		                var endIndex = Math.min(startIndex + itemsPerPage, totalItems);
		                
		                document.querySelectorAll('.align-middle').forEach(function(item, index) {
		                    if (index >= startIndex && index < endIndex) {
		                        item.style.display = 'table-row';
		                    } else {
		                        item.style.display = 'none';
		                    }
		                });
		                
		             // 페이지 버튼 활성/비활성 설정
			            document.getElementById('firstPageButton').disabled = currentPage === 1;
			            document.getElementById('prevPageButton').disabled = currentPage === 1;
			            document.getElementById('nextPageButton').disabled = currentPage === totalPages;
			            document.getElementById('lastPageButton').disabled = currentPage === totalPages;
		            }
		            
		            // 초기 페이지 표시
		            showPage(1);
		        });
		    </script>
		    <br>
		    
        </div>
    </div>
  
    <jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false" />
    
   
</body>

</html>
