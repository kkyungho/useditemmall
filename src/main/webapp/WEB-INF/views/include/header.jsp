<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>

<!-- 로고 -->
<header>
	<div class="container" style="padding-top: 30px;">    
	 	<a title="홈페이지 이동" id="logo" href="/" style="float: left;">
	 		<img alt="Hmarket" src="/resources/img/hlogo.jpg" height="45" width="150"> 
	 	</a>  	 	 
	  <!-- 우측 -->	      
	  <nav style="float: right;">
	    <!-- 로그인 이전상태 표시 -->
	    <c:if test="${sessionScope.loginStatus == null }">
		  <div class="btn_box" style="padding-top: 5px;">	  	
	      	<a class="btn_login" href="/customer/login" style="text-decoration: none;">
	      		<button type="button" class="btn btn-dark">로그인</button>
	      	</a>     
	      	<a class="btn_join" href="/customer/join" style="text-decoration: none;">
	      		<button type="button" class="btn btn-primary">회원가입</button>
	      	</a>  	     	
	      </div>  
	    </c:if>
	    <!-- 로그인 이후상태 표시 -->
	    <c:if test="${sessionScope.loginStatus != null }">
	     <div class="btn_box" style="padding-top: 5px;">     	
	    	<a class="btn_logout" href="/customer/logout" style="text-decoration: none;">
	    		<button type="button" class="btn btn-outline-dark">로그아웃</button>
	    	</a>
	    	<a class="btn_mypage" href="/customer/mypage" style="text-decoration: none;">
	    		<button type="button" class="btn btn-outline-primary">마이페이지</button>
	    	</a>    	   	    	
	     </div>	
	    </c:if>       
	  </nav> 	
	</div> 
</header>

