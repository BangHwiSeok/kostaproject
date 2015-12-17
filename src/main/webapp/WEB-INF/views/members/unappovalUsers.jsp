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
		<tr id="${user.user.u_id }">
			<td>${user.user.u_id }</td>
			<c:forEach var="profile" items="${user.profiles }">
				<img src="${pageContext.request.contextPath }/resources/${profile.u_num}/${profile.u_num}${profile.p_photonum}${profile.p_extendtype}" />
			</c:forEach>			
			<td>사진1</td>
			<td>사진2</td>
			<td> <button onclick="approvalUser(${user.user.u_num})">승인</button> <button onclick="deleteUser(${user.user.u_num})">삭제</button></td>
		</tr>
	</c:forEach>
</table>
<input id="unApprovalPageNo" type="hidden" value="${unApprovalPageNo }" />
<input id="unApprovalTotalPageNum" type="hidden" value="${unApprovalTotalPageNum }"/>