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
<%@include file="/WEB-INF/views/admin/include/pageHeader.jsp" %>
<br>




<div class="container">
  
  <!-- 로그인 -->  
  <section class="content container-fluid">
     <div class="container" style="width: 450px; height: 420px; background-color: white; margin-top: 30px;">
         <form id="adminLoginForm" class="form-login" action="/admin/adminLogin" method="post" style="padding: 50px 10px;">
             <h2 class="form-login-heading">로그인</h2>
             <br><br>
             <label for="ad_userid" class="sr-only">아이디</label>
             <input type="text" id="ad_userid" name="ad_userid" class="form-control" placeholder="아이디" 
             	style="margin-bottom: 15px;" required autofocus>  
             <label for="ad_userpw" class="sr-only">비밀번호</label>
             <input type="password" id="ad_userpw" name="ad_userpw" class="form-control" placeholder="비밀번호" required><br><br>                    
          <div style="text-align: center">          	
            <button type="button"  id="btnLogin" class="btn btn-warning center">로그인</button>       	                                
          </div>
         </form>
     </div>
  </section>  

   
   
</div>

<script>
  
  $(document).ready(function(){

    //로그인
    $("#btnLogin").on("click", function(){

      let ad_userid = $("#ad_userid");
      let ad_userpw = $("#ad_userpw");

      if(ad_userid.val() == "" || ad_userid.val() == null){
        alert("아이디를 입력하세요.");
        ad_userid.focus();
        return;
      }

      if(ad_userpw.val() == "" || ad_userpw.val() == null){
        alert("비밀번호를 입력하세요.");
        ad_userpw.focus();
        return;
      }

      $.ajax({
          url: '/admin/adminLogin',
          type: 'post',
          dataType: 'text',
          data: { ad_userid : ad_userid.val(), ad_userpw : ad_userpw.val() },
          success: function(data){
            
            if(data == "success"){              
              location.href = "/admin/main";
            }else if(data == "idFail"){
              alert("아이디를 확인해주세요.");
              ad_userid.focus();
              ad_userid.val("");
              return;
              
            }else if(data == "pwFail"){
              alert("비밀번호를 확인해주세요.");
              ad_userpw.focus();
              ad_userpw.val("");
              return;
              
            }
          } 
        });
      });
    
  });

</script>

    
  </body>
</html>
