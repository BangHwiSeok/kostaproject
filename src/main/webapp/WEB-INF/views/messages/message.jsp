<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>header</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="${pageContext.request.contextPath}/resources/css/papermain.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/resources/jquery-1.11.3.min.js"></script>
<script>
function sendMessage(userNum){
	var responseData=$('#contents').val();
	//alert($('#contents').val());
	//var inputDiv = "<div class='my'> <div class='text'> "+ responseData +"</div>     <div class='read'>읽음  12/12/12</div>  </div>";
	//$('.moniter').append(inputDiv);
	//$('.moniter').scrollTop($('.moniter')[0].scrollHeight);
	$.ajax({
		url: '${pageContext.request.contextPath}/messages/'+userNum,
		data: {contents: $('#contents').val() },
		method: 'POST',
		success:function(data){
			if(data.callback){
				var msg = data.msg;
				var inputDiv = "<div class='my'> <div class='text'> "+ msg.contents +"</div> "+"<div class='read'>"+msg.isRead+" "+msg.regdate+"</div> </div>";
				$('.moniter').append(inputDiv);
				$('.moniter').scrollTop($('.moniter')[0].scrollHeight);	
			} 
			console.log(data);
			
		}
	});
	/* $('#contents').; */
}
</script>
</head>
<body>
<div id="messagewrap">
	<div class="taget">
    	<div class="userimg">
    	<!-- 상대방 이미지가 들어갈 곳 -->
       	   <img src=" ${pageContext.request.contextPath}/resources/${profiles[0].u_num}/${profiles[0].u_num}${profiles[0].p_photonum}${profiles[0].p_extendtype}" alt="이미지">
        </div>
        <div class="chat">
        	<div class="username">님 과의 쪽지</div>
            <div class="moniter">
	           	<c:forEach var="message" items="${messages }">
		            <c:if test="${you == message.sender }"> 
			            <div class="other" >
		                	<div class="text" style="background-color:#ffb432; width:380px; height:80px; border-radius:25px; margin-bottom:10px; text-align: left; left:-70px;">${message.contents }</div>
		                    <div class="read" style="color:#FFF">
		                     ${message.isRead } <span>&nbsp;&nbsp;</span>
		                      ${message.regdate} 
		                      </div>
		            	</div>
		            </c:if>
	            	<c:if test="${ my == message.sender }"> 
		            	<div class="my">
			            	<div class="text">${message.contents }</div>
			                <div class="read">
				                ${message.isRead } <span>&nbsp;&nbsp;</span>
				                ${message.regdate} 
			                </div>
			             </div>
	                </c:if>
                </c:forEach>
            </div>
            <div class="send">
            	<div class="text">
       	    	<span class="textwrite"><textarea id="contents" rows="30px" style="background-image:url( ${pageContext.request.contextPath}/resources/images/message_07.png)"></textarea></span>
             	</div>
              <div class="btn" style="float:left;"><input type="image" src=" ${pageContext.request.contextPath}/resources/images/message_06.png" alt="보내기" onclick="sendMessage('${you}')"/></div>
                 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         </div>
    </div>
    </div>
</div>
</body>
</html>