<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>키워드 삭제</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/keywordcheckmain.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>

// 지울 Keyword를 다시 list로 보낸다..
function move(target){
	var html = "<input type='button'  onclick='moveDelete(this)' value='"+$(target).val()+"' />";
	var wrapped = $('#delete');
	wrapped.find(target).remove();
	$('#list').append(html);
}

// 지울 Keyword를 form에 넣는다.
function moveDelete(target){
	var html = "<input type='text' name='delete' onclick='move(this)' value='"+$(target).val()+"' readonly='readonly'/>";
	var wrapped = $('#list');
    wrapped.find(target).remove();
	$('#delete').append(html);
}
function submitKeyword(){
	var keywordNum = $("input[name='delete']").size();
	
	if(keywordNum == 5)
		document.forms[0].submit();
	else if (keywordNum < 5)
		alert( (5-keywordNum) + ' 개의 키워드를 추가해주세요');
	else 
		alert( (keywordNum-5) + ' 개의 키워드를 제거해주세요');
	return false;
}
</script>
</head>
<body>
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
	            	<li><a href="${pageContext.request.contextPath}/matches">매칭</a></li>
	                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
	                <li><a href="${pageContext.request.contextPath}/histories">히스토리</a></li>
	                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
	                <li><a href="${pageContext.request.contextPath}/shop">아이템</a></li>
	                 <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
	                <li><a href="${pageContext.request.contextPath}/evalues">키워드 평가</a></li>
	                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
	                <li><a href="#">관리자 문의</a></li>
	            </ul>
	          <div class="mypage"><a href="${pageContext.request.contextPath}/members/<sec:authentication property='principal.userNum' />"><img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
	          <div class="logout"><a href="${pageContext.request.contextPath}/logout"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
	    	</div>
	    </div>
        
        <!--main부문-->
    	<div id="container" style="background-image:url( ${pageContext.request.contextPath}/resources/images/bg.png); background-repeat:repeat-x;">
        	<div class="title">
            	<div class="headtext">"나에 대한 모든 키워드평가가 끝났습니다"</div>
                <div class="subtext">내게&nbsp;<span>정말 어울리는 키워드</span>를 추려주세요</div>
                <div class="subtext2">개인의 키워드는 총 15개를 가지고 있게 되며, 그러기 위해 <span>20개의 키워드 중 5개</span>를 추려내야 합니다<br>지금&nbsp;<span>나와 가장 맞지 않는다고 생각되는 키워드 5개</span>를 제외하여 본인의 키워드를 완성해주세요</div>
                <div class="subtext3">(지금 선택하게 된 키워드가 본인의 이미지를 대표하게 되며, 임의로 교체할 수 없습니다)</div>
            </div>
            <div class="key" style="background-image:url( ${pageContext.request.contextPath}/resources/images/selectzone_03.png); background-repeat:no-repeat; width:560; height:208px; margin-top:30px;margin-left: 466px">
              	<div id="list" class="list">
              	<c:forEach var="keyword" items="${myKeywords }">
              		<input class="mykeyword" type="button" onclick='moveDelete(this)' value="${keyword.keyword }">
              		</c:forEach>
              	</div>
            </div>
            <form id="delete" class="delete" method='post'>
            	
            </form>
            <div class="okbtn"><a href="javascript: submitKeyword(); " >최종 확인</a></div>
            <div class="lasttest">키워드선택 전에는 다른 서비스를 이용하실 수 없습니다<br><span>최종선택은 신중하게 해주세요</span></div> 
       </div> <!--container-->
           <!--footer-->
    
    <div id="footer">
        <div class="bgre" style="background-color:#666; position:relative; top:-3px;
        background-repeat:repeat-x; width:100%; height:66px; z-index:-1"></div>
        	<div class="footertitle">광고·제휴 문의    /   이용약관   /   개인정보취급방침   /   고객센터<br>
				사업자등록번호100-00-00000    /    통신판매신고 제 0000 - 성남 판교 - 0000호<br>
				경기도 성남시 판교 판교     /    고객센터 help@puzzle.com 1500-0000    /   (주)신석기 대표이사 신석기</div>
            <div class="name">신석기</div>
      </div>
</div>
    <!--footer끝-->
     </center>
    </div> 
</body>
</html>