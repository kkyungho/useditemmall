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
	    
	    form.findIdForm{
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
         <form id="findIdForm" class="findIdForm" action="/customer/findId" method="post">
         	<div class="container" style="width: 900px; padding: 3% 2px;">
	             <h2>아이디찾기</h2>
	             <br>
	             <div class="form-group" style="margin-left: 250px;">
		             <label for="hmal_name">이름</label>
		             <input type="text" id="hmal_name" name="hmal_name" class="form-control" placeholder="이름을 입력해주세요." 
		             	style="margin-bottom: 15px; max-width: 400px;" required autofocus>  
		             <label for="hmal_phone">핸드폰번호</label>
		             <input type="text" id="hmal_phone" name="hmal_phone" class="form-control" placeholder="핸드폰번호를 입력해주세요." 
		             	style="max-width: 400px;" required>
	             </div>                  
		         <div style="text-align: center">          	
		           <button type="button"  id="btnFindId" class="btn btn-warning center">다음</button>
		         </div>
	         </div>
         </form>
     </div>
  </section>
  
<%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   
</div>

<script>
  
  $(document).ready(function(){

    // 아이디찾기
    $("#btnFindId").on("click", function(){   	
    	
    	let hmal_name = $("#hmal_name");
    	let hmal_phone = $("#hmal_phone");
    	
    	if(hmal_name.val() == "" || hmal_name.val() == null) {
    		alert("이름을 입력하세요");
    		hmal_name.focus();
    		return;
    	}
    	
    	if(hmal_phone.val() == "" || hmal_phone.val() == null) {
    		alert("핸드폰번호를 입력하세요");
    		hmal_phone.focus();
    		return;
    	}
    	
    	$.ajax({
            url: '/customer/findId',
            type: 'post',
            dataType: 'text',
            data: { hmal_name : hmal_name.val(), hmal_phone : hmal_phone.val() },
            success: function(data){
              
	              if(data == "no"){
	                alert("입력정보를 확인하세요.");                
	                //location.href = "/customer/findIdAction";
	              }else {
	            	  location.href = "/customer/findIdAction?hmal_id="+data;
	              }                
              
               } 
          });   	
    	  
    });
    
  });

</script>

    
  </body>
</html>
