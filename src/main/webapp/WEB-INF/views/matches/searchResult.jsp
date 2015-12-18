<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>검색 매칭</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href=" ${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href=" ${pageContext.request.contextPath}/resources/css/searchmatchmain.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src=" ${pageContext.request.contextPath}/resources/js/jquery-1.10.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
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

$(function(){//실행틀 시작
	$('.cf').bxSlider({
		  mode: 'fade',
		  captions: true,
		  pager : false
		});
		
	$('.myinfomation').click(function(e){
         var url = $(this).val()||$(this).attr('value');
         alert(url);
         $('#modalInfo').load(url,function(result){
        	 $('#modalInfo').modal({show:true});
         }); 
	});
	
     
})//실행틀 끝


</script>
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
                <li><a href="${pageContext.request.contextPath}/evaluates">키워드 평가</a></li>
                <li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
                <li><a href="#">관리자 문의</a></li>
            </ul>
          <div class="mypage"><a href="${pageContext.request.contextPath}/members/<sec:authentication property='principal.userNum' />"><img src=" ${pageContext.request.contextPath}/resources/images/mypage.png" alt="마이페이지"></a></div>
          <div class="logout"><a href="${pageContext.request.contextPath}/logout"><img src=" ${pageContext.request.contextPath}/resources/images/logout.png" alt="로그아웃"></a></div>
    	</div>
    </div>
    
    <!--main부문-->
		<div id="container">            
            <div class="title">
                <div class="center"><img src=" ${pageContext.request.contextPath}/resources/images/search_matching_00.jpg" alt="메인 사진"></div>
            </div>
            <div class="subtitle">
            	<div class="left"><i>3&nbsp;<span>in</span>&nbsp;1</i><span class="lefttext">&nbsp;/</span></div>
                <div>
                	<div class="list">
                	<c:forEach var="key" items="${keywords }">
                		<input type="text" value="${key }" />
                	</c:forEach>
                	</div>
                    <div class="text">아래의 이성중 한명만 골라주세요 <span>[클릭하시면 자세한 정보를 확인할 수 있습니다]</span></div>
                </div>
            </div>
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
                                    <%-- <li class="img1"><input class='myinfomation' type='image' src=" ${pageContext.request.contextPath}/resources/images/wo1.jpg" style="width:300px; height:300px;" value='${pageContext.request.contextPath }/members/${p.u_num}/info' /></li>
                                    <li class="img2"><input type='image' src=" ${pageContext.request.contextPath}/resources/images/wo2.jpg" style="width:300px; height:300px;"/></li>
                                    <li class="img3"><input type='image' src=" ${pageContext.request.contextPath}/resources/images/wo3.jpg" style="width:300px; height:300px;"/></li> --%>
                                </ul>
                            </div>
                            </div>
                        </div>
                    </div><!--list1-->
                    </c:forEach>
                   
              </div>  <!--image-->
                <div class="underimg"><img src=" ${pageContext.request.contextPath}/resources/images/search_matching_02.jpg" usemap="#Map" border="0">
                  <map name="Map">
                    <area shape="rect" coords="930,35,1094,60" href="#">
                  </map>
                </div>
            </div><!--main-->
           </div>
           
            <!-- Modal -->
			 <div id="modalInfo" class="modal  fade" tabindex="-1" role="dialog">
				
			</div>
           
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
        </div>
        <!-- Modal -->
					 <div id="modalInfo" class="modal  fade" tabindex="-1" role="dialog">
						
					</div>
</center>
</body>
</html>