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
		   	
	  	form.mypageForm{
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

<!-- 마이 페이지 --> 
<div class="container">  
  	<div class="container" style="width: 100%; background-color: white; font-size: 16px;">
  		<form class="mypageForm" action="/customer/mypage" method="post" id="mypageForm">
		  <div class="container" style="width: 900px; padding: 3% 2px;">
		  	<h4>마이 페이지</h4><br><br>
		  	<b style="margin-left: 160px;">✔ 아래 항목을 수정해주세요.</b><br><br>
		    <div class="form-group" style="width: 100%; margin-left: 160px;">
			    <label for="hmal_id">아이디</label><br />
			    <input type="text" class="form-control" id="hmal_id" name="hmal_id" 
			    	 style="max-width:400px;" value='<c:out value="${customerVO.hmal_id }" />'  readonly>				
			</div>
			<div class="form-group" style="width: 100%; margin-left: 160px;">
	    		<label for="hmal_pw">비밀번호</label><br />
	    		<input type="password" class="form-control" id="hmal_pw" name="hmal_pw"
	    			style="max-width: 400px; width: calc(100% - 100px); margin-right: 5px; display: inline-block;" value='<c:out value="${customerVO.hmal_pw }" />' readonly>	    		    		
	    	</div>	    		    	
			<div class="form-group" style="width: 100%; margin-left: 160px;">
			    <label for="hmal_name">이름</label>
			    <input type="text" class="form-control" id="hmal_name" name="hmal_name"
			    	style="max-width: 400px;" value='<c:out value="${customerVO.hmal_name }" />' readonly>
			</div>
			<div class="form-group" style="width: 100%; margin-left: 160px;">
		    	<label for="hmal_email">✔ 이메일</label><br />
		    	<input type="text" class="form-control" id="hmal_email" name="hmal_email"
		    		style="max-width: 400px; width: calc(100% - 115px); margin-right: 5px; display: inline-block;" value='<c:out value="${customerVO.hmal_email }" />' readonly>		    	
		    </div>		    
		    <div class="form-group" style="width: 100%; margin-left: 160px;">
			    <label for="inputAddr">✔  주소</label><br />			      
			    <input type="text" class="form-control" id="hmal_zipcode" name="hmal_zipcode" value='<c:out value="${customerVO.hmal_zipcode }" />'
			     	style="max-width: 300px; width: calc(100% - 128px); margin-right: 5px; display: inline-block;" readonly>
			    <input type="button" class="btn btn-light" id="btnPostCode" name="btnPostCode"  value="우편번호찾기" onclick="sample2_execDaumPostcode()"><br>
			    <input type="text" class="form-control" id="hmal_addr" name="hmal_addr" value='<c:out value="${customerVO.hmal_addr }" />'
			    	style="max-width: 530px; margin: 3px 0px;" readonly>
			    <input type="text" class="form-control" id="hmal_deaddr" name="hmal_deaddr" value='<c:out value="${customerVO.hmal_deaddr }" />'
			    	style="max-width: 530px;" readonly>
			    <input type="hidden" id="sample2_extraAddress" >			        
			 </div>
			 <div class="form-group" style="width: 100%; margin-left: 160px;">
		  	 	<label for="hmal_phone">✔  전화번호</label>
      		 	<input type="tel" class="form-control" id="hmal_phone" name="hmal_phone" value='<c:out value="${customerVO.hmal_phone }" />'
      		 		 style="max-width: 400px;" readonly>
      		 </div><br>      		  
	  		 <div class="form-group text-center">
	  		 	<button type="button" id="btnAlterUser" class="btn btn-primary">내 정보 수정</button>
	  		 	<button type="button" id="btnChangePw" class="btn btn-danger">비밀번호 변경</button>
	  		 	<button type="button" id="btnUserOut" class="btn btn-danger">회원탈퇴</button>	  			
	  		 </div> 
	  	   </div> 
		</form>	 
	  </div> 
  

  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<script>

	$(document).ready(function(){	
		
		// 회원수정 버튼 클릭시
		$("#btnAlterUser").on("click", function(){
			
			location.href = "/customer/alterUser";
			
		});
		
		// 비밀번호변경버튼 클릭시
		$("#btnChangePw").on("click", function(){
			
			location.href = "/customer/changePw";
		});
		
		// 비밀번호변경버튼 클릭시
		$("#btnUserOut").on("click", function(){
			
			location.href = "/customer/userOut";
		});
		
	
	});
</script>


    
  </body>
</html>
