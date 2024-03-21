<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js?=ver2"></script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://kit.fontawesome.com/f70c884d31.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?=ver2" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>리뷰 수정</title>
</head>
<body>
		<div name="리뷰" class="p-5" style="border-radius: 10px; height: 400px;">		
			<h4 style="margin-bottom: 5px">리뷰 수정</h4>
			<c:url value="/reviews/update" var="update_url"/>
			<form:form modelAttribute="review" class="form-horizontal" action="${update_url}">
				<div class ="star_rating">
					<span class="star" value="1"> </span>
					<span class="star" value="2"> </span>
					<span class="star" value="3"> </span>
					<span class="star" value="4"> </span>
					<span class="star" value="5"> </span>
					<!-- hidden input 추가 -->
					<input type="hidden" id="starValue" name="star" />
					<input type="hidden" name="category" value="${category}"/>
					<input type="hidden" name="mem_id" value="${review.mem_id}"/>
					<input type="hidden" name="contentSeq" value="${review.contentSeq}"/>
				</div>
				<form:textarea path="text" class="star_box" placeholder="리뷰 내용을 작성해주세요. (최대 200자)" maxlength="200" value="${review.text}" />
				<input type="submit" class="btn02" value="리뷰 등록"/>	
			</form:form>				
		</div>
		   <script>
   $(document).ready(function() {
	    // "리뷰 작성" 부분의 별은 클릭할 수 있도록 유지
	    $('.p-5 .star_rating > .star').click(function() {
	        $(this).parent().children('span').removeClass('on');
	        $(this).addClass('on').prevAll('span').addClass('on');
	        var value = $(this).attr('value');
	        $('#starValue').val(value); // 선택된 별의 값을 hidden 입력 필드에 설정
	    });

	    // "reviewList"에서 가져온 별은 클릭할 수 없도록 함
	    $('.reviewList .star_rating > .star').click(function() {
	        // 클릭 이벤트 무시
	        return false;
	    });
	});

	// 별을 클릭할 때 해당하는 값을 가져와서 hidden input에 설정하는 함수
	function setStarValue(value) {
	    document.getElementById('starValue').value = value;
	}

	// 각 별을 클릭할 때 setStarValue 함수를 호출하여 hidden input에 값을 설정
	document.querySelectorAll('.star').forEach(function(star) {
	    star.addEventListener('click', function() {
	        var value = parseInt(this.getAttribute('value'));
	        setStarValue(value);
	    });
	});
	
	function moveBack(){
		opener.location.reload();
		self.close();
	}
   </script>
</body>
</html>