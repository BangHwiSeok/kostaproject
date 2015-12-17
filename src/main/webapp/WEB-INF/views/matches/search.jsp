<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Matching</title>
<link href="${pageContext.request.contextPath }/resources/css/typehead.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/searchmain.css" rel="stylesheet" type="text/css" />
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
<script
	src="${pageContext.request.contextPath }/resources/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/typeahead.bundle.js"></script>
<script src="http://twitter.github.io/typeahead.js/js/handlebars.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/typeahead.custom.search.js"></script>
<script>
	$(document)
			.ready(
					function() {
						MM_preloadImages('${pageContext.request.contextPath}/resources/images/menuover_03.png','${pageContext.request.contextPath}/resources/images/menuover_05.png','${pageContext.request.contextPath}/resources/images/itemover_05.png','${pageContext.request.contextPath}/resources/images/menuover_07.png','${pageContext.request.contextPath}/resources/images/menuover_09.png')
						search('.typeahead','${pageContext.request.contextPath }/keywords/find/', '#num','#addTaget');
					}); 
</script>
</head>
<body >
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
            	<li><a href="#">매칭</a></li>
                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                <li><a href="#">히스토리</a></li>
                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                <li><a href="#">아이템</a></li>
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
    <div id="container">
		<div class="title"><img src=" ${pageContext.request.contextPath}/resources/images/search_03.png" alt="헤더 글"></div>
        <div class="search" style="background-image:url( ${pageContext.request.contextPath}/resources/images/search_00.png); 
        	background-repeat:no-repeat; width:590px; height:148px; margin-top:20px;">
       	    <span class="searchkey"><input class="typeahead" type="text"></span>
        </div>
        <div class="pluse" style="background-image:url( ${pageContext.request.contextPath}/resources/images/search.png); background-repeat:no-repeat; height:120; width:691px;">
        	<div class="subsearch"><input type="image"  src= "${pageContext.request.contextPath}/resources/images/search_05.png" onclick="document.forms[0].submit()" /></div>
        	<form id='test'  method='POST'  class="text" style="margin-bottom: 4px;">
            	<div id='addTaget' class="subtext"></div>
        	</form>
       		<div class="subtitle"><img src=" ${pageContext.request.contextPath}/resources/images/search_02.png" alt="글"></div>
    	</div>
    </div>
    <!--main끝나는 부문-->
    
<!--footer-->
    <div class="bgre" style="background-color:#666; position:relative; top:86px; 
    background-repeat:repeat-x; width:100%; height:66px; z-index:-1"></div>
    <div id="footer">
        	<div class="footertitle">광고·제휴 문의    /   이용약관   /   개인정보취급방침   /   고객센터<br>
				사업자등록번호100-00-00000    /    통신판매신고 제 0000 - 성남 판교 - 0000호<br>
				경기도 성남시 판교 판교     /    고객센터 help@puzzle.com 1500-0000    /   (주)신석기 대표이사 신석기</div>
            <div class="name">신석기</div>
       	    </div>
    </div>
    <!--footer끝-->
        
	<!-- <div>
		<h3>키워드로 찾기</h3>
		<div>
			<input class="typeahead" type="text" />
		</div>
	</div>
	<input id='num' type='hidden' value=0 />
	<form id='test'  method='POST'>    </form>
	<button onclick="document.forms[0].submit()">전송</button> -->
	</div>
</center>
</body>
</html>