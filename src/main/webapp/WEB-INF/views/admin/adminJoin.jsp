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
         <form id="adminJoinForm" class="form-login" action="/admin/adminJoin" method="post" style="padding: 50px 10px;">
             <h2 class="form-login-heading">관리자 등록</h2>
             <br><br>
             <div class="form-group" style="width: 100%;">
			    <label for="ad_userid">✔ 아이디</label><br/>
			    <input type="text" class="form-control" id="ad_userid" name="ad_userid" 
			    	placeholder="아이디를 입력해주세요." style="max-width:540px; width: calc(100% - 100px); margin-right: 5px; display: inline-block;">				
				<button type="button" id="btnUseIDChk" class="btn btn-light">중복확인</button>
			</div>
			<div class="form-group">
	    		<label for="ad_userpw">✔ 비밀번호</label>
	    		<input type="password" class="form-control" id="ad_userpw" name="ad_userpw"
	    			placeholder="비밀번호를 입력해주세요." style="max-width: 630px;">
	    	</div>
	    	<br><br>                    
          <div style="text-align: center">          	
            <button type="submit"  id="btnAdminJoin" class="btn btn-light center" value="관리자 등록">관리자등록</button>       	                                
          </div>
         </form>
     </div>
  </section>
  
<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>
   
   
</div>

<script>
  
  $(document).ready(function(){

	  let form = $("#joinForm");
	    // 아이디중복체크
	    let isReID = false;    
	    			
	    //아이디중복체크
	    $("#btnUseIDChk").on("click", function(){
	    	
		  isReID = false;
	      let ad_userid = $("#ad_userid");

	      if(ad_userid.val() == "" || ad_userid.val() == null){
	        alert("아이디를 먼저 입력해주세요");
	        ad_userid.focus();
	        return;
	      }

	      $.ajax({
	        url: '/admin/reID',
	        type: 'get',
	        dataType: 'text',
	        data: { ad_userid : ad_userid.val() },
	        success: function(data){
	          
	          $("#btnUseIDChk").css("color","black");
	          if(data == "Y"){
	            isReID = true;
	            $("#btnUseIDChk").html("사용가능");
	          }else if(data == "N"){
	        	  ad_userid.val("");
	            $("#btnUseIDChk").css("color","red");
	            $("#btnUseIDChk").html("사용불가능");
	          }
	        }
	      });
	    });
  });

</script>

    
  </body>
</html>
