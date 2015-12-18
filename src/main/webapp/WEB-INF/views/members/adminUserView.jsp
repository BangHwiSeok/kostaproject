<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 승인</title>
<link href=" ${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href=" ${pageContext.request.contextPath}/resources/css/adminokmain.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script>
	function nextPage(type) {
		var pageNum = $("#"+type+"pageNo").val();

		var lastPageNum = $("#"+type+"totalPageNum").val();

		if (pageNum < lastPageNum) {
			if(type == "unApproval"){
				getApprovalUsers(pageNum + 1)
			}else{
				getUsers(pageNum + 1);
			}
		} else {
			alert("마지막 Page 입니다.");
		}

	}
	function prePage(type) {
		var pageNum = $("#"+type+"pageNo").val();
		var lastPageNum = $("#"+type+"totalPageNum").val();

		if (pageNum > 1) {
			if(type == "unApproval"){
				getApprovalUsers(pageNum - 1)
			}else{
				getUsers(pageNum - 1);
			}
		} else {
			alert("첫 Page 입니다.");
		}
	}
	
	function getUsers(pageNo) {
		var path = "members/list";
		$.ajax({
			url : "console/list",
			data : {
				pageNo : pageNo
			},
			success : function(data) {
				//alert(data);
				$('#users').html(data);
			}

		});
	}
	function getApprovalUsers(pageNo) {
		$.ajax({
			url : "console/members/list/approval",
			data : {
				pageNo : pageNo
			},
			success : function(data) {
				//alert(data);
				$('#unapproval').html(data);
			}
		});
	}
	
	
	
	function approvalUser(userNum){
		$.ajax({
			url : "console/"+userNum+"/approval",
			success : function(data) {
				//alert(data);
			}

		});
	}
	function deleteUser(userNum){
		$.ajax({
			url : "members/"+userNum+"/delete",
			success : function(data) {
				//alert(data);
			}

		});
	}
	
	$(document).ready(function() {
		getUsers(1);
		getApprovalUsers(1);
	});
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
				<li><a href="${pageContext.request.contextPath }/matches">매칭</a></li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">히스토리</a></li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="${pageContext.request.contextPath }/shop">아이템</a></li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="${pageContext.request.contextPath }/evalues">키워드
						평가</a></li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="${pageContext.request.contextPath }">관리자 문의</a></li>
			</ul>
          <div class="mypage">
				<a
					href="${pageContext.request.contextPath }/members/${currentUser.user.u_num}"><img
					src=" ${pageContext.request.contextPath}/resources/images/mypage.png"
					alt="마이페이지"></a>
			</div>
          <div class="logout">
				<a href="${pageContext.request.contextPath }/logout"><img
					src=" ${pageContext.request.contextPath}/resources/images/logout.png"
					alt="로그아웃"></a>
			</div>
    	</div>
    </div>
    <!--main-->
        <div class="list">
            <ul>
                <li class="listitem"><a href="#">아이템&nbsp;&nbsp;/</a></li>
                <li class="listkey"><a href="#">키워드&nbsp;&nbsp;/</a></li>
                <li class="listreport"><a href="#">신고목록&nbsp;&nbsp;/</a></li>
                <li class="lisetuser"><a href="${pageContext.request.contextPath }/console">승인/유저</a></li>
            </ul>
         </div>
      <div id="container">
      		<div class="title">관리자 승인</div>
           <div id="unapproval"></div>
			<div>
				<button onclick="prePage('unApproval');">&lt;</button>
				<button onclick="nextPage('unApproval');">&gt;</button>
			</div>
            </div>
        <!-- container-->
    <div id="container2">
    	<div class="title2">유저 목록</div>
        <div class="case"> 
        	<div id="users">
        		<div class="user2">
	                <span class="id2">○ 아이디 : kosta106@naver.com</span>&nbsp;
	                <span class="pnum2">○ 연락처 : 01012345678</span>&nbsp;
	                <span class="gender2">○ 성별 : 여자</span>&nbsp;
	                <span class="bir2">○ 생년월일 : 20151231</span>&nbsp;
	                <span class="num2">○ 회원번호 : no.14</span>
            
		            <div align="center" class="subbtn">
		                <div class="subbtn1"><a href="#">회원삭제</a></div>
		                <div class="subbtn2"><a href="#">활성화</a></div>
		                <div class="subbtn3"><a href="#">비활성화</a></div>
		                <div class="subbtn4"><a href="#">쪽지제한</a></div>
		            </div>
          		</div>
        	</div>
            
        </div>
    </div><!-- container2-->
   
     <!--footer-->
    
    <!--footer끝-->
	

	<div>
		<button onclick="prePage('user');">&lt;</button>
		<button onclick="nextPage('user');">&gt;</button>
	</div>
	</div>
	</center>
</body>
</html>