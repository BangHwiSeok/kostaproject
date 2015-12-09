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
	$('#find').keyup(function(){
		console.log("keyup event");
		$.ajax({
			url:"keywords/find/"+$('#find').val(), 
			dataType : "json",
			success:function(data) {
				//var result = JSON.parse(data);
				console.log(data);
				$.each(data[0], function(key, value){
				    //alert('key:' + key + ' / ' + 'value:' + value);
				});
		        /* $('div#results').html(result);
		        $('#results').show(); */
			}
	    });
	});
	
});

</script>

</head>
<body>
	<div>
		<input type="text" id="find" /><br>
		<div id="result"></div>

	</div>
</body>
</html>