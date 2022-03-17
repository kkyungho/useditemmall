<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>Hmarket</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
        
   
  </head>
  <body>
    
<!-- 헤더정보 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
<br>
<!-- 카테고리정보 -->
<%@include file="/WEB-INF/views/include/category.jsp" %>
<br>
<div class="container">
  
  <!-- 회원가입 폼 작업 -->  
  <section class="content container-fluid">
  	<div class="container" style="width: 70%; min-width: 900px; background-color: white; font-size: 16px;">
  		<form action="/customer/changeOut" method="post">
		  <div class="container" style="width: 800px; padding: 10% 5%;">
		  	<h4>비밀번호 찾기</h4>
		  	<br>		    
			<div class="form-group">
	    		<label for="hmal_email">이메일 주소 입력</label>
	    		<input type="text" class="form-control" id="hmal_email" name="hmal_email"
	    			placeholder="이메일주소" style="max-width: 630px;">
	    	</div>
	    	<div class="form-group row">                                
                <div class="col-md-12">
                    <button type="button" id="btnMailSend" class="btn btn-warning">메일 전송</button>
                </div>
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
    	 
    	  let hmal_email = $("#hmal_email");
    	  
    	  if(hmal_email.val() == "" || hmal_email.val() == null){
    		  alert("인증코드를 입력하세요.");
    		  hmal_email.focus();
    		  return;
    	  }
    	  
    	  $.ajax({
    		 url: '/customer/findPw',
    		 type: 'post',
    		 dataType: 'text',
    		 data: { hmal_email : hmal_email.val() },
    		 success: function(data){
    			 
    			 if(data == "success"){
    				 alert("임시비밀번호가 메일발송했습니다. \n변경바랍니다.");    				 
    			 }else if(data == "fail"){
    				 alert("메일발송시 문제가 발생했습니다. 다시 진행해주세요. \n 문제가 발생시 관리자에게 연락주세요.")
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