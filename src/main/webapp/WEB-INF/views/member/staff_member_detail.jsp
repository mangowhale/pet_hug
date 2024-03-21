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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/originalCss.css?ver=0" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>회원 정보</title>
</head>
<body>

	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>	

    <section>
        <div class="jumbotron background-lightgreen pt-5 pb-5">
            <div class="container">
                <h2 class="display-3 font text-center">회원 정보</h2>
            </div>
        </div>
    </section>

    <section>
        <div class="container" style="padding: 100px 0;">
            <div class="flex-center">
                <div class="form col-sm-5 offset-md-1 me-5">
                	<c:url value="/staff/update_member" var="update_url"/>
                    <form:form action="${update_url}" modelAttribute="member" class="form-horizontal" onsubmit="return confirm(회원 정보를 수정하시겠습니까?)">
                        <h2 class="form-title mb-4">회원 정보</h2>
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
                        <div class="form-group row">
                            <label for="" class="col-sm-3">주소</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="60" path="mem_addr" value="${member.mem_addr}"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="" class="col-sm-3">상세주소</label>
                            <div class="col-sm-3">
                                <form:input class="input" maxlength="60" path="mem_addr2" value="${member.mem_addr2}"/>
                            </div>
                        </div>
                        <div class="form-group row mt-4">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input type="submit" value="수정" class="offset-md-8 btn btn-success">
                            	<a href="<c:url value="/staff/members"/>" class="btn btn-warning">취소</a><br>
                            </div>
                        </div>
                        <a href="/pet_hug/staff/delete_member?id=${member.mem_id}" class="btn btn-warning" onclick="return confirm('회원을 삭제하시겠습니까?');">회원 삭제</a>
                    </form:form>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>

</body>
</html>