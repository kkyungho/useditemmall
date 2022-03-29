<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>중고거래의 시작, H중고마켓</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
    
    <style>
		
		h4{
		    text-align : center;    	
		  }	 	
	  	
	  	  
  	</style>        
    
  </head>
  <body>
    
<!-- 헤더정보 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
<br>
<!-- 카테고리정보 -->
<%@include file="/WEB-INF/views/include/category.jsp" %>
<br>
<!-- 사이드메뉴 -->
<%@include file="/WEB-INF/views/include/sideMenu.jsp" %>
<br>
<div class="container">
  
  <!-- 회원수정 -->  
  	<div class="container" style="width: 100%; min-width: 900px; background-color: white; font-size: 16px;  margin-top: 30px;">
  		<form class="alterUserForm" action="/customer/alterUser" method="post" id="alterUserForm">
		  <div class="container" style="width: 800px; padding: 3% 2px;">
		  	<h4>회원수정</h4><br><br>
		  	<b style="margin-left: 160px;">✔ 아래 항목을 수정해주세요.</b><br><br>
		    <div class="form-group" style="width: 100%; margin-left: 160px;">
			    <label for="hmal_id">아이디</label><br />
			    <input type="text" class="form-control" id="hmal_id" name="hmal_id" 
			    	 style="max-width:400px;" value='<c:out value="${customerVO.hmal_id }" />'  readonly>				
			</div>
			<div class="form-group" style="width: 100%; margin-left: 160px;">
	    		<label for="hmal_pw">비밀번호</label><br />
	    		<input type="password" class="form-control" id="hmal_pw" name="hmal_pw"
	    			style="max-width: 400px; width: calc(100% - 100px); margin-right: 5px; display: inline-block;" value='<c:out value="${customerVO.hmal_pw }" />' readonly>
	    		<input type="button" class="btn btn-outline-dark" id="btnChangePw" name="btnChangePw" value="비밀번호변경"><br>
	    	</div>	    		    	
			<div class="form-group" style="width: 100%; margin-left: 160px;">
			    <label for="hmal_name">이름</label>
			    <input type="text" class="form-control" id="hmal_name" name="hmal_name"
			    	style="max-width: 400px;" value='<c:out value="${customerVO.hmal_name }" />' readonly>
			</div>
			<div class="form-group" style="width: 100%; margin-left: 160px;">
		    	<label for="hmal_email">✔ 이메일</label><br />
		    	<input type="text" class="form-control" id="hmal_email" name="hmal_email"
		    		style="max-width: 400px; width: calc(100% - 115px); margin-right: 5px; display: inline-block;" value='<c:out value="${customerVO.hmal_email }" />'>		    	
		    </div>		    
		    <div class="form-group" style="width: 100%; margin-left: 160px;">
			    <label for="inputAddr">✔  주소</label><br />			      
			    <input type="text" class="form-control" id="hmal_zipcode" name="hmal_zipcode" value='<c:out value="${customerVO.hmal_zipcode }" />'
			     	style="max-width: 300px; width: calc(100% - 128px); margin-right: 5px; display: inline-block;" readonly>
			    <input type="button" class="btn btn-light" id="btnPostCode" name="btnPostCode"  value="우편번호찾기" onclick="sample2_execDaumPostcode()"><br>
			    <input type="text" class="form-control" id="hmal_addr" name="hmal_addr" value='<c:out value="${customerVO.hmal_addr }" />'
			    	style="max-width: 530px; margin: 3px 0px;" readonly>
			    <input type="text" class="form-control" id="hmal_deaddr" name="hmal_deaddr" value='<c:out value="${customerVO.hmal_deaddr }" />'
			    	style="max-width: 530px;">
			    <input type="hidden" id="sample2_extraAddress" >			        
			 </div>
			 <div class="form-group" style="width: 100%; margin-left: 160px;">
		  	 	<label for="hmal_phone">✔  전화번호</label>
      		 	<input type="tel" class="form-control" id="hmal_phone" name="hmal_phone" value='<c:out value="${customerVO.hmal_phone }" />'
      		 		 style="max-width: 400px;">
      		 </div><br><br>      		  
	  		 <div class="form-group text-center">
	  		 	<button type="button" id="btnAlterUser" class="btn btn-light">회원수정</button>
	  			<button type="reset" id="btnCancle" class="btn btn-danger">취소</button>
	  		 </div> 
	  	   </div> 
		</form>	 
	  </div> 
  

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

	$(document).ready(function(){	
		
		let form = $("#alterUserForm");
		
		/* 회원수정 버튼 클릭 시 */ 
		$("#btnAlterUser").on("click", function(){			
			let result = confirm("회원수정을 하시겠습니까?");

            if(result){
                let hmal_email = $("#hmal_email");			
                let hmal_zipcode = $("input[name='hmal_zipcode']");
                let hmal_addr = $("input[name='hmal_addr']");
                let hmal_deaddr = $("input[name='hmal_deaddr']");
                let hmal_phone = $("#hmal_phone");
                
                /* 유효성 검사 */
                
                if(hmal_email.val() == "" || hmal_email.val() == null){
                    alert("이메일을 입력해주세요.");
                    hmal_email.focus();
                    return;			
                
                } else if(hmal_zipcode.val() == "" || hmal_zipcode.val() == null){
                    alert("우편번호를 입력해주세요.");
                    $("#btnPostCode").focus();
                    return;
                    
                } else if(hmal_addr.val() == "" || hmal_addr.val() == null){
                    alert("주소를 입력해주세요.");
                    $("#btnPostCode").focus();
                    return;
                    
                } else if(hmal_deaddr.val() == "" || hmal_deaddr.val() == null){
                    alert("상세주소를 입력해주세요.");
                    hmal_deaddr.focus();
                    return;
                    
                } else {
                    form.submit();
                }
            } 
			
			
		});
		
		// 비밀번호변경버튼 클릭시
		$("#btnChangePw").on("click", function(){
			
			location.href = "/customer/changeOut";
		});
		
		/* 취소 버튼 클릭 시 */
		$("#btnCancle").on("click", function(){
			
			console.log("취소버튼");
			
			let result = confirm("회원 정보 수정을 취소하시겠습니까?");
			
			if(result){
				location.href="/"; 
			} else{}
		});
		
		
		//폼에서 일반버튼<input type="button">을 클릭하면 호출되는 이벤트설정
		
				
		
	
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
