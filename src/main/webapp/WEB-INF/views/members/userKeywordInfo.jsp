<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/style.css" />
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/jquery.wheelmenu.js"></script>
				<div class="container" style="margin-top:100px; margin-left:0px;">
					<!-- Top Navi -->
					<script type="text/javascript">
				    	$(".wheel-button").wheelmenu({
				      	trigger: "hover",
				      	animation: "fly",
				      	animationSpeed: "fast"
				    	});
				    	function popup(){
				    		var target = '${userInfo.user.u_num}';
				    		window.open("${pageContext.request.contextPath}/reports?u_num="+target, "_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500, width=400, height=400");
				    	}
				    	function saveHistory(u_num){
				    		alert(u_num);
				    		$.ajax({
				    			url: '${pageContext.request.contextPath}/histories/create/'+u_num,
				    			method:'POST',
				    			success:function(data){
				    				alert('OK');
				    			}
				    			
				    		});
				    	}
				  	</script>
			
					<div class="main">
					  <a href="#wheel" class="wheel-button" style="top: -45px;">
		              <div class="mainimg"><img src=" ${pageContext.request.contextPath }/resources/${userInfo.profiles[0].u_num}/${userInfo.profiles[0].u_num}${userInfo.profiles[0].p_photonum}${userInfo.profiles[0].p_extendtype}" style="width:270px; height:270px;">
		              </div>
					  </a>
					  <div class="pointer">+</div>
				      <ul id="wheel">
				      	<c:forEach var="key" items="${userInfo.myKeywords }">
				        <li class="item"><a href="#home">${key.keyword}</a></li>
				        </c:forEach>
			      </ul>
			    </div>
				</div><!-- Container -->
			<div class="modal-footer row ">
			<div class="col-md-offset-4 col-md-4 text-center">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-warning" onclick="popup()">신고하기</button>
				<button type="button" class="btn btn-primary" onclick="saveHistory('${userInfo.user.u_num}')">History로 이동</button>
				</div>
			</div>
		
