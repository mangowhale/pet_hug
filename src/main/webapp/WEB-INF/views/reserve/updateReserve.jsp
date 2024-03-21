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
				<h2 class="display-3 font text-center">예약 수정</h2>
			</div>
		</div>
	</section>
	<br>
	
	
	
	
	
	<div class="container" style="min-height:600px;">

      <div style="width:50%; transform:translate(400px,100px);">
       <form:form modelAttribute = "updateReserve" action="./update?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" onsubmit="return validateForm();">
       <script>
		    function validateForm() {
		        var name = document.getElementById("name").value;
		        var tel = document.getElementById("tel").value;
		        var date = document.getElementById("Date").value;
		
		        if (name.trim() === '' || tel.trim() === '' || date.trim() === '') {
		            alert("이름, 연락처, 날짜를 모두 입력하세요."); 
		            return false;
		        }
		    }
		</script>
        <fieldset>
        
        <div class="form-group row">
			<label class="col-sm-2 control-label">예약 번호</label>
			<div class="col-sm-6">
				<form:input id="num" path="num" type="hidden" class="form-control" value="${reserve.num}" readonly="true"/>
				${reserve.num}															<!-- readonly 아니면 입력 안됌 disabled X -->
			</div>
		</div>
		<br>
     	<div class="form-group row">
			<label class="col-sm-2 control-label">숙소명</label>
			<div class="col-sm-6">
				<form:input id="title" path="title" type="hidden" class="form-control" value="${reserve.title}" readonly="true"/>
				${reserve.title}																<!-- readonly 아니면 입력 안됌 disabled X -->
			</div>
		</div>
        <br> 
        <div class="form-group row">
            <label class="col-sm-2 control-label" >고객ID</label>
            <div class="col-sm-6">
                <form:input  path="mem_id" type="hidden" class="form-control" value="${reserve.mem_id}" readonly="true"/>  
                ${reserve.mem_id}															<!-- readonly 아니면 입력 안됌 disabled X -->
            </div>
        </div>
        <br>
        <div class="form-group row">
           <label class="col-sm-2 control-label" >고객이름</label>
           <div class="col-sm-6">
               <form:input  path="name" class="form-control" value="${reserve.name}"/>  
           </div>
        </div>
        <br>
        <div class="form-group row">
           <label class="col-sm-2 control-label" >연락처</label>
           <div class="col-sm-6">
               <form:input  path="tel" class="form-control" value="${reserve.tel}"/>  
           </div>
        </div>
        <br>              
        <div class="form-group row">
            <label class="col-sm-2 control-label" >날짜</label>
            <div class="col-sm-6">     
                <form:input type="date" id="Date" path="date" class="form-control" value="${reserve.date}"/>  
            </div>
            <script>
            var now_utc = Date.now() // 지금 날짜를 밀리초로
        	 // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
        	 var timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
       		 // new Date(now_utc-timeOff).toISOString()은 '지금을 기준' 반환
       		 var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
         	document.getElementById("Date").setAttribute("min", today); // min 오늘 이전 선택 불가능 max 오늘 이후
            </script>
        </div>
       <br>
        <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10" >
            <input type="submit" class="btn btn-success" value ="수정"/>
            <a href="/pet_hug/reserves/mem_id/${sessionScope.sessionId}" class="btn btn-warning">취소</a>
            </div>
        </div>
        </fieldset>
        </form:form> 
        </div>
        
            			
	</div>
	<br>
	
	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
	</body>
</html>