<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="user" items="${users }">
<p>${user.key }---${user.value }</p>
	<c:forEach var="profile" items="${user.value }">
		<img src="${pageContext.request.contextPath }/resources/${profile.u_num}/${profile.u_num}${profile.p_photonum}${profile.p_extendtype}" />
	</c:forEach>
</c:forEach>
<%-- <img src="${pageContext.request.contextPath }/resources/${profiles[0].u_num}/${profiles[0].u_num}${profiles[0].p_photonum}${profiles[0].p_extendtype}" />
<c:forEach var="profile" items="${profiles }">
	<img src="${pageContext.request.contextPath }/resources/${profile.u_num}/${profile.u_num}${profile.p_photonum}${profile.p_extendtype}" />
</c:forEach> --%>
</body>
</html>