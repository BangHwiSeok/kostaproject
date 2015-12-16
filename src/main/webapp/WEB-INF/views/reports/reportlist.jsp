<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
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
 
// 차트 연습 (반 파이 차트)
$(function () {
    $('#container').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: '나의<br><b>키워드</b>',
            align: 'center',
            verticalAlign: 'middle',
            y: 80
        },
        /* tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        }, */
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: true,
                    distance: 30,
                    style: {
                        fontWeight: 'bold',
                        color: 'black',
                        //textShadow: '0px 1px 2px black'
                    }
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '85%']
            }
        },
        series: [{
            type: 'pie',
            name: '나의키워드',
            innerSize: '50%',
            data: [
                ['Firefox',   10],
                ['IE',       1],
                ['Chrome', 1],
                ['Safari',    1],
                ['Opera',     1],
                {
                    name: 'Unknown',
                    y: 1,
                    dataLabels: {
                        enabled: false
                    }
                }
            ]
        }]
    });
});

	$(function () {
        // Build the chart
        $('#container2').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: '퍼즐 회원 남녀비율'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                    		distance: -60,
                        enabled: true,
                        style: {
                        	fontSize: 18,
                          fontWeight: 'bold',
                          color: 'white',
                          textShadow: false
                      }
                    },
                    //showInLegend: true
                }
            },
            series: [{
                name: '남/녀',
                colorByPoint: true,
                data: [{
                    name: '남',
                    y: 245,
                    color: 'skyblue',
                    sliced: true,
                    selected: true
                }, 
                {   name: '녀',
                    y: 50,
                    color: 'pink'
                    //sliced: true
                    //selected: true
				}]
            }]
        });
	});


</script>
<style>
	#report_table{
		width:600px;
	}
</style>
<body>
	<div id="container" style="min-width: 400px; max-width:600px; height: 400px; margin: 0;"></div>
	<div id="container2" style="min-width: 400px; max-width:600px; height: 400px; margin: 0;"></div>
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
