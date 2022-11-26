/*
 < ** 입력값의 무결성 확인 >
  ** user 무결성 확인사항
  ID : 길이(5이상 10이하), 영문자, 숫자로만 구성
  Password : 길이(8이상 15이하), 영문, 숫자, 특수문자로 구성, 특수문자는 반드시 1개 이상 포함할 것
  Name : 길이(2이상), 영문 또는 한글로만 입력
  BirthDay : 입력 여부 확인  ( length == 10 )
  Email : 직접입력이나 select 했는지
  Phone : '-' 없이 숫자 11자리 입력했는지

 < ** 작성 규칙 >
   => JavaScript function으로 정의 하고 
      결과를 true or false로 return
 */
function idCheck() {

   let id = $('#id').val();
   
   if (id.length < 5 || id.length > 10) {
      $('#iMessage').html('ID 길이는 5 ~ 10자리입니다.');
      return false;

   } else if (id.replace(/[a-z.0-9]/g, '').length > 0) {
      $('#iMessage').html('ID는 알파벳 소문자, 숫자로만 입력하세요.');
      return false;
      
   } else {
      $('#iMessage').html('');
      return true;
   }

} // idCheck

//--------------------------------------------------------------------------------------

function pwCheck() {

   let password = $('#password').val();

   if (password.length < 8 || password.length > 15) {
      $('#pMessage').html('Password는 8 ~ 15자리입니다.');
      return false;

   } else if (password.replace(/[!-*.@]/gi, '').length >= password.length) {
      $('#pMessage').html('Password에는 특수문자가 반드시 포함되어야 합니다.');
      return false;

   } else if (password.replace(/[a-z.0-9.!-*.@]/gi, '').length > 0) {
      $('#pMessage').html('Password는 영문자, 숫자, 특수문자로만 입력하세요.');
      return false;
      
   } else {
      $('#pMessage').html('');
      return true;
   }

} // pwCheck

//--------------------------------------------------------------------------------------