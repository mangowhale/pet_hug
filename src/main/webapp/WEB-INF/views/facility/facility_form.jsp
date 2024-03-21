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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>시설 등록</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>

    <section>
        <div class="jumbotron background-lightgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">시설 등록</h2>
            </div>
        </div>
    </section>

    <section style="padding: 140px 0;">
        <div class="container">
        	<c:url value="/facility/add" var="add_url"/>
            <form:form method="POST" enctype="multipart/data" action="${add_url}" modelAttribute="Facility" class="form-horizontal col-sm-7" style="margin: 0 auto;">
            <p>*는 필수 입력 항목입니다.
                <form:input type="hidden" value="${sessionScope.sessionId}" path="owner_id"/>
                <div class="form-group row mb-2">
                    <label for="">*지역구</label>
                    <form:select name="" id="" required="required" class="input w-25" path="area_name">
                        <form:option value="gangreung">강릉시</form:option>
                        <form:option value="goseong">고성군</form:option>
                        <form:option value="donghae">동해시</form:option>
                        <form:option value="samcheuk">삼척시</form:option>
                        <form:option value="sokcho">속초시</form:option>
                        <form:option value="yanggu">양구군</form:option>
                        <form:option value="yangyang">양양군</form:option>
                        <form:option value="yeongwol">영월군</form:option>
                        <form:option value="wonju">원주시</form:option>
                        <form:option value="inje">인제군</form:option>
                        <form:option value="jeongseon">정선군</form:option>
                        <form:option value="cheolwon">철원군</form:option>
                        <form:option value="chuncheon">춘천시</form:option>
                        <form:option value="taebaek">태백시</form:option>
                        <form:option value="pyeongchang">평창군</form:option>
                        <form:option value="hongcheon">홍천군</form:option>
                        <form:option value="hwacheon">화천군</form:option>
                        <form:option value="hoilgseung">횡성군</form:option>
                    </form:select>
                </div>
                <div class="form-group row mb-2">
                    <label for="">*주소</label>
                    <form:input type="text" maxlength="60" required="required"  class="input" path="fac_addr"/>
                </div>
                <div class="form-group row mb-2">
                    <label for="">*상세주소</label>
                    <form:input type="text" maxlength="60" required="required" class="input" path="fac_addr2"/>
                </div>
                <div class="form-group row mb-2">
                    <label for="">*카테고리</label>
                    <form:select name="" id="" required="required"  class="input w-25" path="fac_category">
                        <form:option value="class">클래스·공방</form:option>
                        <form:option value="kindergarten">유치원</form:option>
                        <form:option value="train">훈련</form:option>
                        <form:option value="cafe">애견카페</form:option>
                        <form:option value="field">운동장·수영장</form:option>
                        <form:option value="studio">스튜디오</form:option>
                        <form:option value="beauty">미용</form:option>
                        <form:option value="others">기타</form:option>
                    </form:select>
                </div>
                <div class="form-group row mb-2">
                    <label>*시설 소개</label>
                    <form:textarea name="" id="" cols="30" rows="10" maxlength="600" class="input" path="fac_intro"></form:textarea>
                </div>
                <br>
                <fieldset>
                <legend>대상 동물</legend>
	                <label for="">강아지용</label>
					<form:checkbox path="for_dog" class="mb-2"/>
					<div style="border: 1px solid black;" class="mb-2">
						<p class="mb-1">출입 가능 사이즈</p>
		                <label>소형견</label>
						<form:checkbox path="for_small_dog"/>
		                <label>중형견</label>
						<form:checkbox path="for_middle_dog"/>
		                <label>대형견</label>
						<form:checkbox path="for_big_dog"/><br>
					</div>
	                <label for="" class="mt-2">고양이용</label>
	                <form:checkbox path="for_cat" class="mb-2"/>
	                <div class="form-group row mb-2">
	                    <label for="">그 외 대상 동물</label>
	                    <form:input type="text" maxlength="20" class="input" path="for_what"/>
	                </div>
                </fieldset>
                
                <br>
                <div class="form-group row">
                    <label for="">이용 정보/이용시 주의사항</label>
                    <form:textarea name="" id="" cols="30" rows="10" maxlength="600" class="input" path="fac_info"></form:textarea>
                </div>
                <div class="form-group row mb-2">
                    <label for="">반려동물 시설</label>
                    <form:input type="text" maxlength="100" class="input" path="fac_ani"/>
                </div>
                <div class="form-group row mb-5">
                    <label for="">반려인 편의시설</label>
                    <form:input type="text" maxlength="100" class="input" placeholder="주차장, 와이파이 등" path="fac_human"/>
                </div>
                <div class="form-group row">
                    <p>영업시간</p>
                    <div>
                        <label for="">월요일</label>
                        <form:input type="text" class="input" placeholder="10:00 ~ 20:00" path="mon_hour" maxlength="13"/>
                    </div>
                    <div>
                        <label for="">화요일</label>
                        <form:input type="text" class="input" placeholder="10:00 ~ 20:00" path="tue_hour" maxlength="13"/>
                    </div>
                    <div>
                        <label for="">수요일</label>
                        <form:input type="text" class="input" placeholder="10:00 ~ 20:00" path="wed_hour" maxlength="13"/>
                    </div>
                    <div>
                        <label for="">목요일</label>
                        <form:input type="text" class="input" placeholder="10:00 ~ 20:00" path="thu_hour" maxlength="13"/>
                    </div>
                    <div>
                        <label for="">금요일</label>
                        <form:input class="input" placeholder="10:00 ~ 20:00" path="fri_hour" maxlength="13"/>
                    </div>
                    <div>
                        <label for="">토요일</label>
                        <form:input type="text" class="input" placeholder="10:00 ~ 20:00" path="sat_hour" maxlength="13"/>
                    </div>
                    <div>
                        <label for="">일요일</label>
                        <form:input type="text" class="input" placeholder="10:00 ~ 20:00" path="sun_hour" maxlength="13"/>
                    </div>
                </div>
                <div>
                    <label>사진 등록</label>
                    <input type="file" name="fac_pic1">
                </div>
                <input type="submit" value="등록" class="submit-green offset-md-10">
            </form:form>
        </div>
    </section>

	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>

</body>
</html>