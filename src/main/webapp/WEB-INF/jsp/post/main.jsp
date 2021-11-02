<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>     
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp" />
	<c:import url="/WEB-INF/jsp/include/board.jsp" />
	<section>
		<div>
			<div>학원게시판 최근 글</div>
			<c:forEach var="hagwon" items="${hagwonList }">
						<div class="mt-1">
							<b>${hagwon.userName }</b><a href="/post/detail_view?id=${hagwon.id }"> ${hagwon.content }</a>
						</div>
			</c:forEach>
			<div>과외게시판 최근 글</div>
			<c:forEach var="tutoring" items="${tutoringList }">
						<div class="mt-1">
							<b>${tutoring.userName }</b><a href="/post/detail_view?id=${tutoring.id }"> ${tutoring.content }</a>
						</div>
			</c:forEach>
			<div>학교게시판 최근 글</div>
			<c:forEach var="school" items="${schoolList }">
						<div class="mt-1">
							<b>${school.userName }</b><a href="/post/detail_view?id=${school.id }"> ${school.content }</a>
						</div>
			</c:forEach>
			<div>건강게시판 최근 글</div>
			<c:forEach var="health" items="${healthList }">
						<div class="mt-1">
							<b>${health.userName }</b><a href="/post/detail_view?id=${health.id }"> ${health.content }</a>
						</div>
			</c:forEach>
			<div>수다게시판 최근 글</div>
			<c:forEach var="talking" items="${talkingList }">
						<div class="mt-1">
							<b>${talking.userName }</b><a href="/post/detail_view?id=${talking.id }"> ${talking.content }</a>
						</div>
			</c:forEach>
			
		</div>
	</section>	
	

	<c:import url="/WEB-INF/jsp/include/footer.jsp" />
</div>

</body>
</html>