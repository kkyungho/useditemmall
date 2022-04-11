<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">    
    <title>중고거래의 시작, H중고마켓</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/pricing/">
        
    
    <style>
    		   	  
	  
		h4{
		   text-align : center;    	
		}
		
		form.userOutForm{
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

<!-- 비밀번호변경 -->
<div class="container">
  <section class="content container-fluid">
  	<div class="container" style="width: 100%; background-color: white; font-size: 16px;">
  		<form class="userOutForm" action="/customer/userOut" method="post">
		  <div class="container" style="width: 900px; padding: 3% 2px;">
		  	<h4>회원탈퇴</h4>
		  	<br>
			<div class="form-group" style="margin-left: 250px;">
				<label for="hmal_pw">현재비밀번호</label>
	   			<input type="password" class="form-control" id="hmal_pw" name="hmal_pw" 
	   				placeholder="현재 비밀번호를 입력해주세요." style="max-width: 400px;"><br>
	   			<label for="hmal_pw"></label>
    			<button type="button" id="btnUserDelete" class="btn btn-danger" >회원탈퇴</button>
			</div>			     		  
	  		
	  	   </div> 
		</form>	 
	  </div> 
  </section>  
  
  
  

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

	$(document).ready(function(){
		
		// 회원탈퇴
		$("#btnUserDelete").on("click", function(){
			let result = confirm("회원탈퇴를 하시겠습니까?");
			
			if(result){
				
				// 유효성검사
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
							alert("회원탈퇴가 완료되었습니다.");
							location.href = "/";
						}else if(data == "0"){
							alert("현재 비밀번호가 다릅니다. 확인하세요.");
							hmal_pw.val("");
							hmal_pw.focus();
						}				
					}
					
				});
			}
					
		});
	
	});
</script>

    
  </body>
</html>
