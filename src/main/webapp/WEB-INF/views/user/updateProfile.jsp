<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>GameZone | 정보 수정</title>
	<link rel="shortcut icon" href="#">
	<!-- Stylesheets -->
	<link rel="stylesheet" href="resources/css/update.css">
	<link rel="stylesheet" href="resources/css/owl.carousel.css" />
	<link rel="stylesheet" href="resources/css/style.css" />
	<link rel="stylesheet" href="resources/css/animate.css" />
	<link rel="shortcut icon" href="resources/img/icon2.ico">
	<script src="resources/myLib/jquery-3.2.1.min.js"></script>
	<script src="resources/myLib/inCheck.js"></script>

    <script>
 // ----------------------------------------------------------------------------------------------------------
    	let nCheck = false;
        let emCheck = false;
        let dwCheck = false;
        let dCheck = false;
        let phCheck = false;

        $(function () {
        	$('#user_name').focus();

           	$('#user_name').keydown(function (e) {
            	// ** Name
                if (e.which == 13) {
                	e.preventDefault();
                    $('#email').focus();
                }
			}).focusout(function () {
            	nCheck = nmCheck();
            }); //id
            
         	// ** Phone
            $('#phone').keydown(function (e) {
            	if (e.which == 13) {
                	e.preventDefault();
                    $('#email').focus();
                }
            }).focusout(function () {
                phCheck = phoCheck();
            }); // phone

            // ** Email
            $('#email').keydown(function (e) {
            	if (e.which == 13) {
                	e.preventDefault();
                    $('#domain').focus();
                }
            }).focusout(function () {
            	emCheck = emaCheck();
            }); // email

            $('#dw').keydown(function (e) {
            	if (e.which == 13) {
                	e.preventDefault();
                    $('#submit').focus();
                }
            }).focusout(function () {
            	dwCheck = dowCheck();
            }); // dw

            $('#domain').keydown(function (e) {
	            if (e.which == 13) {
    	            e.preventDefault();
                    $('#submit').focus();
             	}
           	}).focusout(function () {
            	dCheck = doCheck();
            }); // domain

            

		}); //ready

		function inCheck() {

        	if ($('#user_name').val() == '${one.user_name}') {
            	nCheck = true;
            }

            if (nCheck == false) {
           		 $('#nMessage').html('Name을 확인하세요 !!');

            }
            
            if ($('#phone').val() == '${one.phone}') {
            	phCheck = true;
            }

            if ($('#email').val() == '${one.email}') {
            	emCheck = true;
            }

            if (emCheck == false) {
            	$('#emMessage').html('이메일을 확인하세요 !!');
            }

            if ($('#dw').val() == '${one.domain}') {
         	   dwCheck = true;
            }

            if (dwCheck == false) {
            	$('#dwMessage').html('이메일 형식을 맞춰 입력하세요');
            }

            if (dCheck == false) {
           		$('#dMessage').html('도메인을 선택해주세요');
            }

            if (phCheck == false) {
            	$('#phMessage').html('핸드폰 번호를 확인하세요 !!');
            }

            if ($('#domain').val() == 1) {
            	dCheck = true;

            } else {
            	dwCheck = true;
            }

            if (nCheck && phCheck && emCheck && dwCheck && dCheck) {
            	//if (nCheck && bCheck && emCheck && phCheck) {
            	if (confirm("수정하시겠습니까? (Yes : 확인 / No : 취소)") == false) {
                	alert('수정이 취소되었습니다.');
                    return false;

                } else
                	alert('수정되었습니다.');
                	return true;

			} else {
            	alert('오류가 있습니다.' + nCheck + phCheck + emCheck + dwCheck + dCheck);
                return false;
            }

		} //inCheck
	</script>
</head>

	<body>
    	<!-- Header section -->
	   <header class="header-section">
	      <div>
	         <!-- logo -->
	         <a class="site-logo" href="home">
	            <img src="resources/img/logo22.png" alt="gamelogo">
	         </a>
	         <!-- site menu -->
	         <nav class="main-menu">
	            <ul>
	               <li><a href="home">Home</a></li>
	               <li><a href="axPcGame">PC 게임조회</a></li>
	               <li><a href="axMobileGame">모바일 게임조회</a></li>
	               <li><a href="axFlashGame">플래시 게임</a></li>
	               <li><a href="boardList">자유 게시판</a></li>
	               <li><a href="qnaBoardList">Q&amp;A</a></li>
	            </ul>
	         </nav>
	         <div class="user-panel">
	            <c:choose>
	               <c:when test="${not empty loginID && loginID != 'admin'}">
	                  <a href="detailUser">내 정보 보기</a> / <a href="logout">로그아웃</a>
	               </c:when>
	               <c:when test="${loginID == 'admin'}">
	                  <a href="userList">회원 리스트</a> / <a href="logout">로그아웃</a>
	               </c:when>
	               <c:otherwise>
	                  <a href="loginUser">로그인</a> / <a href="joinForm">회원가입</a>
	               </c:otherwise>
	            </c:choose>
	         </div>
	      </div>
	   </header>
	   <!-- Header section end -->

         <form action="updateProfile" method="post" enctype="multipart/form-data">
            <div class="container rounded bg-white">
               <div class="row">
                  <div class="col-md-3">
                     <div class="d-flex flex-column align-items-center text-center p-3 pt-5">
                        <img src="${one.uploadimg}" class="select_img" width="230" height="300"> 
                        <input type="hidden" name="uploadimg" value="${one.uploadimg}"><br> 
                        <input type="file" name="uploadimgfile" id="uploadimgfile">
                        <script>
                           $('#uploadimgfile').change(function () {

                              if (this.files && this.files[0]) {
                                 var reader = new FileReader;
                                 reader.readAsDataURL(this.files[0]);

                                 reader.onload = function (e) {
                                    $(".select_img").attr("src", e.target.result).width(100).height(100);
                                 } // onload_function

                              } // if

                           }); // change
                        </script>

                        <input type="text" class="font-weight-bold profile_id" value="${one.id}" name="id" id="id" readonly>
                        <input type="text" class="text-black-50 profile_email" value="${one.email}${one.domain}" readonly>
                     </div>
                  </div>
                  <div class="col-md-5">
                     <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                           <h4 class="text-right text-white">Profile Settings</h4>
                        </div>
                        <div class="row mt-3">
                           <div class="col-md-12">
                              <label class="labels">Name</label>
                              <input type="text" class="form-control" name="user_name" id="user_name" value="${one.user_name}">
                              <b><span id="nMessage" class="eMessage"></span></b>
                           </div>

                           <!-- gender  -->
                           <div class="gcol-md-12">
                              <label class="labels">Gender</label><br>
                              <div class="radio_m">
                                 <span class="gradio_w">여</span> 
                                 <input class="gradio" type="radio" name="gender" value="1" <c:if test="${one.gender == 1}">checked</c:if>>
                                 <span class="gradio_m">남</span> 
                                 <input class="gradio" type="radio" name="gender" value="2" <c:if test="${one.gender == 2}">checked</c:if>><br>
                              </div>
                           </div>
                           <!-- gender -->
                           
                           <div class="col-md-12">
                              <label class="labels">Phone</label><input type="text" class="form-control" name="phone"
                                 id="phone" value="${one.phone}"><br> <b><span id="phMessage"
                                    class="eMessage"></span></b>
                           </div>

                           <div class="ecol-md-12">
                              <label class="labels">Email</label><br> 
                              <input type="text" class="eform-control" id="email" name="email" value="${one.email}">
                              <input name="dw" class="dform-control" id="dw" type="text" value="${one.domain}">
                              <select class="email-select" name="domain" id="domain">
                                 <option value="1">직접 입력</option>
                                 <option value="@naver.com">@naver.com</option>
                                 <option value="@google.com">@google.com</option>
                                 <option value="@daum.net">@hanmail.net</option>
                                 <option value="@nate.com">@nate.com</option>
                                 <option value="@kakao.com">@kakao.com</option>
                              </select> <br> <b><span id="emMessage" class="eMessage"></span></b>
                           </div>
                           
                        </div>
                     </div>
                     <div class="button">
                        <div class="text-center">
                           <input class="btn btn-primary" type="submit" id="submit" value="저장" onclick="return inCheck()">
                        </div>
                        <div class="text-center">
                           <input class="btn btn-primary" type="reset" value="취소">
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </form>

		<!-- Footer section -->
	    <footer class="footer-section">
	       <div class="container">
	          <ul class="footer-menu">
	             <li><a href="home">Home</a></li>
	             <li><a href="axPcGame">PC 게임</a></li>
	             <li><a href="axMobileGame">모바일 게임</a></li>
	             <li><a href="boardList">자유 게시판</a></li>
	             <li><a href="qnaBoardList">Q&amp;A</a></li>
	          </ul>
	          <p class="copyright">
	             Copyright &copy;
	             <script>
	                         document.write(new Date().getFullYear());
	                   </script>
	             All rights reserved | This template is made with <i
	                class="fa fa-heart-o" aria-hidden="true"></i> by <a
	                href="#" target="_blank">GameZone</a>
	          </p>
	       </div>
	    </footer>
	    <!-- Footer section end -->

         <!--====== Javascripts & Jquery ======-->
         <!--    <script src="resources/js/jquery-3.2.1.min.js"></script>
   <script src="resources/js/bootstrap.min.js"></script>
   <script src="resources/js/owl.carousel.min.js"></script>
   <script src="resources/js/jquery.marquee.min.js"></script>
   <script src="resources/js/main.js"></script> -->
         <script type="text/javascript">
            //도메인 직접 입력 or domain option 선택
            const domainListEl = document.querySelector('#domain');
            const domainInputEl = document.querySelector('#dw');

            // select 옵션 변경 시
            domainListEl.addEventListener('change', (event) => {
               // option에 있는 도메인 선택 시
               if (event.target.value !== "1") {
                  // 선택한 도메인을 input에 입력하고 disabled
                  domainInputEl.value = event.target.value
                  domainInputEl.disabled = true
               } else { // 직접 입력 시
                  // input 내용 초기화 & 입력 가능하도록 변경
                  domainInputEl.value = ""
                  domainInputEl.disabled = false
               }
            })
         </script>
	</body>

      </html>