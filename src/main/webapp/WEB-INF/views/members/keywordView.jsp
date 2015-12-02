<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ='c' uri="http://java.sun.com/jsp/jstl/core" %>
<table>
<tr>
<th>Header</th>
</tr>

<c:forEach items="${keywords}" var="keyword"> <!-- list값들을 보여주기 위해 -->
	<tr id="${keyword.pageNo}">
		
		<td>${keyword.K_NAME}</td>
		<td>${keyword.K_GROUP}</td>
		
	</tr>
</c:forEach>

</table>

<input type="hidden" value="${pageNo}"/>  

<input type="submit" value="키워드 추가"/>