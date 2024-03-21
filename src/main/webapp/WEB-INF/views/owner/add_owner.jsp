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
<title>회원가입</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>	

    <section>
        <div class="jumbotron background-lightgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">사장님 회원가입</h2>
            </div>
        </div>
    </section>

    <section>
        <div class="container" style="padding: 180px 0;">
            <div class="d-flex">
                <div class="form col-sm-5 offset-md-1 border-right me-5">
                    <form:form modelAttribute="new_owner" class="form-horizontal">
                        <h2 class="form-title mb-4">사장님 회원가입</h2>
                        <div class="form-group row">
                            <label for="" class="col-sm-3 control-label">*아이디</label>
                            <div class="col-sm-3">
                                <form:input class="input" required="required" path="owner_id" maxlength="15" placeholder="최대 15글자"/>
                            </div> 
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*비밀번호</label>
                            <div class="col-sm-3">
                                <form:password class="input" required="required" path="owner_pw" maxlength="15" placeholder="최대 15글자"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*이름</label>
                            <div class="col-sm-3">
                                <form:input class="input" required="required" path="owner_name" maxlength="17"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*시설 이름</label>
                            <div class="col-sm-3">
                                <form:input class="input" required="required" path="fac_name" maxlength="30" placeholder="최대 30글자"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">휴대전화 번호</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="11" path="owner_phone" placeholder="'-' 없이 숫자만 입력해주세요"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*시설 전화번호</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="11" path="fac_phone" placeholder="'-' 없이 숫자만 입력해주세요" required="required"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">이메일</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="40" path="owner_email"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*시설 주소</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="60" path="fac_addr" required="required"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*시설 상세주소</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="60" path="fac_addr2" required="required"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">*사업자 등록번호</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="14" path="owner_number" required="required" placeholder="- 포함해서 입력"/>
                            </div>
                        </div>
                        <div class="form-group row mt-4">
                        *은 필수 입력 항목입니다.
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" value="확인" class="offset-md-8 submit-green">
                            </div>
                        </div>
                    </form:form>
                </div>
                <div class="col-sm-5">
                    <div class="background-yellow position-relative h-100">
                        <div class="about-img">
                            <br>
                            <img src="<c:url value="/resources/images/addmem_puppy.jpg"/>" alt="" class="img-fluid position-absolute" style="left: 5%; top: 5%;">
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>

</body>
</html>