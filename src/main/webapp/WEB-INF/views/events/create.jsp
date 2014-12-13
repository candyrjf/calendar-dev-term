<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<c:set var="pageTitle" value="Welcome to myCalendar!" scope="request" />
<html lang="en">
<head>
<title>myCalendar: <c:out value="${pageTitle}" />
</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${resourceUrl}/bootstrap-3.3.1/css/bootstrap-datetimepicker.css"
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
	<div class="container">
		<jsp:include page="../includes/header.jsp" />
		<c:if test="${message != null}">
			<div class="alert alert-success" id="message">
				<c:out value="${message}" />
			</div>
		</c:if>

		<div class="container">
			<form:form action="./new" method="post" commandName="userForm">
				<h2>Create Events</h2>
				<input name="summary" type="text" class="form-control"
					placeholder="Summary" autofocus="">
				<input type="text" class="form-control" placeholder="Description"
					autofocus="" name="description">
				<input type="text" class="form-control" placeholder="Owner"
					name="owner">
				<input type="text" class="form-control" placeholder="num_likes"
					name="num_likes">
				<input type="text" class="form-control" placeholder="event_level"
					name="event_level">
				<div class='input-group date' id='datetimepicker1'>
					<input type="datetime" class="form-control" name="when"
						data-date-format="YYYY-MM-DD HH:MM:SS" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>

				<button class="btn btn-lg btn-primary btn-block" type="submit">submit</button>

			</form:form>
		</div>


		<jsp:include page="../includes/footer.jsp" />
	</div>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/bootstrap-3.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/moment.js"></script>
	<script type="text/javascript"
		src="${resourceUrl}/javascript/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#datetimepicker1').datetimepicker();
		});
	</script>
</body>
</html>