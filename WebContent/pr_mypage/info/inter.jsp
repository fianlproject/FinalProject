<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>관심기술</title>
<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
<style type="text/css">
.btn-lg, .btn-group-lg > .btn {
padding: 7px 7px;
font-size: 15px;
line-height: 1.33;
border-radius: 5px;
}
</style>
</head>
<br />
<body class="project-list">
	<div id="wrap1">
		<div class="page">
			<div class="content">
				<div class="content-header">
					<h3 class="header-text">
						관심기술 <small class="small-text">관심기술 입니다.</small>
					</h3>
				</div>
				<div class="content-header">
					<form method="post" action="/pfinal/pfinal.do">
						<input type="hidden" name="command" value="inter" />

						<div class="form-group">
						<label class="control-label required" for="title"><span>*</span>Language</label>
							<input type="checkbox" name="inter" value="JAVA">JAVA
							<input type="checkbox" name="inter" value="C">C
							<input type="checkbox" name="inter" value="C++">C++
							<input type="checkbox" name="inter" value=C#>C#
							<input type="checkbox" name="inter" value="Objective-C">Objective-C<br/>
							<input type="checkbox" name="inter" value="MFC">MFC
							<input type="checkbox" name="inter" value="Python">Python
							<input type="checkbox" name="inter" value="Ruby">Ruby
							<input type="checkbox" name="inter" value="Groovy">Groovy
							<input type="checkbox" name="inter" value="Scala">Scala<br/>
							<input type="checkbox" name="inter" value="VB">VB
							<input type="checkbox" name="inter" value="Clojure">Clojure
						</div><hr/>
						<div class="form-group" style="float: inherit;">
						<label class="control-label required" for="title"><span>*</span>WEB</label>
							<input type="checkbox" name="inter" value="JSP">JSP
							<input type="checkbox" name="inter" value="JS">JS
							<input type="checkbox" name="inter" value="JQuery">JQuery
							<input type="checkbox" name="inter" value="angular.js">angular.js
							<input type="checkbox" name="inter" value="JSTL">JSTL<br/>
							<input type="checkbox" name="inter" value="JSON">JSON
							<input type="checkbox" name="inter" value="AJAX">AJAX
							<input type="checkbox" name="inter" value="SPRING">SPRING
							<input type="checkbox" name="inter" value="PHP">PHP
							<input type="checkbox" name="inter" value="ASP">ASP<br/>
							<input type="checkbox" name="inter" value="HTML5">HTML5
							<input type="checkbox" name="inter" value="Structs">Structs
							<input type="checkbox" name="inter" value="CSS">CSS
							<input type="checkbox" name="inter" value="MARIADB">MARIADB
							<input type="checkbox" name="inter" value="IBATIS">IBATIS<br/>
							<input type="checkbox" name="inter" value="MYBATS">MYBATS
							<input type="checkbox" name="inter" value="node.js">node.js
							<input type="checkbox" name="inter" value="Vert.x">Vert.x
							<input type="checkbox" name="inter" value="apache">apache
							<input type="checkbox" name="inter" value="tomcat">tomcat
						</div><hr/>
						<div class="form-group" style="float: inherit;">
						<label class="control-label required" for="title"><span>*</span>APP</label>
							<input type="checkbox" name="inter" value="Android">Android
							<input type="checkbox" name="inter" value="iOS">iOS	
						</div><hr/>
						<div class="form-group" style="float: inherit;">
						<label class="control-label required" for="title"><span>*</span>GRAPHIC</label>
							<input type="checkbox" name="inter" value="Photoshop">Photoshop
							<input type="checkbox" name="inter" value="ILLUST">ILLUST	
						</div><hr/>
						<div class="form-group" style="float: inherit;">
						<label class="control-label required" for="title"><span>*</span>DATABASE</label>
							<input type="checkbox" name="inter" value="ORACLE">ORACLE
							<input type="checkbox" name="inter" value="MYSQL">MYSQL	
							<input type="checkbox" name="inter" value="MSSQL">MSSQL	
							<input type="checkbox" name="inter" value="DB2">DB2	
							<input type="checkbox" name="inter" value="TSQL">TSQL	
						</div><hr/> 
						<div class="form-group" style="float: inherit;">
						<label class="control-label required" for="title"><span>*</span>OS</label>
							<input type="checkbox" name="inter" value="Windows">Windows
							<input type="checkbox" name="inter" value="Linux">Linux
							<input type="checkbox" name="inter" value="Unix">Unix									
						<hr/>
						<div class="form-group">
							<input type="submit" value="전송" class="btn btn-lg btn-client js-disable-on-click btn-submit">
					
						<a href="/pfinal/pfinal.do?command=free_index"
							class="btn btn-lg btn-default js-disable-on-click">홈으로</a>
					</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

