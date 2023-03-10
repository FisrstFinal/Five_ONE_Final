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

 // 수정 버튼 클릭시
$(".up_btn").on("click", function() {
		if($("#exampleDataList").val().trim() != "") {
			if($("#floatingTextarea2").val().trim() == "") {
				$("#floatingTextarea2").val("null");
			}
			
			console.log("test");
			// 공개 여부
			const radioOpenId = $('input[name=flexRadioDefault_openClose]:checked').attr("id");
			const radioOpen = $("label[for='" + radioOpenId + "']");
			
			// 아동용, 성인용
			const radioAgeId = $('input[name=flexRadioDefault_age]:checked').attr("id");
			const radioAge = $("label[for='" + radioAgeId + "']");
			
			const inputAge = `<input type='hidden' name='select_Age' value='${radioAge}' >`;
			const inputOpen = `<input type='hidden' name='select_openClose' value='${radioOpen}'>`;
			
			const bundle = $("#bundleCheck option:selected").text();
			const bundleTag = `<input type='hidden' name='bundleText' value='${bundle}'>`;
			
			$(".age_select").append(inputAge);
			$(".open_check").append(inputOpen);
			$(".bundleDiv").append(bundleTag);

		
			if($("#input_file").val() != "") {
				const vname = $("#input_file").val();	
				$("#video_name").val(vname);
			} else if($("#input_file").val() == "") {
				$("#video_name").val(originVideo);
			} else {
				history.back();
			}
			
			if($("#autoSizingInputGroup").val() != "") { // 빈값이 아니라면
				const iname = $("#autoSizingInputGroup").val();
				$("#img_name").val(iname); // text에 값 넣기
			} else if($(".img_field") == "파일을 선택해주세요") {  // 이미지가 없는 경우, 추가를 안한 경우
				$(".img_field").val("파일을 선택해주세요");
			}
			
			$("#formData").submit();
		} else {
			alert("제목을 입력 안하셨어요 :)");
		}
});