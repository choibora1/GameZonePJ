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
				$('#resultArea1').html('');
				$('#resultArea1').html('~~ 서버 오류 !! 잠시후 다시 시도 하세요 ~~');
 			}
 		}); //ajax
 	
 	}); //axmlist_click








 
 // ** Ajax_BoardList
 








 }); //ready
 
 
 
 