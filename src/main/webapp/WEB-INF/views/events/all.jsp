<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>Calendar</title>
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link href="${resourceUrl}/css/custom.css" rel="stylesheet" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link href="${resourceUrl}/vendors/fullcalendar/fullcalendar.css"
	rel="stylesheet" media="screen">
<link href="${resourceUrl}/css/styles.css" rel="stylesheet"
	media="screen">
<script
	src="${resourceUrl}/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body class="header">
	<jsp:include page="../includes/header.jsp" />
	<c:if test="${message != null}">
		<div class="alert alert-danger" id="message">
			<c:out value="${message}" />
		</div>
	</c:if>
	
	<div class="container-fluid">
		<div class="row-fluid">
			<!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
					<!-- block -->
					<div class="block">
						<div class="navbar navbar-inner block-header">
							<div class="pull-right"></div>
						</div>
						<div class="block-content collapse in">
							<div class="span10">
								<div id='calendar'></div>
							</div>
						</div>
					</div>
					<!-- /block -->
				</div>
			</div>
		</div>
		<jsp:include page="../includes/footer.jsp" />
	</div>
	<style>
#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

.external-event { /* try to mimick the look of a real event */
	margin: 10px 0;
	padding: 2px 4px;
	background: #3366CC;
	color: #fff;
	font-size: .85em;
	cursor: pointer;
	z-index: 99999999;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}
</style>
	<!--/.fluid-container-->
	<c:url var="resourceUrl" value="/resources" />
	<script src="${resourceUrl}/vendors/jquery-1.9.1.min.js"></script>
	<script src="${resourceUrl}/vendors/jquery-ui-1.10.3.js"></script>
	<script src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
	<script src="${resourceUrl}/vendors/fullcalendar/fullcalendar.js"></script>
	<script src="${resourceUrl}/vendors/fullcalendar/gcal.js"></script>
	<script src="${resourceUrl}/javascript/scripts.js"></script>
	<script>
		$(function() {
			// Easy pie charts
			var calendar = $('#calendar')
					.fullCalendar(
							{
								header : {
									left : 'prev,next',
									center : 'title',
									right : 'month,basicWeek,basicDay'
								},
								selectable : true,
								selectHelper : true,
								select : function(start, end, allDay) {
									var title = prompt('Event Title:');
									if (title) {
										calendar.fullCalendar('renderEvent', {
											title : title,
											start : start,
											end : end,
											allDay : allDay
										}, true // make the event "stick"
										);
									}
									calendar.fullCalendar('unselect');
								},
								
								editable : true,
								// US Holidays
								events : 'http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic'

							});
		});
		$('#external-events div.external-event').each(function() {

			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title : $.trim($(this).text())
			// use the element's text as the event title
			};

			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex : 999999999,
				revert : true, // will cause the event to go back to its
				revertDuration : 0
			//  original position after the drag
			});

		});
		<?php 
				session_start();
				if(isset($_SESSION['sess_user_id']))
				{
				        require "connection.php";
				        $sess = $_SESSION['sess_user_id'];
				        $result = $dbh->prepare("SELECT * FROM event WHERE euser_id = :sess");
				        $result->bindParam(':sess', $sess);
				        $result->execute();
				        $event_array = array();
				        $result->setFetchMode(PDO::FETCH_ASSOC);
				        while ($record = $result->fetch()) {
				            $event_array[] = array(
				                'id' => $record['event_id'],
				                'title' => $record['event_name'],
				                'start' => $record['start_event'],
				                'end' => $record['end_event'],
				            );
				        }
				    echo json_encode($event_array);
				}
				?>
	</script>
</body>
</html>