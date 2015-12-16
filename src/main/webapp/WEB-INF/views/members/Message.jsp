<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix ='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="${pageContext.request.contextPath}/message" method="POST">
		<label>발신자</label><input type="text" name="sender"/>
		<label>수신자</label><input type="text" name="receiver"/>
		<label>내용</label><input type="text" name="contents"/>
		<hr>
		<input type="submit" value="전송"/>
	</form>
	
</body>
</html>