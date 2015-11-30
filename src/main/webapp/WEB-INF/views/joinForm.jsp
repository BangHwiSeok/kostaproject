<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<spring:form commandName="userForm" method="POST">
	<label>ID : </label><spring:input path="u_id"/>
	<label>PWD : </label><spring:input path="u_pwd" type="password" />
	<label>Phone : </label><spring:input path="u_pnum" />
	<label>GENDER : </label><spring:select path="u_gender">
		<spring:option value="남" label="남"/>
		<spring:option value="여" label="여" />
	</spring:select>
	<label>Birth</label><spring:input path="u_birth" />
</spring:form>
</body>
</html>