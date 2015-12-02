<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	function getItems() {
		$.ajax({
			url : "items/itemlist",
			success : function(data) {
				//alert(data);
				$('.approvalItem').html(data);
			}

		});

	}
	
	$(document).ready(function() {
		getItems();
		
	});
	
	function addItem(){
		alert("addItem");
		//console.log($(document).forms[0]);
		var params = $('#form').serialize();
		$.ajax({
			url : "items/insertItem",
			type : "POST",
			data : params,
			success : function(data) {
				alert(data);
				getItems();
				//$('.approvalItem').html(data);
			},
			error:function(data){
				alert("fail");
			}

		});
	}
	
</script>
<style type="text/css">
div.a {
	color: #FF2D2D;
}
.text_num_input{
	width: 20px;
}
</style>
</head>
<body>
	<div>
		<h3>아이템 리스트</h3>
	</div>
	<div class="approvalItem">
	</div>
	<hr>
	<div>
		<h3>아이템 추가</h3>
	</div>
	<form id="form" method="POST">
		<label>아이템 이름 : </label><input type="text" id="i_name" name="i_name" requierd>
		<label>키워드수정기능 : </label><input class="text_num_input" type="text" id="i_key" name="i_key" requierd>
		<label>쪽지추가기능 : </label><input class="text_num_input" type="text" id="i_msg" name="i_msg" requierd>
		<label>검색추가기능 : </label><input class="text_num_input" type="text" id="i_search" name="i_search" requierd>
		<input type="button" onclick="addItem();" value="아이템 생성하기" >
	</form>
</body>
</html>