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
		
		form.changePwForm{
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
  		<form class="changePwForm" action="/customer/changePw" method="post">
		  <div class="container" style="width: 900px; padding: 3% 2px;">
		  	<h4>비밀번호 변경</h4>
		  	<br>		    
			<div class="form-group" style="margin-left: 200px;">
	    		<label for="ori_hmal_pw">현재 비밀번호</label>
	    		<input type="password" class="form-control" id="ori_hmal_pw" name="ori_hmal_pw"
	    			placeholder="현재 비밀번호를 입력해주세요." style="max-width: 400px;">
	    	</div>
	    	<div class="form-group" style="margin-left: 200px;">
			    <label for="alter_hmal_pw">변경 비밀번호</label>
			    <input type="password" class="form-control" id="alter_hmal_pw" name="alter_hmal_pw"
			    	placeholder="변경할 비밀번호를 입력해주세요." style="width: 400px;"><br>
			    <label for="ori_hmal_pw"></label>
			    <button type="button" id="btnAlterPw" class="btn btn-warning">비밀번호변경</button>
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
						alert("비밀번호 변경이 완료되었습니다.");	
						location.href = "/";
					}else if(data == "noPw"){
						alert("현재 비밀번호가 다릅니다. 확인하세요.");
						ori.hmal_pw.val("");
						ori.hmal_pw.focus();
					}
				}
			});
		});				
	
	});
</script>

    
  </body>
</html>
