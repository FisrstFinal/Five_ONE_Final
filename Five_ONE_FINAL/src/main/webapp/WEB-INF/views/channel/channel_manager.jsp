<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="channelOwner" value="${currentOwner }" />
<c:set var="mvlist" value="${mvList }" />
<c:set var="bundle" value="${bundleList }" />
<c:set var="positionPath" value="F:/GitHub/workspace(Spring)/Five_ONE_Final/Five_ONE_FINAL/src/main/webapp/resources" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="${path }/resources/hochan_CSS/channel_manager.css"></link>
	<link rel="stylesheet" href="${path }/resources/hochan_CSS/uploadBtn.css"></link>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"></link>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"></link>
<title>채널 관리 페이지</title>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<jsp:include page="../include/top_include.jsp"/>
	<div class="d-none d-xl-block">
		<jsp:include page="../include/side_include.jsp"></jsp:include>
	</div>
	<input type="hidden" id="oCc" value="${channelOwner.channel_code }">
	<input type="hidden" id="chaName" value="${channelOwner.channel_name }">
	<div class="col-12 col-xl-12 align-middle" style="margin-top: 0.5%;">
	  <div class="row justify-content-center">
	    <div class="col-3 d-none d-xl-block" align="center">
	      	<div class="card left_card" style="width: 18rem;">
			  <img src="${path }/resources/img/channel_profile/${channelOwner.channel_profil }" class="card-img-top left_img channel-backcolor" alt="...">		   
			  <div class="card-body">
			    <h5 class="card-title">
			    	${channelOwner.channel_name }
			    </h5>
			    <p class="card-text">
			    	<div>구독자 ${channelOwner.channel_like }명</div>
			    	<div>${channelOwner.channel_date.substring(0, 10) }</div>
			    </p>
			  </div>
			</div>
			<div class="card left_card" style="width: 18rem;">
				<div class="card-body">
					<div class="row channel_button_area">
						<div class="col-6">
						  	<button type="button" onclick="managerModify('${channelOwner.channel_code}')" class="btn btn-success" id="listmake">채널 수정</button>						
						</div>
					  	<div class="col-6">
						  	<button type="button" onclick="newVideo()" class="btn btn-success" id="videoMake" data-toggle="modal" data-target="#videoUploadModal">영상 업로드</button>					  	
					  	</div>
					  	<div class="col-6">
						  	<button type="button" onclick="location.href='<%=request.getContextPath() %>/channel_manager.do?code=${channelOwner.channel_code }'" class="btn btn-success btn-sm" id="videoManager">영상 관리하기</button>				  	
					  	</div>
					  	
					  	<!-- 비디오 업로드 모달 -->
						<div class="modal fade" id="videoUploadModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-xl" role="document">
						    <div class="modal-content">
						    	
						    </div>
						  </div>
						</div>
					</div>
				  	
				  	<div align="left">
					<div class="nav-link px-0 align-middle atag">
            			<i class="bi bi-bookmark-star"></i><span class="ms-1 d-none d-sm-inline atag">내 재생목록</span>
            		</div>
            		<ul class="nav flex-column ms-3" id="bundleList">
						<c:if test="${!empty bundle }">
	                     	<c:forEach items="${bundle }" var="bundledto" varStatus="status">
	                     		<li class="w-100 index">
	                             	<a href="javascript:void(0)" class="nav-link px-3 bundle_text" style="display: inline-block;" onclick="bundleDetail('${bundledto.bundle_code }')">
	                             		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-music-note-list icon black" viewBox="0 0 16 16">
										  <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
										  <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
										  <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
										  <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
										</svg>
	                             		<span class="d-none d-sm-inline child_bundle">${bundledto.bundle_title }</span>	
	                             	</a>
	                             	<button id="bDelIndex" class="delicon" onclick="bundleDel('${bundledto.bundle_code}')">
	                             			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3" viewBox="0 0 16 16">
										  	<path d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z"/>
											</svg>
	                             	</button>
	                         	</li>
	                     	</c:forEach>
						</c:if>
					</ul>
					<div class="bundleAdd">
	            		<hr color="green">
	                    	<a data-toggle="collapse" href="#collapse1" aria-expanded="false" class="nav-link px-0"> <span class="d-none d-sm-inline child_bundle">재생 목록 추가하기</span></a>
	                    	<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
					         <div class="panel-body" style="display: flex;">
					           <input class="form-control form-control-sm bundleNameField" type="text" placeholder="이름을 입력해주세요" aria-label=".form-control-sm example">
					           <button onclick="bundleMake()" class="btn btn-link" style="font-size: 12px; color: green; padding-bottom: 2px;">ADD</button>
					         </div>
						</div>	
	            	</div>
	            	<div>
	            		<a data-toggle="collapse" href="#Redirect" aria-expanded="false" class="nav-link px-0 bDel"> <span class="d-none d-sm-inline child_bundle">재생 목록 삭제하기</span></a>
	            	</div>
				  	</div>			
				</div>
			</div>
	    </div>
	    <div class="col-12 col-xl-8">
		    <div class="row video_detail_area">
		    <form>
		    	<table class="table">
		    	<thead>
				  <tr>
				  	<th class="col-4">동영상</th>
				  	<th class="col-2">제목</th>
				  	<th class="col-1" style="font-size: 14px;">공개 상태</th>
				  	<th class="col-1" style="font-size: 14px;">제한 사항</th>
				  	<th class="col-1">날짜</th>
				  	<th class="col-1">조회수</th>
				  	<th class="col-1">좋아요</th>
				  	<th class="col-1">수정</th>
				  	<th class="col-1">삭제</th>
				  </tr>
				</thead>
			    <c:if test="${empty mvlist }">
			    	<tr>
			    		<td colspan="7" width="800px" height="800px" id="noVideoArea" onclick="changeBtn()">
					    	<div class="col-12 align-self-center div_upload_btn" align="center">
					    		<img alt="" class="style-scope ytcp-video-section-content" src="https://www.gstatic.com/youtube/img/creator/no_content_illustration_upload_video_v3.svg">
								<div class="arrow upload_font">시청자들에게 영상 보여주기</div>
					    	</div>
			    		</td>
			    	</tr>
			    </c:if>
			    <c:if test="${!empty mvlist }">
					<tbody class="manager_tbody">
					  <c:forEach items="${mvlist }" var="mvdto">
					  	<tr>
					  		<td>
					  			<c:if test="${empty mvdto.video_img}">
					   				<div><video class="show_file"><source src="${path}/resources/AllChannel/${channelOwner.channel_code}/${mvdto.video_title }.mp4"></video></div>
					   			</c:if>
					   			<c:if test="${!empty mvdto.video_img}">
							    	<div><img class="show_file" src="${path}/resources/AllChannel/${channelOwner.channel_code}/thumbnail/${mvdto.video_img }"></div>					   				
					   			</c:if>
					  		</td>
					  		<td>
					  			${mvdto.video_title }
					  		</td>
					  		<td>
					  			<c:if test="${mvdto.video_open == 1}">
									비공개
								</c:if>
								<c:if test="${mvdto.video_open == 0}">
									공개
								</c:if>
					  		</td>
					  		<td>
					  			<c:if test="${mvdto.video_age eq 'true' }">
					  				아동용
					  			</c:if>
					  			<c:if test="${mvdto.video_age ne 'true' }">
					  				성인용
					  			</c:if>
					  			 
					  		</td>
					  		<td>
					  			 ${mvdto.video_view_cnt }
					  		</td>
					  		<td>
					  			${mvdto.video_regdate }
					  		</td>
					  		<td>
					  			<c:if test="${mvdto.video_good == 0 }">
					  				0%
					  			</c:if>
					  			<c:if test="${mvdto.video_good != 0 }">
					  				<fmt:formatNumber var="good" value="${mvdto.getVideo_good() }" pattern="#.##" />
						  			<fmt:formatNumber var="bad" value="${mvdto.getVideo_bad() }" pattern="#.##"/>
						  			<fmt:formatNumber var="answer" value="${(good - bad)/bad }" />	
						  			${answer }%
					  			</c:if>
					  		</td>
					  		<td>
					  			<div>
					  				<button class="modify_btn" onclick="videoModify('${mvdto.video_code}', '${channelOwner.channel_code }')" type="button">
					  					<i class="bi bi-gear"></i>
							    	</button>
					  			</div>
					  		</td>
					  		<td>
					  			<div>
			  						<button class="modify_btn" onclick="videoDelete('${mvdto.video_code}', '${channelOwner.channel_code }', '${mvdto.video_title }')" type="button">
			  							<i class="bi bi-send-x-fill"></i>
			  						</button>
					    		</div>
					  		</td>
					  	</tr>
					  </c:forEach>
					  </tbody>
				    </c:if>
					</table>
				</form>
		    </div>
	    </div>
	  </div>
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script type="text/javascript" src="${path}/resources/hochan_JavaScript/channel_manager.js"></script>
	<script type="text/javascript" src="${path}/resources/hochan_JavaScript/channel_modify.js"></script>
	<!-- member js -->
	<!-- bundle modal -->
	<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
		<div class="modal-dialog modal-sm modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalToggleLabel">재생 목록 생성하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
			        <input type="text" class="bundleName" placeholder="이름을 입력해주세요.">
			    </div>
			    <div class="modal-footer">
			    	<button type="button" class="btn btn-outline-success" onClick="createBundle()">ADD</button>
			    </div>
			</div>
		</div>
	</div>
	<!-- bundle modal End -->
	
	<script src="${path}/resources/member/member_js.js"></script>
</body>
</html>