<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>아이디 찾기</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/idmain.css" rel="stylesheet" type="text/css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  






</head>
<body>
<center>
	<div id="wrap" style="background-image:url(${pageContext.request.contextPath}/resources/images/idbg.jpg); background-size:cover;">
          
          <div class="logo"><a href="main.jsp"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="로고"></a></div>
          <div class="reg"><a href=" ${pageContext.request.contextPath}/signup"><img src="images/login_div_04.png" alt="reg"></a></div>
          <div class="login">ID 찾기</div>
         
          <div class="container">
                    <form class="u_id">
                    <input type="text" name="u_pnum" alt="아이디" placeholder="휴대폰번호 입력" style="width:200px; height:45px; 
                    border-radius:20px; text-align:center;">
            		<%-- <div class="loginok"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/loginclick.png" alt="로그인 클릭"></a></div> --%>
          			<div class="loginok"><input type="image" src="${pageContext.request.contextPath}/resources/images/loginclick.png" alt="로그인 클릭"></div>
          </form>
            <ul class="cf">
            	<li class="btn1"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/login_div_01.png" alt="아이디 찾기"></a></li>
                <li class="btn2"><a href="#"><img src="${pageContext.request.contextPath}/resources/images/login_div_02.png" alt="비밀번호 찾기"></a></li>
            </ul>
            <div class="writ">
            <span>PUZZLE</span>&nbsp;의 모든 서비스는 회원가입을 거친 후에 이용하실 수 있습니다<br>
            <h4>나만의 이상형찾기, PUZZLE로 어서 놀러오세요</h4></div>
            </div>
            <div class="logo2"><img src="${pageContext.request.contextPath}/resources/images/login_div_00.png" alt="로그인 배경"></div>
         	
    </div><!--wrap-->
    </center>
   
</body>
</html>