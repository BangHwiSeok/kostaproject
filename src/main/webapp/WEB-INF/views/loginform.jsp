<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="wrap">
    	<div id="main">
        	<div class="bg">
            <img src="${pageContext.request.contextPath}/resources/images/page_design_bg.jpg" alt="배경화면">
            <div class="logo2"><img src="${pageContext.request.contextPath}/resources/images/login_div_00.png" alt="로그인 배경"></div>
            </div><!---->
         
          <div class="logo"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고"></a></div>
            <div class="reg"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/login_div_04.png" alt="reg"></a></div>
            <div class="login"><img src="${pageContext.request.contextPath}/resources/images/login_div_05.png" alt="login"></div>
         
          <div class="container">
				<div class="u_id">
					<input type="text" alt="아이디" placeholder="아이디 입력"
						style="width: 250px; height: 25px; border-radius: 20px; text-align: center;">
				</div>
				<div class="u_pwd">
                    <input type="password" alt="비밀번호" placeholder="비밀번호 입력" style="width:250px; height:25px; 
                    border-radius:20px; text-align:center;">
            </div>
          
            <ul class="cf">
            	<li class="btn1"><a href="findidpwd.jsp"><img src="${pageContext.request.contextPath}/resources/images/login_div_01.png" alt="아이디 찾기"></a></li>
                <li class="btn2"><a href="findidpwd.jsp"><img src="${pageContext.request.contextPath}/resources/images/login_div_02.png" alt="비밀번호 찾기"></a></li>
            </ul>
            <div class="writ">
            <span>PUZZLE</span>&nbsp;의 모든 서비스는 회원가입을 거친 후에 이용하실 수 있습니다<br>
            <h4>나만의 이상형찾기, PUZZLE로 어서 놀러오세요</h4></div>
        </div><!--main-->
    </div><!--wrap-->
</body>
</html>