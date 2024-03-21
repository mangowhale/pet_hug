<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>	
	
	<section>
        <div class="jumbotron background-darkgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">회원관리</h2>
            </div>
        </div>
    </section>
	
	
	<div class="tap_bar">	
	
		<c:choose>
			<c:when test="${sessionScope.sessionId == 'admin'}"> <!--특정 ID로 로그인 한 경우에만 여기로 이동 -->
				<a href="/pet_hug/staff/members" class="w-btn-outline mypage-select2">회원관리</a>
			</c:when>
			<c:otherwise>
				<a href="/pet_hug/member/info" class="w-btn-outline mypage-select2">회원정보</a>
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
		<a href="/pet_hug/hotelcart" class="w-btn-outline w-btn-green2-outline2">관심목록</a>
		<a href="/pet_hug/courses/myCourses" class="w-btn-outline w-btn-green2-outline2">여행코스</a>
	</div>
	
    <section>
        <div class="container" style="padding: 180px 0;">

            <hr class="my-4">
            <table class="table mb-5">
                <tr>
                    <th>아이디
                    <th>이름
                    <th>닉네임
                    <th>이메일
                    <th>상세정보
                </tr>
                    <c:forEach items="${member_list}" var="member">
                    <tr>
                        <td>${member.mem_id}
                        <td>${member.mem_name}</td>
                        <td>${member.mem_nickname}
                        <td>${member.mem_email}
                        <td><a href="<c:url value="/staff/members/detail?id=${member.mem_id}"/>" >상세정보</a>
                    </tr>
                    </c:forEach>
            </table>
        </div>
    </section>

	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
</body>
</html>