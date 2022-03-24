<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/plugin_js.jsp" %>

<!-- 로고 -->
<section class="header-top">
<div class="container" style="padding-top: 30px;">    
 	<a title="홈페이지 이동" id="logo" href="/" style="float: left;">
 		<img alt="Hmarket" src="/resources/img/hlogo.jpg" height="45" width="150"> 
 	</a> 
  <!-- 검색창 -->	
  <div class="second" style="float: left; margin-left: 170px;">
  	<form id="searchForm" action="/customer/product/productList" method="get">
  		<select name="type">
  			<option value=""
				<c:out value="${pageMaker.cri.type == null? 'selected':'' }" />>--</option>
			<option value="${productVO.pro_name }"
				<c:out value="${pageMaker.cri.type eq 'N'? 'selected':'' }" />>상품명</option>
			<option value="P"
				<c:out value="${pageMaker.cri.type eq 'P'? 'selected':'' }" />>거래처</option>
  		</select>
  		<input type="text" name="keyword" style="max-width:500px; width: calc(100% - 100px); display: inline-block;" 
  			value="<c:out value="${pageMaker.cri.keyword}" />">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">		
		<input type="hidden" name="pro_name" value="${pro_name}">		
  	</form>
  </div>
  
  <!-- 우측 -->	      
  <nav style="float: right;">
    <!-- 로그인 이전상태 표시 -->
    <c:if test="${sessionScope.loginStatus == null }">
	  <div class="btn_box">
      	<a class="btn_login" href="/customer/login" style="text-decoration: none;">
      		<button type="button" class="btn btn-default">로그인</button>
      	</a>     
      	<a class="btn_join" href="/customer/join" style="text-decoration: none;">
      		<button type="button" class="btn btn-default">회원가입</button>
      	</a>   
	  	     	
      </div>  
    </c:if>

    <!-- 로그인 이후상태 표시 -->
    <c:if test="${sessionScope.loginStatus != null }">
     <div class="btn_box">
    	<a class="btn_logout" href="/customer/logout" style="text-decoration: none;">
    		<button type="button" class="btn btn-default">로그아웃</button>
    	</a>
    	<a class="btn_alterUser" href="/customer/alterUser" style="text-decoration: none;">
    		<button type="button" class="btn btn-default">회원수정</button>
    	</a>
    	<a class="btn_changeOut" href="/customer/changeOut" style="text-decoration: none;">
    		<button type="button" class="btn btn-default">비밀번호변경/회원탈퇴</button>
    	</a>    	    	
     </div>	
    </c:if>
       
  </nav>  
  
	
</div> 
</section>

