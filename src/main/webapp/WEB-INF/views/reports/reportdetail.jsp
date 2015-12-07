<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>신고 상세보기</title>
<script type="text/javascript">
	
	
	function deleteReport(rp_num){
		alert("deleteReport");
		opener.location.href='${pageContext.request.contextPath}/reports/'+rp_num+'/deleteReport';
		window.close();
	}
	
	
	function checkReport(rp_num){
		alert("checkReport");
		opener.location.href='${pageContext.request.contextPath}/reports/'+rp_num+'/checkReport';
		window.close();
	}
	

</script>
</head>
<body>
	<table>
		<tr>
			<td>신고번호</td><td>${reportDetail.rp_num }</td>
			<td>신고자</td><td>${reportDetail.rp_sendid }</td>
			<td>신고할유저</td><td>${reportDetail.rp_id }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="5">${reportDetail.rp_content }</td>
		</tr>
		<tr>
			
			<c:if  test="${not empty reportDetail.rp_file}">
			<td>첨부파일</td>
				<td colspan="5"><img src="${pageContext.request.contextPath}/resources/${reportDetail.rp_file}"></img></td>
			</c:if>
		</tr>
	</table>
	<input type="button" onclick="checkReport(${reportDetail.rp_num});" value="확인" /> 
	<input type="button" onclick="deleteReport(${reportDetail.rp_num});" value="삭제" />
<%-- 	
	<input type="button" onclick="opener.location.href='${pageContext.request.contextPath}/reports/${reportDetail.rp_num}/checkReport'" value="확인" /> 
	<input type="button" onclick="opener.location.href='${pageContext.request.contextPath}/reports/${reportDetail.rp_num}/deleteReport'" value="삭제" />
 --%>
</body>
</html>