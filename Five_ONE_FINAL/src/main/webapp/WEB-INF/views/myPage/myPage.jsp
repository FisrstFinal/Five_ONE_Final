<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

body {
margin: 0;
padding: 0;
}

#wrap_myPage {
/* background-color: yellow; */
width: 100%;
height: 1080px;
}


/* area 공통 스타일 */
.area_style{
}
/* 왼쪽 사이드 서브 메뉴 영역 */
#sub_menu_area{
background-color: gray;
width: 100px;
height: 1080px;

float: left;
}

/* 중앙 메인 컨텐츠 영역 */
#content_area {
/* background-color: blue; */
width: 60%;
height: auto;
margin-top: 30px;
float: right;
}

/* 오른쪽 사이드 채널 정보 영역 */
#chanel_area {
/* background-color: orange; */
width: 10%;
height: 1000px;
text-align: center;
margin-right: 8%;
margin-left: 1%;
float: right;
}
/* 컨텐츠 박스 공통 스타일 */
.content_box {
background-color: white;
width: 100%;
height: auto;
}

/* 각 컨텐츠 박스 스타일 */
#watch_box {}
#playlist_box {}
#reply_box {}
#good_box {}

.tset_video {
border-radius: 10px;
width: 210px;
margin-right: 2px;
margin-left: 2px;
}

.video_box {
display: inline-block;
margin-right: 0px;
margin-left: 0px;
margin-bottom: 30px;
}

.video_box p {
margin-top: 0px;
/* margin-bottom: 0px; */
}

.test {
width: 100%;
display: inline-block;
}

.content_title1 {
font-size: 20px;
margin-left: 15px;
float: left;
}

.content_title2 {
margin-right: 40px;
float: right;
text-decoration: none;
vertical-align: middle
}
.content_title1 a { text-decoration: none; }
.content_title2 a { text-decoration: none; vertical-align: middle; }

.hr_style { width: 95%; margin-top: 10px; margin-bottom: 10px;}
.video_title_p { font-size: 15px; margin-bottom: -5px;}
.video_channel_p { font-size: 12px; margin-bottom: -15px;}
.video_views_p { font-size: 12px; margin-bottom: -15px;}
.video_upload_p { font-size: 10px; margin-bottom: -10px;}

.info_box {
display: inline-block;
width: 90%;
margin-top: 10px;
margin-bottom: 7px;
}
.info_title {float: left;}
.info_cont {float: right;}
.info_title p { margin: 0px; font-size: 13px;}
.info_cont p { margin: 0px; font-size: 13px;}


#profile_icon {
margin-top: 90px;
overflow: hidden;
}

#profile_icon img{
width: 70px;
height: 70px;
border-radius: 50%;
object-fit: cover;
margin-bottom: 10px;
}
.channel_hr {
width: 90%;
}

#profile_box {
margin-bottom: 30px;
}

/* 로그인 안했을 시 */
#page_none {
width: 100%;
height: 800px;
text-align: center;
}
#none_img {
margin-top: 12%;
}
#none_title {
font-size: 30px;
font-weight: bold;
}
#none_text {
font-size: 17px;
}
#none_btn {

}


/* (foreach) 작성한 댓글 리스트 스타일 */
.reply_list {
display: inline-block;
background-color: gray;
}

/* ======================= 미디어 쿼리 스타일 영역 ======================= */
@media screen and (max-width: 1088px) {
	#chanel_area {
		display: none;
	}
	/* .content_title2 a {
		margin-right: 150px;
	} */
}
@media screen and (max-width: 600px) {
	
	.content_title2 a {
		margin-right: 0px;
	}
}

/* ========================= 미디어 쿼리 end ========================= */
/* ========================= 사이드바 스타일 ========================= */

/* ======================= 사이드바 스타일 end ======================= */

</style>

</head>
<body>

<div id="wrap_myPage">

	<!-- top 영역 -->
	<jsp:include page="../include/top_include.jsp"/>


	<!-- 왼쪽 사이드 서브 메뉴 영역 -->
	<div id="sub_menu_area" class="area_style">
	</div>
	
	<c:set var="c_info" value="${m_channel }" />

	<c:if test="${!empty h_list }">
	<!-- 오른쪽 사이드 채널 정보 영역 -->
	<div id="chanel_area" class="area_style">
		<div id="profile_box">
			<div id="profile_icon">
				<img src="${pageContext.request.contextPath}/resources/img/unnamed.jpg"> 
			</div>
			<div id="profile_name">
				${c_info.getChannel_name() }
			</div>
		</div>
		
		<div id="profile_info">
			<hr class="channel_hr">
			<div class="info_box">
				<div class="info_title">
					<p>구독</p>
				</div>
				<div class="info_cont">
					<p>${fn:length(channel_sub)}</p>
				</div>
			</div>
			<hr class="channel_hr">
			<div class="info_box">
				<div class="info_title">
					<p>업로드</p>
				</div>
				<div class="info_cont">
					<p>${fn:length(channel_video)}</p>
				</div>
			</div>
			<hr class="channel_hr">
			<div class="info_box">
				<div class="info_title">
					<p>좋아요</p>
				</div>
				<div class="info_cont">
					<p>${fn:length(g_list)}</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 중앙 메인컨텐츠 영역 -->
	<div id="content_area" class="area_style">
		
		<!-- [기록(시청한 동영상)] 박스 -->
		<div id="watch_box" class="content_box">
			<div class="test">
				<p class="content_title1"><a href="<%=request.getContextPath() %>/history_list.do">기록</a></p>
				<p class="content_title2"><a href="<%=request.getContextPath() %>/history_list.do">모두보기</a></p>
			</div>
			
			<c:set var="history" value="${h_list }" />
			
			<c:forEach items="${history }" var="h_dto">
			<div class="video_box">
				<video class="tset_video" src="https://blog.kakaocdn.net/dn/bzobdO/btrSnWRB7qk/LAZKJtMKBI4JPkLJwSKCKK/1234.mp4?attach=1&knm=tfile.mp4" controls></video>
				<p class="video_title_p">${h_dto.getVideo_title() }<p>
				<p class="video_channel_p">${h_dto.getChannel_name() }<p>
				<p class="video_views_p">조회수 ${h_dto.getVideo_view_cnt() }회 • ${h_dto.getVideo_regdate().substring(0,10) }<p>
			</div>
			</c:forEach>
		</div>
		
		<hr class="hr_style">
		
		<!-- [재생목록] 박스 -->
		<div id="playlist_box" class="content_box">
			<div class="test">
				<p class="content_title1"><a href="<%=request.getContextPath() %>/playlist_list.do">재생목록</a></p>
				<p class="content_title2"><a href="<%=request.getContextPath() %>/playlist_list.do">모두보기</a></p>
			</div>
			
			<c:set var="playlist" value="${p_list }" />
			
			<c:forEach items="${playlist }" var="p_dto">
			<div class="video_box">
				<video class="tset_video" src="https://blog.kakaocdn.net/dn/bzobdO/btrSnWRB7qk/LAZKJtMKBI4JPkLJwSKCKK/1234.mp4?attach=1&knm=tfile.mp4" controls></video>
				<p class="video_title_p">${p_dto.getVideo_title() }<p>
				<p class="video_channel_p">${p_dto.getChannel_name() }<p>
				<p class="video_views_p">조회수 ${p_dto.getVideo_view_cnt() }회 • ${p_dto.getVideo_regdate().substring(0,10) }<p>
			</div>
			</c:forEach>
		</div>
	
		
		<hr class="hr_style">
		
		<!-- [좋아요 표시한 동영상] 박스 -->
		<div id="good_box" class="content_box">
			<div class="test">
				<p class="content_title1"><a href="<%=request.getContextPath() %>/good_list.do">좋아요 표시한 동영상</a> [갯수]</p>
				<p class="content_title2"><a href="<%=request.getContextPath() %>/good_list.do">모두보기</a></p>
			</div>
			
			<c:set var="good" value="${g_list }" />
			
			<c:forEach items="${good }" var="g_dto">
			<div class="video_box">
				<video class="tset_video" src="https://blog.kakaocdn.net/dn/bzobdO/btrSnWRB7qk/LAZKJtMKBI4JPkLJwSKCKK/1234.mp4?attach=1&knm=tfile.mp4" controls></video>
				<p class="video_title_p">${g_dto.getVideo_title() }<p>
				<p class="video_channel_p">${g_dto.getChannel_name() }<p>
				<p class="video_views_p">조회수 ${g_dto.getVideo_view_cnt() }회 • ${g_dto.getVideo_regdate().substring(0,10) }<p>
			</div>
			</c:forEach>
		</div>
		
		<hr class="hr_style">
		
		<!-- [작성한 댓글 리스트] 박스 -->
		<div id="reply_box" class="content_box">
			<div class="test">
				<p class="content_title1"><a href="<%=request.getContextPath() %>/reply_list.do">작성한 댓글</a> [갯수]</p>
				<p class="content_title2"><a href="<%=request.getContextPath() %>/reply_list.do">모두보기</a></p>
			</div>
			<c:set var="r_list" value="${reply_list }"  />
			<c:forEach items="${r_list }" var="r_dto">
			<div class="reply_list">
				<p>${r_dto.getReply_cont() }</p>
			</div>
			</c:forEach>
			
		</div>
	</div>
	</c:if>
	<c:if test="${empty h_list }">
	<div id="page_none">
		<img id="none_img" src="${pageContext.request.contextPath}/resources/img/myPage_no.jpg">
		<p id="none_title">좋아하는 동영상을 감상해 보세요.</p>
		<p id="none_text">저장하거나 좋아요 표시한 동영상을 보려면 로그인하세요.</p>
		<button id="none_btn">로그인</button>
	</div>
	</c:if>
	
	
	
</div>
	

</body>
</html>