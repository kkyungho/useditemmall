<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>중고거래의 시작, H중고마켓</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
         
        
    <style>	
    
    	h2{
	    	text-align : center;    	
	    } 
	    
	    form.findPwForm{
		  border: 0.01px solid rgb(224, 224, 224); border-collapse: collapse;
		  border-radius: 5px;
		  padding: 15px;
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

<!-- 비밀번호 찾기 -->  
<div class="container">
  <section class="content container-fluid">
  	<div class="container" style="width: 100%; background-color: white; font-size: 16px;">
  		<form id="findPwForm" class="findPwForm" action="/customer/changeOut" method="post">
  		  <div class="container" style="width: 900px; padding: 3% 2px;">
			  <h2>비밀번호찾기</h2><br>
			  	<div class="form-group" style="margin-left: 250px;">             
		            <label for="hmal_name">이름</label>
		            <input type="text" class="form-control" id="hmal_name" name="hmal_name"
			    		placeholder="이름을 입력해주세요." style="max-width: 400px;"><br>
		            <label for="hmal_email">이메일주소</label>
		            <input type="text" class="form-control" id="hmal_email" name="hmal_email"
			    		placeholder="가입하신 이메일주소를 입력해주세요." style="width: 400px;">
		    	</div>                                
	          <div style="text-align: center">          	
	            <button type="button"  id="btnMailSend" class="btn btn-warning center">찾기</button>
	          </div>
          </div>          
		</form>	 
	  </div> 
  </section>
  

   <%@include file="/WEB-INF/views/include/footer.jsp" %> 
   
</div>

<script>
  
  $(document).ready(function(){
    
      // 메일인증확인
      $("#btnMailSend").on("click", function(){
    	 
    	  let hmal_name = $("#hmal_name");
    	  let hmal_email = $("#hmal_email");
    	  
    	  if(hmal_name.val() == "" || hmal_name.val() == null) {
      		alert("이름을 입력하세요");
      		hmal_name.focus();
      		return;
      	  }
    	  
    	  if(hmal_email.val() == "" || hmal_email.val() == null){
    		  alert("이메일을 입력하세요.");
    		  hmal_email.focus();
    		  return;
    	  }
    	  
    	  $.ajax({
    		 url: '/customer/findPw',
    		 type: 'post',
    		 dataType: 'text',
    		 data: { hmal_name : hmal_name.val(), hmal_email : hmal_email.val() },
    		 success: function(data){
    			 
    			 if(data == "success"){
    				 alert("임시비밀번호가 메일발송했습니다. \n임시비밀번호로 로그인해주세요."); 
    				 location.href = "/customer/login";
    			 }else if(data == "fail"){
    				 alert("메일발송시 문제가 발생했습니다. 다시 진행해주세요. \n문제가 발생시 관리자에게 연락주세요.")
    			 }else if(data == "noMail"){
    				 alert("가입하신 메일주소가 다릅니다. 확인해 주세요.");
    			 }
    		 }
    		  
    	  });
    	  
      });
  });
</script>

    
  </body>
</html>