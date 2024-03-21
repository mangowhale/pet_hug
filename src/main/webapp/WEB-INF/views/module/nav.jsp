<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&family=Noto+Sans+KR&family=Poor+Story&family=Roboto:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/nav.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
    <nav>
        <a class="logo" href="/pet_hug/home"><img src="${pageContext.request.contextPath}/resources/images/sample/pethug.png" style="height:90px"></a>
        <ul id="nav_bar">  	
            <li><a href="/pet_hug/courses/getMap">여행코스 만들기</a>
            <li><a href="/pet_hug/hotels">여행지 찾아보기</a>
<!--             	<ul id="innerUl">
            		<li><a href="/pet_hug/hotels">숙소</a>
            		<hr>
	         		<li><a href="/pet_hug/spots">관광지</a>
	         		<hr>
	         		<li><a href="/pet_hug/cafes">식음료</a>
	         		<hr>
	         		<li><a href="/pet_hug/exps">체험</a>  
            	</ul> -->
            </li>       
            <c:if test="${empty sessionScope.sessionId}">
            	<li><a href="/pet_hug/member/add">회원가입</a></li>
        		<li><a href="/pet_hug/member/login">로그인</a></li>
        	</c:if>
            <c:if test="${not empty sessionScope.sessionId}">
			    <c:if test="${sessionScope.sessionId == 'admin'}">
			        <li><a href="/pet_hug/staff/members">마이페이지</a></li>
			        <li><a href="/pet_hug/member/logout">로그아웃</a></li>
			    </c:if>
			    <c:if test="${sessionScope.sessionId != 'admin'}">
			        <li><a href="/pet_hug/member/info">마이페이지</a></li>
			        <li><a href="/pet_hug/member/logout">로그아웃</a></li>
			    </c:if>
			</c:if>
        </ul>       
    </nav>
</body>
</html>