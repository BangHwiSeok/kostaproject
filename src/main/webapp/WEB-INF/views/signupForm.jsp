<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring"
	uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="tag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/css/base.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/registermain.css" rel="stylesheet" type="text/css" />
<link	href="${pageContext.request.contextPath }/resources/bootstrap/css/jasny-bootstrap.min.css" rel="stylesheet">
<link	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/bootstrap/js/jasny-bootstrap.min.js"></script>
<script>
	$('.fileinput').fileinput('clear');
	
	function valide(){
		/* var isValid = true;
		console.log($('#personalAgree').prop('checked'));
		if(!$('#personalAgree').prop('checked')){
			alert('personalAgree');
			isValid= false;
		}
		if(!$('#agree').prop('checked')){
			isValid= false;
		}
		
		if(isValid){ */
			document.forms[0].submit();
		//}
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
	            	<li><a href="#">매칭</a></li>
	                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
	                <li><a href="#">히스토리</a></li>
	                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
	                <li><a href="#">아이템</a></a></li>
	                 <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
	                <li><a href="#">키워드 평가</a></li>
	                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
	                <li><a href="#">관리자 문의</a></li>
	            </ul>
	          <div class="mypage"><a href="#"><img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
	          <div class="logout"><a href="#"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
	    	</div>
	    </div>
		
		<!--main부문-->
    	<div class="mainimg" style=" background-color:#f0f0f0; background-repeat:repeat-x;"><img src=" ${pageContext.request.contextPath}/resources/images/signup_00.jpg" alt="메인사진"></div>
		
		<spring:form commandName="userForm" class="main" method="POST"
			enctype="multipart/form-data">
			<div class="centermenu">
	        	<div class="proname">프로필 사진<span>[메인사진 2장은 필수로 등록되어있어야 합니다.(5MB 제한)]</span></div>
	            <div class="promainimg">
	           
	            	<div class="img1 fileinput fileinput-new" data-provides="fileinput" >
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:200px; height:150px;"></div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[0]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
	               <div class="img2 fileinput fileinput-new" data-provides="fileinput" >
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:200px; height:150px;"></div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[1]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
	            </div>
	            <div class="submain">
	            	<div class="subimg1 fileinput fileinput-new" data-provides="fileinput">
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:132px; height:132px;"></div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[2]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
	                <div class="subimg2 fileinput fileinput-new" data-provides="fileinput">
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:132px; height:132px;"></div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[3]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
	                <div class="subimg3 fileinput fileinput-new" data-provides="fileinput">
	            		<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width:132px; height:132px;"></div>
	            			<span class="btn btn-default btn-file"><span
									class="fileinput-new">Select image</span><span
									class="fileinput-exists">Change</span><input type="file"
									name="photoes[4]"></span> <a href="#"
									class="btn btn-default fileinput-exists"
									data-dismiss="fileinput">Remove</a>
	            	</div>
	            </div>
	        </div><!--centermenu-->
	        
			 <div class="rightmenu">
				<div class="keyname">기본 정보</div>
				<div class="list">
					<div class="sublist1">
						<div class="left"> 아이디 </div>
						<spring:input
								path="u_id"  type="email" alt="아이디" placeholder="아이디 입력"
								style="width:298px; height:30px; background-color:#666; color:#FFF; text-align:right;" /> <font
							color="red"><spring:errors path="u_id" /></font>
					</div>
					<div class="sublist1">
					<div class="left"> 비밀번호 : </div> 
						<spring:input
							path="u_pwd"  class="right"  type="password" alt="비밀번호" placeholder="비밀번호 입력"
							style="width:298px; height:30px; background-color:#666; color:#FFF; text-align:right;" /> <font
						color="red"><spring:errors path="u_pwd" /></font>
					</div>
					<div class="sublist1">
					<div class="left">비밀번호 확인</div><spring:input class="right"
							path="u_repwd" type="password" alt="비밀번호 확인"
							placeholder="비밀번호 확인"
							style="width:298px; height:30px; background-color:#666; color:#FFF; text-align:right;" /> <font
						color="red"><spring:errors path="u_repwd" cssClass="error" /></font>
					</div>
					
					<div class="sublist1">
					<div class="left" >전화번호</div><spring:input
							path="u_pnum" alt="전화번호" placeholder="전화번호 입력"
							style="width:298px; height:30px; background-color:#666; color:#FFF; text-align:right;" /> <font
						color="red"><spring:errors path="u_pnum" cssClass="error" /></font>
					</div>
					<div class="sublist1"><div class="left"> 성별 </div> <spring:radiobutton
							path="u_gender"  value="남" />남 <spring:radiobutton
							path="u_gender" value="여" />여
					</div>
					<div class="sublist1"><div class="left"> 생년월일</div> <spring:input class="right"
							path="u_birth" type="date"
							 style="width:298px; height:30px; background-color:#666; color:#FFF; text-align:right;" /> <font
						color="red"><spring:errors path="photoes" /></font>
					</div>
					 
				</div>
				<!-- <div class="text">
           		 <div class="title">개인정보 수집 및 이용안내</div>
                 <div class="subtitle">퍼즐에서 위와 같이 수집하는 개인정보에 대해 동의하지 않거나,<br>개인정보를 기재하지 않음으로써 거부할 수 있습니다.<br>다만, 이러한 경우 회원에게 제공되는 서비스가 제한될 수 있습니다</div>
                 <div class="agree"><input id='agree' type="checkbox">&nbsp;<span>이용약관</span>에 동의합니다.</div>
                 <div class="subagree"><input id='personalAgree' type="checkbox">&nbsp;<span>개인정보 취급방침</span>&nbsp;및 개인정보 수집 및 이용안내에 동의합니다.</div>
            </div> -->
			</div>
			

		</spring:form>
		
		<div class="okbtn"><a href="javascript:valide();">가입 신청</a></div>
		
		 <div id="footer">
	     	<div class="bgre" style="background-color:#666; position:relative; top:100px;
	        background-repeat:repeat-x; width:100%; height:66px; z-index:-1"></div>
	        	<div class="footertitle">광고·제휴 문의    /   이용약관   /   개인정보취급방침   /   고객센터<br>
					사업자등록번호100-00-00000    /    통신판매신고 제 0000 - 성남 판교 - 0000호<br>
					경기도 성남시 판교 판교     /    고객센터 help@puzzle.com 1500-0000    /   (주)신석기 대표이사 신석기</div>
	        <div class="name">신석기</div>
       	 </div>
    </div>
</center>
</body>
</html>