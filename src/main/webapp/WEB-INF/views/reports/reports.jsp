<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고내역 관리</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	function getReports() {
		$.ajax({
			url : "getAllReports",
			success : function(data) {
				//alert(data);
				$('.listViewDiv').html(data);
			}

		});

	}
	
	$(document).ready(function() {
		getReports();
	});
	
	function getCheckReports(){
		$.ajax({
			url : "getCheckReports",
			success : function(data) {
				//alert(data);
				$('.listViewDiv').html(data);
			},
			error:function(data){
				alert("fail");
			}
		});
	}
	
	function getNoCheckReports(){
		$.ajax({
			url : "getNoCheckReports",
			success : function(data) {
				//alert(data);
				$('.listViewDiv').html(data);
			},
			error:function(data){
				alert("fail");
			}
		});
	}
	
</script>
<style type="text/css">
a {
	color: #FF2D2D;
}

.text_num_input {
	width: 30px;
}
</style>
</head>
<body>
	<div>
		<h3>신고내역 리스트</h3>
		<div align="left">
			<!-- <form action="" method="get">
				<input list="getrule" name="getrule">
				<datalist id="getrule">
					<option onclick="getReports()" value="전체내역보기">
					<option onclick="getCheckReports()" value="체크 내역보기">
					<option onclick="getNoCheckReports()" value="미체크 내역보기">
				</datalist>
				<input type="submit">
			</form> -->
		<input type="button" onclick="getReports()" value="전체내역보기"/>
		<input type="button" onclick="getCheckReports()" value="체크 내역보기"/>
		<input type="button" onclick="getNoCheckReports()" value="미체크 내역보기"/>
		</div>
		
	</div>
	<div class="listViewDiv"></div>
	<hr>
	<div>
		<form>
			<input type="text" id="search"><input type="submit" value="검색">
		</form>
	</div>
</body>
</html>