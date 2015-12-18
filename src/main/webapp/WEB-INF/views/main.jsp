<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>메인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href=" ${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href=" ${pageContext.request.contextPath}/resources/css/mainmain.css" rel="stylesheet" type="text/css" />
</head>
<body>

<center>
<div class="wrap">
<!--헤더-->
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
            <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN','ROLE_FUL_WAITING','ROLE_WAITING') and isAuthenticated()">
	            <div class="mypage"><a href="${pageContext.request.contextPath}/members/<sec:authentication property='principal.userNum' />"><img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
	          	<div class="logout"><a href="${pageContext.request.contextPath }/logout"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
          	</sec:authorize>
    	</div>
    </div>
    
    <!--main부문-->
	<div class="top">
    	<div class="topimg">
            <div class="mainimg"><img src=" ${pageContext.request.contextPath}/resources/images/main_src_00.png" alt="사람사진"></div>
            <div class="maintitle1"><img src=" ${pageContext.request.contextPath}/resources/images/main_text_00.png" alt="타이틀1"></div>
            <div class="maintitle2"><img src=" ${pageContext.request.contextPath}/resources/images/main_text_01.png" alt="타이틀2"></div>
        </div>
        <div class="topbtn">
        	<div class="btn1"><a href="${pageContext.request.contextPath}/matches/meet"><img src=" ${pageContext.request.contextPath}/resources/images/main_01.jpg" alt="맞춤"></a></div>
        	<div class="btn2"><a href="${pageContext.request.contextPath}/matches/search"><img src=" ${pageContext.request.contextPath}/resources/images/main_02.jpg" alt="맞춤"></a></div>
            <div class="subtitle"><img src=" ${pageContext.request.contextPath}/resources/images/main_text_02.png"></div>
        </div>
    </div>
    <div class="under"><img src=" ${pageContext.request.contextPath}/resources/images/main_03_r.jpg"></div>
    <!--main끝나는 부문-->
    
    <!--footer-->
    <div class="bgre" style="background-color:#666; position:relative; top:-1px; 
    background-repeat:repeat-x; width:100%; height:66px; z-index:-1"></div>
    <div id="footer">
        	<div class="footertitle">광고·제휴 문의    /   이용약관   /   개인정보취급방침   /   고객센터<br>
				사업자등록번호100-00-00000    /    통신판매신고 제 0000 - 성남 판교 - 0000호<br>
				경기도 성남시 판교 판교     /    고객센터 help@puzzle.com 1500-0000    /   (주)신석기 대표이사 신석기</div>
            <div class="name">신석기</div>
       	    </div>
    </div>
    <!--footer끝-->
</div><!--wrap-->
</center>
</body>
</html>