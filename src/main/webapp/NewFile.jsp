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
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>회원가입</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>	

    <section>
        <div class="jumbotron background-lightgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">회원가입</h2>
            </div>
        </div>
    </section>
    
    <section>
    	<div class="container relative" style="padding: 50px 0 140px; min-height: 700px;">
    		<div class="absolute" style="width: 80%; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
    			<hr>
    			<div style="padding: 100px 0;">
	    			<h3>회원가입이 완료되었습니다.</h3>
		    		<p>소중한 반려동물과 함께 행복한 하루 되세요!</p><br>
		    		<a class="mt-5 me-3 button background-yellow" href="<c:url value="/member/login"/>">로그인</a><a class="mt-5 button background-green" href="<c:url value="/home"/>">메인으로</a>				
    			</div>
    			<hr>
    		</div>
    	</div>
    </section>
    
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
</body>
</html>