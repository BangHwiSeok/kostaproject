<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고내역 관리</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script>

	$(document).ready(function() {
		getReports();
	});
	
	// 전체 신고내역 가져오기
	function getReports() {
		$.ajax({
			url : "${pageContext.request.contextPath}/reports/getAllReports",
			success : function(data) {
				//alert(data);
				$('.listViewDiv').html(data);
			}
		});
	}
	
	// 체크된 신고내역 가져오기
	function getCheckReports(){
		$.ajax({
			url : "${pageContext.request.contextPath}/reports/getCheckReports",
			success : function(data) {
				//alert(data);
				$('.listViewDiv').html(data);
			},
			error:function(data){
				alert("fail");
			}
		});
	}
	
	// 미체크 신고내역 가져오기
	function getNoCheckReports(){
		$.ajax({
			//url : $('#pageNo').val()+"/getNoCheckReports",
			url : "${pageContext.request.contextPath}/reports/getNoCheckReports",
			success : function(data) {
				//alert(data);
				$('.listViewDiv').html(data);
			},
			error:function(data){
				alert("fail");
			}
		});
	}
	
	// 페이징처리 (실패)
	function goPage(pageNo){
		console.log("pageNo:" + pageNo);
		//console.log("pageContext.request.contextPath : " + ${pageContext.request.contextPath}),
		var CurrentUrl = document.URL.substring(document.URL.lastIndexOf("/") + 1, document.URL.lastIndexOf("/") + 30);
		console.log("CurrentUrl : " + CurrentUrl);
		$.ajax({
			url : "${pageContext.request.contextPath}/" + pageNo + "/" + CurrentUrl,
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
	<input type="hidden" id="pageNo" value="${pageNo }"/>
		<h3>신고내역 리스트</h3>
		<div align="left">
			<input type="button" onclick="getReports()" value="전체내역보기"/>
			<input type="button" onclick="getCheckReports()" value="체크 내역보기"/>
			<input type="button" onclick="getNoCheckReports()" value="미체크 내역보기"/>
		</div>
	</div>
		<div class="listViewDiv"></div>
	<hr>
	<div>
		<!-- 검색 미구현 -->
		<form>
			<input type="text" id="search"><input type="submit" value="검색">
		</form>
	</div>
</body>
</html>