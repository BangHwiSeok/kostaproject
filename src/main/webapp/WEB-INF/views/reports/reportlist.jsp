<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	
	// 신고내역 상세보기
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
<style>
	#report_table{
		width:600px;
	}
</style>
<body>
	<table id="report_table">
		<tr>
			<td>신고번호</td>
			<td>확인여부</td>
			<td>내용</td>
			<td>발신인</td>
			<td>발신시간</td>
		</tr>
		<c:forEach items="${reportList}" var="List">
			<tr>
				<td>${List.rp_num }</td>
				<td>${List.rp_check }</td>
				<td><span onclick="getReport(${List.rp_num});">${List.rp_content }</span></td>
				<td>${List.rp_sendid }</td>
				<td>${List.rp_date }</td>
			</tr>
		</c:forEach>
	</table>
	<%-- <div class="pagingBar">
			<a href="javascript:goPage('1')" class="first">처음 페이지</a> 
			<a href="javascript:goPage(${pageNo})" class="prev">이전 페이지</a> 
			<span> <c:forEach var="i" begin="${pageNo}" end="${pageNo}" step="1">
					<c:choose>
						<c:when test="${i eq pageNo}">
							<a href="javascript:goPage(${i})" class="choice">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="javascript:goPage(${i})">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</span> <a href="javascript:getCheckReports()" class="next">다음 페이지</a> 
			<a href="javascript:goPage(${PageNo})" class="last">마지막 페이지</a>
		</div> --%>
	<div>미체크${noCheckCount }/${allCount }</div>

</body>
