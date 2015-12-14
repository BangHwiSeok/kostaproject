<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
		<!-- Title 영역  -->
			<tiles:getAsString name="title"/>
	
</title>
		<!-- StyleSheet  Link 영역 -->
		<link href='<tiles:getAsString name="css"/>' type="text/css" rel="stylesheet" />
</head>
<body>
		<!-- Header 영역 -->
		<tiles:insertAttribute name="header" />
		<!-- Visual 영역 -->
		<tiles:insertAttribute name="visual" />
		<!-- Main   영역  -->
		<div id="main">
				<div class="top-wrapper clear">
					<!-- Content 영역 -->
					<tiles:insertAttribute name="content" />
					<!-- Aside(Navi) 영역 -->	
					<tiles:insertAttribute name="aside" />
		</div>	
				</div>		
					
			
		<!-- Footer 영역  -->
		<tiles:insertAttribute name="footer" />
</body>
</html>