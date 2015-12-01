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
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/jasny-bootstrap.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/bootstrap/js/jasny-bootstrap.min.js"></script>
<script>
	$('.fileinput').fileinput('clear');
</script>
</head>
<body>
<div class="container">
	<spring:form commandName="userForm" method="POST"
		enctype="multipart/form-data">
		<label>ID : </label>
		<spring:input path="u_id" type="email" />
		<font color="red"><spring:errors path="u_id" /></font>
		<br />
		<label>PWD : </label>
		<spring:input path="u_pwd" type="password" />
		<font color="red"><spring:errors path="u_pwd" /></font>
		<br />
		<label>RePWD : </label>
		<spring:input path="u_repwd" type="password" />
		<font color="red"><spring:errors path="u_repwd"
				cssClass="error" /></font>
		<br />
		<label>Phone : </label>
		<spring:input path="u_pnum" />
		<font color="red"><spring:errors path="u_pnum" cssClass="error" /></font>
		<br />
		<label>GENDER : </label>
		<spring:select path="u_gender">
			<br />
			<spring:option value="남" label="남" />
			<spring:option value="여" label="여" />
		</spring:select>
		<label>Birth</label>
		<spring:input path="u_birth" type="date" />
		<br />
		<font color="red"><spring:errors path="photoes"/></font><br/>
		<div class="fileinput fileinput-new" data-provides="fileinput">
			<div class="fileinput-preview thumbnail" data-trigger="fileinput"
				style="width: 150px; height:100px;"></div>
			<div>
				<span class="btn btn-default btn-file"><span
					class="fileinput-new">Select image</span><span
					class="fileinput-exists">Change</span><input type="file" name="photoes[0]"></span>
				<a href="#" class="btn btn-default fileinput-exists"
					data-dismiss="fileinput">Remove</a>
			</div>
		</div>
		<div class="fileinput fileinput-new" data-provides="fileinput">
			<div class="fileinput-preview thumbnail" data-trigger="fileinput"
				style="width: 150px; height:100px;"></div>
			<div>
				<span class="btn btn-default btn-file"><span
					class="fileinput-new">Select image</span><span
					class="fileinput-exists">Change</span><input type="file" name="photoes[1]"></span>
				<a href="#" class="btn btn-default fileinput-exists"
					data-dismiss="fileinput">Remove</a>
			</div>
		</div>
		<div class="fileinput fileinput-new" data-provides="fileinput">
			<div class="fileinput-preview thumbnail" data-trigger="fileinput"
				style="width: 150px; height:100px;"></div>
			<div>
				<span class="btn btn-default btn-file"><span
					class="fileinput-new">Select image</span><span
					class="fileinput-exists">Change</span><input type="file" name="photoes[2]"></span>
				<a href="#" class="btn btn-default fileinput-exists"
					data-dismiss="fileinput">Remove</a>
			</div>
		</div>
		<div class="fileinput fileinput-new" data-provides="fileinput">
			<div class="fileinput-preview thumbnail" data-trigger="fileinput"
				style="width: 150px; height:100px;"></div>
			<div>
				<span class="btn btn-default btn-file"><span
					class="fileinput-new">Select image</span><span
					class="fileinput-exists">Change</span><input type="file" name="photoes[3]"></span>
				<a href="#" class="btn btn-default fileinput-exists"
					data-dismiss="fileinput">Remove</a>
			</div>
		</div>
		<div class="fileinput fileinput-new" data-provides="fileinput">
			<div class="fileinput-preview thumbnail" data-trigger="fileinput"
				style="width: 150px; height:100px;"></div>
			<div>
				<span class="btn btn-default btn-file"><span
					class="fileinput-new">Select image</span><span
					class="fileinput-exists">Change</span><input type="file" name="photoes[4]"></span>
				<a href="#" class="btn btn-default fileinput-exists"
					data-dismiss="fileinput">Remove</a>
			</div>
		</div>
		<br>
		<!-- 		
		<input name="photo[0]" type="file" />
		<br>
		<input name="photo[1]" type="file" />
		<br>
		<input name="photo[2]" type="file" />
		<br>
		<br /> -->

		<spring:button type="submit">SignUp</spring:button>
	</spring:form>
</div>
</body>
</html>