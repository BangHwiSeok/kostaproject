<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.typeahead, .tt-query, .tt-hint {
	width: 396px;
	height: 30px;
	padding: 8px 12px;
	font-size: 24px;
	line-height: 30px;
	border: 2px solid #ccc;
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	outline: none;
}

.typeahead {
	background-color: #fff;
}

.typeahead:focus {
	border: 2px solid #0097cf;
}

.tt-query {
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.tt-hint {
	color: #999
}

.tt-menu {
	width: 422px;
	margin: 12px 0;
	padding: 8px 0;
	background-color: #fff;
	border: 1px solid #ccc;
	border: 1px solid rgba(0, 0, 0, 0.2);
	-webkit-border-radius: 8px;
	-moz-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
	box-shadow: 0 5px 10px rgba(0, 0, 0, .2);
}

.tt-suggestion {
	padding: 3px 20px;
	font-size: 18px;
	line-height: 24px;
}

.tt-suggestion:hover {
	cursor: pointer;
	color: #fff;
	background-color: #0097cf;
}

.tt-suggestion.tt-cursor {
	color: #fff;
	background-color: #0097cf;
}

.tt-suggestion p {
	margin: 0;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/typeahead.bundle.js"></script>
<script src="http://twitter.github.io/typeahead.js/js/handlebars.js"></script>
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
														type : 'POST',
														dataType : 'json',
														jsonpCallback : 'callback',
														success : function(data) {
															console
																	.log(data.callback);
															window.location.href = '${pageContext.request.contextPath}';
															alert('test');
														},
														error : function(xhr,
																status, error) {
															alert("code: "
																	+ xhr.status)
															console
																	.log("code : "
																			+ xhr.status
																			+ "-- error : "
																			+ error);
														}
													});
										});
						var bestPictures = new Bloodhound(
								{
									datumTokenizer : function(datum) {
										return Bloodhound.tokenizers
												.whitespace(datum.value);
									},
									queryTokenizer : Bloodhound.tokenizers.whitespace,
									remote : {
										url : '${pageContext.request.contextPath }/keywords/find/%QUERY',
										wildcard : '%QUERY',
										filter : function(data) {
											// Map the remote source JSON array to a JavaScript object array
											console.log(data);
											return $.map(data, function(value) {
												return {
													value : value.k_NAME
												};
											});
										}
									}
								});
						console.log(bestPictures);
						bestPictures.initialize();

						$('.typeahead').typeahead(null, {
							displayKey : 'value',
							source : bestPictures.ttAdapter()

						});
					});
</script>
</head>
<body>
	<c:if test="${!non_eval}">
		<p>${eval.u_num }</p>
		<div id="user">
			<input id="u_num" type="hidden" value="15" /> <img alt="User"
				src="${pageContext.request.contextPath }/resources/15/150.jpg"
				width="100px" height="150px" />
		</div>
		<form id="eval">
			<div>
				<label>Keyword1 : <input class="typeahead tt-input"
					name="keyword1" id="key1" type="text" /></label>
					<font color="red">${error.key1 }</font>			
			</div>
			<div>
				<label>Keyword2 : </label><input class="typeahead" name="keyword2"
					type="text" /><font color="red">${error.key2 }</font>		
			</div>
		</form>
		<button id="createKeyword">Add Keyword</button>
	</c:if>
	<c:if test="${non_eval }">
	평가할 목록이 없습니다.
</c:if>
</body>
</html>