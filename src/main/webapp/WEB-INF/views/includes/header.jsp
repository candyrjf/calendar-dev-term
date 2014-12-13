<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/">SORA's Calendar</a>
		</div>
		<div class="navbar-collapse collapse" style="height: 1px;">
			<!--사용자의 로그인 상태 판별 : 로그인 하지 않음  -->
			<sec:authorize access="isAnonymous()">
				<ul class="nav navbar-nav">
					<c:url var="welcomeUrl" value="/" />
					<li class="active"><a id="navWelcomeLink" href="${welcomeUrl}">홈</a></li>
					<c:url var="eventsUrl" value="/events/" />
					<li><a id="navEventsLink" href="${eventsUrl}">모든 이벤트 보기</a></li>

					<c:url var="myEventsUrl" value="/events/my" />
					<li><a id="navMyEventsLink" href="${myEventsUrl}">나의 이벤트</a></li>

					<c:url var="createEventUrl" value="/events/form" />
					<li><a id="navCreateEventLink" href="${createEventUrl}">이벤트
							생성</a></li>

					<c:url var="signupUrl" value="/users/signup" />
					<li><a id="signupLink" href="${signupUrl}">회원 가입</a></li>
				</ul>

				<form class="navbar-form navbar-right" name='loginForm'
					action="<c:url value='/j_spring_security_check' />" method='POST'>
					<div class="form-group">
						<input type="text" name="email" placeholder="Email"
							class="form-control">
					</div>
					<div class="form-group">
						<input type="password" name="password" placeholder="Password"
							class="form-control">
					</div>
					<button type="submit" class="btn btn-success">Sign in</button>
				</form>
			</sec:authorize>

			<!--사용자의 로그인 상태 판별 : 로그인 함  -->
			<sec:authorize access="isAuthenticated()">
				<ul class="nav navbar-nav">
					<c:url var="welcomeUrl" value="/" />
					<li class="active"><a id="navWelcomeLink" href="${welcomeUrl}">홈</a></li>
					<c:url var="eventsUrl" value="/events/" />
					<li><a id="navEventsLink" href="${eventsUrl}">모든 이벤트 보기</a></li>

					<c:url var="myEventsUrl" value="/events/my" />
					<li><a id="navMyEventsLink" href="${myEventsUrl}">나의 이벤트</a></li>

					<c:url var="createEventUrl" value="/events/form" />
					<li><a id="navCreateEventLink" href="${createEventUrl}">이벤트
							생성</a></li>
				</ul>
				<!-- 로그아웃 버튼을 눌렀을 때 미리 j_spring_security_logout의 url을 설정해 두 었기 때문에 첫 화면으로 돌아감 -->
				<a href="${ctx}j_spring_security_logout"
					class="navbar-form navbar-right">
					<button type="submit" class="btn btn-success">Logout</button>
				</a>

			</sec:authorize>
		</div>
		<!--/.navbar-collapse -->
	</div>
</div>
