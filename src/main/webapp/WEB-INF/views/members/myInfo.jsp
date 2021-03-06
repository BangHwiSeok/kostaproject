<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE >
<html>
<head>
<title>유저 마이페이지</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href=" ${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href=" ${pageContext.request.contextPath}/resources/css/usermain.css" rel="stylesheet" type="text/css" />
<link	href="${pageContext.request.contextPath }/resources/bootstrap/css/jasny-bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/bootstrap/js/jasny-bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.js"></script>
<script>
function upLoadPhoto(){
	var changedPhotoes = $("input[type='hidden']");
	$('.centermenu').find(changedPhotoes).remove();
	var params = $('.centermenu').serialize();
	var files = $("input[type='file']");
	var changedIndex = [];
	
	$(files).each(function(i,f){
		var inputHtml = "<input type='hidden' name='changedIndex["
		if($(f).val() != ''  && i < 2){
			inputHtml+=i+"]' value="+true+" />";
			$('.centermenu').append( inputHtml);
		}else{
			inputHtml+=i+"]' value='"+false+"' />";
			$('.centermenu').append( inputHtml);
		}
	});
	$(".centermenu").ajaxSubmit({
		method:'post',
		success : function(data) {
			alert(data);
		},
		error : function(error) {
			alert("요청 처리 중 오류가 발생하였습니다.");
		}
	});
	/* $.ajax({
		url:"${pageContext.request.contextPath }/members/files/upload",
		data: params,
		method:'post',
		success:function(data){
			alert('Success');
		}
	}); */
	
}
function fileTrigger(target){
	
}

$('.fileinput').fileinput();
function updateInfo(){
	var param = $('.userdata').serialize();
	/* 
	$.ajax({
		url:'${pageContext.request.contextPath }/members/'+'${myInfo.user.u_num}'+'/pwd',
		type:'post',
		data:{pwd:pwd},
		success:function(data){
			alert(data);
			$("#pwd").val('');
			
		}
	}); */ 
	alert(param);
}

</script>
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
                <li><a href="#">관리자 문의</a></li>
            </ul>
          <div class="mypage"><a href="${pageContext.request.contextPath}/memebers/<sec:authentication property='principal.userNum' />"><img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
          <div class="logout"><a href="${pageContext.request.contextPath}/logout"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
    	</div>
    </div>
    
    <!--main부문-->
    <div class="mainimg"><img src=" ${pageContext.request.contextPath}/resources/images/mypage_01.jpg" alt="메인사진"></div>
    <div class="main">
        <div class="leftmenu">
        	<form class="userdata" action='${pageContext.request.contextPath }' method="post"  >
            	<div class="userdataname">기본 정보<span>[비밀번호와 전화번호 수정가능]</span></div>
                <div class="userdatalist">
                	<div class="id">
                    	<div class="left">아이디</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_id }" readonly="readonly"></div>
                    </div>
                    <div class="pwd">
                   	    <div class="left">비밀번호</div>
                        <div class="right"><input type="text" ></div>
                    </div>
                    <div class="checkpwd">
                   	    <div class="left">비밀번호 확인</div>
                        <div class="right"><input type="text"></div>
                    </div>
                    <div class="pnum">
                   	    <div class="left">전화번호</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_pnum }"></div>
                    </div>
                    <div class="gender">
                   	    <div class="left">성별</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_gender}" readonly="readonly"></div>
                    </div>
                    <div class="birth">
                   	    <div class="left">생년월일</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_birth }" ></div>
                    </div>
                    <div class="num">
                   	    <div class="left">회원번호</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_num }" readonly="readonly"></div>
                    </div>
                    <div class="join">
                   	    <div class="left">가입날짜</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_regdate }" readonly="readonly"></div>
                    </div>
                    <div class="state">
                   	    <div class="left">회원상태</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_role }" readonly="readonly"></div>
                    </div>
                    <div class="message">
                   	    <div class="left">쪽지횟수</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_msgnum }" readonly="readonly"></div>
                    </div>
                    <div class="search">
                   	    <div class="left">검색횟수</div>
                        <div class="right"><input type="text" value="${myInfo.user.u_sernum }" readonly="readonly"></div>
                    </div>
                </div><!--userdatalist-->
                <div class="userdatabtn"><a href="" onclick='updateInfo()'>기본 정보 수정</a></div>
            </form><!--userdata-->
            <div class="itemdata">
                <div class="itemdataname">아이템 정보<span><a href="#">[아이템샵 바로가기]</a></span></div>
                    <div class="itemdatalist">
                        <div class="paper">
                            <div class="left">쪽지아이템</div>
                            <div class="right"><input type="text"></div>
                        </div>
                        <div class="key">
                            <div class="left">키워드교체아이템</div>
                            <div class="right"><input type="text"></div>
                        </div>
                        <div class="serch">
                            <div class="left">검색추가아이템 </div>
                            <div class="right"><input type="text"></div>
                        </div>
                    </div>
                </div>
            </div><!--itemdata-->
        <form class="centermenu" action="${pageContext.request.contextPath }/members/files/upload" enctype="multipart/form-data">
        	<div class="proname">프로필 사진<span>[메인사진 2장은 필수로 등록되어있어야 합니다.(5MB 제한)]</span></div>
            <div  class="promainimg">
            	<div class="img1 fileinput fileinput-new" data-provides="fileinput"  style="width:230px; height:250px;">
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:230px; height:250px;">
	            			<img src="${pageContext.request.contextPath }/resources/${myInfo.profiles[0].u_num}/${myInfo.profiles[0].u_num}${myInfo.profiles[0].p_photonum}${myInfo.profiles[0].p_extendtype}" onerror="javascript:this.src='${pageContext.request.contextPath }/resources/images/noimage.png'">
	            		</div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[0]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
                <div class="img2 fileinput fileinput-new" data-provides="fileinput"   style="width:230px; height:250px;">
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:230px; height:250px;">
	            			<img src="${pageContext.request.contextPath }/resources/${myInfo.profiles[1].u_num}/${myInfo.profiles[1].u_num}${myInfo.profiles[1].p_photonum}${myInfo.profiles[1].p_extendtype}" onerror="javascript:this.src='${pageContext.request.contextPath }/resources/images/noimage.png'"/>
	            		</div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[1]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
				</div>
            </div>
            <div class="submain">
            	<div class="subimg1 fileinput fileinput-new" data-provides="fileinput" style="width:165px; height:165px;">
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:165px; height:165px;">
	            			<img src="${pageContext.request.contextPath }/resources/${myInfo.profiles[2].u_num}/${myInfo.profiles[2].u_num}${myInfo.profiles[2].p_photonum}${myInfo.profiles[2].p_extendtype}" onerror="javascript:this.src='${pageContext.request.contextPath }/resources/images/noimage.png'"/>
	            		</div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[2]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
                <div class="subimg2 fileinput fileinput-new" data-provides="fileinput" style="width:165px; height:165px;">
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:165px; height:165px;">
	            			<img src="${pageContext.request.contextPath }/resources/${myInfo.profiles[3].u_num}/${myInfo.profiles[3].u_num}${myInfo.profiles[3].p_photonum}${myInfo.profiles[3].p_extendtype}" onerror="javascript:this.src='${pageContext.request.contextPath }/resources/images/noimage.png'"/>
	            		</div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[3]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
                <div class="subimg3 fileinput fileinput-new" data-provides="fileinput" style="width:165px; height:165px;">
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:165px; height:165px;">
	            			<img src="${pageContext.request.contextPath }/resources/${myInfo.profiles[4].u_num}/${myInfo.profiles[4].u_num}${myInfo.profiles[4].p_photonum}${myInfo.profiles[4].p_extendtype}" onerror="javascript:this.src='${pageContext.request.contextPath }/resources/images/noimage.png'"/>
	            		</div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[4]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
            </div>
            <div class="centerbtn"><a href="javascript:upLoadPhoto()">사진 수정</a></div>
        </form><!--centermenu-->
        <div class="rightmenu">
        	<div class="keyname">키워드 정보</div>
            <div class="list">
            <c:forEach var="keyword" items="${myInfo.myKeywords }">
            	<div class="sublist">
                	<div class="left"><span>&nbsp;</span></div>
                    <div class="right"><input type="text" value="${keyword.keyword }" readonly="readonly" style="text-align: center"></div>
                </div>
                </c:forEach>
            </div>
            <div class="listbtn">
            	<div class="leftbtn"><a href="#">교체</a></div>
                <div class="rightbtn"><a href="#">충전</a></div>
            </div>
            <div class="point">
           		 <div class="left">보유 포인트</div>
                 <div class="right"><input type="text"></div>
            </div>
        </div><!--rightmenu-->
  	</div><!--main끝-->
    
    <!-- <div id="footer">
        <div class="bgre" style="background-color:#666; position:relative; top:200px;
        background-repeat:repeat-x; width:100%; height:66px; z-index:-1"></div>
        	<div class="footertitle">광고·제휴 문의    /   이용약관   /   개인정보취급방침   /   고객센터<br>
				사업자등록번호100-00-00000    /    통신판매신고 제 0000 - 성남 판교 - 0000호<br>
				경기도 성남시 판교 판교     /    고객센터 help@puzzle.com 1500-0000    /   (주)신석기 대표이사 신석기</div>
            <div class="name">신석기</div>
    </div> -->
    <!--footer끝-->
</div><!--wrap끝-->

</center>
</body>
</html>