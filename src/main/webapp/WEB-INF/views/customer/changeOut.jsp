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
        
    <script>
  	
	  	let msg = '${msg}'; 
	  	if(msg == 'alterUserFail'){
	  		alert("비밀번호를 확인바랍니다.");
	  	}
  
  	</script>
    
    
  </head>
  <body>
    
<!-- 헤더정보 -->
<%@include file="/WEB-INF/views/include/header.jsp" %>
<br>
<!-- 카테고리정보 -->
<%@include file="/WEB-INF/views/include/category.jsp" %>
<br>
<div class="container">
  
  <!-- 비밀번호변경/회원탈퇴 -->
  <section class="content container-fluid">
  	<div class="container" style="width: 70%; min-width: 900px; background-color: white; font-size: 16px;">
  		<form action="/customer/changeOut" method="post">
		  <div class="container" style="width: 800px; padding: 10% 5%;">
		  	<h4>비밀번호 변경/회원탈퇴</h4>
		  	<br>		    
			<div class="form-group">
	    		<label for="ori_hmal_pw">❕  현재 비밀번호</label>
	    		<input type="password" class="form-control" id="ori_hmal_pw" name="ori_hmal_pw"
	    			placeholder="현재 비밀번호를 입력해주세요." style="max-width: 630px;">
	    	</div>
	    	<div class="form-group">
			    <label for="alter_hmal_pw">❕  변경 비밀번호</label>
			    <input type="password" class="form-control" id="alter_hmal_pw" name="alter_hmal_pw"
			    	placeholder="변경할 비밀번호를 입력해주세요." style="width: 630px;"><br>
			    <label for="ori_hmal_pw">&nbsp;</label>
			    <button type="button" id="btnAlterPw" class="btn btn-warning">비밀번호변경</button>
			</div>
			<div class="form-group">
				<label for="hmal_pw">❗ 현재비밀번호(회원탈퇴)</label>
	   			<input type="password" class="form-control" id="hmal_pw" name="hmal_pw" 
	   				placeholder="현재 비밀번호를 입력해주세요." style="max-width: 630px;"><br>
	   			<label for="hmal_pw">&nbsp;</label>
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
						location.href = "/";
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
						alert("회원탈퇴가 완료되었습니다.");
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
