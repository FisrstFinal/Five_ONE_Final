<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="playList" value="${list }" /> <!-- videoplay -->
<c:set var="mainCategory" value="${cateList }" /> <!-- category -->
<c:set var="bundle" value="${playBundle }" /> <!-- bundle -->
<c:set var="positionPath" value="F:/GitHub/workspace(Spring)/Five_ONE_Final/Five_ONE_FINAL/src/main/webapp/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link rel="stylesheet" href="${path }/resources/hochan_CSS/modify.css">
</head>

<body>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script type="text/javascript" src="${path }/resources/hochan_JavaScript/modify.js"></script>
	<!-- Vertically centered scrollable modal -->
	<div class="video-modify">
		<div>${pageContext.request.contextPath }</div>
		<input type="hidden" id="subVideoCode" name="subVideoCode" value="${playList.video_code }">
		<input type="hidden" id="channelCode" name="channelCode" value="${playList.channel_code }">
	  	<div class="container text-left img-thumbnail">
	  	<p>
	  	  <!-- 영상 row -->
	  	  <div class="row col-10">
	  	  <hr class="hrtag">
	  	  	<div class="col-10">
	  	  		<div>동영상</div>
	  	  		<div>본인 채널과 구독자들에게 VIDIVIDI에서 영상을 보여줍니다.</div>
	  	  	</div>
	  	  	
	  	  	<br>
	  	  	
	  	  	<div class="col-5">
		  	  <div id="movie_area">
			      <video id="upload_file_btn" class="update_modal img-thumbnail">
			      	<source class="source_tag" src="${path}/resources/AllChannel/${playList.channel_code}/${playList.video_title}.mp4" type="video/mp4">
			      </video>
			  </div>
	  	  	</div>
	  	  	<div class="col-5">
	  	  		<div>MP4 또는 MKV 파일을 사용하세요. 동영상은 VIDIVIDI 커뮤니티 가이드를 준수합니다.</div>
	  	  		<div>
	     			<button type="button" class="btn btn-outline-danger btn-sm modify-btn">영상 변경하기</button>
	     			<input type="hidden" value="${playList.getVideo_title() }">
	     			<input type="file" hidden id="file_mv" name="file_mv">
	     		</div>
	  	  	</div>
	  	  </div> 
	  	  <!-- 영상 row -->
	  	  
	  	  <br>
	  	  
	  	  <!-- 영상 제목 row -->
	  	  <div class="row col-10">
	  	  <hr class="hrtag">
	  	  	<div class="col-10">
	  	  		<div align="left">제 목<span class="btn-position"><button class="btn btn-outline-success btn-sm">저 장</button></span></div>
	  	  		<input class="form-control" name="video_title" list="datalistOptions" id="exampleDataList" placeholder="변경할 제목을 알려주세요" value="${playList.video_title }">
	  	  	</div>
	  	  </div> <!-- 영상 제목 row -->
	  	  
	  	  <br>
	  	  
	  	  <!-- 영상 설명 row -->
	  	  <div clas="row col-10">
	  	  <hr class="hrtag">
	  	  	<div class="col-8">
		  	  <div class="form-floating">
		  	  	<div align="left">영 상 소 개<span class="btn-position"><button class="btn btn-outline-success btn-sm">저 장</button></span></div>
				<c:if test="${playList.video_cont eq 'null'}">
				  <textarea class="form-control" name="video_cont" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 250px; width: 100%;"></textarea>
				</c:if>
				<c:if test="${playList.video_cont ne 'null' }">
				  <textarea class="form-control" name="video_cont" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 250px; width: 80%;">${playList.video_cont }</textarea>
				</c:if> 
			  </div>
	  	  	</div>
	  	  </div> <!-- 영상 설명 row -->
	  	  
	  	  <br>
	  	  
	  	  <!-- 영상 카테고리 row -->
	  	  <div class="row col-10">
	  	  <hr class="hrtag">
	  	  	<div class="col-12">
	  	  		<div class="col-10" align="left">
	  	  			<strong>영상 카테고리<span class="btn-position"><button class="btn btn-outline-success btn-sm">저 장</button></span></strong>
	  			</div>
	  			<br>
	  			<div class="col-12">
	  				<c:if test="${empty mainCategory }">
			  			<a href="#" class="text-decoration-none" style="display: flex;">카테고리 오류</a>
			  		</c:if>
			  		<c:if test="${!empty mainCategory }">
			  			<select id="category_List" name="category_List" class="form-select" size="3" aria-label="size 3 select example">
						  <c:forEach items="${mainCategory }" var="categoryList">
						      	<option value="${categoryList.category_code }" <c:if test="${playList.category_code eq categoryList.category_code}" >selected</c:if>>${categoryList.category_title }</option>
						  </c:forEach>
						</select>
			  		</c:if>
	  			</div>
	  	  	</div>
	  	  </div> <!-- 영상 카테고리 row -->
	  	  
	  	  <br>
	  	  
	  	  <!-- 영상 재생목록 row -->
	  	  <div class="row col-10">
	  	  <hr class="hrtag">
			<div class="col-12" align="left">
		  		<strong>재생목록<span class="btn-position">
			  		<c:if test="${empty bundle}">
			  			
			  		</c:if>
			  		<c:if test="${!empty bundle}">
			  			<button class="btn btn-outline-success btn-sm">저 장</button></span>
			  		</c:if>
		  		</strong>
		  	</div>
		  	<br>
		  	<div class="col-12">
			  	<c:if test="${empty bundle }">
		  			<a href="#" class="text-decoration-none" style="display: flex;">재생목록이 없어요. 재생목록을 추가해보세요!</a>
		  		</c:if>
		  		<c:if test="${!empty bundle }">
		  			<select id="bundleCheck" name="bundleValue" class="form-select" size="3" aria-label="size 3 select example">
					  <c:forEach items="${bundle }" var="bundlelist">
					      	<option value="${bundlelist.bundle_code }" <c:if test="${bundlelist.bundle_code eq list.playList_code }">selected</c:if>>${bundlelist.bundle_title }</option>
					  </c:forEach>
					</select>
		  		</c:if>
		  	</div>
	  	  </div>
	  	  <!-- 영상 재생목록 row -->
	  	  
	  	  <br>
	  	  
	  	  <!-- 시청자층 row -->
	  	  <div class="row col-10">
	  	  	<hr class="hrtag">
	  	  	<div class="col-8">
			  	<h5>시청자층*</h5>
				이 동영상이 아동용으로 설정됨 크리에이터가 설정함<br>
				모든 크리에이터는 위치에 상관없이 아동 온라인 개인정보 보호법(COPPA) 및 기타 법률을 준수해야 할 법적인 의무가 있습니다. 아동용 동영상인지 여부는 크리에이터가 지정해야 합니다.
	  	  	</div>
			<div class="col-4">
				<br>
		  		<div class="form-check age_select" >
					  <input class="form-check-input" type="radio" name="flexRadioDefault_age" id="flexRadioDefault1" checked>
					  <label class="form-check-label" for="flexRadioDefault1">
					    예 아동용 입니다
					  </label>
					</div>
					<div class="form-check age_select">
					  <input class="form-check-input" type="radio" name="flexRadioDefault_age" id="flexRadioDefault2">
					  <label class="form-check-label" for="flexRadioDefault2">
					    아니요 성인용 입니다
					  </label>
				</div>
				<br>
				<div>
					<button class="btn btn-outline-success btn-sm">저 장</button>
				</div>
			</div>
	  	  </div>
	  	  <!-- 시청자층 row -->
	  	  
	  	  <br>
	  	  
	  	  <!-- 공개 여부 row -->
	  	  <div class="row col-10">
	  	  <hr class="hrtag">	
		  	<strong>공개 여부<span class="btn-position"><button class="btn btn-outline-success btn-sm">저 장</button></span></strong>
		  	<div class="col-10 open_check">
		  		<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault_openClose" id="flexRadioDefault3" checked>
				  <label class="form-check-label" for="flexRadioDefault3">
				   	시청자들과 같이 보기
				  </label>
				</div>
				&nbsp; &nbsp;
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault_openClose" id="flexRadioDefault4">
				  <label class="form-check-label" for="flexRadioDefault4">
				   	나만 보기
				  </label>
				</div>
			</div>
		  </div>
	  	  <!-- 공개 여부 row -->
	  	  
	  	  <br>
	  	  
	  	  <!-- 썸네일 이미지 row -->
	  	  <div class="row col-10">
	  	  <hr class="hrtag">
	  	  	<div class="col-12">
		  	  <strong>영상 첫이미지 수정하기</strong>
				<div class="input-group mb-3">
					<div class="custom-file">
						 <div class="input-group">
					      <label class="input-group-text form-control" for="autoSizingInputGroup">
					      	파일선택&nbsp;&nbsp;
					      	
					      	<c:if test="${empty playList.video_img}">
						      	<input type="text" name="img_name" class="img_field" value="파일을 선택해주세요" readonly>
					      	</c:if>
					      	<c:if test="${!empty playList.video_img}">
					      		<input type="text" name="img_name" class="img_field" value="${playList.video_img }" readonly>
					      	</c:if>
					      </label>
					      <div class="file_div">
					      	<input class="form-control" type="file" id="autoSizingInputGroup" name="file_img" hidden>				      
					      </div>
					    </div>
				  	</div>
				</div>
	  	  	</div>
	  	  </div>
	  	  <!-- 썸네일 이미지 row -->		  		  		  		  	
	</div>
</body>
</html>