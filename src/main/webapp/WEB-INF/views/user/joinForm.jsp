<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>** UserJoin **</title>
   <link rel="stylesheet" type="text/css" href="resources/myLib/myStyle.css">
   <script src="resources/myLib/jquery-3.2.1.min.js"></script>
   <script src="resources/myLib/inCheck.js"></script>
   <script>
      function idDupCheck() {
         // 1) id 무결성 확인
         if (iCheck == false) {
            iCheck = idCheck();
         } else {
            // 2) 서버로 확인 요청 => 결과는 새 창으로 처리
            let url = 'idDupCheck?id=' + $('#id').val();
            window.open(url, '_blank', 'width = 400, height = 300, resizable = yes, scrollbars = yes, toolbar = no, menubar = yes');
         }
   
      } // idDupCheck
      
   // ----------------------------------------------------------------------------------------------------------
   
      let iCheck = false;
      let pCheck = false;
      let ppCheck = false;
      let nCheck = false;
      let bCheck = false;
      let emCheck = false;
      let dwCheck = false;
      let dCheck = false;
      let phCheck = false;
   
      $(function() {
         $('#id').focus();
   
         $('#id').keydown(function(e) {
            // ** ID
            if (e.which == 13) {
               e.preventDefault();
               $('#password').focus();
            }
         }).focusout(function() {
            iCheck = idCheck();
         }); //id
   
         // ** Password
         $('#password').keydown(function(e) {
            if (e.which == 13) {
               e.preventDefault();
               $('#password2').focus();
            }
         }).focusout(function() {
            pCheck = pwCheck();
         }); // password
   
         // ** Password2
         $('#password2').keydown(function(e) {
            if (e.which == 13) {
               e.preventDefault();
               $('#uname').focus();
            }
         }).focusout(function() {
            ppCheck = pw2Check();
         }); // password2
   
         // ** Uname
         $('#uname').keydown(function(e) {
            if (e.which == 13) {
               e.preventDefault();
               $('#birthday').focus();
            }
         }).focusout(function() {
            nCheck = nmCheck();
         }); // uname
   
         // ** Birthday
         $('#birthday').keydown(function(e) {
            if (e.which == 13) {
               e.preventDefault();
               $('#email').focus();
            }
         }).focusout(function() {
            bCheck = bdCheck();
         }); // birthday
         
         // ** Email
         $('#email_id').keydown(function(e) {
            if (e.which == 13) {
               e.preventDefault();
               $('#dw').focus();
            }
         }).focusout(function() {
            emCheck = emaCheck();
         }); // email_id
         
         $('#dw').keydown(function(e) {
            if (e.which == 13) {
               e.preventDefault();
               $('#phone').focus();
            }
         }).focusout(function() {
            dwCheck = dowCheck();
         }); // dw
         
         $('#domain').keydown(function(e) {
             if (e.which == 13) {
                e.preventDefault();
                $('#phone').focus();
             }
          }).focusout(function() {
             dCheck = doCheck();
          }); // domain
         
         // ** Phone
         $('#phone').keydown(function(e) {
            if (e.which == 13) {
               e.preventDefault();
               $('#submit').focus();
            }
         }).focusout(function() {
            phCheck = phoCheck();
         }); // phone
   
      }); //ready
   
      function inCheck() {
         if (iCheck == false) {
            $('#iMessage').html('id를 확인하세요 !!');
         }
         
         if (pCheck == false) {
            $('#pMessage').html('Password를 확인하세요 !!');
         }
         
         if (ppCheck == false) {
            $('#ppMessage').html('Password가 일치하지 않습니다 !!');
         }
         
         if (nCheck == false) {
            $('#nMessage').html('Name을 확인하세요 !!');
         }
         
         if (bCheck == false) {
            $('#bMessage').html('생년월일을 확인하세요 !!');
         }
         
         if (emCheck == false) {
            $('#emMessage').html('이메일을 확인하세요 !!');
         }
         
         if (dwCheck == false) {
            $('#ewMessage').html('이메일 형식을 맞춰 입력하세요');
         }
         
         if (dCheck == false) {
             $('#dMessage').html('도메인을 선택해주세요');
          }
         
         if (phCheck == false) {
            $('#phMessage').html('핸드폰 번호를 확인하세요 !!');
         }
   
         if (iCheck && pCheck && ppCheck && nCheck && bCheck && emCheck && dwCheck && dCheck && phCheck) { // 전체 있는 거
         //if (iCheck && pCheck && ppCheck && nCheck && bCheck && emCheck && dwCheck && phCheck) { // domain Check 없는 거
         //if (iCheck && pCheck && ppCheck && nCheck && bCheck && emCheck && dCheck && phCheck) { // doWrite 없는 거
            if (confirm("가입하시겠습니까 ? (Yes : 확인 / No : 취소)") == false) {
               alert('가입이 취소되었습니다.');
               return false;
               
            } else
               return true; // submit 진행
               
         } else
            return false;
      } //inCheck
   
      function emailWrite() {
           if ($('#domain').val() == 1)
            $('#dw').attr('type', 'text');
           else 
              $('#dw').attr('type', 'hidden');
      } // emailWrite
   </script>
</head>
<body>
   <h2>** UserJoin **</h2>
   <form action="join" method="post" id="myForm"
      enctype="multipart/form-data">
      <table style="width: 100;">
      
         <tr height="50">
            <th bgcolor="PowderBlue" style="text-align: center;">Image</th>
            <td>
               <img src="" class="select_img"><br> 
               <input type="file" name="uploadimgf" id="uploadimgf">
               <script>
                  $('#uploadimgf').change(function() {
                     if (this.files && this.files[0]) {
                        var reader = new FileReader;
                        reader.readAsDataURL(this.files[0]);
                        
                        reader.onload = function(e) {
                           $(".select_img").attr("src", e.target.result).width(100).height(100);
                        } // onload_function
                     } // if   
                  }); //change
               </script>
            </td>
         </tr>
         
         <tr height="40">
            <th bgcolor="PowderBlue" style="text-align: center;">I D</th>
            <td>
               <input type="text" name="id" id="id" size="20" placeholder="영문, 숫자 5~10자만 가능">
               <button type="button" id="idDup" onclick="idDupCheck()">ID 중복확인</button><br>
               <b><span id="iMessage" class="eMessage"></span></b>
            </td>
         </tr>
         
         <tr height="40">
            <th bgcolor="PowderBlue" style="text-align: center;">PassWord</th>
            <td>
               <input type="password" name="password" id="password" size="20" placeholder="특수문자 반드시 포함"><br>
               <b><span id="pMessage" class="eMessage"></span></b>
            </td>
         </tr>
         
         <tr height=40>
            <th bgcolor="PowderBlue" style="text-align: center;"><label for=password>PW 확인</label></th>
            <td>
               <input type="password" name=password2 id=password2 size="20"><br> 
               <b><span id="ppMessage" class="eMessage"></span></b>
            </td>
         </tr>

         <tr height="40">
            <th bgcolor="PowderBlue" style="text-align: center;">Name</th>
            <td>
               <input type="text" name="uname" id="uname"><br>
               <b><span id="nMessage" class="eMessage"></span></b>
            </td>
         </tr>
         
         <tr height="40">
            <th bgcolor="PowderBlue" style="text-align: center;">Gender</th>
            <td>
               여
               <input type="radio" name="gender" value="1" checked> 
               남
               <input type="radio" name="gender" value="2"><br> 
            </td>
         </tr>

         <tr height="40">
          <th bgcolor="PowderBlue" style="text-align: center;">BirthDay</th>
          <td>
          	<div class="info" id="birthday">
		  <select class="box" id="birth_year">
		    <option disabled selected>출생 연도</option>
		  </select>
		  <select class="box" id="birth_month">
		    <option disabled selected>월</option>
		  </select>
		  <select class="box" id="birth_day">
		    <option disabled selected>일</option>
		  </select>
		</div>         
<!--          <tr height="40">
            <th bgcolor="PowderBlue" style="text-align: center;">BirthDay</th>
            <td>
               <input type="date" name="birthday" id="birthday"><br>
               <b><span id="bMessage" class="eMessage"></span></b>
            </td>
         </tr> -->
         
         <tr height="40">
            <th bgcolor="PowderBlue" style="text-align: center;">Email</th>
            <td>
            	<input type="text" id="email" name="email"> @
            	<input class="box" name="dw" id="dw" type="text"/>
					<select class="box" name="domain" id="domain">
					  <option value="1">직접 입력</option>
					  <option value="naver.com">naver.com</option>
					  <option value="google.com">google.com</option>
					  <option value="hanmail.net">hanmail.net</option>
					  <option value="nate.com">nate.com</option>
					  <option value="kakao.com">kakao.com</option>
					</select>
	               <br>
               <b><span id="emMessage" class="eMessage"></span></b>
            </td>
         </tr>  
        
         <tr height="40">
            <th bgcolor="PowderBlue" style="text-align: center;">Phone</th>
            <td><input type="text" name="phone" id="phone" placeholder="번호만 입력해주세요."><br>
               <b><span id="phMessage" class="eMessage"></span></b>
            </td>
         </tr>
         
         <tr height="40">
            <td></td>
            <td>
               <input type="submit" value="가입" id="submit" onclick="return inCheck()" disabled>&nbsp;&nbsp; 
               <input type="reset" value="취소">
            </td>
               
      </table>
   </form>
   
   <c:if test="${not empty message}">
      <hr>
    <${message}<br>
   </c:if>
   <hr>
   <br> &nbsp;&nbsp;
   <a href="home">[HOME]</a>
   
   <script type="text/javascript">
	//도메인 직접 입력 or domain option 선택
	const domainListEl = document.querySelector('#domain');
	const domainInputEl = document.querySelector('#dw');
	
	// select 옵션 변경 시
	domainListEl.addEventListener('change', (event) => {
  	// option에 있는 도메인 선택 시
  	if(event.target.value !== "1") {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value
    domainInputEl.disabled = true
  	} else { // 직접 입력 시
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = ""
    domainInputEl.disabled = false
  }
});

	// '생년월일' 셀렉트 박스 option 목록 동적 생성
	const birthYear = document.querySelector('#birth_year')
	const birthMonth = document.querySelector('#birth_month')
	const birthDay = document.querySelector('#birth_day')
	
	// option 목록 생성 여부 확인
	isYearOptionExisted = false;
	birthYear.addEventListener('focus', function () {
  	// year 목록 생성되지 않았을 때 (최초 클릭 시)
  	if(!isYearOptionExisted) {
    isYearOptionExisted = true
    for(var i = 1940; i <= 2022; i++) {
      // option element 생성
      const YearOption = document.createElement('option')
      YearOption.setAttribute('value', i)
      YearOption.innerText = i
      // birthYearEl의 자식 요소로 추가
      this.appendChild(YearOption);
    }
  }
});
	
	// option 목록 생성 여부 확인
	isMonthOptionExisted = false;
	birthMonth.addEventListener('focus', function () {
  	// year 목록 생성되지 않았을 때 (최초 클릭 시)
  	if(!isMonthOptionExisted) {
    isMonthOptionExisted = true
    for(var i = 1; i <= 12; i++) {
      // option element 생성
      const MonthOption = document.createElement('option')
      MonthOption.setAttribute('value', i)
      MonthOption.innerText = i
      // birthYearEl의 자식 요소로 추가
      this.appendChild(MonthOption);
    }
  }
});
	
	// option 목록 생성 여부 확인
	isDayOptionExisted = false;
	birthDay.addEventListener('focus', function () {
  	// year 목록 생성되지 않았을 때 (최초 클릭 시)
  	if(!isDayOptionExisted) {
    isDayOptionExisted = true
    for(var i = 1; i <= 31; i++) {
      // option element 생성
      const DayOption = document.createElement('option')
      DayOption.setAttribute('value', i)
      DayOption.innerText = i
      // birthYearEl의 자식 요소로 추가
      this.appendChild(DayOption);
    }
  }
});
// Month, Day도 동일한 방식으로 구현
	</script>
</body>
</html>