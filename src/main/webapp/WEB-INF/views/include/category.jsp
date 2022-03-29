<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category</title>

<style>
	
</style>
</head>
<body>

<div class="container border-bottom" style="padding-top: 45px; padding-bottom: 20px;">
	<div class="dropdown drop-tabs">	
	<button type="button" class="btn btn-outline-light dropdown" style="font-size: 20px; color: black; font-weight: bold;" data-toggle="dropdown">카테고리</button>
		<div class="dropdown-menu">
		  <c:forEach items="${userCategory}" var="categoryVO">
			  <div class="dropdown-item">
			    <a class="dropdown-item" data-toggle="dropdown" href="${categoryVO.cate_code }" role="button">${categoryVO.cate_name }</a>			    
			  </div>
			  <div class="hover-menu" style="text-align: center;">
				  <div class="subCategory" id="subCategory_${categoryVO.cate_code }">
				  </div>
			  </div>
		  </c:forEach>
		 </div>
		 <!-- 검색창 -->
		 <!-- 
		 <div class="container" style="text-align: center;">
		  	<form id="searchForm" action="/customer/product/productList" method="get">		  		
		  		<input type="text" name="keyword" style="max-width:400px; width: calc(100% - 100px); display: inline-block;" 
		  			value="<c:out value="${pageMaker.cri.keyword}" />">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">		
				<input type="hidden" name="pro_name" value="${pro_name}">		
		  	</form>
		 </div>
		 -->		 		
		 <!-- 로그인 상태가 아님 --> 	
		 <c:if test="${sessionScope.loginStatus == null }">
		 	 <!-- board주소넣을예정
		 	 <a href="#" style="margin-left: 240px;"> 
		 	 	<button class="btn btn-link" style="color: black; font-weight: bold; text-decoration: none;">Q&A</button>
		 	 </a>
		 	 -->		 	
		 	 <a href="/customer/login" >
	    		<img alt="내상점" src="/resources/img/mypage.png" width="85" height="30" style="float: right; margin-left: 30px;">
	    	 </a>	    	    	 	    	 
	    	 <a href="/customer/login">
	    		<img alt="판매하기" src="/resources/img/selling.png" width="95" height="32" style="float: right;">  	
	    	 </a>	    	 
    	 </c:if> 	
   	 	 <!-- 로그인 상태 -->
    	 <c:if test="${sessionScope.loginStatus != null }">
    	 	 <!-- board주소넣을예정
    	 	 <a href="#" style="margin-left: 40px;"> 
		 	 	<button class="btn btn-link" style="color: black; font-weight: bold; text-decoration: none;">Q&A</button>
		 	 </a>
		 	 -->
    	 	 <a href="/customer/product/myproduct" >
	    		<img alt="내상점" src="/resources/img/mypage.png" width="85" height="30" style="float: right; margin-left: 30px;">
	    	 </a>
			 <a href="/customer/product/productInsert">
			 	<img alt="판매하기" src="/resources/img/selling.png" width="95" height="32" style="float: right;">	    		  	
	    	 </a>	    	 
    	 </c:if>
    	 
	 </div>
	 	  
</div>



 

<script>
	$(function(){
	  
	  //1차카테고리 클릭시
	  $(".dropdown .dropdown-menu a.dropdown-item").hover(function(){
		console.log("1차카테고리");

		let url = "/customer/product/subCategory/" + $(this).attr("href");
		let curAnchor = $(this); // ajax메서드 호출전에 선택자 this를 전역변수로 받아야 한다.

	      $.getJSON(url, function(data){			
	        
			// 2차카테고리 정보를 모두 삭제해라.
			$(".dropdown .dropdown-menu div.subCategory").each(function(){
				
				$(this).empty();
			});

			//subCategoryBindingView(data, $("#subCategory"), $("#subCategoryTemplate"));
			let subCategoryStr = "";
			for(let i=0; i<data.length; i++) {
				//data[i].cate_code;
				//data[i].cate_name;
				let selector = "#subCategory_" + data[i].cate_prt_code;
				console.log("선택자: " + selector)
				//$(selector).empty();
				subCategoryStr = "<a class='sub_cate' href='" + data[i].cate_code + "'>" + data[i].cate_name + "</a>";
				$(selector).append(subCategoryStr);
			}

			
			/*
			curAnchor.next().empty();
			curAnchor.next().append(subCategoryStr);
			*/

	      });
	  });

	  $("div.subCategory").on("click","a.sub_cate",function(e){
		e.preventDefault();

		//console.log("2차카테고리 클릭");
		location.href = "/customer/product/productList?cate_code=" + $(this).attr("href");
	  });
	});
</script>

</body>
</html>