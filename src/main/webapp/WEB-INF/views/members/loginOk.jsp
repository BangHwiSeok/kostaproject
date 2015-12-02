<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 처리 화면</title>
</head>
<body>
	
	로그인ID : <c:out value="${sessionScope.USERID}" /> 님 로그인 성공
	<hr>
	로그아웃  : <a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
</body>
</html>