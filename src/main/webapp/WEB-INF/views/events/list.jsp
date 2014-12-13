<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<c:set var="pageTitle" value="All Events" scope="request" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/css/bootstrap.css" rel="stylesheet">
<link href="${resourceUrl}/css/signin.css" rel="stylesheet">
<body class="header">
	<div class="container">
		<jsp:include page="../includes/header.jsp" />
	</div>

	<div class="container">
		<h3 align=center>현재 등록된 이벤트의 목록입니다.</h3>
		<c:url var="createUrl" value="/events/form" />
		<div id="create" class="pull-right">
			<a href="${createUrl}">Create Event</a>
		</div>
		<div class="container">
			<c:forEach items="${events_attendees}" var="attendee">
				<c:out value="${attendee.attendee}" />
				<c:if test="${events.id == attendee.event_id }" var="result">
					<tr>
						<td><c:out value="${attendee.attendee.name}" /></td>
					</tr>
				</c:if>
			</c:forEach>
		</div>
		<table class="table table-bordered table-striped table-condensed">
			<thead>
				<tr>
					<th>Date/Time</th>
					<th>Owner</th>
					<th>Summary</th>
					<th>Description</th>
					<th>Attendee</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty events}">
					<tr>
						<td colspan="2" class="msg">No events.</td>
					</tr>
				</c:if>
				<c:forEach items="${events}" var="event">
					<tr>
						<fmt:formatDate value="${event.when.time}" type="both"
							pattern="yyyy-MM-dd HH:mm:ss" var="when" />
						<td><c:out value="${when}" /></td>
						<td><c:out value="${event.owner.name}" /></td>
						<td><c:out value="${event.summary}" /></td>
						<td><c:out value="${event.description}" /></td>
						<td><c:out value="${event.id}" /></td>
						<!-- 로그인한 사용자가 ROLE_USER인지 ROLE_ADMIN인지 판별 -->
						<td><sec:authorize ifAnyGranted="ROLE_USER,ROLE_ADMIN">
								<input type="button" value="참여">
							</sec:authorize> <sec:authorize ifAllGranted="ROLE_ADMIN">
								<input type="button" value="삭제">
							</sec:authorize></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<jsp:include page="../includes/footer.jsp" />
	</div>
</body>
</html>