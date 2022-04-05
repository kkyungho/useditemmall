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
<br>

<div class="container">
  
  <!-- 로그인 -->  
  <section class="content container-fluid">
     <div class="container" style="width: 450px; height: 420px; background-color: white; margin-top: 30px;">
         <form id="findIdForm" class="findIdForm" action="/customer/findIdAction" method="get" style="padding: 50px 10px;">
             <h2 class="form-findId-heading">가입한 아이디</h2>
             <br>             
             <input type="text" id="hmal_id" name="hmal_id" class="form-control"
             	style="margin-bottom: 30px;" value='<c:out value="${hmal_id }" />' readonly>
          <div style="text-align: center">          	
            <button type="button"  id="btnLoginAction" class="btn btn-warning center">로그인하러가기</button>
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
    
  });

</script>

    
  </body>
</html>
