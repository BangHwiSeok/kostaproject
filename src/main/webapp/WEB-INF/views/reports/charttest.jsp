<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<style type="text/css">
/* 헤더 */
#header {
	position: relative;
	height: 66px;
}

#header .logo {
	position: relative;
	width: 160px;
	top: 35px;
	left: -320px;
}

#header .mypage {
	width: 80px;
	float: left;
	margin-right: 20px;
}

#header .logout {
	width: 80px;
	float: left;
}

.headerwidth {
	position: relative;
	top: -22px;
	width: 1024px;
}

#header ul {
	color: #fff;
	width: 450px;
	float: left;
	margin-top: 10px;
	margin-left: 300px;
}

#header ul li {
	float: left;
	margin-right: 5px;
	font-size: 15px;
}

#header ul li a {
	color: #FFF;
}

#header ul li a:hover {
	font-weight: bold;
}

body, div, p, ul, ol, li, dl, dt, dd, h1, h2, h3, h4, h5, h6, fieldset {
	padding: 0px;
	margin: 0px;
}

body {
	font-family: 'Malgun Gothic' 'Nanum Gothic', sans-serif;
	font-size: 12px;
	line-height: 1em;
	color: #181818
}
/*line-height속성 : 줄간격.
em단위=>상대값. 1.4em은 기본값의 1.4배 크기로 사용하겠다는 뜻.*/

/*a태그의 경우 상태에 따라 다른 스타일을 지정할수 있음.
a:link        => a태그의 기본 상태
a:hover       => a태그에 마우스 올렸을때의 상태
a:active      => a태그를 마우스로 누르고있는 동안의 상태
a:visited     => a태그의 경로를 사용해본적이 있을때의 상태 */
a {
	color: #181818;
	text-decoration: none;
}
/*text-decoration속성: 텍스트에 줄을 그어주는 속성
 text-decoration:overline      => 텍스트 탑에
 text-decoration:underline     => 텍스트 바텀에
 text-decoration:line-through  => 텍스트 가운데
*/
img {
	border: 0px;
	vertical-align: top;
}

select, option, input {
	vertical-align: top;
}

fieldset {
	border: none;
}

legend {
	display: none;
}

ul, ol {
	list-style: none;
}
/*ul, il{} => ul태그와 ol태그에 동일한 속성을 사용하겠다는 뜻.*/
.cf {
	
} /*float송성을 가진 태그를 감싸는 엄마태그에게 무조건 cf클래스를 추가해놓음.*/
.cf:after {
	clear: both;
	content: "";
	display: block;
}
</style>

<script type="text/javascript">
	//차트 연습 (반 파이 차트)
	$(function() {
		$('#container').highcharts(
				{
					chart : {
						plotBackgroundColor : null,
						plotBorderWidth : 0,
						plotShadow : false
					},
					title : {
						text : '나의<br><b>키워드</b>',
						align : 'center',
						verticalAlign : 'middle',
						y : 80
					},
					tooltip: {
		                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		            },
					plotOptions : {
						pie : {
							dataLabels : {
								enabled : true,
								distance : 30,
								style : {
									//fontWeight : 'bold',
									color : 'black',
								//textShadow: '0px 1px 2px black'
									
								}
							},
							showInLegend: true,
							startAngle : -90,
							endAngle : 90,
							center : [ '50%', '85%' ]
						}
					},
					series : [ {
						type : 'pie',
						name : '나의키워드',
						innerSize : '50%',
						data : [ [ '맑은눈', 10 ], [ '깊은눈', 8 ],
								[ '진돗개', 3 ], [ '개구리', 2 ],
								[ '아그리파', 1 ], [ '감자', 1 ],
								[ '선생님', 1 ],[ '삼촌', 1 ],
								[ '푸근', 1 ],[ '선함', 1 ],
								[ '시바견', 1 ],[ '오크', 1 ],
								
								]
					} ]
				});
	});

	$(function() {
		// Build the chart
		$('#container2').highcharts({
			chart : {
				plotBackgroundColor : null,
				plotBorderWidth : null,
				plotShadow : false,
				type : 'pie'
			},
			title : {
				text : '퍼즐 회원 남녀비율'
			},
			tooltip : {
				pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
			},
			plotOptions : {
				pie : {
					allowPointSelect : true,
					cursor : 'pointer',
					dataLabels : {
						distance : -60,
						enabled : true,
						style : {
							fontSize : 18,
							fontWeight : 'bold',
							color : 'white',
							textShadow : false
						}
					},
				//showInLegend: true
				}
			},
			series : [ {
				name : '남/녀',
				colorByPoint : true,
				data : [ {
					name : '남',
					y : parseInt('${malesCount}'),
					color : 'skyblue',
					sliced : true,
					selected : true
				}, {
					name : '녀',
					y : parseInt('${femalesCount}'),
					color : 'pink'
				//sliced: true
				//selected: true
				} ]
			} ]
		});
	});
	
	
</script>

</head>
<body>
<center>
	<!--헤더-->
	<div id="header"
		style="background-color: #ff524f;; background-repeat: repeat-x;">
		<div class="headerwidth">
			<div class="logo">
				<a href="${pageContext.request.contextPath }"><img
					src="images/logo.png" alt="로고"></a>
			</div>
			<ul>
				<li><a href="#">매칭</a></li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">히스토리</a></li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">아이템</a></a></li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">키워드 평가</a></li>
				<li>&nbsp;&nbsp;|&nbsp;&nbsp;</li>
				<li><a href="#">관리자 문의</a></li>
			</ul>
			<div class="mypage">
				<a href="#"><img src="images/mypage.png" alt="마이페이지"></a>
			</div>
			<div class="logout">
				<a href="#"><img src="images/logout.png" alt="로그아웃"></a>
			</div>
		</div>
	</div>
	<!--main부문-->
	<div>
		<div id="container" style="min-width: 400px; max-width:600px; height: 400px; margin: 0;"></div>
		<div id="container2" style="min-width: 400px; max-width:600px; height: 400px; margin: 0;"></div>
	</div>
</center>
</body>
</html>