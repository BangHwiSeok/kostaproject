<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<% request.setCharacterEncoding("UTF-8"); %>	
<style type="text/css">
div.a
{
	color:GRAY;
}

div.a.b
{
	color:#FF2D2D;
}
</style>
</head>
<body>
	<div>
		<h3>아이템 리스트</h3>
	</div>
	<c:forEach items="${itemList}" var="List">
	<div>	
		- 아이템 이름 : ${List.i_name}
		- 키워드수정기능 : ${List.i_key}
		- 쪽지추가기능 : ${List.i_msg}
		- 검색추가기능 : ${List.i_search}
		<a href="${pageContext.request.contextPath}/items/deleteItem?i_name=${List.i_name}" >
		<b>[${List.i_name }]</b>아이템 삭제하기</a>
	</div>
	</c:forEach>
	<div><a href="${pageContext.request.contextPath}/items/itemInsertform">아이템 추가하기</a></div>
</body>
</html>