<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Find Keyword</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
$(document).ready(function(){
	$('#find').click(function(){
		console.log("keyup event");
		var params = $('form').serialize();
		$.ajax({
			url:"keywords",
			method:"post",
			data:params,
			success:function(data) {
				alert('입력');
			}
	    });
	});
});

</script>

</head>
<body>
	<div>
		<div id="result"></div>
		<form method="post">
			<label>GROUP : </label><input type="text" name='K_GROUP'  value="미분류"/><br/>
			<label>K_NAME : </label><input type="text" name='K_NAME' />
		</form>
<button id="find" >input</button><br>
	</div>
</body>
</html>