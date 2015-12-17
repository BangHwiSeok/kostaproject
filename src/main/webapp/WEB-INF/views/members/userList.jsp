<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:forEach var="user" items="${users }">
<div class="user">
	<span class="id">○ 아이디 : ${user.u_id }</span><br> <span
		class="pnum">○ 연락처 : ${user.u_pnum }</span><br> <span class="gender">○
		성별 : ${user.u_gender}</span><br> <span class="bir">○ 생년월일 : ${user.u_birth }</span><br> 
</div>
<div class="sub">

	<ul class="cf">
	
		<li class="subimg"><img src="images/wo2.jpg"></li>
		<li class="subimg"><img src="images/wo2.jpg"></li>
		<li class="subimg"><img src="images/wo3.jpg"></li>
		<li class="subimg"><img src="images/wo4.jpg"></li>
		<li class="subimg"><img src="images/wo5.jpg"></li>
	</ul>
</div>
<div class="btn">
	<input type="image"
		src="${pageContext.request.contextPath}/resources/images/ok.png"
		alt="Submit" width="80px" height="31px">
</div>
</c:forEach> --%>
<table>
	
	<c:forEach var="user" items="${users }">
		<tr id="${user.u_id }">
			<td>${user.u_id }</td>
			<td>사진1</td>
			<td>사진2</td>
			<td>
				<button onclick="setMSGActive(${user.u_num})">Message
					Active</button>
				<button onclick="deleteUser(${user.u_num})">삭제</button>
			</td>
		</tr>
	</c:forEach>
</table>
<input id="pageNo" type="hidden" value="${pageNo }" />
<input id="totalPageNum" type="hidden" value="${totalPageNum }" />