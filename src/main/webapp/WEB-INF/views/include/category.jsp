<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>category</title>
</head>
<body>

<div class="container">
	<div class="dropdown drop-tabs">	
	<button type="button" class="btn btn-light dropdown" data-toggle="dropdown">카테고리</button>
		<div class="dropdown-menu">
		  <c:forEach items="${userCategory}" var="categoryVO">
			  <div class="dropdown-item">
			    <a class="dropdown-item" data-toggle="dropdown" href="${categoryVO.cate_code }" role="button">${categoryVO.cate_name }</a>
			    <div class="subCategory" id="subCategory_${categoryVO.cate_code }">
			    </div>
			  </div>
		  </c:forEach>
		 </div>		 	
		 <c:if test="${sessionScope.loginStatus == null }">
			 <a href="/customer/login">
	    		<img alt="판매하기" src="/resources/img/sell.png" width="26" height="26" style="float: right;">  	
	    	 </a>
    	 </c:if> 	
   	 
    	 <c:if test="${sessionScope.loginStatus != null }">
			 <a href="/customer/product/productInsert">
			 	<img alt="판매하기" src="/resources/img/sell.png" width="26" height="26" style="float: right;">				 	
	    		<!-- <button type="button" class="btn btn-default" style="float: right;">판매하기</button> -->    	
	    	 </a>
    	 </c:if>
    	 
	 </div>
	 	  
</div>



 

<script>
	$(function(){
	  
	  //1차카테고리 클릭시
	  $(".dropdown .dropdown-menu a.dropdown-item").on("click", function(){
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