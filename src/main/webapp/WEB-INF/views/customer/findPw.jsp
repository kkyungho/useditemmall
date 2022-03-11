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
  
  <!-- 회원가입 폼 작업 -->  
  <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">비밀번호 찾기</div>
                    <div class="card-body">
                        <form>
                            <div class="form-group row">
                                <label for="hmal_email" class="col-md-4 col-form-label text-md-left">이메일 주소 입력</label>
                                <div class="col-md-12">
                                    <input type="text" id="hmal_email" name="hmal_email" class="form-control" placeholder="이메일주소">
                                </div> 
                            </div>

                            <div class="form-group row">                                
                                <div class="col-md-12">
                                    <button type="button" id="btnMailSend" class="btn btn-primary">메일 전송</button>
                                </div>
                            </div>                            
							
                             
                          </form>
                    	</div>
                    	
                </div>
            </div>
        </div>
  

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