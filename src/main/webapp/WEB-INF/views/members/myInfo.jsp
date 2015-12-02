<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
function changePWD(){
	var pwd = $("#pwd").val();
	$.ajax({
		url:'${pageContext.request.contextPath }/members/'+'${myInfo.u_num}'+'/pwd',
		type:'post',
		data:{pwd:pwd},
		success:function(data){
			alert(data);
			$("#pwd").val('');
			
		}
	});
}
</script>
</head>
<body>
		<h1>MyInfo</h1>
		<div>
			<label>ID</label> <b>${myInfo.u_id }</b>
		</div>
		<div>
				<label>PWD : </label> <input type="password" id="pwd"> 
				<button onclick="changePWD()">Change PWD</button>
		</div>
		<div>
			<img src="${pageContext.request.contextPath }/resources/${myInfo.u_num}/${myInfo.u_num}0.jpg" width="100px" height="150px"/>
		</div>
	
</body>
</html>