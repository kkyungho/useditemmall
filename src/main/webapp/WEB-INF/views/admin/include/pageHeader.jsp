<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>

<div class="container" style="padding-top: 30px;">    
 	<a title="홈페이지 이동" id="logo" href="/admin/main" style="float: left;">
 		<img alt="Hmarket" src="/resources/img/hlogo.jpg" height="45" width="150"> 
 	</a> 	
 	      
  <nav style="float: right;">	 

    <!-- 로그인 이전상태 표시 -->
    <c:if test="${sessionScope.loginStatus == null }">
	  <div class="btn_box">
      	<a class="btnLogin" href="/admin/adminLogin" style="text-decoration: none;">
      		<button type="button" class="btn btn-default">로그인</button>
      	</a>     
      	<a class="btnJoin" href="/admin/adminJoin" style="text-decoration: none;">
      		<button type="button" class="btn btn-default">관리자 등록</button>
      	</a>   
	  	     	
      </div>  
    </c:if>

    <!-- 로그인 이후상태 표시 -->
    <!-- 
    <c:if test="${sessionScope.loginStatus != null }">
     <div class="btn_box">
    	<a class="btn_logout" href="/admin/adminLogout" style="text-decoration: none;">
    		<button type="button" class="btn btn-default">로그아웃</button>
    	</a>
    	<a class="btn_alterAdmin" href="/admin/adminModify" style="text-decoration: none;">
    		<button type="button" class="btn btn-default">관리자 수정</button>
    	</a>
    	<a class="btn_userSupervise" href="#" style="text-decoration: none;">
    		<button type="button" class="btn btn-default">회원관리</button>
    	</a>    	    	
     </div>	
    </c:if>
     -->
       
  </nav>  
  
	
</div> 


