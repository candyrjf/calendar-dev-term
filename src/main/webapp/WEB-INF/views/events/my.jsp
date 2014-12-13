<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<c:set var="pageTitle" value="My Events" scope="request" />
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/css/bootstrap.css" rel="stylesheet">
<link href="${resourceUrl}/css/signin.css" rel="stylesheet">
<body class="header">
	<div class="container">
		<jsp:include page="../includes/header.jsp" />
	</div>

	<div class="container">
	<br><h4 align=center>
			<strong><c:out value="${currentUser.email}" /></strong> 
			님의 이벤트 목록입니다.
		</h4>
		<c:url var="createUrl" value="/events/form" />
		<div id="create" class="pull-right">
			<a href="${createUrl}">Create Event</a>
		</div>

		<table class="table table-bordered table-striped table-condensed">
			<thead>
				<tr>
					<th>Date/Time</th>
					<th>Owner</th>
					<th>Summary</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty events}">
					<tr>
						<td colspan="2" class="msg">No events.</td>
					</tr>
				</c:if>
				<!-- for문처럼 forEach를 사용하여 로그인한 사용자가 owner로 있는 이벤트들을 출력한다. -->
				<c:forEach items="${events}" var="event">
					<tr>
						<fmt:formatDate value="${event.when.time}" type="both"
							pattern="yyyy-MM-dd HH:mm:ss" var="when" />
						<td><c:out value="${when}" /></td>
						<td><c:out value="${event.owner.name}" /></td>
						<td><c:out value="${event.summary}" /></td>
						<td><c:out value="${event.description}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="../includes/footer.jsp" />
	</div>
</body>
</html>