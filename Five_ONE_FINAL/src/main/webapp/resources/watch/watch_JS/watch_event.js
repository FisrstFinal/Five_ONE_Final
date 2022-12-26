/**
 * 
 */

let feedback_code;

function getSession(){

	let res;
	$.ajax({
		url : getContextPath() +"/getSession.do",
		async : false,
		ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
		success : function(data){
			if(data){
				res = data;
			}
		},
		error : function(request, status, error){
			console.log("code: " + request.status);
			console.log("message: " + request.responseText);
			console.log("error: " + error);
		}

	});
	return res;
}
 
$(document).ready(function(){

	

	let good_code = $("#good_code").val();
	let video_code = $("#video_code").val();
	let channel_code = $("#channel_code").val();
	let subscribe_code = $("#subscribe_code").val();
	let feedback_code;	

	function getContextPath(){
		
		let path = location.href.indexOf(location.host)+location.host.length;
		
		return location.href.substring(path, location.href.indexOf('/', path+1));
	}




	function changeValue(tag, good_img, bad_img, name){
		
		let check = tag.attr("data-value");



		if(name == "good"){
			if(check == 1){ // 좋아요 취소
				good_img.attr("src", getContextPath() +"/resources/watch/watch_img/good_icon.svg");
				tag.attr("data-value", 0);
			}else if(check == 2){ // 좋아요 수정
				good_img.attr("src", getContextPath() +"/resources/watch/watch_img/good_icon_selected.svg");
				bad_img.attr("src", getContextPath() +"/resources/watch/watch_img/bad_icon.svg");
				tag.attr("data-value", 1);
			}else{ // 좋아요 추가
				good_img.attr("src", getContextPath() +"/resources/watch/watch_img/good_icon_selected.svg");
				tag.attr("data-value", 1);
			}
		}else if(name == "bad"){
			if(check == 2){ // 싫어요 취소
				bad_img.attr("src", getContextPath() +"/resources/watch/watch_img/bad_icon.svg");
				tag.attr("data-value", 0);
			}else if(check == 1){ // 싫어요 수정
				good_img.attr("src", getContextPath() +"/resources/watch/watch_img/good_icon.svg");
				bad_img.attr("src", getContextPath() +"/resources/watch/watch_img/bad_icon_selected.svg");
				tag.attr("data-value", 2);
			}else{ // 싫어요 추가
				bad_img.attr("src", getContextPath() +"/resources/watch/watch_img/bad_icon_selected.svg");
				tag.attr("data-value", 2);
			}
		}
	}

	function insertSubscribe(channel_code){

		let resl
		$.ajax({

			url :  getContextPath() +"/insertSubscribe.do",
			async : false,
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				"channel_code" : channel_code,
			},
			success : function(data){
				console.log('구독성공');
				res = data;
			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}
		});

		return res;
	}

	function deleteSubscribe(subscribe_code){
		
		$.ajax({

			url :  getContextPath() +"/deleteSubscribe.do",
			async : false,
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				"subscribe_code" : subscribe_code,
			},
			success : function(data){
				console.log('구독취소성공');
			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}
		});

	}

	function insertGood(video_code, good_bad){

		let res;

		$.ajax({

			url :  getContextPath() +"/insertGood.do",
			async : false,
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				"video_code" : video_code,
				"good_bad" : good_bad
			},
			success : function(data){
				console.log('insert성공');
				console.log('data> ' +data);

				res = data;
			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}
		});

		return res;
	}

	function deleteGood(video_code, good_code, good_bad){

		$.ajax({

			url :  getContextPath() +"/deleteGood.do",
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				"video_code" : video_code,
				"good_code" : good_code,
				"good_bad" : good_bad
			},
			success : function(data){
				console.log('delete성공');

			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}

		});	
	}

	function updateGood(video_code, good_code, good_bad){
		
		$.ajax({

			url :  getContextPath() +"/updateGood.do",
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				"video_code" : video_code,
				"good_code" : good_code,
				"good_bad" : good_bad
			},
			success : function(data){
				console.log('update성공');
			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}

		});			
	}

	function insertFeedback(video_code, reply_code, feedback_good){

		let res;

		console.log('v>' +video_code);
		console.log("r>" +reply_code);

		$.ajax({

			url :  getContextPath() +"/insertFeedback.do",
			async : false,
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				"video_code" : video_code,
				"reply_code" : reply_code,
				"feedback_good" : feedback_good
			},
			success : function(data){
				res = data;
			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}

		});
		return res;
	}

	function deleteFeedback(feedback_code, feedback_good){

		console.log('c>' +feedback_code);

		$.ajax({

			url :  getContextPath() +"/deleteFeedback.do",
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				"feedback_code" : feedback_code,
				"feedback_good" : feedback_good
			},
			success : function(data){
				console.log('feedback delete');
			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}

		});

	}

	function updateFeedback(feedback_code, feedback_good){
		$.ajax({

			url :  getContextPath() +"/updateFeedback.do",
			ContentType : "application/x-www-form-urlencoded;charset=UTF-8",
			data : {
				"feedback_code" : feedback_code,
				"feedback_good" : feedback_good
			},
			success : function(data){
				console.log('feedback update');
			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}

		});
	}


	function inputReply(video_code, reply_cont, reply_comment){

		$.ajax({
			url : getContextPath() +"/inputReply.do",
			data : {
				"video_code" : video_code,
				"reply_cont" : reply_cont,
				"reply_comment" : reply_comment
			},
			success : function(data){
				console.log('성공');
				console.log('data > '+data.reply_code);
			},
			error : function(request, status, error){
				console.log("code: " + request.status);
				console.log("message: " + request.responseText);
				console.log("error: " + error);
			}			

		})
	}



	// 댓글 더보기
  	 $(".reply_cont_box").each(function(){
	        //var content = $(this).children('.content');
	        
	        var content = $(this).find('#input_reply_cont');

	        var content_txt = content.text();
	        var content_html = content.html();
	        var content_txt_short = content_txt.substring(0,100)+"...";
	        var btn_more = $('<span class="more">더보기</span>');

	        $(this).append(btn_more);
	        
	        if(content_txt.length >= 100){
	            content.html(content_txt_short)
	        }
	        
	        btn_more.click(toggle_content);
	        function toggle_content(){
	            if($(this).hasClass('short')){
	                // 접기 상태
	                $(this).html('더보기');
	                content.html(content_txt_short)
	                $(this).removeClass('short');
	            }else{
	                // 더보기 상태
	                $(this).html('간략히');
	                content.html(content_html);
	                $(this).addClass('short');

	            }
	        }
	    }); 
	 
	 // 영상 설명 더보기
 	 $(".cont_box").each(function(){
	        //var content = $(this).children('.content');
	        
	        var content = $(this).find('.cont');

	        var content_txt = content.text();
	        var content_html = content.html();
	        var content_txt_short = content_txt.substring(0,100)+"...";
	        var btn_more = $('<span class="more">더보기</span>');

	        $(this).append(btn_more);
	        
	        if(content_txt.length >= 100){
	            content.html(content_txt_short)
	        }
	        
	        btn_more.click(toggle_content);
	        function toggle_content(){
	            if($(this).hasClass('short')){
	                // 접기 상태
	                $(this).html('더보기');
	                content.html(content_txt_short)
	                $(this).removeClass('short');
	            }else{
	                // 더보기 상태
	                $(this).html('간략히');
	                content.html(content_html);
	                $(this).addClass('short');

	            }
	        }
	 });
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

	 	// 드롭다운 메뉴 클릭
		$(".dropdown_menu").on("click", function(){
		
		console.log('클릭')
		let wrap = $("#dropdown_wrap");

		if(wrap.hasClass("open_wrap")){
			console.log('if');
			wrap.removeClass("open_wrap");
		}else{
			console.log('else');
			wrap.addClass("open_wrap");
		}

		});
		
		// 다른곳 클릭 시 드롭다운 메뉴 닫기 
		$(document).mouseup(function(e){

		if (!$(".dropdown_wrap").is(e.target) && $(".dropdown_wrap").has(e.target).length === 0){

		$(".dropdown_wrap").removeClass("open_wrap");

		}	
		});

		$(".video_option").on("click", function(){
		video_option = $(this).attr("data-value");
		
		getReply(video_code, video_option);
		});

		$(".comment_toggle").on("click", function(){

			reply_group = $(this).attr("data-value");

			let res = getComment(video_code, reply_group);

			$(this).closest(".input_comment").append(res);


		});


		// 네비게이션 클릭
		let scrollNav = $('.test').scrollLeft();
	
		$("#slide_right").on("click", function(){

			scrollNav.scrollLeft(scrollNav + 250);
		});

		$("#slide_left").on("click", function(){
			scrollNav.scrollLeft(scrollNav - 250);
		});
		

		// 구독버튼 클릭
		$("#subscribe_btn").on("click", function(){

			let session = getSession();

			
			if(session){
				if($(this).attr("class") == "subscribe_true"){
					deleteSubscribe(subscribe_code);
					$(this).attr("class", "subscribe_false");
					$(this).children().text("구독");
				}else {
					subscribe_code = insertSubscribe(channel_code);
					$(this).attr("class", "subscribe_true");
					$(this).children().text("구독중");
				}
			}else{
				alert('로그인 해주세요');
			}
		});


 
		// 영상 좋아요 클릭
		$(".watch_good_btn").on("click", function(){

			let session = getSession();

			let check = $(this).parent().attr("data-value");
			let good_img = $(this).find(".good");
			let tag = $(this).parent();
			let bad_img = tag.find(".bad");
			let check_good = "good";
			let good_bad = 1;
			if(session){ // 로그인 체크
					
				if(check == 1){ // 좋아요 취소
					deleteGood(video_code, good_code, good_bad);
					changeValue(tag, good_img, bad_img, check_good);

				}else if(check == 2){ // 좋아요 수정
					updateGood(video_code, good_code, good_bad);
					changeValue(tag, good_img, bad_img, check_good);

				}else{ // 좋아요 추가
					good_code = insertGood(video_code, good_bad);
					changeValue(tag, good_img, bad_img, check_good);

				}	

			}else{ // 로그인 x
				alert('로그인 해주세요');
			}
			
	
		});
		// 영상 싫어요 클릭
		$(".watch_bad_btn").on("click", function(){

			let session = getSession();

			let check = $(this).parent().attr("data-value");
			
			let bad_img = $(this).find(".bad");
			let tag = $(this).parent();
			let good_img = tag.find(".good");
			let check_good = "bad";
			let good_bad = 2;
			if(session){ // 로그인 체크
					
				if(check == 2){ // 싫어요 취소
					deleteGood(video_code, good_code, good_bad);
					changeValue(tag, good_img, bad_img, check_good);

				}else if(check == 1){ // 싫어요 수정
					updateGood(video_code, good_code, good_bad);
					changeValue(tag, good_img, bad_img, check_good);

				}else{ // 싫어요 추가
					good_code = insertGood(video_code, good_bad);
					console.log(good_code);
					changeValue(tag, good_img, bad_img, check_good);

				}	

			}else{ // 로그인 x
				alert('로그인 해주세요');
			}
			
	
		});


		// 댓글 좋아요
		$(document).on("click", ".reply_good_btn", function(){

			let session = getSession();

			let reply_code = $(this).parents().closest(".reply_box").find(".reply_code").val();

			let tag = $(this).parents().closest(".reply_box");

			let check = tag.attr("data-value");
			
			if(tag.attr("data-code")){
				feedback_code = tag.attr("data-code");
			}
			

			let good_img = tag.find(".reply_good");
			let bad_img = tag.find(".reply_bad");

			let check_good = "good";
			let feedback_good = 1;
			if(session){ // 로그인 체크
					
				if(check == 1){ // 좋아요 취소
					console.log('del');
					deleteFeedback(reply_code, feedback_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}else if(check == 2){ // 좋아요 수정
					console.log('up');
					updateFeedback(feedback_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}else{ // 좋아요 추가
					console.log('in');
					feedback_code = insertFeedback(video_code, reply_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}	

			}else{ // 로그인 x
				alert('로그인 해주세요');
			}
			
	
		});
		

		// 댓글 싫어요
		$(document).on("click", ".reply_bad_btn", function(){

			let session = getSession();

			let reply_code = $(this).parents().closest(".reply_box").find(".reply_code").val();
		
			let tag = $(this).parents().closest(".reply_box");

			let check = tag.attr("data-value");

			if(tag.attr("data-code")){
				feedback_code = tag.attr("data-code");
			}

			let good_img = tag.find(".reply_good");
			let bad_img = tag.find(".reply_bad");

			let check_good = "bad";
			let feedback_good = 2;

			if(session){ // 로그인 체크
					
				if(check == 2){ // 싫어요 취소
					deleteFeedback(reply_code, feedback_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}else if(check == 1){ // 싫어요 수정
					updateFeedback(feedback_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}else{ // 싫어요 추가
					feedback_code = insertFeedback(video_code, reply_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}	

			}else{ // 로그인 x
				alert('로그인 해주세요');
			}
			
	
		});		

		// 대댓글 좋아요
		$(document).on("click", ".comment_good_btn", function(){

			let session = getSession();

			let reply_code = $(this).parents().closest(".comment_wrap").find(".reply_code").val();

			console.log('댓글번호 >' +reply_code);

			let tag = $(this).parents().closest(".comment_wrap");

			let check = tag.attr("data-value");
			let feedback_good = 1;
			
			if(tag.attr("data-code")){
				feedback_code = tag.attr("data-code");
			}
			

			let good_img = tag.find(".reply_good");
			let bad_img = tag.find(".reply_bad");

			let check_good = "good";
			if(session){ // 로그인 체크
					
				if(check == 1){ // 좋아요 취소
					console.log('del');
					deleteFeedback(reply_code, feedback_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}else if(check == 2){ // 좋아요 수정
					console.log('up');
					updateFeedback(feedback_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}else{ // 좋아요 추가
					console.log('in');
					feedback_code = insertFeedback(video_code, reply_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}	

			}else{ // 로그인 x
				alert('로그인 해주세요');
			}
			
	
		});		

		// 대댓글 싫어요
		$(document).on("click", ".comment_bad_btn", function(){

			let session = getSession();

			let reply_code = $(this).parents().closest(".comment_wrap").find(".reply_code").val();

			let tag = $(this).parents().closest(".comment_wrap");

			let check = tag.attr("data-value");
			
			if(tag.attr("data-code")){
				feedback_code = tag.attr("data-code");
			}
			

			let good_img = tag.find(".reply_good");
			let bad_img = tag.find(".reply_bad");

			let check_good = "bad";
			let feedback_good = 2;

			if(session){ // 로그인 체크
					
				if(check == 2){ // 싫어요 취소
					console.log('del');
					deleteFeedback(reply_code, feedback_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}else if(check == 1){ // 싫어요 수정
					console.log('up');
					updateFeedback(feedback_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}else{ // 싫어요 추가
					console.log('in');
					feedback_code = insertFeedback(video_code, reply_code, feedback_good);
					changeValue(tag, good_img, bad_img, check_good);

				}	

			}else{ // 로그인 x
				alert('로그인 해주세요');
			}
			
	
		});	

		$("#reply_complete").on("click", function(){
			//let reply_cont = $("#reply_cont").children().text;
			//let reply_cont = document.getElementById('reply_cont').innerText.replace("\r\n","<br>");
			let reply_cont = document.getElementById("reply_cont").innerText.replaceAll("\n","<br>")
			//let join_reply_cont = reply_cont.join();
			
			console.log('내용>' +reply_cont);
			let reply_comment = 0;
			inputReply(video_code, reply_cont, reply_comment);
		});
 
 
 });