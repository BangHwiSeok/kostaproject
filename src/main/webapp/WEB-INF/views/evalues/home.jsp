<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$('#createKeyword')
								.bind(
										'click',
										function() {
											var params = $('#eval').serialize();

											$
													.ajax({
														url : "evalues/create/"
																+ $('#u_num')
																		.val(),
														data : params,
														type:'POST',
														dataType : 'jsonp',
														jsonpCallback:'callback',
														success : function(data) {
															console
																	.log(data.callback);
															window.location.href = '${pageContext.request.contextPath}';
															alert('test');
														},
														error : function(xhr,status,error) {
															alert("code: "+xhr.status)
															console.log("code : "+xhr.status+"-- error : "+error);
														}
													});
										})

					});
</script>
</head>
<body>
<p>
${eval.u_num }
</p>
	<div id="user">
		<input id="u_num" type="hidden" value="15" /> <img alt="User"
			src="${pageContext.request.contextPath }/resources/15/150.jpg"
			width="100px" height="150px" />
	</div>
	<form id="eval">
		<div>
			<label>Keyword1 : </label><input name="keyword1" type="text" />
		</div>
		<div>
			<label>Keyword2 : </label><input name="keyword2" type="text" />
		</div>
	</form>
	<button id="createKeyword">Add Keyword</button>
</body>
</html>