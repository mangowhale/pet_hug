<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/module/nav.jsp" flush="false"/>	

    <section>
        <div class="container" style="padding: 180px 0;">
            <h2>회원관리</h2>
            <hr class="my-4">
            <table class="table mb-5">
                <tr>
                    <th>아이디
                    <th>이름
                    <th>시설 이름
                    <th>이메일
                    <th>상세정보
                </tr>
                    <c:forEach items="${owner_list}" var="owner">
                    <tr>
                        <td>${owner.owner_id}
                        <td>${owner.owner_name}
                        <td>${owner.fac_name}
                        <td>${owner.owner_email}
                        <td><a href="<c:url value="/staff/owners/detail?id=${owner.owner_id}"/>" >상세정보</a>
                    </tr>
                    </c:forEach>
            </table>
        </div>
    </section>

	<jsp:include page="/WEB-INF/views/module/footer.jsp" flush="false"/>
</body>
</html>