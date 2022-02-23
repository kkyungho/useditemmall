<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>
    
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm"> 
  <!-- <a class="my-0 mr-md-auto font-weight-normal text-dark" href="/">Hmarket</a> -->    
 	<a class="my-0 mr-md-auto font-weight-normal" title="홈페이지 이동" id="logo" href="/">
 		<img alt="Hmarket" src="/resources/img/logo.png" height="30" width="92"> 
 	</a>
 	
 	<!-- <input type="text" width="120" size="100"> --> 
 	   
  <nav class="my-2 my-md-0 mr-md-3">	 

    <!-- 로그인 이전상태 표시 -->
    <c:if test="${sessionScope.loginStatus == null }">
    
	  <div class="btn_box">
      	<a class="btn_login_box" href="/customer/login">
      		<button type="button" class="btn btn-light">로그인</button>
      	</a>     
      	<a class="btn_join_box" href="/customer/join">
      		<button type="button" class="btn btn-light">회원가입</button>
      	</a>    
	  	<a class="btn_login_box" href="/customer/login">
      		<button type="button" class="btn btn-light">내상점</button>
      	</a>
      	
      </div>
      
	  
    </c:if>

    <!-- 로그인 이후상태 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
    
     <div class="btn_box">
    	<a class="btn_logout_box" href="/customer/logout">
    		<button type="button" class="btn btn-light">로그아웃</button>
    	</a>
    	<a class="btn_alterUser_box" href="/customer/alterUser">
    		<button type="button" class="btn btn=light">회원수정</button>
    	</a>
    	<a class="btn_changeOut_box" href="/customer/changeOut">
    		<button type="button" class="btn btn-light">비밀번호변경/회원탈퇴</button>
    	</a>
    	<a class="btn_mystore_box" href="/customer/mystore" >
    		<button type="button" class="btn btn-light">내상점</button>
    	</a>
     </div>	
     
    </c:if>

    <!-- <a class="p-2 text-dark" href="#" >내상점</a> -->    
  </nav> 
  
  <!--  
  <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
	<ul class="nav">
	  <li class="nav-item">
	    <a class="nav-link active" href="#">Active</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">Link</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="#">Link</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link disabled">Disabled</a>
	  </li>
	</ul>
  </div>
   -->
  
	
</div> 