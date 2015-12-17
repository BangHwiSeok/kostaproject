<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/adminokmain.css" rel="stylesheet" type="text/css" />
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
			url : "members/list",
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
			url : "members/list/approval",
			data : {
				pageNo : pageNo
			},
			success : function(data) {
				alert(data);
				$('#unapproval').html(data);
			}
		});
	}
	
	
	
	function approvalUser(userNum){
		$.ajax({
			url : "members/"+userNum+"/approval",
			success : function(data) {
				//alert(data);
				alert(data);
			}

		});
	}
	function deleteUser(userNum){
		$.ajax({
			url : "members/"+userNum+"/delete",
			success : function(data) {
				//alert(data);
				alert(data);
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
<%-- <center>
	<div id="wrap">
        <div class="list">
            <ul>
                <li class="listitem"><a href="#">아이템&nbsp;&nbsp;/</a></li>
                <li class="listkey"><a href="#">키워드&nbsp;&nbsp;/</a></li>
                <li class="listreport"><a href="#">신고목록&nbsp;&nbsp;/</a></li>
                <li class="lisetuser"><a href="#">승인/유저</a></li>
            </ul>
         </div>
      <div id="container">
      		<div class="title">관리자 승인</div>
            <!-- <div class="main"><img src="images/wo1.jpg"></div> -->
            <div class="user">
            	<span class="id">○ 아이디 : kosta106@naver.com</span><br>
                <span class="pnum">○ 연락처 : 01012345678</span><br>
                <span class="gender">○ 성별 : 여자</span><br>
                <span class="bir">○ 생년월일 : 20151231</span><br>
                <span class="num">○ 회원번호 : no.14</span><br>
            </div>
            <div class="sub">
            	<ul class="cf">
            	<li class="subimg"><img src="images/wo2.jpg"></li>
                	<li class="subimg"><img src="images/wo2.jpg"></li>
                    <li class="subimg"><img src="images/wo3.jpg"></li>
                    <li class="subimg"><img src="images/wo4.jpg"></li>
                    <li class="subimg"><img src="images/wo5.jpg"></li>
                </ul>
            </div>
            <div class="btn"><input type="image" src="${pageContext.request.contextPath}/resources/images/ok.png" alt="Submit" width="80px" height="31px"></div>
        </div>
    <div id="container2">
    	<div class="title2">유저 목록</div>
        <div class="case"> 
            <div class="user2">
                <span class="id2">○ 아이디 : kosta106@naver.com</span>&nbsp;
                <span class="pnum2">○ 연락처 : 01012345678</span>&nbsp;
                <span class="gender2">○ 성별 : 여자</span>&nbsp;
                <span class="bir2">○ 생년월일 : 20151231</span>&nbsp;
                <span class="num2">○ 회원번호 : no.14</span>
            </div>
            <div align="center" class="subbtn">
                <div class="subbtn1"><input type="image" src="${pageContext.request.contextPath}/resources/images/subbtn1.jpg" alt="Submit" width="76px" height="22px"></div>
                <div class="subbtn2"><input type="image" src="${pageContext.request.contextPath}/resources/images/subbtn2.jpg" alt="Submit" width="76px" height="22px"></div>
                <div class="subbtn3"><input type="image" src="${pageContext.request.contextPath}/resources/images/subbtn3.jpg" alt="Submit" width="76px" height="22px"></div>
                <div class="subbtn4"><input type="image" src="${pageContext.request.contextPath}/resources/images/subbtn4.jpg" alt="Submit" width="76px" height="22px"></div>
            </div>
        </div>
    </div>
    
    </div>
    </center> --%>
	<h1>Unapproval User</h1>
	<div id="unapproval"></div>
	<div>
		<button onclick="prePage('unApproval');">&lt;</button>
		<button onclick="nextPage('unApproval');">&gt;</button>
	</div>
	<hr/>
	<h1>Users</h1>
	<div id="users"></div>
	<div>
		<button onclick="prePage('user');">&lt;</button>
		<button onclick="nextPage('user');">&gt;</button>
	</div>
</body>
</html>