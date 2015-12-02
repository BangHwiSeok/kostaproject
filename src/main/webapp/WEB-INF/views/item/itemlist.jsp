<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">

	function deleteItem(i_num){
		alert("deleteItem");
		//var params = $('#form').serialize();
		$.ajax({
			url : "items/"+i_num+"/deleteItem",
			type : "GET",
			data : {i_num:i_num},
			success : function(data) {
				//alert(data);
				getItems(); 
				//$('.approvalItem').html(data);
			},
			error:function(data){
				alert("fail");
			}
	
		});
	}
	
	function updateItem(i_num){
		alert("updateItem");
		var params = $('#item_'+i_num).serialize();
		console.log(params);
		$.ajax({
			url : "items/"+i_num+"/updateItem",
			type : "POST",
			data : params,
			success : function(data) {
				//alert(data);
				getItems(); 
				//$('.approvalItem').html(data);
			},
			error:function(data){
				alert("fail");
			}
	
		});
	}
	
</script>
<body>
	<c:forEach items="${itemList}" var="List">
		<div>
			<form id="item_${List.i_num }">
				<label>아이템 이름 : </label><input type="text" id="i_name" name="i_name" value="${List.i_name }" requierd>
				<label>키워드수정기능 : </label><input class="text_num_input" type="text" id="i_key" name="i_key" value="${List.i_key }" requierd>
				<label>쪽지추가기능 : </label><input class="text_num_input" type="text" id="i_msg" name="i_msg" value="${List.i_msg }" requierd>
				<label>검색추가기능 : </label><input class="text_num_input" type="text" id="i_search" name="i_search" value="${List.i_search }" requierd>
				<input type="button" onclick="updateItem(${List.i_num})"
					value="수정" /> 
				<input type="button" onclick="deleteItem(${List.i_num})"
					value="삭제" />
			</form>
		</div>
	</c:forEach>
	<div>현재 아이템 수 : ${count }</div>
</body>
