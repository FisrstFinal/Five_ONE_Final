/**
 * 
 */

$(function() {
	$.ajaxSetup({
			ContentType: "application/x-www-form-urlencoded;charset=UTF-8", //한글처리
			type: "post"
	});

	/* 영상 변경시 경고창 */
	$(".modify-btn").on("click", function() {
		if(!confirm("영상을 수정하면 이전 영상을 가져올 수 없습니다. 수정하시겠습니까?")) {
			
		} else {
		 $("#file_mv").click();			
		}
		
	 }); 
});
 
const movieArea = document.querySelector("#movie_area");

/* 영상 변경시 이미지 변경 함수 */
 $("#file_mv").on("change", function(e) {
	 let file = this.files[0];
	 let vaildExtensions = ["video/quicktime", "video/mp4", "video/wmv", "video/avi", "video/avchd", "video/mpeg-2", "video/x-matroska"]; // 모든 목록
	 
	 if(vaildExtensions.includes(file.type)) {
		const channelCode = $("#channelCode").val(); // 채널 코드
		const subVideoCode = $("#subVideoCode").val(); // 비디오 코드
		
		const formData = new FormData();
		const currentFile = $("#file_mv")[0].files[0];
		console.log(currentFile);
		formData.append('file_upload', currentFile);
		
		console.log(channelCode + " " + subVideoCode);
		
		 $.ajax({
			url: getContextPath() + "/movieUpload.do?chCode=" + channelCode + "&mvCode=" + subVideoCode,
			type: 'POST',
			data: formData,
			datatype: 'text',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			success: function(response) {
				let fileReader = new FileReader();
		 		let reader = new FileReader();
		 		
				reader.fileName = file.name;
		 
				fileReader.onload = function(e) {
				fileURL = fileReader.result;
					 
				let videoTag = `<video id="upload_file_btn"><source class="source_tag" src="${fileURL}"></video>`;
					movieArea.innerHTML = videoTag;
				};
				 
				fileReader.readAsDataURL(file);
			},
			error: function(e) {
				console.log('영상 저장 실패: ' + e);
			}
		 });
	 } else {
		 alert('mp4, wmv, avi, mkv 확장자 영상만 업로드 가능해요!');
	 }
});