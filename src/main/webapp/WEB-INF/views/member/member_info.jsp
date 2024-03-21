<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?ver=1" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/radio_tab.css?ver=1" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css?ver=1" rel="stylesheet">
<title>회원정보</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>	
	<section>
        <div class="jumbotron background-darkgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">회원정보</h2>
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
        <div class="container" style="padding: 100px 0;">
            <div class="d-flex">
                <div class="form col-sm-5 offset-md-1  me-5" style="transform:translate(150px,50px);">
                    <form:form action="/pet_hug/member/update_info" modelAttribute="member" class="form-horizontal">
                        
                        <div class="form-group row">
                            <label for="" class="col-sm-3 control-label">아이디</label>
                            <div class="col-sm-3">
                                <form:input class="input" readonly="true" path="mem_id" value="${member.mem_id}"/>
                            </div> 
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">이름</label>
                            <div class="col-sm-3">
                                <form:input class="input" required="required" path="mem_name" maxlength="17" value="${member.mem_name}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">닉네임</label>
                            <div class="col-sm-3">
                                <form:input class="input" path="mem_nickname" minlength="2" maxlength="10" placeholder="2~10글자" value="${member.mem_nickname}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">전화번호</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="11" path="mem_phone" placeholder="'-' 없이 숫자만 입력해주세요" value="${member.mem_phone}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">이메일</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="40" path="mem_email" value="${member.mem_email}"/>
                            </div>
                        </div>
                        <div class="form-group row mt-4">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" value="수정" class="offset-md-8 btn btn-success">
                            	<a href="<c:url value="/home"/>" class="btn btn-warning">취소</a><br>
                            </div>
                        </div>
                    </form:form>
                    <form name="delete_form" action="<c:url value="/member/delete_member"/>" onsubmit="return confirm('회원 탈퇴하시겠습니까?');">
                    	<input type="submit" value="회원 탈퇴" class="btn btn-warning"/>
                    </form>
                </div>
                <div id="#">
                	<img alt="" src="https://newsimg-hams.hankookilbo.com/2021/12/19/51e4f7ad-79f8-44b7-9a5c-6354dbd55df3.jpg" style="width:750px">
                </div>
            </div>          
        </div>							
    </section>

    <jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>

</body>
</html>