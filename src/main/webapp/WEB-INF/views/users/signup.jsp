<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%request.setCharacterEncoding("utf-8"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<title>Registration</title>
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/css/bootstrap.css" rel="stylesheet">
<link href="${resourceUrl}/css/signin.css" rel="stylesheet">
</head>
<body class="header">
	<div class="container">
		<jsp:include page="../includes/header.jsp" />
	</div>
	<div class="container">
		<form:form action="signup" method="post" commandName="eventForm">
			<form class="form-signin">
				<h2 class="form-signin-heading">Please sign in</h2>
				<!-- sign in버튼을 누르면 DB에 email, password, name저장 -->
				<input name="email" type="text" class="form-control"
					placeholder="Email address" autofocus=""> <input
					type="text" class="form-control" placeholder="Name" autofocus=""
					name="name"> <input type="password" class="form-control"
					placeholder="Password" name="password">
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
					in</button>
			</form>
		</form:form>
	</div>
</body>
</html>