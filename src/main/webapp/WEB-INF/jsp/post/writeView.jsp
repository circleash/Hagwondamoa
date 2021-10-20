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
		<section class="d-flex justify-content-center">
			<div class="w-75 my-4">
				<h1 class="text-center">글쓰기 업로드</h1>
				<div>
					<div class="image-container">
					    <img style="width: 500px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=image+preview">
					    <input style="display: block;" accept="image/*" type="file" id="fileInput">
					</div>
					<hr>
					<h5 class="text-center">학원리뷰글의 경우 영수증 사진을 업로드해주세요.</h5>
				</div>
				<textarea class="form-control mb-3" rows="5" id="contentInput"></textarea>
				<!-- MIME text/html image/jpeg -->
				<div class="d-flex justify-content-between my-3">
					<a href="/post/main_view" class="btn btn-info">메인페이지로</a>
					<div class="d-flex">
						<h5>게시판 선택 - </h5>
						<select name="category" id="selectBox">
							<option value="hagwon" selected>학원</option>
							<option value="tutoring">과외</option>
							<option value="school">학교</option>
							<option value="health">건강</option>
							<option value="talking">수다</option>
						</select>
						<button type="button" class="btn btn-info" id="saveBtn">저장</button>
					</div>
				</div>
			</div>
		
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	</div>
	
	<script>
	$(document).ready(function() {
		$("#imageUploadBtn").on("click", function() {
			$("#fileInput").click();
		});
		
		$("#saveBtn").on("click", function() {
			var content = $("#contentInput").val().trim();
			var category = $("#selectBox").val();
			
			if(content == null || content == "") {
				alert("내용을 입력하세요");
				return;
			}
			
			var formData = new FormData();
			formData.append("content", content);
			formData.append("category", category);
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
						alert("삽입성공");
						
					} else {
						alert("삽입실패");
					}
					
				},
				error:function(e) {
					alert("error");
				}
				
				
			});
			
		});
		
		function readImage(input) {
		    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader()
		        // 이미지가 로드가 된 경우
		        reader.onload = e => {
		            const previewImage = document.getElementById("preview-image")
		            previewImage.src = e.target.result
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0])
		    }
		}
		// input file에 change 이벤트 부여
		const inputImage = document.getElementById("fileInput")
		inputImage.addEventListener("change", e => {
		    readImage(e.target)
		})
	})
	
	</script>


</body>
</html>