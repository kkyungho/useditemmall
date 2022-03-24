<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    
    <title>H중고마켓(관리자)</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
        
        
    <style>
    
    h2{
    	text-align : center;    	
    }
    
    </style>
  </head>
  <body>
    
<!-- 헤더정보 -->
<%@include file="/WEB-INF/views/admin/include/header.jsp" %>
<br>




<div class="container">
  
  <!-- 로그인 -->  
  <section class="content container-fluid">
     <div class="container" style="width: 450px; height: 420px; background-color: white; margin-top: 30px;">
         <form id="adminLoginForm" class="form-login" action="/admin/adminLogin" method="post" style="padding: 50px 10px;">
             <h2 class="form-login-heading">로그인</h2>
             <br><br>
             <label for="ad_userid" class="sr-only">아이디</label>
             <input type="text" id="hmal_id" name="ad_userid" class="form-control" placeholder="아이디" 
             	style="margin-bottom: 15px;" required autofocus>  
             <label for="ad_userpw" class="sr-only">비밀번호</label>
             <input type="password" id="ad_userpw" name="ad_userpw" class="form-control" placeholder="비밀번호" required><br><br>                    
          <div style="text-align: center">          	
            <button type="button"  id="btnlogin" class="btn btn-warning center">로그인</button>       	                                
          </div>
         </form>
     </div>
  </section>
  
<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
   
   
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
              hmal_id.val("");
              return;
              
            }else if(data == "pwFail"){
              alert("비밀번호를 확인해주세요.");
              hmal_pw.focus();
              hmal_pw.val("");
              return;
              
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
