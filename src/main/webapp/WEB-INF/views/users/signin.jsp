<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<html>
<head>
<title>Login Page</title>
<c:url var="resourceUrl" value="/resources" />
<link href="${resourceUrl}/css/bootstrap.css" rel="stylesheet">
<link href="${resourceUrl}/css/signin.css" rel="stylesheet">
</head>
<body onload='document.loginForm.username.focus();'>
	<div class="container">
		<jsp:include page="../includes/header.jsp" />
	</div>
	<div class="container" align=center>
		<div id="login-box">

			<h3>이메일 주소와 비밀번호를 입력하세요.</h3>

			<c:if test="${not empty error}">
				<div class="error">${error}</div>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="msg">${msg}</div>
			</c:if>

			<form name='loginForm'
				action="<c:url value='/j_spring_security_check' />" method='POST'>
				<table>
					<tr>
						<td>Email:</td>
						<td><input type='text' name='email' class="form-control"></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><input type='password' name='password'
							class="form-control" /></td>
					</tr>
					<tr><!-- 버튼을 누르게 되면 db에 저장되어있는 사용자와 일치한지 검색한 후 로그인 성공 여부를 판별한다. -->
						<td colspan='2'><button
								class="btn btn-lg btn-primary btn-block" type="submit">Sign
								in</button>
					</tr>
				</table>

				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
	</div>
</body>
</html>