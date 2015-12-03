<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	
	function buyItem(i_num){
		alert("buyItem");
		$.ajax({
			url : "shop/"+i_num+"/buyItem",
			type : "GET",
			data : {i_num:i_num},
			success : function(data) {
				alert("success");
				//getItems();
				//$('.approvalItem').html(data);
			},
			error:function(data){
				alert("fail");
			}
		});
	}
	
	function buyConfirm(i_num) {
	    var r = confirm("정말 구매 하시겠습니까?");
	    if (r == true) {
	    	buyItem(i_num);
	    } else {
	        alert("취소");
	    }
	}
	
	
	

</script>
<style type="text/css">
	.td{
		width: 180px;
	}
	th, td{
		width: 50px;
		text-align: center;
	}
</style>
<body>
	<table>
		<tr>
			<th class="td">아이템 이름</th><th>퍼즐</th><th>비고</th>
		</tr>
		<c:forEach items="${itemList }" var="List">
		<tr>
			<td>${List.i_name }</td>
			<td>${List.i_cost }</td>
			<td><input type="button" onclick="buyConfirm(${List.i_num});" value="구매" ></td>
		<tr>
		</c:forEach>
	</table>
</body>
