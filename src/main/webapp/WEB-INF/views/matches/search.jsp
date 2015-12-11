<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Matching</title>
<link href="${pageContext.request.contextPath }/resources/css/typehead.css" rel="stylesheet" />
<style>
#wrap {width:100%; height:534px; margin:0 auto; background-color:#ff524f; }
</style>
<script
	src="${pageContext.request.contextPath }/resources/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/typeahead.bundle.js"></script>
<script src="http://twitter.github.io/typeahead.js/js/handlebars.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/typeahead.custom.search.js"></script>
<script>
	$(document)
			.ready(
					function() {
						search('.typeahead','${pageContext.request.contextPath }/keywords/find/', '#num','#addTaget');
					}); 
</script>
</head>
<body >
<input id='num' type='hidden' value=0 />
	<center>
	<div id="wrap" >
		<div class="title">
			<img src="${pageContext.request.contextPath}/resources/images/search_03.png" alt="헤더 글">
		</div>
        <div class="search" style="background-image:url(${pageContext.request.contextPath}/resources/images/search_00.png);   background-repeat:no-repeat; width:590px; height:148px; margin-top:20px;">
       	    <span class="searchkey"><input class="typeahead" type="text"></span>
        </div>
        
        <div class="pluse" style="background-image:url(${pageContext.request.contextPath}/resources/images/search.png); background-repeat:no-repeat; height:120; width:691px;">
        	<input type="image" src="${pageContext.request.contextPath}/resources/images/search_05.png" class="subsearch" onclick="document.forms[0].submit()"/>
        	<form id='test'  method='POST'  class="text">
            	<div id='addTaget' class="subtext"></div>
            	<input type="text"/>
        	</form>
        	<div class="subtitle"><img src="${pageContext.request.contextPath}/resources/images/search_02.png" alt="글"></div>
    	</div>
    </div>
    </center>
	<!-- <div>
		<h3>키워드로 찾기</h3>
		<div>
			<input class="typeahead" type="text" />
		</div>
	</div>
	<input id='num' type='hidden' value=0 />
	<form id='test'  method='POST'>    </form>
	<button onclick="document.forms[0].submit()">전송</button> -->
</body>
</html>