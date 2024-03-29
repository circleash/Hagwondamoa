<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<header class="mt-3 mb-5">
			<div class="d-flex justify-content-between align-items-center">
				<a href="/post/main_view"><h2 class="ml-3 pt-3">학원다모아</h2></a>
				<c:if test="${not empty userName }">
				<div>
					<div class="mr-3">
						${userName } <a href="/user/sign_out"> [로그아웃] </a>
					</div>
					<div class="text-right">
						<a href="/post/write_view" class="btn btn-info">글쓰러 가기</a>
					</div>
				</div>
				</c:if>
			</div>
		</header>