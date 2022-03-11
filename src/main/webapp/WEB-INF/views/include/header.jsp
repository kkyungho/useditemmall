<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>

<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom"> 
  <!-- <a class="my-0 mr-md-auto font-weight-normal text-dark" href="/">Hmarket</a> -->    
 	<a class="my-0 mr-md-auto " title="홈페이지 이동" id="logo" href="/" style="margin-left: 180px;">
 		<img alt="Hmarket" src="/resources/img/logo.png" height="38" width="120"> 
 	</a> 	
 	      
  <nav class="my-2 my-md-0 mr-md-3">	 

    <!-- 로그인 이전상태 표시 -->
    <c:if test="${sessionScope.loginStatus == null }">
	  <div class="btn_box">
      	<a class="btn_login_box" href="/customer/login">
      		<button type="button" class="btn btn-default">로그인</button>
      	</a>     
      	<a class="btn_join_box" href="/customer/join">
      		<button type="button" class="btn btn-default">회원가입</button>
      	</a>    
	  	<a class="btn_login_box" href="/customer/login">
      		<button type="button" class="btn btn-default">내상점</button>
      	</a>      	
      </div>  
    </c:if>

    <!-- 로그인 이후상태 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
     <div class="btn_box">
    	<a class="btn_logout_box" href="/customer/logout">
    		<button type="button" class="btn btn-default">로그아웃</button>
    	</a>
    	<a class="btn_alterUser_box" href="/customer/alterUser">
    		<button type="button" class="btn btn-default">회원수정</button>
    	</a>
    	<a class="btn_changeOut_box" href="/customer/changeOut">
    		<button type="button" class="btn btn-default">비밀번호변경/회원탈퇴</button>
    	</a>
    	<a class="btn_mystore_box" href="/customer/mystore" >
    		<button type="button" class="btn btn-default">내상점</button>
    	</a>    	
     </div>	
    </c:if>

    <!-- <a class="p-2 text-dark" href="#" >내상점</a> -->    
  </nav>  
  
	
</div> 


