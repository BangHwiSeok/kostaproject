<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Matching</title>
<link href="${pageContext.request.contextPath }/resources/css/typehead.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/keywordmain.css" rel="stylesheet" type="text/css" />
 <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
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
						var items= $('.item');
						items[0].attry('active');
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
	<c:if test="${!non_eval}">
		<%-- <p>${eval.u_num }</p> --%>
		
		<div id="wrap">
		<center>
		<!--헤더-->
        <div id="header" style="background-color:#ff524f;; background-repeat:repeat-x;">
            <div class="headerwidth">
                <div class="logo">
                    <a href="${pageContext.request.contextPath }"><img
                        src=" ${pageContext.request.contextPath}/resources/images/logo.png"
                        alt="로고"></a>
                </div>
              <ul>
                    <li><a href="#">매칭</a></li>
                    <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                    <li><a href="#">히스토리</a></li>
                    <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                    <li><a href="#">아이템</a></li>
                     <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                    <li><a href="#">키워드 평가</a></li>
                    <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                    <li><a href="#">관리자 문의</a></li>
                </ul>
              <div class="mypage"><a href="#"><img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
              <div class="logout"><a href="${pageContext.request.contextPath}/logout"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
            </div>
        </div>
    	<div id="container">
        	<div class="conup">
                <div class="title"><img src="${pageContext.request.contextPath}/resources/images/title.png" alt="키워드 글"></div>
                <div class="circleimg">
                     <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:276px; height:276px;">
                        <!-- Indicators -->
                        <ol class="carousel-indicators"  style="position:relative; top:255px; left:45px;">
                          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                          <li data-target="#myCarousel" data-slide-to="1"></li>
                          <li data-target="#myCarousel" data-slide-to="2"></li>
                          <li data-target="#myCarousel" data-slide-to="3"></li>
                        </ol>
                    
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox" style="margin-top:-30px;">
                        <c:forEach var="profile" items="${profiles }">
                          <div class="item">
                        	<img src="${pageContext.request.contextPath }/resources/${profile.u_num}/${profile.u_num }${profile.p_photonum}${profile.p_extendtype}" alt="이미지"style=" height:276px; width:276px;">  
                          </div>
                          </c:forEach>
                        </div>
                    
                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"
                        style="width:0; position:relative; top:-130px; left:-120px;">
                          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"
                        style="width:0; position:relative; top:-130px; left:120px;">
                          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        </a>
                      </div>
                </div>
               </div>
               <%--  <div class="circleimg" >
                <c:forEach var="profile" items="${profiles }">
                	<img class="slide"  src="${pageContext.request.contextPath }/resources/${profile.u_num} /${profile.u_num }${profile.p_photonum}${profile.p_extendtype}" alt="유저 사진">
                </c:forEach>
                </div>
                <img src="${pageContext.request.contextPath }/resources/${profiles[0].u_num} /${profiles[0].u_num }${profiles[0].p_photonum}${profiles[0].p_extendtype}" alt="유저 사진"></div>
                <div class="subtitle"><img src="${pageContext.request.contextPath}/resources/images/subtitle.png" alt="내용"></div>
             </div>
             <div class="concen">
             	<input id="u_num" type="hidden" value="${eval.u_num }" /> 
                <div class="ser1"><input type="text"class="auto" name="keyword1" placeholder="검색" style="height:30px; width:250px;" />
                &nbsp;<input type="image" src="${pageContext.request.contextPath}/resources/images/searchbar.png" alt="Submit" width="58" height="31" onclick="return addKeyword('keyword1')"/></div>
                <div class="ser2"><input type="text" class="auto" name="keyword2" placeholder="카테고리" style="height:30px; width:250px;" />
                &nbsp;<input type="image" id="addKeyword" src="${pageContext.request.contextPath}/resources/images/searchbar.png" alt="Submit" width="58" height="31" onclick="return addKeyword('keyword2')"/></div>
                
                <form id="eval"  class="carbar"></form>
                <input type="hidden" id="num" value=0 />
                <button id="createKeyword">Add Keyword</button>
             </div> --%>
       </div>
       </center>
    </div> 
		
	</c:if>
	<c:if test="${non_eval }">
	평가할 목록이 없습니다.
</c:if>
</body>
</html>