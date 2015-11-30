<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<form method="post">
		로그인 : <a href="${pageContext.request.contextPath}/login.do">로그인</a>
		회원가입 : <a href="${pageContext.request.contextPath}/signUp.do">회원가입</a>
		회원정보 수정 : <a href="${pageContext.request.contextPath}/usermypage.do">회원정보 수정</a>
</body>
</html>