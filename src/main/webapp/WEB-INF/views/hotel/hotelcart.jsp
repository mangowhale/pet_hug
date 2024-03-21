<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value="/resources/js/tab.js?=ver1"/>"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?=ver1" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css?=ver0" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>숙소</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>

	<section>
		<div class="jumbotron background-darkgreen pt-5 pb-5">
			<div class="container">
				<h2 class="display-3 font text-center">관심목록</h2>
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
				<a href="/pet_hug/reserves" class="w-btn-outline w-btn-green2-outline2">예약목록</a>
			</c:when>
			<c:otherwise>
				<a href="/pet_hug/reserves/mem_id/${sessionScope.sessionId}" class="w-btn-outline w-btn-green2-outline2">예약목록</a>
			</c:otherwise>
		</c:choose>
		<a href="/pet_hug/hotelcart" class="w-btn-outline mypage-select2">관심목록</a>
		<a href="/pet_hug/courses/myCourses" class="w-btn-outline w-btn-green2-outline2">여행코스</a>
	</div>  
	<div class="container" style="min-height: 550px;">
		
		<div style="padding-top: 50px">
			<table class="table table-hover">
			<tr>
				<th>숙소사진</th>
				<th>숙소명</th>
				<th>주소</th>
				<th>이동하기</th>
				<th>비고</th>
			</tr>
			<form:form name="removeForm" method="put">
			<c:if test="${not empty sessionScope.sessionId}"> <!-- 로그인 한 경우에만 아래 목록들 출력 -->
				<c:forEach items="${hotelcart.hotelcartItems}" var="hotelitem">
				<tr class="align-middle">
					<td><a href="/pet_hug/hotels/hotel?num=${hotelitem.value.hotel.contentSeq}"><img src=${hotelitem.value.hotel.p1} style="width: 50%"></a></td>
					<td><a href="/pet_hug/hotels/hotel?num=${hotelitem.value.hotel.contentSeq}">${hotelitem.value.hotel.title}</a></td>
					<td><a href="/pet_hug/hotels/hotel?num=${hotelitem.value.hotel.contentSeq}">${hotelitem.value.hotel.address}</a></td>
					<td><a href="/pet_hug/reserves/add?title=${hotelitem.value.hotel.title}&contentSeq=${hotelitem.value.hotel.contentSeq}" class="btn btn-success">예약</a>
					<td><a href="javascript:removeFromCart('../hotelcart/remove/${hotelitem.value.hotel.contentSeq}')" class="btn btn-warning">삭제</a></td>									
					<script>
					function removeFromCart(action) 
					{
					    document.removeForm.action = action;
					    document.removeForm.submit();
					    //window.location.reload();
					    setTimeout(function () {window.location.reload();}, 500);
					}
					</script>
				</tr>
				</c:forEach>
			</c:if>
			</form:form>
			<tr>
				<th><a href="/pet_hug/hotels" class="btn btn-secondary">숙소목록</a></th>
				<th></th>
				<th></th>
				<th></th>
				<th>
					<form:form name="clearForm" method="delete">
						<a href="javascript:clearCart()" class="btn btn-warning pull-left">삭제하기</a>
						<script>
						function clearCart()
						{
							document.clearForm.submit();
							/*window.location.reload();*/
							setTimeout(function () {window.location.reload();}, 500);
						}
						</script>
					</form:form>
				</th>
			</tr>
			</table>
			
			
		</div>
	
	</div>


















	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
	

</body>
</html>