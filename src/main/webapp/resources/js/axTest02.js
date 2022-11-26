/**
 *  ** AjaxTest 02
	=> 반복문에 이벤트 적용하기
	=> axmlist : id별로 board조회, 관리자기능 (delete 버튼), Image(File)Download 
	=> axblist : 상세글 보기
 */
 
 $(function(){
 
 // ** Ajax_MemberList 
 	$('#axmlist').click(function(){
 		$.ajax({
 			type:'Get',
 			url:'axmlist',
 			success:function(resultPage){
 				$('#resultArea1').html(resultPage);
 			},
 			error:function(){
 				$('#resultArea1').html('~~ 서버 오류 !! 잠시후 다시 하세요 ~~');
 			}
 		}); //ajax
 	}); //axmlist_click
 
 // ** Ajax_BoardList 
 	$('#axblist').click(function(){
 		$.ajax({
 			type:'Get',
 			url:'axblist',
 			success:function(resultPage){
 				$('#resultArea1').html(resultPage);
 			},
 			error:function(){
 				$('#resultArea1').html('~~ 서버 오류 !! 잠시후 다시 하세요 ~~');
 			}
 		}); //ajax
 	}); //axblist_click
 
 	// ** 반복문에 이벤트 적용하기 
 	// test2) JQuery : id, class, this 활용 
	// => id별로 board조회 (요청 id 인식)
 	$('.ccc').click(function() {
 		// 1) 요청 id 인식 
 		let id=$(this).html();  
 			// 또는 $(this).text()
 			// JS : innerHTML, innerTEXT
 		console.log('*** id => '+id);	
 		
 		// 2) ajax 처리
 		$.ajax({
 			type:'Get',
 			url:'aidblist',
 			data: {
 				keyword: id // 컨트롤러에서 SearchCriteria cri 로 처리하기위함
 			},
 			success:function(resultPage){
 				$('#resultArea2').html(resultPage);
 			},
 			error:function(){
 				$('#resultArea2').html('~~ 서버 오류 !! 잠시후 다시 하세요 ~~');
 			}
 		}); //ajax
 	}); //ccc_click
 	
 	// ** id별로 Delete 기능
	// => Response 는 jsonView 로 처리 
	// => Delete 성공/실패 후 표시 
	$('.ddd').click(function() {
 		// 1) 요청 id 인식 
 		// => 이벤트가 일어난 Tag 의 id 속성의 값으로 보관
 		let id = $(this).attr('id');   
 		//id='11111'; // ErrorTest Data
  		console.log('*** id => '+id);	
  		$('#resultArea2').html('');
  		
 		// 2) ajax 처리
 		$.ajax({
 			type:'Post',
 			url:'axmdelete',
 			data: {
 				id: id 
 			},
 			success:function(resultData){
				// ** jaonView 처리 결과
				// => 성공: span 의 컨텐츠를 Deleted, click_event 를 off
 				if ( resultData.code==200 ) {
 					 alert('~~ 삭제 성공 ~~');
 					 /*
 					 $(this).html('Deleted');
 					 => ajax 처리 단계이므로 이미 this는 변경되어 click 시의 this 가 아님
 					    그러므로 this 로는 불가능, id 속성은 가능 
 					 */
 					 
 					 $('#'+id).html('Deleted')
 					 .css({
 					 	color:'Gray',
 					 	fontWeight:'bold'
 					 }).off();
 					 // 이벤트제거 (적용됨) , removeClass 는 적용안됨
 				}else {
 					alert('~~ 삭제 실패 ~~');
 				};
 			},
 			error:function(){
 				$('#resultArea2').html('~~ 서버 오류 !! 잠시후 다시 하세요 ~~');
 			}
 		}); //ajax
 	}); //ddd_click
 
 }); //ready
 
 // ** 반복문에 이벤트 적용하기  
// => id별로 board조회
// test 1) JS function
function aidBList(id) {
	$.ajax({
 			type:'Get',
 			url:'aidblist',
 			data: {
 				keyword: id // 컨트롤러에서 SearchCriteria cri 로 처리하기위함
 			},
 			success:function(resultPage){
 				$('#resultArea2').html(resultPage);
 			},
 			error:function(){
 				$('#resultArea2').html('~~ 서버 오류 !! 잠시후 다시 하세요 ~~');
 			}
 	}); //ajax
} //aidBList 



 
 
 
 
 
 
 
 
 