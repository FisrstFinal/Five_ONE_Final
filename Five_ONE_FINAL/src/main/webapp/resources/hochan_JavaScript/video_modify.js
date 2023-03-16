/**
 * 
 */

// 처음 영상 이름
const originVideo = $(".video_field").val(); 
const imgName = $(".img_field").val();


$(function() {
	$("#input_file").on("change", function() {
		videoName = $("#input_file").val();
		$(".video_field").val(videoName);
	});
	//.toString().split('/').pop().split('\\').pop()
	// 이미지를 변경했을시
	$("#autoSizingInputGroup").on("change", function() {
		if($("#autoSizingInputGroup").val() != "") {
			let imgName = $("#autoSizingInputGroup").val();
			$(".img_field").val(imgName.toString().split('/').pop().split('\\').pop());	
		} else if($("#autoSizingInputGroup").val() == "") {
			$(".img_field").val("파일을 선택해주세요");
		}
	});
});