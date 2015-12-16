<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 마이페이지 수정</title>
<script type="text/javascript">

	function userCheck(){
		var u_pwd = document.usermypage.password;
		var u_pnum = document.usermypage.pnum;
	
		if(u_pwd.value==""){
			alert("비밀번호를 입력해 주세요");
			u_pwd.focus();
			return false;
		}
		if(u_pnum.value==""){
			alert("연락처를 입력해 주세요");
			u_num.focus();
			return false;
		}
	}
</script>
</head>
<body>
<form action="" method="POST">
	<input type="hidden" name="command" value="usermypage">
	<input type="hidden" name="u_id" value="${upzzle.dto.User.U_id}">
	<input type="hidden" name="u_gender" value="${upzzle.dto.User.u_gender}">
	<input type="hidden" name="u_birth" value="${upzzle.dto.User.u_birth}">
	<input type="hidden" name="u_num" value="${upzzle.dto.User.u_num}">
	<input type="hidden" name="u_regdate" value="${upzzle.dto.User.u_regdate}">
	<input type="hidden" name="u_role" value="${upzzle.dto.User.u_role}">
	<input type="hidden" name="u_point" value="${upzzle.dto.User.u_point}">
	<input type="hidden" name="u_msgnum" value="${upzzle.dto.User.u_msgnum}">
	<input type="hidden" name="u_sernum" value="${upzzle.dto.User.u_sernum}">
	<input type="hidden" name="u_msgitem" value="${upzzle.dto.User.u_msgitem}">
	<input type="hidden" name="u_keyitem" value="${upzzle.dto.User.u_keyitem}">
	<input type="hidden" name="u_seritem" value="${upzzle.dto.User.u_seritem}">
		
	
		
		<table border="1">
		<tr>
			<td>아이디:${upzzle.dto.User.U_id}</td>
		</tr>
		<tr>
			<td>비밀번호 : <input type="text" name="password"> </td>
		</tr>
		<tr>
			<td>연락처 : <input type="text" name="password"></td>
		</tr>
		<tr>
			<td>성별 : ${upzzle.dto.User.U_gender}</td>
		</tr>
		<tr>
			<td>생년월일 : ${upzzle.dto.User.U_birth}</td>
		</tr>
		<tr>
			<td>회원번호 : ${upzzle.dto.User.U_num}</td>
		</tr>
		<tr>
			<td>가입날짜 : ${upzzle.dto.User.U_regdate}</td>
		</tr>
		<tr>
			<td>롤 : ${upzzle.dto.User.U_role}</td>
		</tr>
		<tr>
			<td>포인트 : ${upzzle.dto.User.U_point}</td>
		</tr>
		<tr>
			<td>기본 쪽지 횟수 : ${upzzle.dto.User.U_msgnum}</td>
		</tr>
		<tr>
			<td>기본 검색 횟수 : ${upzzle.dto.User.U_sernum}</td>
		</tr>
		<tr>
			<td>쪽지 추가 아이템 : ${upzzle.dto.User.U_msgitem}</td>
		</tr>
		<tr>
			<td>키워드 교체 가능 아이템 : ${upzzle.dto.User.U_keyitem}</td>
		</tr>
		<tr>
			<td>검색 추가 가능 아이템 : ${upzzle.dto.User.U_seritem}</td>
		</tr>
		</table>
	</form>
</body>
</html>