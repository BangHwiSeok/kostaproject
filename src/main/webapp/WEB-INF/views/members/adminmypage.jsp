<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>

</head>
<body>
<form action="" method="POST">
		<table border="1">
		<tr>
			<td>아이디 : 관리자</td>
		</tr>
		<tr>
			<td>비밀번호 : ${upzzle.dto.User.U_pwd}</td>
		</tr>
		<tr>
			<td>쪽지 보내기 활성 여부 : </td>
		</tr>
		<tr>
			<td>승인 여부 : </td>
		</tr>
		</table>
	</form>
</body>
</html>