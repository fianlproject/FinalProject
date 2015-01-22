<%@ page contentType="text/html; charset=utf-8"%>
<!-- DatePicker(jQuery UI) -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<!-- FullCalendar(jQuery API) -->
<link href='/pfinal/fullcalendar/fullcalendar.css' rel='stylesheet' />
<script src='/pfinal/fullcalendar/fullcalendar.js'></script>
<script>
	// FullCalnedar
	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			height: 400,
			editable: true,
			events: "json-events.jsp",
			eventDrop: function(event, delta) {
				alert(event.title + ' was moved ' + delta + ' days\n' +
					'(should probably update your database)');
					},
			loading: function(bool) {
				if (bool) $('#loading').show();
				else $('#loading').hide();
			}
			
		}).dblclick(function(){
			var popUrl = "/pfinal/schedule/calendaradd.jsp";	//팝업창에 출력될 페이지 URL
			var popOption = "width=350, height=500, resizable=no, scrollbars=no, status=no, top=250, left=900;";    //팝업창 옵션(optoin)
				window.open(popUrl,"",popOption);
		});
	// DatePicker
		$( ".datepicker" ).datepicker({
			dateFormat: 'yy-mm-dd' 
		});
	});
</script>
<style type="text/css">
#wrap{margin: 0 auto; padding: 20px;}
.calendar_body{width: 600px; float: left; margin-right: 20px;}

</style>
<body>
	<div id="wrap">
		<!-- FullCalendar body -->
		<div class="calendar_body">
			<div id="calendar"></div>
		</div>
	</div>
</body>
