<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>메인매칭</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href=" ${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href=" ${pageContext.request.contextPath}/resources/css/mainmatchingmain.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
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
          <div class="mypage"><a href="${pageContext.request.contextPath}/members/<sec:authentication property='principal.userNum' />"><img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
          <div class="logout"><a href="${pageContext.request.contextPath}/logout"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
    	</div>
    </div>
    
    <!--main부문-->
    	<div id="main" style="background-image:url( ${pageContext.request.contextPath}/resources/images/matching_bg.jpg); background-repeat:repeat-x;  height:534px;" onLoad="MM_preloadImages(' ${pageContext.request.contextPath}/resources/images/matching_01.png',' ${pageContext.request.contextPath}/resources/images/matching_03.png')">
        	<div class="title"><img src=" ${pageContext.request.contextPath}/resources/images/matching_04.png" alt="타이틀"></div>
        	<div class="match1"><a href="${pageContext.request.contextPath}/matches/meet"><img src=" ${pageContext.request.contextPath}/resources/images/matching_00.png" alt="맞춤" id="Image1" onMouseOver="MM_swapImage('Image1','',' ${pageContext.request.contextPath}/resources/images/matching_01.png',1)" onMouseOut="MM_swapImgRestore()"></a></div>
          <div class="match2"><a href="${pageContext.request.contextPath}/matches/search"><img src=" ${pageContext.request.contextPath}/resources/images/matching_02.png" alt="검색" id="Image2" onMouseOver="MM_swapImage('Image2','',' ${pageContext.request.contextPath}/resources/images/matching_03.png',1)" onMouseOut="MM_swapImgRestore()"></a></div>
            <span class="ty1"><img src=" ${pageContext.request.contextPath}/resources/images/ti1.png" alt="글1"></span>
            <span class="ty2"><img src=" ${pageContext.request.contextPath}/resources/images/ti2.png" alt="글2"></span>
        </div><!--main-->
        
         <!--footer-->
    <div class="bgre" style="background-color:#666; 
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