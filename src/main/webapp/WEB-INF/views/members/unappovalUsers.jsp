<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

      	<c:forEach var="user" items="${users }">
         <div class="user" id="${user.user.u_num }">
            <div class="sub">
            	<ul class="cf">
            		<c:forEach var="profile" items="${user.profiles }">
                	<li class="subimg"><img src="${pageContext.request.contextPath }/resources/${profile.u_num}/${profile.u_num}${profile.p_photonum}${profile.p_extendtype}" style="width: 135px; height: 180px"/></li>
                	</c:forEach>
                </ul>
                <div class="user">
                    <span class="id">○ 아이디 : ${user.user.u_id }</span>
                    <span class="pnum">○ 연락처 : ${user.user.u_pnum }</span>
                    <span class="gender">○ 성별 : ${user.user.u_gender }</span>
                    <span class="bir">○ 생년월일 : ${user.user.u_birth }</span>
                    <span class="num">○ 회원번호 : no.${user.user.u_num }</span>
            </div>
            <div class="btn"><a href="javascript:approvalUser('${user.user.u_num }')">승인</a></div>
            </div>
           </div>
           </c:forEach>
<input id="unApprovalPageNo" type="hidden" value="${unApprovalPageNo }" />
<input id="unApprovalTotalPageNum" type="hidden" value="${unApprovalTotalPageNum }"/>

