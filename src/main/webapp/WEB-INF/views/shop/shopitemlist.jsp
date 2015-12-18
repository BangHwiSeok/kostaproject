<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이템샵</title>
<link href=" ${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href=" ${pageContext.request.contextPath}/resources/css/itemmain.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
function buyItem(i_num){
	alert("buyItem");
	$.ajax({
		url : "shop/"+i_num+"/buyItem",
		type : "GET",
		data : {i_num:i_num},
		success : function(data) {
			alert("success");
			//getItems();
			//$('.approvalItem').html(data);
		},
		error:function(data){
			alert("fail");
		}
	});
}

function buyConfirm(i_num) {
    var r = confirm("정말 구매 하시겠습니까?");
    if (r == true) {
    	buyItem(i_num);
    } else {
        alert("취소");
    }
}
	
</script>
<style type="text/css">
div.a {
	color: #FF2D2D;
}
.text_num_input{
	width: 30px;
}
</style>
</head>
<body>
	<center>
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
                <li><a href="${pageContext.request.contextPath}/evalues">키워드 평가</a></li>
                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
            </ul>
          <div class="mypage"><a href="#"><img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
          <div class="logout"><a href="#"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
    	</div>
    </div>
    
    <!--main부문-->
      <div id="container">
      	<div class="title">더 즐거운 퍼즐 <span>아이템샵</span></div>
        <div class="subtitle">퍼즐을 더욱 더 즐겁게 즐길 수 있게,&nbsp;<span>다양한 아이템</span>이 마련되어 있습니다.<br>관심표현을 더욱 자유롭게 할 수 있게 아이템을 사용해보세요</div>
       
        <div class="main">
        	
            <div class="mainleft">
            	<div class="menu">
                    <div class="item1">아이템</div>
                    <div class="puzzle1">퍼즐</div>
                    <div class="bgo1">비고</div>
                </div>
                <c:forEach var="item" items="${itemList }">
	                <div class="list">
	                	<div class="listpluse">
	                        <div class="itemname1">${item.i_name}</div>
	                        <div class="puzzlename1">${item.i_cost}</div>
	                        <div class="bgoname1"><a href="#">구매</a></div>
	                    </div>
	                </div>
                </c:forEach>
            </div><!--left끝-->
        </div>
   	  </div>
      <!--main끝나는 부문-->
    
    <!--footer-->
    <div class="bgre" style="background-color:#666; position:fixed; bottom:0px; 
    background-repeat:repeat-x; width:100%; height:66px; z-index:-1"></div>
    <div id="footer">
        	<div class="footertitle">광고·제휴 문의    /   이용약관   /   개인정보취급방침   /   고객센터<br>
				사업자등록번호100-00-00000    /    통신판매신고 제 0000 - 성남 판교 - 0000호<br>
				경기도 성남시 판교 판교     /    고객센터 help@puzzle.com 1500-0000    /   (주)신석기 대표이사 신석기</div>
            <div class="name">신석기</div>
       	    </div>
    </div>
    <!--footer끝-->
      
</center>
	
	
</body>
</html>
