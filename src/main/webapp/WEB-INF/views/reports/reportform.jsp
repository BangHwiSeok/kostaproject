<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고</title>
</head>
<body>
<spring:form commandName="reportForm" method="post">
	<spring:input type="hidden" path="rp_sendid" value="${u.num }"/>
	<spring:input type="hidden" readonly="readonly" path="rp_id" value="${u.num }"/>
	이 사용자에 대해 신고할 내용을 적어주세요.<br>
	<spring:textarea style="margin: 0px; width: 300px; height: 80px;" path="rp_content" /><br>
	<spring:input type="file" path="photo"/>
	<input type="submit" value="전송"/>
</spring:form>
</body>
</html>