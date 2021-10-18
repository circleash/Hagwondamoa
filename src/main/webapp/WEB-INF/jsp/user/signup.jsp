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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="content d-flex justify-content-center align-items-center">
			<div class="login-box d-flex align-items-center">
				<div class="w-100">
					<h1 class="text-center">회원가입</h1>
					<form id="signupForm">
						<div class="d-flex">
						<input type="text" id="loginIdInput" name="loginId" class="form-control" placeholder="아이디를 입력하세요">
						<button type="button" id="isDuplicateBtn" class="btn btn-info btn-default btn-sm ml-1">중복확인</button>
						</div>
						<div class="text-danger d-none" id="duplicateDiv"><small>중복된 id입니다.</small></div>
						<div class="text-success d-none" id="noneDuplicateDiv"><small>사용 가능한 id입니다.</small></div>
						<input type="password" id="passwordInput" name="password" class="form-control mt-3" placeholder="비밀번호를 입력하세요">
						<input type="password" id="passwordConfirmInput" name="passwordConfirm" class="form-control mt-3" placeholder="비밀번호 확인">
						<input type="text" id="isWhoInput" name="isWho" class="form-control mt-3" placeholder="학부모 또는 학생 또는 기타 선택 작성">
						<input type="text" id="userNameInput" name="userName" class="form-control mt-3" placeholder="이름">
						<input type="text" id="userSchoolInput" name="userSchool" class="form-control mt-3" placeholder="학교">
						<input type="text" id="emailInput" name="emailInput" class="form-control mt-3" placeholder="이메일주소">
						<button type="submit" id="signupBtn" class="btn btn-info btn-block mt-3">가입하기</button>
					</form>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	
	
	</div>
	
	<script>
	$(document).ready(function() {
		// 중복체크확인변수
		var isChecked = false;
		//중복 url 여부
		var isDuplicate = true;
		
		//아이디에 입력이 있을 경우 다시 초기화
		$("#loginIdInput").on("input", function() {
			$("#duplicateDiv").addClass("d-none");
			$("#noneDuplicateDiv").addClass("d-none");
			isChecked = false;
			isDuplicate = true;
			
		});
		
		$("#signupForm").on("submit", function(e) {
			e.preventDefault();
			
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var passwordConfirm = $("#passwordConfirmInput").val();
			var isWho = $("#isWhoInput").val();
			var userName = $("#userNameInput").val();
			var userSchool = $("#userSchoolInput").val();
			var email = $("#emailInput").val();
			
			if(loginId == null || loginId == "") {
				alert("아이디를 입력하세요");
				return ;
			}
			
			if(password == null || password == "") {
				alert("비밀번호를 입력하세요");
				return;
			}
			
			if(password != passwordConfirm) {
				alert("비밀번호가 일치하지 않습니다.");
				return ;
			}
			
			if(isWho == null || isWho == "") {
				alert("이름을 입력하세요");
				return;
			}
			
			if(userName == null || userName == "") {
				alert("이름을 입력하세요");
				return;
			}
			
			if(userSchool == null || userSchool == "") {
				alert("이름을 입력하세요");
				return;
			}
			
			if(email == null || email == "") {
				alert("이메일 주소를 입력하세요");
				return ;
			}
			
			if(isChecked == false) {
				alert("중복체크를 진행해 주세요!")
				return;
			}
			
			//이름이 중복된 경우
			if(isDuplicate == true) {
				alert("중복된 id는 입력할 수 없습니다");
				return;
			}
			
			
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{"loginId":loginId, "password":password, "isWho":isWho, "userName":userName, "userSchool":userSchool, "email":email},
				success:function(data) {
					if(data.result == "success") {
						location.href="/user/signin_view";
					} else {
						alert("회원가입 실패");
					}
				},
				error:function(e) {
					alert("error");
				}
				
			});
		});
		$("#isDuplicateBtn").on("click", function() {
			//id에 대한 validation
			var loginId = $("#loginIdInput").val();
			
			if(loginId == null || loginId =="") {
				alert("id를 입력하세요");
				return;
			}
		
		$.ajax({
			type:"get",
			url:"/user/is_id_duplication",
			data:{"loginId":loginId},
			success:function(data) {
				isChecked = true;
				if(data.isDuplication) {
					
					isDuplicate = true;
					$("#duplicateDiv").removeClass("d-none");
					$("#noneDuplicateDiv").addClass("d-none");
				} else {
					isDuplicate = false;
					$("#noneDuplicateDiv").removeClass("d-none");
					$("#duplicateDiv").addClass("d-none");
				}
			},
			error:function(e) {
				alert("error");
			}
			})
		})
	});
	</script>

</body>
</html>