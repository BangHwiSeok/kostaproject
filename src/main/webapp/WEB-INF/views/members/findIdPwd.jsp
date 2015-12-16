<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID, PWD찾기</title>
</head>
<body>
<center>
	<h2>ID, PWD찾기</h2>
	<form action="${pageContext.request.contextPath}/findidpwd" method="POST">
		<label>id</label><input type="text" name="id"/>
		<label>pwd</label><input type="text" name="pwd"/>
		
		<hr>
		<input type="submit" value="전송"/>
	</form>
</center>
</body>
</html>