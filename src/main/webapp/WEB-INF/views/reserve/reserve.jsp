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
				<h2 class="display-3 font text-center">예약 목록</h2>
			</div>
		</div>
	</section>
	<br>
	
	
       
        
        <div class="p-3">
        	<p><b>숙소명</b> : ${reserve.title}</p>
        	<p><b>고객ID</b> : ${reserve.mem_id}</p>
        	<p><b>고객이름</b> : ${reserve.name}</p>
        	<p><b>고객연락처</b> : ${reserve.tel}</p>        	
        	<p><b>예약날짜</b> : ${reserve.date}</p>
	        <div class="col-md-8">
	        	<a href="/pet_hug/hotels" class="btn btn-secondary">숙소목록</a>
	        	<a href="<c:url value="/reserves/update?num=${reserve.num}"/>" class="btn btn-success">수정</a>
				<a href="<c:url value="javascript:deleteConfirm('${reserve.num}')"/>" class="btn btn-danger">삭제</a>
				<script>			
				function deleteConfirm(num) //삭제 버튼
				{
				   if(confirm("삭제합니다") == true)location.href="./delete?num="+num;
				   else return;
				}
				</script>
	        </div>
		</div>
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
	</body>
</html>