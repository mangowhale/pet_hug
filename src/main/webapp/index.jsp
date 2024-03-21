<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<h2>Hello World!</h2>
<a href="<c:url value="hotels"/>" >hotels</a><br>
<a href="<c:url value="/member/add"/>">add_member</a><br>
<a href="<c:url value="/member/login"/>">login</a><br>
<a href="<c:url value="/owner/add"/>">add_owner</a><br>
<a href="<c:url value="/owner/login"/>">owner_login</a><br>
<a href="<c:url value="/staff/members"/>">members</a><br>
<a href="<c:url value="/staff/owners"/>">owners</a><br>
<a href="<c:url value="/facility/add"/>">add facility</a><br>
<a href="<c:url value="/spots/all"/>">spots</a><br>
</body>
</html>
