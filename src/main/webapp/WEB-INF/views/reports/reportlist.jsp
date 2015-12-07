<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function getReport(rp_num) {
		window.open(rp_num+"/getReport", "_blank", 
				"toolbar=yes, scrollbars=yes, resizable=yes, top=center, left=center, width=400, height=400")
			}
	/* 
	function getReport(rp_num){
		alert("getReport : " + rp_num);
		//var params = $('#form').serialize();
		
			//url : "reports/"+rp_num+"/getReport",
			//type : "GET",
			data : {rp_num:rp_num},
			success : function(data) {
				//alert(data);
				getReports(); 
				//$('.approvalItem').html(data);
			},
			error:function(data){
				alert("fail");
			}
	
		};
	}
	
 */	

</script>
<body>
	<table>
	<tr>
		<td>확인여부</td>
		<td>내용</td>
		<td>발신인</td>
		<td>발신시간</td>
	</tr>
	<c:forEach items="${reportList}" var="List">
		<tr>
			<td>${List.rp_check }</td>
			<td><span onclick="getReport(${List.rp_num});">${List.rp_content }</span></td>
			<td>${List.rp_sendid }</td>
			<td>${List.rp_date }</td>
		</tr>
	</c:forEach>
	</table>
	<div>미체크${noCheckCount }/${allCount }</div>
</body>
