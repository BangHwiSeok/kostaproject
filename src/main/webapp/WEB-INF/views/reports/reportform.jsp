<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<spring:form commandName="reportForm" method="post">
	<spring:input path="rp_sendid" />
	<spring:input path="rp_id" />
	<spring:input path="rp_content" />
	<spring:input type="file" path="photo"/>
</spring:form>
</body>
</html>