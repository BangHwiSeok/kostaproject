<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	function getUsers(pageNo) {
		$.ajax({
			url : "members/list",
			data : {
				pageNo : pageNo
			},
			success : function(data) {
				alert(data);
				$('.container').html(data.val());
			}

		});

	}
	$(document).ready(function() {
		getUsers(1);
	});
</script>
</head>
<body>
	<h1>ADMIN VIEW</h1>
	<div class="container">
		<table id="approvalUser">

		</table>
	</div>
</body>
</html>