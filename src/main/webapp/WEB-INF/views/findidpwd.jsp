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
	<form action="${pageContext.request.contextPath}/find/phone" method="post" id="findidpwd">
		<table width="500" border="1">
			<tr height="40">
				<td align="center" width="200">전화번호</td>
				<td width="300"><input type="text" name="UserPhoneNum" size="12"></td>
			</tr>
			<tr height="40">
			<td align="center" clospan="2"><input type="submit"
			value="아이디/패스워드 찾기"></td>
			</tr>
		</table>
	
	</form>
</center>
</body>
</html>