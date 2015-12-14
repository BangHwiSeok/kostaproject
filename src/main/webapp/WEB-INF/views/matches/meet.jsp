<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recommend Matching</title>
<link href="${pageContext.request.contextPath }/resources/css/meet.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	    
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src=" ${pageContext.request.contextPath}/resources/js/jquery.wheelmenu.js"></script>

<script>
 $(function(){
	 $('[data-toggle="ajaxModal"]').on('click',
             function(e) {
               $('#myModal').remove();
               e.preventDefault();
               var $this = $(this)
                 , $remote = $this.data('remote') || $this.attr('href')
                 , $modal = $('<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"><div class="modal-body"></div></div>');
               $('body').append($modal);
               $modal.modal({backdrop: 'static',keyboard: true});
               $modal.load($remote);
             }
           );
	
 	/* $("a[data-target=#myModal]").click(function(ev) {
	    ev.preventDefault();
	    var target = $(this).attr("href");
	
	    console.log(target);
	    // load the url and show modal on success
	    $(".modal-body").load(target, function() { 
	    	console.log(target);
	         $("#myModal").modal("show"); 
	    });
	});	  */
	
	// Modal이 close 되었을 때, 기존에 있는 modal 내용을 지운다.
 /* 	  $('#myModal').on('hidden.bs.modal', function() {
	    $(this).removeData('bs.modal');
	});   */
}); 
 
function showUserInfo(userNum){
	alert(userNum);
	/* $.ajax({
		url: '${pageContext.request.contextPath}'
		
		
	}); */
}
</script>
</head>
<body>
	<center>
		<div id="wrap">
			<div id="container">
				<div class="title">
					너와 나의 <span>매칭</span>
				</div>
				<div class="subtitle">매칭 내역을 확인해볼 수 있습니다</div>
				<div class="main">
					<div class="line"></div>
					
					
					<div class="image">
						<%-- <c:forEach var="user" items="${users }">
							<p>${user.key }---${user.value }</p>
							<c:forEach var="profile" items="${user.value }">
								<img
									src="${pageContext.request.contextPath }/resources/${profile.u_num}/${profile.u_num}${profile.p_photonum}${profile.p_extendtype}" />
							</c:forEach>
						</c:forEach> --%>
						<c:forEach var="user" items="${users }">
						<div class="img1">
							<div class="inimg">
							<a href="${pageContext.request.contextPath }/members/${user.value[0].u_num}/info" data-toggle="ajaxModal" class="myimage" data-target="#myModal">
								<img src="${pageContext.request.contextPath }/resources/${user.value[0].u_num}/${user.value[0].u_num}${user.value[0].p_photonum}${user.value[0].p_extendtype}"/>
							</a>
							<%-- <input type="image" class="myimage" onclick="showUserInfo('${user.value[0].u_num}')"
									src="${pageContext.request.contextPath }/resources/${user.value[0].u_num}/${user.value[0].u_num}${user.value[0].p_photonum}${user.value[0].p_extendtype}" /> --%>
							</div>
							<div class="btn1">
								<div class="btn1left"></div>
								<div class="btn1right"></div>
							</div>
						</div>
						</c:forEach>

						

						<div class="underline"></div>
						<%-- <a data-toggle="modal" class="btn btn-info" href="${pageContext.request.contextPath }" data-target="#myModal">Click me !</a> --%>
						 <!-- <a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a> -->

					<!-- Modal -->
					<div class="modal fade " id="myModal" tabindex="-1" role="dialog" >
					    
					    <!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
					
					
					</div>
				</div>
				<div class="subbtn"></div>
			</div>
		</div>
	</center>
<%-- <c:forEach var="user" items="${users }">
<p>${user.key }---${user.value }</p>
	<c:forEach var="profile" items="${user.value }">
		<img src="${pageContext.request.contextPath }/resources/${profile.u_num}/${profile.u_num}${profile.p_photonum}${profile.p_extendtype}" />
	</c:forEach>
</c:forEach> --%>
	<%-- <img src="${pageContext.request.contextPath }/resources/${profiles[0].u_num}/${profiles[0].u_num}${profiles[0].p_photonum}${profiles[0].p_extendtype}" />
<c:forEach var="profile" items="${profiles }">
	<img src="${pageContext.request.contextPath }/resources/${profile.u_num}/${profile.u_num}${profile.p_photonum}${profile.p_extendtype}" />
</c:forEach> --%>
</body>
</html>