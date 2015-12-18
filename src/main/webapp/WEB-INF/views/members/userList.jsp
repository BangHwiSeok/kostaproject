<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="user" items="${users }">
<div class="user2">
                <span class="id2">○ 아이디 :${user.u_id }</span>&nbsp;
                <span class="pnum2">○ 연락처 : ${user.u_pnum }</span>&nbsp;
                <span class="gender2">○ 성별 : ${user.u_gender }</span>&nbsp;
                <span class="bir2">○ 생년월일 : ${user.u_birth }</span>&nbsp;
                <span class="num2">○ 회원번호 : no.${user.u_num }</span>
            
            <span align="center" class="subbtn">
                <span class="subbtn1"><a href="javascript:deleteUser('${user.u_num}')">회원삭제</a></span>
            </span>
          </div>
          </c:forEach>
<input id="pageNo" type="hidden" value="${pageNo }" />
<input id="totalPageNum" type="hidden" value="${totalPageNum }" />