<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이템샵</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	function getItems() {
		$.ajax({
			url : "${pageContext.request.ContextPath}/shop/getItems",
			success : function(data) {
				//alert(data);
				$('.approvalItem').html(data);
			}

		});

	}
	
	$(document).ready(function() {
		getItems();
	});
	
</script>
<style type="text/css">
div.a {
	color: #FF2D2D;
}
.text_num_input{
	width: 30px;
}
</style>
</head>
<body>
	<div>
		<h3>아이템 리스트</h3>
	</div>
	<div class="approvalItem">
	</div>
	
	
</body>
</html>