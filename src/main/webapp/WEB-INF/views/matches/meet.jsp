<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recommend Matching</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css" rel="stylesheet" />
<link href=" ${pageContext.request.contextPath}/resources/css/matchmain.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/jquery.wheelmenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
<script>
$(function(){//실행틀 시작
	$('.cf').bxSlider({
		  mode: 'fade',
		  captions: true,
		  pager : false
		});
	$('.myinfomation').click(function(e){
         var url = $(this).val()||$(this).attr('value');
         $('#modalInfo').load(url,function(result){
        	 $('#modalInfo').modal({show:true});
         }); 
	});
	timer();
	setInterval(timer,1000);
	
     
})//실행틀 끝
 
function timer() {
    var d = new Date();
    var n = 24-d.getHours();
    if(n == 0){
    	n='00';
    }
	 var min = 59-d.getMinutes();
	 if(min < 10){
		 min = '0'+min;
	 }
	var sec = 59 - d.getSeconds();
	if(sec < 10){
		sec = '0'+sec;
	}
    $('#timer').text( n+':'+min+':'+sec );
}
function showUserInfo(userNum){
	alert(userNum);
	/* $.ajax({
		url: '${pageContext.request.contextPath}'
		
		
	}); */
}
</script>
</head>
<body>
	<center>
		<div id="wrap">
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
			<div id="container">
				<div class="title">
                <div class="center"><img src=" ${pageContext.request.contextPath}/resources/images/matching2_00.jpg" alt="메인 사진"></div>
            </div>
            <div class="subtitle"><a href="#"><img src=" ${pageContext.request.contextPath}/resources/images/matching2_05.jpg"></a></div>
            <div class="bg" style="background-color:e6e6e6; background-repeat:repeat-x; height:300px;">
				<div class="main">
					<div class="image">
					<c:forEach var="u" items="${users}">
                	<div class="list1">
                        <div class="img1">
                            <div class="inimg1">
                            <div class="userimg1">
                                <ul class="cf">
                                <c:forEach var="p" items="${u.value}">
	                                    <li><input  type="image" class='myinfomation' src="${pageContext.request.contextPath}/resources/${p.u_num}/${p.u_num }${p.p_photonum}${p.p_extendtype}" style="width:300px; height:300px;" value='${pageContext.request.contextPath }/members/${p.u_num}/info' /></li>
                                    </c:forEach>
                                </ul>
                            </div>
                            </div>
                        </div>
                    </div><!--list1-->
                    </c:forEach>
				<div class="info">
                       <div class="history"><a href="${pageContext.request.contextPath}/histories">
                       Go to the<br>
                       My history<span>&nbsp;내 히스토리가기</span>
                       </a>
                       </div>
                       <div class="count">
                            <div class="left"><a href="#">오늘 하루의 선택<br><span>남은 시간</span></a></div>
                            <div class="right"><a href="#" id='timer'>06:45</a></div>
                       </div>
                       <div class="search">
                       <a href="${pageContext.request.contextPath }/matches/search">오늘의 맞춤매칭은 검색매칭을 많이 <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;할 수록 정확도가 높아집니다.<br>
                       <span>검색매칭 하러 가기 ></span>
                       </a>
                       </div>
                  </div>
			</div>
			</div>
			</div>
				 <!-- Modal -->
				 <div id="modalInfo" class="modal  fade" tabindex="-1" role="dialog">
				</div>
				
			   <div class="bgre" style="background-color:#666; position:relative; top:86px; 
			    background-repeat:repeat-x; width:100%; height:66px; z-index:-1"></div>
			    <div id="footer">
			        	<div class="footertitle">광고·제휴 문의    /   이용약관   /   개인정보취급방침   /   고객센터<br>
							사업자등록번호100-00-00000    /    통신판매신고 제 0000 - 성남 판교 - 0000호<br>
							경기도 성남시 판교 판교     /    고객센터 help@puzzle.com 1500-0000    /   (주)신석기 대표이사 신석기</div>
			            <div class="name">신석기</div>
			    </div> <!--footer끝-->
		    </div>
		    
        </div>
	</center>
</body>
</html>