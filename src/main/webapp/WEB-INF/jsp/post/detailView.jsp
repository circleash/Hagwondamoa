<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="d-flex justify-content-center">
			<div class="w-75 my-4">
				<h1 class="text-center">게시판</h1>
				<div class="d-flex">
					<div class="mr-3">
						<b>${post.userName }(${post.userSchool }) / ${post.isWho }</b>
					</div>
					<div class="mr-3">
						<span></span>
					</div>
					<div>
						<span><fmt:formatDate value="${post.createdAt }" pattern="yyyy-MM-dd HH:mm:ss" /></span>
					</div>
				</div>
				<textarea class="form-control mb-3" rows="5" id="contentInput">${post.content }</textarea>
				<img src="${post.imagePath }">
				<div class="d-flex justify-content-between my-3">
					<div>
					<a href="/post/list_view?category=${post.category }" class="btn btn-info">목록으로</a>
					<button type="button" class="btn btn-danger" id="deleteBtn" data-post-id="${post.id }">삭제</button>
					</div>
					<button type="button" class="btn btn-success" id="updateBtn" data-post-id="${post.id }">수정</button>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
</body>

<script>
	$(document).ready(function() {
		$("#saveBtn").on("click", function() {
			var content = $("#contentInput").val().trim();
			
			if(content == null || content == "") {
				alert("내용을 입력하세요");
				return;
			}
			
			var formData = new FormData();
			formData.append("content", content);
			formData.append("file", $("#fileInput")[0].files[0]);
			
			$.ajax({
				enctype:"multipart/form-data", // 파일 업로드 필수
				processData:false, //파일업로드 필수
				contentType:false, //파일업로드 필수
				type:"post",
				url:"/post/create",
				data:formData,
				success:function(data) {
					if(data.result == "success") {
						location.href="/post/list_view"
					} else {
						alert("삽입실패");
					}
					
				},
				error:function(e) {
					alert("error");
				}
				
				
			});
			
		});
		
		$("#deleteBtn").on("click", function() {
			var postId = $(this).data("post-id");
			
			$.ajax({
				type:"get",
				url:"/post/delete",
				data:{"postId":postId},
				success:function(data) {
					if(data.result == "success") {
						location.href="/post/main_view";
					} else {
						alert("삭제실패");
					}
				},
				error:function(e) {
					alert("error");
				}
			})
				
		});
			
		$("#updateBtn").on("click", function() {
			var postId = $(this).data("post-id");
			
			$.ajax({
				type:"post",
				url:"/post/update",
				data:{"postId":postId, "content":$("#contentInput").val()},
				success:function(data) {
					if(data.result == "success") {
						alert("수정 성공");
					} else {
						alert("수정 실패");
					}
				},
				error:function(e) {
					alert("error");
				}
			});
	
		});
	});
	
	</script>
</html>