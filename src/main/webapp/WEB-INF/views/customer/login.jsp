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
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">로그인</div>
                    <div class="card-body">
                        <form>
                            <div class="form-group row">
                                <label for="hmal_id" class="col-md-4 col-form-label text-md-right">아이디</label>
                                <div class="col-md-6">
                                    <input type="text" id="hmal_id" name="hmal_id" class="form-control" placeholder="아이디" required>
                                </div> 
                            </div>

                            <div class="form-group row">
                                <label for="hmal_pw" class="col-md-4 col-form-label text-md-right">비밀번호</label>
                                <div class="col-md-6">
                                    <input type="password" id="hmal_pw" name="hmal_pw" class="form-control" placeholder="비밀번호" required>
                                </div>
                            </div>
                            
							<!-- 
                            <div class="form-group row">
                                <div class="col-md-6 offset-md-4">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="remember"> Remember Me
                                        </label>
                                    </div>
                                </div>
                            </div>
                            -->					        
					        
                            						
                            <div style="text-align: center">
                                <button type="button"  id="btnlogin" class="btn btn-light center">로그인</button>	                  
                            	<button type="button"  id="btnFindPw" class="btn btn-warning center">비밀번호 찾기</button>                                
                            </div>
                             
                          </form>
                    	</div>
                    	
                </div>
            </div>
        </div>
  

   
   
</div>

<script>
  
  $(document).ready(function(){

    //로그인
    $("#btnlogin").on("click", function(){

      let hmal_id = $("#hmal_id");
      let hmal_pw = $("#hmal_pw");

      if(hmal_id.val() == "" || hmal_id.val() == null){
        alert("아이디를 입력하세요.");
        hmal_id.focus();
        return;
      }

      if(hmal_pw.val() == "" || hmal_pw.val() == null){
        alert("비밀번호를 입력하세요.");
        hmal_pw.focus();
        return;
      }

      $.ajax({
          url: '/customer/login',
          type: 'post',
          dataType: 'text',
          data: { hmal_id : hmal_id.val(), hmal_pw : hmal_pw.val() },
          success: function(data){
            
            if(data == "success"){
              alert("로그인 성공.");
              location.href = "/";
            }else if(data == "idFail"){
              alert("아이디를 확인해주세요.");
              hmal_id.focus();
              
            }else if(data == "pwFail"){
              alert("비밀번호를 확인해주세요.");
              hmal_pw.focus();
            }
          } 
        });
      });
    
      $("#btnFindPw").on("click", function(){
    	 location.href = "/customer/findPw"; 
      });
  });

</script>

    
  </body>
</html>
