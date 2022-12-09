<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script> 
<!-- jQuery UI -->
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
<!-- toast -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style type="text/css">
	html, body, #join-page-wrap {
		height: 100%;
	}

	#join-wrap {
		display: flex;
		align-items: center;
		height: 80%;
	}
	
	#join-side-bar {
		flex: 1;
	}
	
	#join-content {
		flex: 9;
		height: 100%;
		display: flex;
		align-items: center;
	}
	
	#join-content-box {
		margin: auto;
		width: 30%;
	}
	
	#join-content-1, #join-content-2, #join-content-3 {
		display: inline-block;
		width: 100%;
	}
	
	
	#join-content-box div input, #join-content-box div span {
		display: block;
		width: 100%;
		padding: 15px;
		padding-top: 20px;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	
	input.password {
		-webkit-text-security:disc;
	}
	
	#join-process-bar {
		width: 100%;
		height: 5px;
		background-color: lightgray;
	}
	
	#bar {
		width: 33%;
		height: 100%;
		background-color: #fc942c;
	}
	
	div.label-input {
		display: inline;
		position: absolute;
	    color: gray;
	    transition: all 0.5s;
	    margin-left: 20px;
	    margin-top: 18px;
	}
	
	label.label-input{
		
	}
	
	.join-input{
		border-radius: 10px;
		border: 1px solid gray;
		background-color: transparent;
		font-size: 1em;
	}
	
	.join-input:focus{
		outline: none;
		box-shadow: none;
	}
	
	.onfocus{
		font-size: 0.6em;
		margin-left:12px !important;
		margin-top:8px !important;
	}
	
	/* input[type=date]::-webkit-datetime-edit-text {
	    -webkit-appearance: none;
	    display: none;
	}
	input[type=date]::-webkit-datetime-edit-month-field{
	    -webkit-appearance: none;
	    display: none;
	}
	input[type=date]::-webkit-datetime-edit-day-field {
	    -webkit-appearance: none;
	    display: none;
	}
	input[type=date]::-webkit-datetime-edit-year-field {
	    -webkit-appearance: none;
	    display: none;
	}
	 */
	 
	 
	 .date-empty:before{
	 	content: attr(data-placeholder);
	 	width: 100%;
	 }
	 
	 /* 부트스트랩 토스트창 배경색 중복 수정 */
	div.toast {
		background-color: unset;
	}
	
	div.toast-success {
		background-color: #51A351;
	}
	div.toast-warning {
		background-color: #f89406;
	}
	div.toast-info {
		background-color: #2F96B4;
	}
	div.toast-error {
		background-color: #BD362F;
	}
	
</style>

<script type="text/javascript">
	
	$(function(){
		
		$.ajaxSetup({
			ContentType: "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post"								
		});
		
		$("#join-content-1").nextAll().hide();
		
		$("#submit-1").attr("disabled", true);
		$("#submit-2").attr("disabled", true);
		
		$(".join-form-btn").on('click', function(){
			$(this).parent().parent('div').fadeOut('fast');
			$(this).parent().parent('div').next().fadeIn(1000);
			if ($(this).val() == '회원가입'){
				$("#bar").animate({width: "66%"}, 1000);
			}else {
				$("#bar").animate({width: "100%"}, 1000);
			}
			
		});
		
		$(".join-input").on('focus', function(){
			$(this).prev('div').addClass('onfocus');
		});
				
		$(".join-input").on('blur', function(){
			if($(this).val() == ''){
				$(this).prev('div').removeClass('onfocus');
				$(this).prev('div').children().eq(0).hide();
				$(this).prev('div').children().eq(1).show();
			}
		});
		
		
		function optionalInputChange(){
			if ( 
					$("#input-name").val() == "" &&
					$("#input-email").val() == "" &&	
					$("#input-birth").val().toString() == "" &&
					$("#input-phone").val() == "" &&
					$("#input-addr").val() == ""
				) {
					$("#submit-2").attr("disabled", true);
				}else {
					$("#submit-2").attr("disabled", false);
				}
		}
		
		
		$(".join-input").on('keyup', function(){
			
			if ($("#input-id").val() != '' && $("#input-pwd").val() != '' && $("#input-pwd-confirm").val() != '') {
				$("#submit-1").attr("disabled", false);
			}else {
				$("#submit-1").attr("disabled", true);
			}
			
			/* if ($("#input-pwd").val() == ) */
			
			optionalInputChange();
			
		});
		
		$("input[type=date].date-placeholder").on("change", function(){
			if ($(this).val() == ""){
				$(this).addClass("date-empty");
				console.log($("#input-birth").val());
			}else{
				$(this).removeClass("date-empty");
				console.log($("#input-birth").val());
			}
			
			optionalInputChange();
		});
		
		
		function joinIdCheck(){
			let id = $("#input-id").val();
			console.log(id);
			$.ajax({
				url: "<%=request.getContextPath()%>/joinIdCheck.do",
				data: { id : id },
				success: function(result){
					if ($("#input-id").val() != ""){
						$("#input-id-check").show();
						$("#input-id-label").hide();
					}
					
					if(result == 'allow'){
						$("#input-id-check").text("사용 가능한 아이디입니다.");
						$("#input-id-check").css("color", "green");
					}else if(result == 'deny'){
						$("#input-id-check").text("중복된 아이디입니다.");
						$("#input-id-check").css("color", "red");
					}
				},
				error: function(){
					toastr.warning("데이터 전송 오류");	
				}
			});
				
		}
		
		$("#input-id").on('keyup', function(){
			joinIdCheck();
		});
		
		
		


	});
	
	function ajaxTest(){
		$.ajax({
			url : "./testajax.do",
			type: "POST",
			dataType: 'json',
			success : function(data){
				
				$(data).each(function(){
					alert(this.member_code+"/"+this.member_id+"/"+this.member_name);
				});
				
			},
			error : function(){
				alert("데이터 통신 오류");
			}
		});
		
	}
	
</script>
</head>
<body>
<button onclick="ajaxTest();">테스트~~~~~~~~~~~~</button>
	<div id="join-page-wrap"> 
		<jsp:include page="../include/top_include.jsp"/>
		<div id="join-wrap">
			<div id="join-side-bar">
				<jsp:include page="../include/side_include.jsp"></jsp:include>
			</div>
			<div id="join-content">
				<div id="join-content-box">
					<div id="join-process-bar">
						<div id="bar"></div>
					</div>
					<div id="join-content-1">
						<form method="post" id="join-form-1">
							<span>간편회원가입</span>
							
							<div class="label-input" >
								<label for="input-id" id="input-id-check"></label>
								<label for="input-id" id="input-id-label">아이디</label>
							</div>
							<input name="id" class="join-input essential" id="input-id">
							
							<div class="label-input" >
								<label for="input-id" class="label-input" id="input-pwd-check"></label>
								<label for="input-id" class="label-input" id="input-pwd-label">비밀번호</label>
							</div>
							<input name="pwd" class="password join-input essential" id="input-pwd">
							
							<div class="label-input" >
								<label for="input-id" class="label-input" id="input-pwd-confirm-check"></label>
								<label for="input-id" class="label-input" id="input-pwd-confirm-label">비밀번호 확인</label>
							</div>
							<input name="check-pwd" class="password join-input essential" id="input-pwd-confirm">
							
							<input type="button" value="회원가입" class="join-form-btn" id="submit-1">
						</form>
						<hr>
						<span>소셜로 가입하기</span>
						<input type="button" value="구글로 가입하기">
						<input type="button" value="카카오로 가입하기">
						<input type="button" value="네이버로 가입하기">
					</div>
					<div id="join-content-2">
						<span>회원가입이 완료되었어요!</span>
						<span>선택정보를 입력하시면 더욱 편리하게 이용할 수 있어요</span>
						<span>사실 가입 안됐습니다. view 페이지 구성중입니다.</span>
						<form method="post" id="join-form-2">
							<div class="label-input" >
								<label for="input-name" class="label-input" id="input-name-check"></label>
								<label for="input-name" class="label-input" id="input-name-label">이름</label>
							</div>
							<input name="name" class="join-input optional" id="input-name"> <!-- 이름을 입력하지 않으면 id값을 받아와 이름으로 처리 -->
							
							<div class="label-input" >
								<label for="input-email" class="label-input" id="input-email-check"></label>
								<label for="input-email" class="label-input" id="input-email-label">이메일</label>
							</div>
							<input name="email" class="join-input optional" id="input-email"> <!-- *@*.* 형식인지 체크-->
							
							<div class="label-input" >
								<label for="input-birth" class="label-input" id="input-birth-check"></label>
								<label for="input-birth" class="label-input" id="input-birth-label">생년월일</label>
							</div>
							<input type="date" name="birth" class="join-input optional date-placeholder date-empty" id="input-birth" data-placeholder=""> <!-- 일정 나이 이상이어야 조회가능한 동영상이 있음. -->
							
							<div class="label-input" >
								<label for="input-phone" class="label-input" id="input-phone-check"></label>
								<label for="input-phone" class="label-input" id="input-phone-label">전화번호</label>
							</div>
							<input name="phone" class="join-input optional" id="input-phone"> <!-- 문자인증 하지않으면 동영상 업로드 안되게..? 불법적인 동영상 있을 수 있으니까 실명인증 -->
							
							<div class="label-input" >
								<label for="input-addr" class="label-input" id="input-addr-check"></label>
								<label for="input-addr" class="label-input" id="input-addr-label">주소</label>
							</div>
							<input name="addr" class="join-input optional" id="input-addr"> <!-- 주소는..없앨까...? -->
														
							<input type="button" value="선택정보 입력" class="join-form-btn" id="submit-2">
							<input type="button" value="다음에 할래요" class="join-form-btn" id="submit-3">
						</form>
					</div>
					<div id="join-content-3">
						<span>가입을 축하합니다!</span>
						<input type="button" value="메인으로 가기" class="join-form-btn" id="submit-4" onclick="location.href='<%=request.getContextPath()%>'">
						<input type="button" value="마이페이지로 가기" class="join-form-btn" id="submit-5">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>