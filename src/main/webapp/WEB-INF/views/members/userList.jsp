<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
	<tr>
		<th>EMAIL</th>
		<th>IMAGE1</th>
		<th>IMAGE2</th>
		<th>허가</th>
	</tr>
	<c:forEach var="user" items="${users }">
		<tr id="${user.u_id }">
			<td>${user.u_id }</td>
			<td>사진1</td>
			<td>사진2</td>
			<td> <button onclick="setMSGActive(${user.u_num})">Message Active</button> <button onclick="deleteUser(${user.u_num})">삭제</button></td>
		</tr>
	</c:forEach>
</table>
<input id="pageNo" type="hidden" value="${pageNo }" />
<input id="totalPageNum" type="hidden" value="${totalPageNum }"/>