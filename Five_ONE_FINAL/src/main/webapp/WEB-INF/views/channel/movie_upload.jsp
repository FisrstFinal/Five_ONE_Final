<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<div class="modal-body">
	<form method="post" action="<%=request.getContextPath() %>/upload_success.do" enctype="multipart/form-data" class="form-floating">
		<div class="container-fluid">
		    <div class="row">
		      <div class="col-md-2">
		      	<div class="upload-font">파일 업로드</div>
		      </div>
		      <div class="col-md-2 ms-auto">
		      	<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
		      </div>
		    </div>
		    <div class="row">
		      <div class="col-md-12 ms-auto out-side">
		      	<%-- 업로드 섹션 시작 --%>
		      	<div class="drag-area">
		      		<div class="icon">
		      			<i class="fas fa-cloud-upload-alt"></i>
		      		</div>
		      		<header>업로드할 파일을 드래그 해주세요.</header>
		      		<span>또는</span>
		      		<input type="button" class="upload_click_btn" value="클 릭">
		      		<input class="upload_input_btn" name="video_save_file" type="file">
		      	</div>
		      <%-- 업로드 섹션 끝 --%>
			    </div>
			</div><!-- upload div -->
			<div class="row">
			  <div class="col-md-12 ms-auto">
				  	<div class="form-floating cont_area">
					  <textarea class="form-control title_field" placeholder id="floatingTextarea2"></textarea>
					  <label for="floatingTextarea2" >시청자에게 제목을 알려주세요</label>
					</div>
		      </div>
			</div>
			<!-- 설명 div -->
			    <div class="row">
	 		      <div class="col-md-12 ms-auto">
			      	<div class="form-floating cont_area">
					  <textarea class="form-control" placeholder="시청자에게 동영상에 대해 이야기하기" id="floatingTextarea3"></textarea>
					  <label for="floatingTextarea3" >시청자에게 동영상에 대해 이야기하기</label>
					</div>
			      </div>
			      <div class="col-md-2 ms-auto"></div>
			    </div>
			<!-- 설명끝 div -->
			    <div class="row">
			      <div class="col-sm-9" align="left">
			        <label for="validationServer04" class="form-label">재생목록</label>
				    <select class="form-select" aria-label="Default select example">
					  <option selected>기본 목록</option>
					  <option value="1">One</option>
					  <option value="2">Two</option>
					  <option value="3">Three</option>
					</select>
					</div>
					<p>
					<hr>
					<p>
			        <div class="row">
			          <div class="col-8 col-sm-6" style="font-size: 14px;">
			            시청자층<br>
						이 동영상이 아동용으로 설정됨 크리에이터가 설정함<br>
						모든 크리에이터는 위치에 상관없이 아동 온라인 개인정보 보호법(COPPA) 및 기타 법률을 준수해야 할 법적인 의무가 있습니다. 아동용 동영상인지 여부는 크리에이터가 지정해야 합니다.
			          </div>
			          <div class="col-4 col-sm-6 age_select">
			          	<div class="form-check age_select">
							  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
							  <label class="form-check-label" for="flexRadioDefault1">
							    예 아동용 입니다
							  </label>
							</div>
							<div class="form-check age_select">
							  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
							  <label class="form-check-label" for="flexRadioDefault2">
							    아니요 성인용 입니다
							  </label>
						</div>
			          </div>
			        </div>
			        <div class="row">
			        	<div class="col-8 col-sm-6">
			        	</div>
			        	<div class="col-4 col-sm-6">
			        		<button type="submit" class="btn btn-primary video_upload_btn">업로드</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			        	</div>
			        </div>
			    </div>
		  </div>
	 </form>
	</div>
	<script type="text/javascript" src="${path }/resources/hochan_JavaScript/uploadBtn.js"></script>
</body>
</html>