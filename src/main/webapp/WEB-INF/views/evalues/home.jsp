<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Matching</title>
<link href="${pageContext.request.contextPath }/resources/css/typehead.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/keywordmain.css" rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath }/resources/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/typeahead.bundle.js"></script>
	<script
	src="${pageContext.request.contextPath }/resources/js/jquery.bxslider.min.js"></script>
<script src="http://twitter.github.io/typeahead.js/js/handlebars.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/typehead.autocomplete.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						autocomplete('#createKeyword', '#eval','#u_num', '${pageContext.request.contextPath}','${pageContext.request.contextPath }/keywords/find/' ,'.auto' );
					
					});
	function addKeyword(target){
		var num = parseInt($('#num').val())
		
		if(num >1 )
			return false;
		/* $('#num').val(num+1); */
		var selected = $('.tt-selectable');
		//console.log(pre);
		//console.log(num);
		var suggestion = $(selected[num]).text();
		console.log(suggestion);
		$('.carbar').append("<input type='text'  name='"+target+"' value='"+suggestion+"' />")
		
		$('#num').val(num+1);
	}
	
</script>
</head>
<body>
<div id="wrap">
<!--헤더-->
    <div id="header" style="background-color:#ff524f;; background-repeat:repeat-x;">
        <div class="headerwidth">
        	<div class="logo">
				<a href="${pageContext.request.contextPath }"><img
					src=" ${pageContext.request.contextPath}/resources/images/logo.png"
					alt="로고"></a>
			</div>
          <ul>
            	<li><a href="${pageContext.request.contextPath}/matches">매칭</a></li>
                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                <li><a href="${pageContext.request.contextPath}/histories">히스토리</a></li>
                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                <li><a href="${pageContext.request.contextPath}/shop">아이템</a></li>
                 <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                <li><a href="${pageContext.request.contextPath}/evaluates">키워드 평가</a></li>
                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                <li><a href="#">관리자 문의</a></li>
            </ul>
          <div class="mypage"><a href="${pageContext.request.contextPath}/memebers/<sec:authentication property='principal.userNum'/>" > <img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
          <div class="logout"><a href="${pageContext.request.contextPath}/logout"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
    	</div>
    </div>
<center>

	<c:if test="${!non_eval}">
		<%-- <p>${eval.u_num }</p> --%>
		
		
		
    	<div id="container">
        	<div class="conup">
                <div class="title"><img src="${pageContext.request.contextPath}/resources/images/title.png" alt="키워드 글"></div>
                <div class="circleimg" >
                <%-- <c:forEach var="profile" items="${profiles }">
                	<img class="slide"  src="${pageContext.request.contextPath }/resources/${profile.u_num} /${profile.u_num }${profile.p_photonum}${profile.p_extendtype}" alt="유저 사진">
                </c:forEach>
                </div> --%>
                <img src="${pageContext.request.contextPath }/resources/${profiles[0].u_num} /${profiles[0].u_num }${profiles[0].p_photonum}${profiles[0].p_extendtype}" alt="유저 사진"></div>
                <div class="subtitle"><img src="${pageContext.request.contextPath}/resources/images/subtitle.png" alt="내용"></div>
             </div>
             <div class="concen">
             	<input id="u_num" type="hidden" value="${eval.u_num }" /> 
                <div class="ser1">
                <input type="text"class="auto" name="keyword1" placeholder="검색" style="height:30px; width:250px;" />
                &nbsp;<input type="image" src="${pageContext.request.contextPath}/resources/images/searchbar.png" alt="Submit" width="58" height="31" onclick="return addKeyword('keyword1')"/></div>
                <div class="ser2"><input type="text" class="auto" name="keyword2" placeholder="카테고리" style="height:30px; width:250px;" />
                &nbsp;<input type="image" id="addKeyword" src="${pageContext.request.contextPath}/resources/images/searchbar.png" alt="Submit" width="58" height="31" onclick="return addKeyword('keyword2')"/></div>
                
                <form id="eval"  class="carbar"></form>
                <input type="hidden" id="num" value=0 />
                <button id="createKeyword">Add Keyword</button>
             </div>
       </div>
		
		
		<%-- <div id="user">
			<c:forEach var="p" items="${profiles }">
			<input id="u_num" type="hidden" value="${eval.u_num }" /> <img alt="User"
				src="${pageContext.request.contextPath }/resources/${p.u_num} /${p.u_num }${p.p_photonum}${p.p_extendtype}"
				width="100px" height="150px" />
				</c:forEach>
		</div>
		<form id="eval">
			<div>
				<label>Keyword1 : <input class="typeahead tt-input"
					name="keyword1" id="key1" type="text"  /></label>
					<font color="red">${error.key1 }</font>			
			</div>
			<div>
				<label>Keyword2 : </label><input class="typeahead" name="keyword2"
					type="text" /><font color="red">${error.key2 }</font>		
			</div>
		</form> --%>
		
	</c:if>
	<c:if test="${non_eval }">
	평가할 목록이 없습니다.
	</c:if>
	<div id="footer">
        <div class="bgre" style="background-color:#666; position:relative; top:87px;
        background-repeat:repeat-x; width:100%; height:66px; z-index:-1"></div>
        	<div class="footertitle">광고·제휴 문의    /   이용약관   /   개인정보취급방침   /   고객센터<br>
				사업자등록번호100-00-00000    /    통신판매신고 제 0000 - 성남 판교 - 0000호<br>
				경기도 성남시 판교 판교     /    고객센터 help@puzzle.com 1500-0000    /   (주)신석기 대표이사 신석기</div>
            <div class="name">신석기</div>
       	    </div>
    <!--footer끝-->
 </center>
 </div>
</body>
</html>