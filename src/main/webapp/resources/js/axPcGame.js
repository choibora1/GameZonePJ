// ** Ajax_PC Game List **

$(function() {

   // ** Ajax_PC Game List
   $('#axPcGame').click(function() {
   
      let dataForm = $('#pcGameForm').serialize();
      console.log('** dataForm => ' + dataForm);
      $.ajax({
         type: 'Get',
         url: 'pcGameList',
         data: dataForm,
         success: function(resultPage) {
            console.log('** resultPage => ');
            $('#resultArea1').html(resultPage);
         },
         error: function() {
            //$('#resultArea1').html('');
            $('#resultArea1').html('** 서버 오류 ! 잠시 후 다시 시도해주세요');
         }

      }); // ajax
   }); // axPcGame_click
}); // ready