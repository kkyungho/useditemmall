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
	    
	    form.loginForm{
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

<!-- 로그인 --> 
<div class="container">
  <section class="content container-fluid">
     <div class="container" style="width: 100%; background-color: white; font-size: 16px;">
         <form id="loginForm" class="loginForm" action="/customer/login" method="post" style="padding: 50px 10px;">
         	<div class="container" style="width: 900px; padding: 3% 2px;">
	            <h2>로그인</h2>
	            <br>
	            <div class="form-group" style="margin-left: 250px;"> 
		            <label for="hmal_id" class="sr-only">아이디</label>
		            <input type="text" id="hmal_id" name="hmal_id" class="form-control" placeholder="아이디" 
		             	style="margin-bottom: 15px; max-width: 400px;" required autofocus>  
		            <label for="hmal_pw" class="sr-only">비밀번호</label>
		            <input type="password" id="hmal_pw" name="hmal_pw" class="form-control" placeholder="비밀번호" 
		            	style="max-width: 400px;" required>
            	</div>                  
		        <div style="text-align: center">	                    	
		          <button type="button"  id="btnlogin" class="btn btn-warning center">로그인</button>
		          <button type="button"  id="btnFindIdPw" class="btn btn-light center">아이디 찾기/비밀번호찾기</button>
		        </div>
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
              //alert("회원님 반갑습니다.");
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
      // 아이디 찾기
      $("#btnFindIdPw").on("click", function(){
    	 location.href = "/customer/findId"; 
      });      
      
      
  });

</script>

    
  </body>
</html>
