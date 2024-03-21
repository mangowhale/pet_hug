<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<title>상세보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>
		
	<section>
		<div class="jumbotron background-lightgreen pt-5 pb-5">
			<div class="container">
				<h2 class="display-3 font text-center">예약 완료</h2>
			</div>
		</div>
	</section>
	<br>
	<div class="container">
		<h2 class="alert alert-success">예약해 주셔서 감사합니다.</h2>		
			<p>${reserve.date}날짜로 예약되었습니다</p>			
	</div>
<div class="container">
	<p>
		<a href="/pet_hug/hotels" class="btn btn-secondary">숙소목록</a>
	</p>
</div>
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
	</body>
</html>