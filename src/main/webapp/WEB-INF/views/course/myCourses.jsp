<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?=ver3" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/course.css?=ver2" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>

   <section>
      <div class="jumbotron background-darkgreen pt-5 pb-5">
         <div class="container">
            <h2 class="display-3 font text-center">나의 여행코스</h2>
         </div>
      </div>
   </section>
   
	<div class="tap_bar">
		<a href="/pet_hug/member/info" class="w-btn-outline w-btn-green2-outline2">회원정보</a>
		<c:choose>
			<c:when test="${sessionScope.sessionId == 'admin'}"> <!--특정 ID로 로그인 한 경우에만 여기로 이동 -->
				<a href="/pet_hug/reserves" class="w-btn-outline w-btn-green2-outline2">예약목록</a>
			</c:when>
			<c:otherwise>
				<a href="/pet_hug/reserves/mem_id/${sessionScope.sessionId}" class="w-btn-outline w-btn-green2-outline2">예약목록</a>
			</c:otherwise>
		</c:choose>
		<a href="/pet_hug/hotelcart" class="w-btn-outline w-btn-green2-outline2">관심목록</a>
		<a href="/pet_hug/courses/myCourses" class="w-btn-outline mypage-select2">여행코스</a>
	</div>  
   
	<section style="min-height: 700px;">
		<c:choose>
			<c:when test="${courseCount > 0}">
				<div class="container" style="padding: 100px 0;">
					<div class="d-flex flex-wrap">
						<c:forEach items="${courseList}" var="course">
							<div onclick="moveToCourse('${course.courseNum}')" class="courseName">
								<p>${course.courseName}</p>
								<p class="courseDate">${course.createDate}</p>
								<div class="courseDetail"><i class="fas fa-search"></i>상세보기</div>
							</div>
						</c:forEach>
					</div>
						<div></div>
				</div>
			</c:when>
			<c:otherwise>
				<div style="padding: 100px 0;" class="container">
				
					<hr>
					<h3 style="text-align: center; margin: 100px 0;">저장된 여행코스가 없습니다.<br>
						여행코스 만들기에서 나만의 여행코스를 만들어보세요.</h3>
					<hr>
				</div>
			</c:otherwise>
		</c:choose>
	</section>
	<script>
		function moveToCourse(courseNum){
			window.location.href = "myCourse?courseNum=" + courseNum;
		}
	</script>
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
</body>
</html>