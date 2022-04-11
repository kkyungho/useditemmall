<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<!-- 아이디 보여주기  --> 
<div class="container">
  <section class="content container-fluid">
     <div class="container" style="width: 100%; background-color: white; font-size: 16px;">
         <form id="findIdForm" class="findIdForm" action="/customer/findIdAction" method="get">
         <div class="container" style="width: 900px; padding: 3% 2px;">
             <h2>가입한 아이디</h2><br>
             <div class="form-group" style="margin-left: 250px;">             
	             <input type="text" id="hmal_id" name="hmal_id" class="form-control"
	             	style="margin-bottom: 30px; max-width: 400px;" value='<c:out value="${hmal_id }" />' readonly>
             </div>
	         <div style="text-align: center">   
	           <button type="button"  id="btnFindPw" class="btn btn-light center">비밀번호찾기</button>       	
	           <button type="button"  id="btnLoginAction" class="btn btn-warning center">로그인하러가기</button>
	         </div>
          </div>
         </form>
     </div>
  </section>
  
<%@include file="/WEB-INF/views/include/footer.jsp" %>
   
   
</div>

<script>
  
  $(document).ready(function(){

    //로그인버튼 눌렀을 시
    $("#btnLoginAction").on("click", function(){
    	
    	location.href = "/customer/login";
    	  
    });
    
 	// 비밀번호 찾기
    $("#btnFindPw").on("click", function(){
    	
  	 	location.href = "/customer/findPw";
  	 	
    });
    
  });

</script>

    
  </body>
</html>
