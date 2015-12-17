<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<link href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
<c:forEach var="h" items="${histories }">
	<div class="list1" style="margin-right: 8px;">
		<div class="img1">
			<div class="inimg1">
				<div class="userimg">
					<ul class="cf">
						<c:forEach var="p" items="${h.profiles}">
							<li><input type="image" class='myinfomation'
								src="${pageContext.request.contextPath}/resources/${p.u_num}/${p.u_num }${p.p_photonum}${p.p_extendtype}"
								style="width: 300px; height: 300px;"
								value='${pageContext.request.contextPath }/members/${p.u_num}/info' /></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<div class="btn1">
			<div class="btn1left">
				<a
					href='${pageContext.request.contextPath }/messages/${h.history.h_num }'
					class='myMessage'> ${h.receivedNum }<br>
				<span>받은쪽지</span>
				</a>
			</div>
			<div class="btn1center">
				<a
					href='${pageContext.request.contextPath }/messages/${h.history.h_num }'>
					${h.sendedNum }<br>
				<span>보낸쪽지</span>
				</a>
			</div>
			<div class="btn1right">
				<a
					href='${pageContext.request.contextPath }/messages/${h.history.h_num }'
					data-toggle="modal" class="myimage" data-target="#myModal">
					${h.unReadNum }<br>
				<span>안 읽은 쪽지</span>
				</a>
			</div>
		</div>
		<div class="time1">
			<img
				src=" ${pageContext.request.contextPath}/resources/images/history_01.png"
				alt="시간">
			<div class="timestart1">${h.history.h_regdate }</div>
		</div>
	</div>
	<!--list1-->
</c:forEach>
<input type="hidden" id="totalPage" value="${totalPage }"/>