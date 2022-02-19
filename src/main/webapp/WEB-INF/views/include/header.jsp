<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>
    
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <!-- <h5 class="my-0 mr-md-auto font-weight-normal" href="">Hmall</h5> -->
  <!-- 로고이미지 넣기(2022.02.09 오류발생) -->
  <!-- <img src="/WEB-INF/views/include/logo.png"> -->
  <a href="/">
  	<img src="/WEB-INF/views/include/logo.png">
  </a> 
    
  <nav class="my-2 my-md-0 mr-md-3">

    <!-- 로그인 이전상태 표시 -->
    <c:if test="${sessionScope.loginStatus == null }">

      <a class="p-2 text-dark" href="/customer/login">로그인</a>
      <a class="p-2 text-dark" href="/customer/join">회원가입</a>
	  <a class="p-2 text-dark" href="/customer/login" >내상점</a>
	  
    </c:if>

    <!-- 로그인 이후상태 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
    
    	<a class="p-2 text-dark" href="/customer/logout">로그아웃</a>
    	<a class="p-2 text-dark" href="/customer/alterUser">회원수정</a>
    	<a class="p-2 text-dark" href="/customer/changeOut">비밀번호변경/회원탈퇴</a>
    	<a class="p-2 text-dark" href="/customer/mypage" >내상점</a>
    	
    </c:if>

    <!-- <a class="p-2 text-dark" href="#" >내상점</a> -->    
  </nav>
</div>