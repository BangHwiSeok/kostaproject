<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 화면</title>
</head>
<script type="text/javascript">
	function loginCheck(){
		var u_id = document.login.u_id;
		var u_pwd = document.login.u_pwd;
		
		if(u_id.value==""){
			alert("아이디를 입력하세요");
			u_id.focus();
			return false;
		}
		if(u_pwd.value==""){
			alert("비밀번호를 입력하세요");
			u_pwd.focus();
			return false;
		}
	}
</script>

<body>
	Session value : <c:out value="${sessionScope.USERID}" /> 
					
	<form action="${pageContext.servletContext.contextPath}/login.do" method="POST">
		<table border="1">
			<tr>
				<td>아이디 : <input type="text" name="id" size="20">
				</td>
			</tr>
			<tr>
				<td>비밀번호 : <input type="password" name="pwd" size="20">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
					<input type="reset"  value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>