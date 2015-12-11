<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Matching</title>
<link href="${pageContext.request.contextPath }/resources/css/typehead.css" rel="stylesheet" />
<script
	src="${pageContext.request.contextPath }/resources/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/typeahead.bundle.js"></script>
<script src="http://twitter.github.io/typeahead.js/js/handlebars.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/typeahead.autocomplete.js"></script>
<script>
	$(document)
			.ready(
					function() {
						//autocomplete('#createKeyword', '#eval', '${pageContext.request.contextPath}','${pageContext.request.contextPath }/keywords/find/' ,'.typeahead' );
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
															if(data.callback){
																window.location.href = '${pageContext.request.contextPath}';
																alert('test');
															}else{
																alert('keyword를 다시 입력해주세요');
															}
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
			<c:forEach var="p" items="${profiles }">
			<input id="u_num" type="hidden" value="${eval.u_num }" /> <img alt="User"
				src="${pageContext.request.contextPath }/resources/${p.u_num} /${p.u_num }${p.p_photonum}${p.p_extendtype}"
				width="100px" height="150px" />
				</c:forEach>
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