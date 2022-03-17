<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>

<div class="container" style="padding-top: 30px;">    
 	<a title="홈페이지 이동" id="logo" href="/" style="float: left;">
 		<img alt="Hmarket" src="/resources/img/logo.png" height="40" width="120"> 
 	</a> 	
 	      
  <nav style="float: right;">	 

    <!-- 로그인 이전상태 표시 -->
    <c:if test="${sessionScope.loginStatus == null }">
	  <div class="btn_box">
      	<a class="btn_login" href="/customer/login">
      		<button type="button" class="btn btn-default">로그인</button>
      	</a>     
      	<a class="btn_join" href="/customer/join">
      		<button type="button" class="btn btn-default">회원가입</button>
      	</a>   
	  	     	
      </div>  
    </c:if>

    <!-- 로그인 이후상태 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
     <div class="btn_box">
    	<a class="btn_logout" href="/customer/logout">
    		<button type="button" class="btn btn-default">로그아웃</button>
    	</a>
    	<a class="btn_alterUser" href="/customer/alterUser">
    		<button type="button" class="btn btn-default">회원수정</button>
    	</a>
    	<a class="btn_changeOut" href="/customer/changeOut">
    		<button type="button" class="btn btn-default">비밀번호변경/회원탈퇴</button>
    	</a>    	    	
     </div>	
    </c:if>
       
  </nav>  
  
	
</div> 


