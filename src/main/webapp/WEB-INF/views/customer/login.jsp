<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    
    <title>Hmarket</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
        
        
    <style>
    
    h2{
    	text-align : center;    	
    }
    
    </style>
  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>


<div class="container">
  
  <!-- 로그인 -->  
  <section class="content container-fluid">
     <div class="container" style="width: 450px; height: 620px; background-color: white; margin-top: 30px;">
         <form id="loginForm" class="form-login" action="/customer/login" method="post" style="padding: 50px 30px;">
             <h2 class="form-login-heading">로그인</h2>
             <br><br>
             <label for="hmal_id" class="sr-only">아이디</label>
             <input type="text" id="hmal_id" name="hmal_id" class="form-control" placeholder="아이디" 
             	style="margin-bottom: 15px;" required autofocus>  
             <label for="hmal_pw" class="sr-only">비밀번호</label>
             <input type="password" id="hmal_pw" name="hmal_pw" class="form-control" placeholder="비밀번호" required><br><br>                    
          <div style="text-align: center">
             <button type="button"  id="btnlogin" class="btn btn-light center">로그인</button>	                  
         	<button type="button"  id="btnFindPw" class="btn btn-warning center">비밀번호 찾기</button>                                
          </div>
         </form>
     </div>
  </section>
  
<%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   
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
              alert("회원님 반갑습니다.");
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
