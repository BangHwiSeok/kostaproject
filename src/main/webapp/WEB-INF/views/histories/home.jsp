<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>히스토리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/resources/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/historymain.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/jquery.bxslider.css" rel="stylesheet" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
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

/* function myInfo(){
	$('#myinfo').click(function(){
		console.log(this);
	})
} */

$(function(){//실행틀 시작
	$('.cf').bxSlider({
		  mode: 'fade',
		  captions: true,
		  pager : false
		});
	
     $('.myMessage').click(function (e) {
  	    e.preventDefault();
  	    var url =$(this).val()|| $(this).attr('href');
  	    
  	    $('#modalInfo').load(url);
  	  	$('#modalInfo').modal({show:true});
  	});       
	
	$('.myinfomation').click(function(e){
		/* console.log($(this).val());
		$('#info-body').load($(this).val())
		console.log($('#info-body'));
		$(this).show(true); */
		 /* $('#myinfo').remove();
         e.preventDefault();
          var $this = $(this)
           , $remote = $this.data('remote') || $this.attr('value')
           , $modal = $('<div class="modal fade" id="myinfo" tabindex="-1" role="modal" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-body"></div></div>');
         $('body').append($modal);
         $modal.modal({backdrop: 'static',keyboard: true});
         $modal.load($remote);  */
         var url = $(this).val()||$(this).attr('value');
         $('#modalInfo').load(url,function(result){
        	 $('#modalInfo').modal({show:true});
         }); 
         
	});
	
	$('.leftBtn').click(function(e){
		var pageNo = parseInt($('#pageNo').val());
		var total = parseInt($('#totalPage').val());
		if(pageNo > 1){
			$('#pageNo').val(pageNo-1);
			nextHistory(pageNo-1);
		}
	});
	$('.rightBtn').click(function(e){
		var pageNo = parseInt($('#pageNo').val());
		var total = parseInt($('#totalPage').val());
		if(pageNo < total){
			$('#pageNo').val(pageNo+1);
			nextHistory(pageNo+1);
		}
	});
	
	function nextHistory(pageNo){
		location.href="${pageContext.request.contextPath}/histories?pageNo="+pageNo;
	}
	
})//실행틀 끝


</script>
</head>
<body >
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
            <div class="title" style="margin-top: 25px;">너와 나의 <span>히스토리</span></div>
            <div class="subtitle" style="margin-top: 36px;">내가 성공한 매칭 내역을 확인해볼 수 있습니다<br>
            내가 히스토리에 남긴 이성은 7일간 기록되며, 쪽지는 하루동안만 가능합니다</div>
            <div class="bg" style="background-color:e6e6e6; background-repeat:repeat-x; height:300px;">
            <div class="main">
                <div class="image">
                <div class="leftbtn" style="margin-right: 9px;"><input type="image" class="leftBtn" src="${pageContext.request.contextPath}/resources/images/history_02.jpg" alt="left" id="Image1" onMouseOver="MM_swapImage('Image1','',' ${pageContext.request.contextPath}/resources/images/history_03.jpg',1)" onMouseOut="MM_swapImgRestore()"></div>
				<div id="target">
	                <c:forEach var="h" items="${histories }">
	               	<div class="list1"  style="margin-right: 8px;">
	                       <div class="img1">
	                           <div class="inimg1">
	                           <div class="userimg">
									<ul class="cf">
										<c:forEach var="p" items="${h.profiles}">
		                                    <li><input  type="image" class='myinfomation' src="${pageContext.request.contextPath}/resources/${p.u_num}/${p.u_num }${p.p_photonum}${p.p_extendtype}" style="width:300px; height:300px;" value='${pageContext.request.contextPath }/members/${p.u_num}/info' /></li>
	                                    </c:forEach>
	                                </ul>
	                           </div>
	                         </div>
	                       </div>
	                       <div class="btn1">
	                             <div class="btn1left">
	                              <a href='${pageContext.request.contextPath }/messages/${h.history.h_num }'   class='myMessage' >
	                              		${h.receivedNum }<br><span>받은쪽지</span>
	                              	</a>
								 </div>
	                             <div class="btn1center">
	                             		<a href='${pageContext.request.contextPath }/messages/${h.history.h_num }' >
	                             			${h.sendedNum }<br><span>보낸쪽지</span>
	                             		</a>
	                             </div>
	                             <div class="btn1right">
	                             		<a href='${pageContext.request.contextPath }/messages/${h.history.h_num }' data-toggle="modal" class="myimage" data-target="#myModal">
	                             			${h.unReadNum }<br><span>안 읽은 쪽지</span>
	                             		</a>
	                             	</div>
	                       </div>
	                       <div class="time1">
	                       	<img src=" ${pageContext.request.contextPath}/resources/images/history_01.png" alt="시간">
	                           <div class="timestart1">${h.history.h_regdate }</div>
	                       </div>
	                   </div><!--list1-->
	                   </c:forEach>
	                   <input type="hidden" id="totalPage" value="${totalPage }"/>
                    </div>
                   <input type="hidden" id="pageNo" value=1 />
                 <div class="rightbtn"><input type="image" class="rightBtn" src=" ${pageContext.request.contextPath}/resources/images/history_04.jpg" alt="right" id="Image2" onMouseOver="MM_swapImage('Image2','',' ${pageContext.request.contextPath}/resources/images/history_05.jpg',1)" onMouseOut="MM_swapImgRestore()"></div>
                </div>  <!--image-->
            </div><!--main-->
             <!--main끝나는 부문-->
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
</center>
</body>
</html>