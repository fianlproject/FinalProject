<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">

<!-- DatePicker(jQuery UI) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="../css/table.css">

<link href="css/7911bc0a5c62.css" rel="stylesheet">
<link href="css/7e63fa136b7d.css" rel="stylesheet">
<link href="css/facebook.css" rel="stylesheet">
<link href="css/floating.css" rel="stylesheet">
<link href="css/layout_nav.css" rel="stylesheet">
<link href="css/map.css" rel="stylesheet">
<!-- FullCalendar(jQuery API) -->
<script>
	// FullCalnedar
	$(document).ready(function() {
		$( ".datepicker" ).datepicker({
			dateFormat: 'yy-mm-dd' 
		});
	});
	function popclose(){
		self.close();
	}
</script>
<style type="text/css">

</style>
<title>일정</title>
</head>
<body>
<%System.out.println("6");%>
	<div id="wrap">
		<div class="cal_input_table">
			<form action="./CalendarAdd.cl" method="post">
			<input type="hidden" name="id" value="${id}" />			
				<table class="table">
				
					<tr><td colspan="2">일정 추가</td></tr>				
					<tr><td>일정</td><td><input type="text" name="title"></td></tr>
					<tr><td>날짜</td><td><input type="text" class="datepicker" name="date"></td></tr>
					<tr><td colspan="2"><input type="submit" value="추가" onclick="popclose()"></td></tr>
				</table>
			</form>
			<form action="./CalendarDel.cl" method="post">
				<table border="1">
					<tr><td colspan="2">일정 삭제</td></tr>
					<tr><td>날짜</td><td><input type="text" class="datepicker" name="date"></td></tr>
					<tr><td colspan="2"><input type="submit" value="삭제"  onclick="popclose()"></td></tr>
				</table>
			</form>
		</div>	
	</div>
</body>
</html>