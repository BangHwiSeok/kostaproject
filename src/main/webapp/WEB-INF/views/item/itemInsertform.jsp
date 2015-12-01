<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="insertItem" method="POST">
		<label>아이템 이름 : </label><input type="text" id="i_name" name="i_name" >
		<label>키워드수정기능 : </label><input type="text" id="i_key" name="i_key" >
		<label>쪽지추가기능 : </label><input type="text" id="i_msg" name="i_msg" >
		<label>검색추가기능 : </label><input type="text" id="i_search" name="i_search">
		<input type="submit" value="아이템 생성하기" >
	</form>
</body>
</html>