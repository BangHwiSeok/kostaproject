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
<body>
	<c:forEach items="${itemList}" var="List">
		<div>
			아이템 이름 : ${List.i_name} /
			키워드수정기능 : ${List.i_key} /
			쪽지추가기능 : ${List.i_msg} /
			검색추가기능 : ${List.i_search} / 
			<input type="button" onclick="deleteItem(${List.i_num})"
				value="${List.i_name }아이템 삭제하기"
			/>
		</div>
	</c:forEach>
</body>
