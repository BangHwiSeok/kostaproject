<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	function nextPage(type) {
		var pageNum = $("#"+type+"pageNo").val();

		var lastPageNum = $("#"+type+"totalPageNum").val();

		if (pageNum < lastPageNum) {
			if(type == "unApproval"){
				getApprovalUsers(pageNum + 1)
			}else{
				getUsers(pageNum + 1);
			}
		} else {
			alert("마지막 Page 입니다.");
		}

	}
	function prePage(type) {
		var pageNum = $("#"+type+"pageNo").val();
		var lastPageNum = $("#"+type+"totalPageNum").val();

		if (pageNum > 1) {
			if(type == "unApproval"){
				getApprovalUsers(pageNum - 1)
			}else{
				getUsers(pageNum - 1);
			}
		} else {
			alert("첫 Page 입니다.");
		}
	}
	
	function getUsers(pageNo) {
		var path = "members/list";
		$.ajax({
			url : "members/list",
			data : {
				pageNo : pageNo
			},
			success : function(data) {
				//alert(data);
				$('#users').html(data);
			}

		});
	}
	function getApprovalUsers(pageNo) {
		$.ajax({
			url : "members/list/approval",
			data : {
				pageNo : pageNo
			},
			success : function(data) {
				//alert(data);
				$('#unapproval').html(data);
			}
		});
	}
	
	
	
	function approvalUser(userNum){
		$.ajax({
			url : "members/"+userNum+"/approval",
			success : function(data) {
				//alert(data);
				alert(data);
			}

		});
	}
	function deleteUser(userNum){
		$.ajax({
			url : "members/"+userNum+"/delete",
			success : function(data) {
				//alert(data);
				alert(data);
			}

		});
	}
	
	$(document).ready(function() {
		getUsers(1);
		getApprovalUsers(1);
	});
</script>
</head>
<body>
	<h1>Unapproval User</h1>
	<div id="unapproval"></div>
	<div>
		<button onclick="prePage('unApproval');">&lt;</button>
		<button onclick="nextPage('unApproval');">&gt;</button>
	</div>
	<hr/>
	<h1>Users</h1>
	<div id="users"></div>
	<div>
		<button onclick="prePage('user');">&lt;</button>
		<button onclick="nextPage('user');">&gt;</button>
	</div>
</body>
</html>