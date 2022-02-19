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
    <title>Pricing example · Bootstrap v4.6</title>

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
    
    <script>
  	
	  	let msg = '${msg}'; 
	  	if(msg == 'alterUserFail'){
	  		alert("비밀번호를 확인바랍니다.");
	  	}
  
  	</script>
    
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
  <h3>비밀번호변경/회원탈퇴</h3>
  <div class="form-row">
	<div class="col-md-5">	  
	  <label for="ori_hmal_pw">현재비밀번호(비밀번호변경) </label>
	  <input type="password" class="form-control" id="ori_hmal_pw" name="ori_hmal_pw">
	</div>    	   
	<div class="col-md-5">
	   <label for="alter_hmal_pw">변경비밀번호</label>
	   <input type="password" class="form-control" id="alter_hmal_pw" name="alter_hmal_pw" >
	</div>   	      
    <div class="col-md-2">
    	<label for="ori_hmal_pw">&nbsp;</label>
    	<button type="button" class="form-control" id="btnAlterPw" >비밀번호 변경</button>
    </div>	
  </div>
  
  <div class="form-row">
  <div class="col-md-5">
	   <label for="hmal_pw">현재비밀번호(회원탈퇴)</label>
	   <input type="password" class="form-control" id="hmal_pw" name="hmal_pw" >
	</div>		      
    <div class="col-md-2">
    	<label for="hmal_pw">&nbsp;</label>
    	<button type="button" class="form-control" id="btnUserDelete">회원탈퇴</button>
    </div>	
  </div>
  
  
  

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

	$(document).ready(function(){		
		
		// 비밀번호변경
		$("#btnAlterPw").on("click", function(){
			
			let ori_hmal_pw = $("#ori_hmal_pw");
			let alter_hmal_pw = $("#alter_hmal_pw");
			
			if(ori_hmal_pw.val() == "" || ori_hmal_pw.val() == null){
				alert("현재 비밀번호를 입력하세요.");
				ori_hmal_pw.focus();
				return;
			}
			
			if(alter_hmal_pw.val() == "" || alter_hmal_pw.val() == null){
				alert("변경할 비밀번호를 입력하세요.");
				alter_hmal_pw.focus();
				return;
			}
			
			$.ajax({
				url: '/customer/alterPw',
				type: 'post',
				dataType: 'text',
				data: { ori_hmal_pw : ori_hmal_pw.val(), alter_hmal_pw : alter_hmal_pw.val() },
				success: function(data){
					
					if(data == "success"){
						alert("비밀번호 변경완료.");						
					}else if(data == "noPw"){
						alert("현재 비밀번호가 다릅니다. 확인하세요.");
						ori.hmal_pw.val("");
						ori.hmal_pw.focus();
					}
				}
			});
		});		
		
		// 회원탈퇴
		$("#btnUserDelete").on("click", function(){
			
			let hmal_pw = $("#hmal_pw");
			
			if(hmal_pw.val() == "" || hmal_pw.val() == null){
				alert("현재 비밀번호를 입력하세요.");
				hmal_pw.focus();
				return;
			}
			
			$.ajax({
				url: '/customer/userDelete',
				type: 'post',
				dataType: 'text',
				data: { hmal_pw : hmal_pw.val() },
				success: function(data){
					
					if(data == "1"){
						alert("회원정보가 삭제되었습니다.");
						location.href = "/";
					}else if(data == "0"){
						alert("현재 비밀번호가 다릅니다. 확인하세요.");
						hmal_pw.val("");
						hmal_pw.focus();
					}
				}
				
			});
			
			// location.href = "/customer/userDelete";			
		});
	
	});
</script>

    
  </body>
</html>
