<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/base.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/resources/css/main.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath }/resources/bootstrap/css/jasny-bootstrap.min.css"
	rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/bootstrap/js/jasny-bootstrap.min.js"></script>
<script>
	$('.fileinput').fileinput('clear');
</script>
</head>
<body>
	<div id="wrap">
		<div id="header">
			<div id="logo">
				<a href="#"><img
					src="${pageContext.request.contextPath }/resources/images/logo.png"
					alt="로고"></a>
			</div>
			<div id="bg">
				<img
					src="${pageContext.request.contextPath }/resources/images/bar.jpg"
					alt="뒷배경">
			</div>
			<div id="h3">회원가입 > 로그인</div>
		</div>

		<spring:form commandName="userForm" method="POST"
			enctype="multipart/form-data">
			<div id="container">
				<div class="h1">
					<img
						src="${pageContext.request.contextPath }/resources/images/register.jpg"
						alt="회원 리스트">
				</div>
				<ul class="list">
					<li class="u_id"><label>○ 아이디 : </label> <spring:input
							path="u_id" type="email" alt="아이디" placeholder="아이디 입력"
							style="width: 150px; height: 20px; border-radius: 5px;" /> <font
						color="red"><spring:errors path="u_id" /></font></li>
					<li class="u_pwd"><label>○ 비밀번호 : </label> <spring:input
							path="u_pwd" type="password" alt="비밀번호" placeholder="비밀번호 입력"
							style="width: 150px; height: 20px; border-radius: 5px;" /> <font
						color="red"><spring:errors path="u_pwd" /></font></li>
					<li class="u_repwd"><label>○ 비밀번호 확인 :</label> <spring:input
							path="u_repwd" type="password" alt="비밀번호 확인"
							placeholder="비밀번호 확인"
							style="width: 150px; height: 20px; border-radius: 5px;" /> <font
						color="red"><spring:errors path="u_repwd" cssClass="error" /></font>
					</li>
					<li class="u_pnum"><label>○ 전화번호 :</label> <spring:input
							path="u_pnum" alt="전화번호" placeholder="전화번호 입력"
							style="width: 150px; height: 20px; border-radius: 5px;" /> <font
						color="red"><spring:errors path="u_pnum" cssClass="error" /></font>
					</li>
					<li class="u_gender"><label>○ 성별 : </label> <spring:radiobutton
							path="u_gender" value="남" />남 <spring:radiobutton
							path="u_gender" value="여" />여</li>
					<li class="u_birth"><label>○ 생년월일 : </label> <spring:input
							path="u_birth" type="date"
							style="width: 150px; height: 20px; border-radius: 5px" /> <font
						color="red"><spring:errors path="photoes" /></font></li>
					<li class="btn1"><spring:button type="submit">SignUp</spring:button></li>
					<li class="btn2"><spring:button type="cancel">CANCEL</spring:button></li>
				</ul>
			</div>
			<div id="container2">
				<ul class="pro">
					<li class="pro1"
						style="border: solid 1px; width: 150px; height: 200px;">
						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 150px; height: 100px;"></div>
							<div>
								<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[0]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
							</div>
						</div>
					</li>
					<li class="pro12"
						style="border: solid 1px; width: 150px; height: 200px;">
						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 150px; height: 100px;"></div>
							<div>
								<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[1]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
							</div>
						</div>
					</li>
				</ul>
				<ul class="pro2">
					<li class="pro21"
						style="border: solid 1px; width: 150px; height: 200px;">
						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 150px; height: 100px;"></div>
							<div>
								<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[2]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
							</div>
						</div>
					</li>
					<li class="pro22"
						style="border: solid 1px; width: 150px; height: 200px;">
						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 150px; height: 100px;"></div>
							<div>
								<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[3]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
							</div>
						</div>
					</li>
					<li class="pro23"
						style="border: solid 1px; width: 150px; height: 200px;">
						<div class="fileinput fileinput-new" data-provides="fileinput">
							<div class="fileinput-preview thumbnail" data-trigger="fileinput"
								style="width: 150px; height: 100px;"></div>
							<div>
								<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[4]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
							</div>
						</div>
					</li>
				</ul>
			</div>





			<!-- 		
		<input name="photo[0]" type="file" />
		<br>
		<input name="photo[1]" type="file" />
		<br>
		<input name="photo[2]" type="file" />
		<br>
		<br /> -->
		</spring:form>
		<div id="footer"></div>
	</div>
</body>
</html>