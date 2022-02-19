<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Hmarket</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <!-- <link href="pricing.css" rel="stylesheet"> -->
  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<!-- 
<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">Pricing</h1>
  <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It’s built with default Bootstrap components and utilities with little customization.</p>
</div>
 -->
<div class="container">
  
  <!-- 회원가입 작업 -->
  <div class="py-5 text-center">
  	<h3>회원가입</h3>
  </div>
  
  <div class="col-md-12 order-md-1">
	  <form action="/customer/join" method="post" id="joinForm">
	  <div class="form-row">
	    <div class="col-md-10">
		    <label for="hmal_id">아이디</label>
		    <input type="text" class="form-control" id="hmal_id" name="hmal_id">
		</div>
		<div class="col-md-2">
			<label id="idUseState">&nbsp;</label>
		    <button type="button" class="form-control" id="btnUseIDChk">중복체크</button>
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label for="hmal_pw">비밀번호</label>
	    <input type="password" class="form-control" id="hmal_pw" name="hmal_pw">
	  </div>
	  <div class="form-group">
	    <label for="hmal_pwcheck">비밀번호 확인</label>
	    <input type="password" class="form-control" id="hmal_pwcheck" name="hmal_pwcheck">
	  </div>
	  <div class="form-group">
	    <label for="hmal_name">이름</label>
	    <input type="text" class="form-control" id="hmal_name" name="hmal_name">
	  </div>

	  <div class="form-row">
	    <div class="col-md-6">
		    <label for="hmal_email">이메일</label>
		    <input type="text" class="form-control" id="hmal_email" name="hmal_email">
		  </div>	
		  <div class="col-md-2">
			  <label for="btnMailCertiReq">메일확인바랍니다.</label>
		    <button type="button" class="form-control" id="btnMailCertiReq">메일인증요청</button>
	    </div>   
	    <div class="col-md-2">
		    <label for="certi_mail">메일인증코드입력</label>
		    <input type="text" class="form-control" id="certi_mail" name="certi_mail">
		  </div>	
		  <div class="col-md-2">
			  <label id="certiMailState">&nbsp;</label>
		    <button type="button" class="form-control" id="btnMailCertiConfirm">메일인증확인</button>
	    </div>	    
	  </div>
	 
	   <div class="form-row">
	   <div class="col-md-2">
	      <label for="hmal_zipcode">우편번호</label>
	      <input type="text" class="form-control" id="hmal_zipcode" name="hmal_zipcode">
	    </div>
	    <div class="col-md-2">
	      <label for="btnPostCode">&nbsp;</label>
	      <input type="button" class="form-control" id="btnPostCode" name="btnPostCode"  value="우편번호찾기" onclick="sample2_execDaumPostcode()">
	    </div>
	    <div class="col-md-4">
	      <label for="hmal_addr">기본주소</label>
	      <input type="text" class="form-control" id="hmal_addr" name="hmal_addr">
	    </div>
	    <div class="col-md-4">
	      <label for="hmal_deaddr">상세주소</label>
	      <input type="text" class="form-control" id="hmal_deaddr" name="hmal_deaddr">
          <input type="hidden" id="sample2_extraAddress" placeholder="참고항목">
	    </div>	    
	   </div>

	   <div class="form-group">
      	<label for="hmal_phone">전화번호</label>
      	<input type="text" class="form-control" id="hmal_phone" name="hmal_phone">        
       </div>     	   
	
	  <button type="submit" id="btnJoin" class="btn btn-primary">회원가입</button>
	  <button type="reset" class="btn btn-primary" >취소</button>
	</form>
</div>  
  

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

  $(document).ready(function(){
	  
    // 아이디중복체크
    let isReID = false;
    
    // 메일인증확인체크
    let isMailCertiConfirm = false;
	
    $("#joinForm").on("submit", function(){
      
      console.log("아이디중복체크? " + isReID)
      
      if(isReID == false){
        alert("아이디 중복체크 확인바람");		  
        $("#hmal_id").focus();
        return false;
      }
      
      if(isMailCertiConfirm == false){
        alert("메일인증요청 확인바람");
        $("#btnMailCertiReq").focus();
        return false;
      }
    });
    
    
    
    
		
	
    //아이디중복체크
    $("#btnUseIDChk").on("click", function(){
	  isReID = false;
      let hmal_id = $("#hmal_id");

      if(hmal_id.val() == "" || hmal_id.val() == null){
        alert("아이디를 입력하세요");
        hmal_id.focus();
        return;
      }

      $.ajax({
        url: '/customer/reID',
        type: 'get',
        dataType: 'text',
        data: { hmal_id : hmal_id.val() },
        success: function(data){
          
          $("#idUseState").css("color","black");
          if(data == "Y"){
            isReID = true;
            $("#idUseState").html("아이디 사용가능");
          }else if(data == "N"){
        	  hmal_id.val("");
            $("#idUseState").css("color","red");
            $("#idUseState").html("아이디 사용불가능");
          }
        }
      });
    });


    //메일인증요청
    $("#btnMailCertiReq").on("click", function(){
      isMailCertiConfirm = false;
      let hmal_email = $("#hmal_email");

      if(hmal_email.val() == "" || hmal_email.val() == null){
        alert("메일주소를 입력하세요.");
        hmal_email.focus();
        return;
      }

      $.ajax({
        url: '/customer/certiMail',
        type: 'get',
        dataType: 'text',
        data: { hmal_email : hmal_email.val() },
        success: function(data){
          
          if(data == "success"){
        	  isMailCertiConfirm = true;
            alert("인증요청 메일발송됨.");
          }else if(data == "fail"){
        	  alert("인증요청 메일발송 에러.");
          }
        }
      });
    });
    
  	// 메일인증 확인
    $("#btnMailCertiConfirm").on("click", function(){
      
      let certi_mail = $("#certi_mail");

      if(certi_mail.val() == "" || certi_mail.val() == null){
        alert("인증코드를 입력하세요.");
        certi_mail.focus();
        return;
      }

      $.ajax({
        url: '/customer/mailCertiConfirm',
        type: 'get',
        dataType: 'text',
        data: { hCertiCode : certi_mail.val() },
        success: function(data){
          
          if(data == "success"){        	
            alert("인증요청 성공.");
          }else if(data == "fail"){
        	  alert("인증요청 실패\n 인증코드를 다시 입력하세요. 또는 인증요청을 다시 하기바랍니다.");
        	  certi_mail.val("");
          }
        }
      });
    });

  	
    
    
  });


</script>

<!--우폅번호 DAUM API-->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>
  
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      // 우편번호 찾기 화면을 넣을 element
      var element_layer = document.getElementById('layer');
  
      function closeDaumPostcode() {
          // iframe을 넣은 element를 안보이게 한다.
          element_layer.style.display = 'none';
      }
  
      function sample2_execDaumPostcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      document.getElementById("sample2_extraAddress").value = extraAddr;
                  
                  } else {
                      document.getElementById("sample2_extraAddress").value = '';
                  }
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById("hmal_zipcode").value = data.zonecode;
                  document.getElementById("hmal_addr").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("hmal_deaddr").focus();
  
                  // iframe을 넣은 element를 안보이게 한다.
                  // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                  element_layer.style.display = 'none';
              },
              width : '100%',
              height : '100%',
              maxSuggestItems : 5
          }).embed(element_layer);
  
          // iframe을 넣은 element를 보이게 한다.
          element_layer.style.display = 'block';
  
          // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
          initLayerPosition();
      }
  
      // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
      // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
      // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
      function initLayerPosition(){
          var width = 300; //우편번호서비스가 들어갈 element의 width
          var height = 400; //우편번호서비스가 들어갈 element의 height
          var borderWidth = 5; //샘플에서 사용하는 border의 두께
  
          // 위에서 선언한 값들을 실제 element에 넣는다.
          element_layer.style.width = width + 'px';
          element_layer.style.height = height + 'px';
          element_layer.style.border = borderWidth + 'px solid';
          // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
          element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
          element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
      }
  </script>




    
  </body>
</html>
